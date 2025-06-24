package com.bigpoint.zoomumba.model.windowSystem
{
   import com.bigpoint.zoomumba.constants.DataNote;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.namespaces.windowSystem;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoomumba.view.windowSystem.WindowSystemMediator;
   import flash.utils.Dictionary;
   import org.puremvc.as3.interfaces.IProxy;
   import org.puremvc.as3.patterns.mediator.Mediator;
   import org.puremvc.as3.patterns.proxy.Proxy;
   import windows.core.AbstractWindow;
   
   use namespace windowSystem;
   
   public class WindowSystemProxy extends Proxy implements IProxy
   {
      public static const NAME:String = "WindowSystemProxy";
      
      private var windowMediators:Dictionary;
      
      private var windowViewComponents:Dictionary;
      
      private var _stackedWindowCount:int = 0;
      
      private var windowQueue:Vector.<WindowVars> = new Vector.<WindowVars>();
      
      public function WindowSystemProxy()
      {
         super(NAME);
         this.windowMediators = new Dictionary();
         this.windowViewComponents = new Dictionary();
      }
      
      public function storeWindowData(param1:int, param2:String, param3:Mediator, param4:AbstractWindow) : void
      {
         this.windowMediators[String(param1) + "_" + param2] = param3;
         this.windowViewComponents[String(param1) + "_" + param2] = param4;
         ++this._stackedWindowCount;
         sendNotification(DataNote.WINDOW_COUNT_CHANGED);
      }
      
      public function isWindowCreated(param1:int, param2:String) : Boolean
      {
         return Boolean(this.windowViewComponents[String(param1) + "_" + param2]);
      }
      
      public function getWindowViewComponont(param1:int, param2:String) : AbstractWindow
      {
         return this.windowViewComponents[String(param1) + "_" + param2] as AbstractWindow;
      }
      
      public function getWindowMediator(param1:int, param2:String) : WindowMediator
      {
         return this.windowMediators[String(param1) + "_" + param2] as WindowMediator;
      }
      
      public function deleteWindowData(param1:int, param2:String) : void
      {
         delete this.windowMediators[String(param1) + "_" + param2];
         delete this.windowViewComponents[String(param1) + "_" + param2];
         --this._stackedWindowCount;
         sendNotification(DataNote.WINDOW_COUNT_CHANGED);
      }
      
      public function deleteAllWindowData() : void
      {
         var _loc1_:Array = null;
         var _loc2_:WindowMediator = null;
         var _loc3_:AbstractWindow = null;
         var _loc5_:String = null;
         var _loc4_:WindowSystemMediator = facade.retrieveMediator(WindowSystemMediator.NAME) as WindowSystemMediator;
         for(_loc5_ in this.windowMediators)
         {
            _loc1_ = _loc5_.split("_");
            _loc1_[0] = int(_loc1_[0]);
            _loc2_ = this.windowMediators[_loc5_];
            _loc3_ = this.windowViewComponents[_loc5_];
            _loc2_ = this.getWindowMediator.apply(this,_loc1_);
            _loc3_ = this.getWindowViewComponont.apply(this,_loc1_);
            _loc4_.hideWindow(_loc3_);
            facade.removeMediator(_loc2_.getMediatorName());
            this.deleteWindowData.apply(this,_loc1_);
            _loc2_.dispose();
            _loc2_.windowSystem::handleWindowClose();
            _loc2_.windowSystem::disposeWindowMediator();
         }
      }
      
      public function queWindowVars(param1:WindowVars) : void
      {
         this.windowQueue.push(param1);
      }
      
      public function getNextQueuedWindowVars() : WindowVars
      {
         return this.windowQueue.shift();
      }
      
      public function get stackedWindowCount() : int
      {
         return this._stackedWindowCount;
      }
      
      public function get queuedWindowCount() : int
      {
         return this.windowQueue.length;
      }
   }
}

