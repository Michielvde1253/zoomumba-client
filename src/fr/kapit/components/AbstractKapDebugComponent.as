package fr.kapit.components
{
   import fr.kapit.utils.ClassUtils;
   import mx.containers.VBox;
   
   public class AbstractKapDebugComponent extends VBox implements IKapDebugComponent
   {
      public var host:Object;
      
      public var targetName:String;
      
      protected var targetChanged:Boolean;
      
      private var _class:Class;
      
      private var _target:Object;
      
      public function AbstractKapDebugComponent()
      {
         super();
         this._class = ClassUtils.getObjectClass(this);
      }
      
      public function get componentLabel() : String
      {
         return this._class["LABEL"];
      }
      
      public function get componentName() : String
      {
         return this._class["NAME"];
      }
      
      public function dispose() : void
      {
      }
      
      public function registerView(param1:String) : void
      {
         ComponentManager.instance.registerView(this._class,param1);
      }
      
      public function setRoot(param1:Object, param2:String = "", param3:Object = null) : void
      {
         this.targetName = param2;
         this.host = param3;
         this.target = param1;
      }
      
      public function get target() : Object
      {
         return this._target;
      }
      
      public function set target(param1:Object) : void
      {
         var _loc2_:KapDebugComponentFactory = null;
         if(this._target != param1)
         {
            _loc2_ = ComponentManager.instance.getComponentFactory(this.componentName);
            if(Boolean(_loc2_) && _loc2_.canAccept(param1))
            {
               this._target = param1;
               this.targetChanged = true;
               invalidateProperties();
               invalidateDisplayList();
            }
         }
         else
         {
            this.targetChanged = false;
         }
      }
   }
}

