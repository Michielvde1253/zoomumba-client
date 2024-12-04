package com.bigpoint.zoomumba.view.windowSystem
{
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowParams;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowTypeDefitinion;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.namespaces.windowSystem;
   import flash.display.Sprite;
   import org.puremvc.as3.interfaces.IMediator;
   import org.puremvc.as3.patterns.mediator.Mediator;
   import windows.core.AbstractWindow;
   import windows.events.WindowCustomEvent;
   
   use namespace windowSystem;
   
   public class WindowMediator extends Mediator implements IMediator
   {
      protected var uniqueMediatorName:String;
      
      protected var windowType:WindowTypeDefitinion;
      
      protected var windowUniqueId:String = "";
      
      private var windowParams:WindowParams;
      
      public function WindowMediator(param1:String, param2:AbstractWindow)
      {
         super(param1,param2);
         this.uniqueMediatorName = param1;
         param2.addEventListener(WindowCustomEvent.CLOSE_BUTTON_CLICKED,this.handleWindowCloseClick);
         param2.addEventListener(WindowCustomEvent.CONFIRM_CLICKED,this.handleWindowConfirm);
         param2.addEventListener(WindowCustomEvent.CANCEL_CLICKED,this.handlewindowCancel);
      }
      
      public function setType(param1:WindowTypeDefitinion) : void
      {
         this.windowType = param1;
      }
      
      public function setUniqueId(param1:String) : void
      {
         this.windowUniqueId = param1;
         this.uniqueMediatorName = this.uniqueMediatorName + "_" + param1;
      }
      
      public function setWindowParams(param1:WindowParams) : void
      {
         this.windowParams = param1;
      }
      
      override public function getMediatorName() : String
      {
         return this.uniqueMediatorName;
      }
      
      public function init(param1:Object) : void
      {
      }
      
      public function dispose() : void
      {
      }
      
      public function initDynamicTitle(param1:String, param2:Sprite = null, param3:uint = 2, param4:uint = 6) : void
      {
         viewComponent.initDynamicTitle(param1,param2,param3,param4);
      }
      
      windowSystem function disposeWindowMediator() : void
      {
         viewComponent.removeEventListener(WindowCustomEvent.CLOSE_BUTTON_CLICKED,this.handleWindowCloseClick);
         viewComponent.removeEventListener(WindowCustomEvent.CONFIRM_CLICKED,this.handleWindowConfirm);
         viewComponent.removeEventListener(WindowCustomEvent.CANCEL_CLICKED,this.handlewindowCancel);
         (viewComponent as AbstractWindow).dispose();
      }
      
      windowSystem function handleWindowOpen(param1:WindowCustomEvent = null) : void
      {
         if(Boolean(this.windowParams) && Boolean(this.windowParams.openNotification))
         {
            facade.sendNotification(this.windowParams.openNotification,this.windowParams.openBodyObject);
         }
      }
      
      windowSystem function handleWindowClose() : void
      {
         this.sendCloseNotification();
      }
      
      protected function sendCloseNotification() : void
      {
         if(Boolean(this.windowParams) && Boolean(this.windowParams.closeNotification))
         {
            facade.sendNotification(this.windowParams.closeNotification,this.windowParams.closeBodyObject);
         }
      }
      
      protected function handleWindowCloseClick(param1:WindowCustomEvent = null) : void
      {
         sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(this.windowType,this.windowUniqueId));
      }
      
      protected function handleWindowConfirm(param1:WindowCustomEvent = null) : void
      {
         if(Boolean(this.windowParams) && Boolean(this.windowParams.confirmNotification))
         {
            facade.sendNotification(this.windowParams.confirmNotification,this.windowParams.confirmBodyObject);
         }
         sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(this.windowType,this.windowUniqueId));
      }
      
      protected function handlewindowCancel(param1:WindowCustomEvent = null) : void
      {
         if(Boolean(this.windowParams) && Boolean(this.windowParams.cancelNotification))
         {
            facade.sendNotification(this.windowParams.cancelNotification,this.windowParams.cancelBodyObject);
         }
         sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(this.windowType,this.windowUniqueId));
      }
   }
}

