package fr.kapit.components
{
   import flash.system.ApplicationDomain;
   import mx.events.ModuleEvent;
   import mx.modules.IModuleInfo;
   import mx.modules.ModuleManager;
   import mx.utils.StringUtil;
   
   public class ComponentLoader
   {
      private static var _modules:Array = [];
      
      private var _consoleName:String;
      
      private var _moduleInfo:IModuleInfo;
      
      public function ComponentLoader(param1:String, param2:String)
      {
         super();
         this._consoleName = param2;
         this.loadComponent(param1);
      }
      
      public static function loadComponents(param1:Array, param2:String) : void
      {
         var _loc3_:String = null;
         for each(_loc3_ in param1)
         {
            _modules.push(new ComponentLoader(StringUtil.trim(_loc3_),param2));
         }
      }
      
      public function loadComponent(param1:String) : void
      {
         this._moduleInfo = ModuleManager.getModule(param1 + ".swf");
         this._moduleInfo.addEventListener(ModuleEvent.READY,this.moduleInfo_readyHandler);
         this._moduleInfo.addEventListener(ModuleEvent.ERROR,this.moduleInfo_errorHandler);
         this._moduleInfo.data = param1;
         this._moduleInfo.load(ApplicationDomain.currentDomain);
      }
      
      private function moduleInfo_errorHandler(param1:ModuleEvent) : void
      {
         this._moduleInfo.removeEventListener(ModuleEvent.ERROR,this.moduleInfo_errorHandler);
         throw new Error("Cannot load KapDebug component: \"" + String(param1.module.data) + "\"");
      }
      
      private function moduleInfo_readyHandler(param1:ModuleEvent) : void
      {
         this._moduleInfo.removeEventListener(ModuleEvent.READY,this.moduleInfo_readyHandler);
         var _loc2_:IKapModule = IKapModule(param1.module.factory.create());
         _loc2_.registerModule(this._consoleName);
         this._moduleInfo = null;
      }
   }
}

