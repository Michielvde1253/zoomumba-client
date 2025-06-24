package com.bigpoint.zoomumba.controller.windowSystem
{
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.windowSystem.WindowSystemProxy;
   import com.bigpoint.zoomumba.model.windowSystem.vo.OpenStrategies;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.namespaces.windowSystem;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoomumba.view.windowSystem.WindowSystemMediator;
   import flash.display.Shape;
   import flash.events.MouseEvent;
   import flash.ui.Mouse;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   import windows.core.AbstractWindow;
   import windows.events.WindowCustomEvent;
   
   use namespace windowSystem;
   
   public class OpenWindowCommand extends SimpleCommand
   {
      private var windowVars:WindowVars;
      
      private var viewComponent:AbstractWindow;
      
      private var windowMediator:WindowMediator;
      
      public function OpenWindowCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var winMediator:WindowSystemMediator;
         var winProxy:WindowSystemProxy;
         var createNewWindow:Boolean;
         var note:INotification = param1;
         this.windowVars = note.getBody() as WindowVars;
         winMediator = facade.retrieveMediator(WindowSystemMediator.NAME) as WindowSystemMediator;
         winProxy = facade.retrieveProxy(WindowSystemProxy.NAME) as WindowSystemProxy;
         createNewWindow = true;
         if(winProxy.isWindowCreated(this.windowVars.windowType.windowDefinitionId,this.windowVars.uniqueId))
         {
            switch(this.windowVars.windowType.openStrategy)
            {
               case OpenStrategies.STACK:
                  createNewWindow = false;
                  sendNotification(Note.WARNING_REPORT,"Window:" + String(this.windowVars.windowType.windowTypeClass) + " can\'t be stacked, Copy of it already opened with same id. Create uniqueId or change open strategy.");
                  break;
               case OpenStrategies.QUEUE:
                  createNewWindow = false;
                  winProxy.queWindowVars(this.windowVars);
                  break;
               case OpenStrategies.REOPEN:
                  sendNotification(WinNote.CLOSE_WINDOW,this.windowVars);
                  break;
               case OpenStrategies.DROP:
                  createNewWindow = false;
            }
         }
         if(createNewWindow)
         {
            if(winProxy.stackedWindowCount > 0 && this.windowVars.windowType.openStrategy == OpenStrategies.QUEUE)
            {
               winProxy.queWindowVars(this.windowVars);
            }
            else
            {
               this.viewComponent = new this.windowVars.windowType.flexClass();
               this.viewComponent.addEventListener(WindowCustomEvent.WINDOW_VISUALLY_CREATED,this.handleWindowCreated);
               try
               {
                  this.windowMediator = new this.windowVars.windowType.windowTypeClass(this.viewComponent);
               }
               catch(error:Error)
               {
                  sendNotification(Note.ERROR_REPORT,"OpenWindowCommand failed to create : " + windowVars.windowType.windowTypeClass + " , check if correct flex object type is  to constructor. It is trying to send :" + viewComponent + "\n" + error.message);
               }
               winProxy.storeWindowData(this.windowVars.windowType.windowDefinitionId,this.windowVars.uniqueId,this.windowMediator,this.viewComponent);
               this.windowMediator.setType(this.windowVars.windowType);
               if(this.windowVars.uniqueId)
               {
                  this.windowMediator.setUniqueId(this.windowVars.uniqueId);
               }
               if(this.windowVars.windowParams)
               {
                  this.windowMediator.setWindowParams(this.windowVars.windowParams);
               }
               facade.registerMediator(this.windowMediator);
               winMediator.showWindow(this.viewComponent);
               this.viewComponent.visible = false;
               this.windowMediator.windowSystem::handleWindowOpen();
            }
         }
         Mouse.show();
      }
      
      private function handleWindowCreated(param1:WindowCustomEvent) : void
      {
         var rectangle:Shape = null;
         var event:WindowCustomEvent = param1;
         if(this.windowVars.windowType.isModal)
         {
            rectangle = new Shape();
            rectangle.graphics.beginFill(0,0.5);
            rectangle.graphics.drawRect(-2000,-2000,4000,4000);
            rectangle.graphics.endFill();
            this.viewComponent.modalLayer.addEventListener(MouseEvent.CLICK,function():void
            {
            },false,0,true);
            this.viewComponent.modalLayer.useHandCursor = false;
            this.viewComponent.modalLayer.addChild(rectangle);
         }
         this.windowMediator.init(this.windowVars.initParams);
         this.viewComponent.visible = true;
         this.viewComponent.removeEventListener(WindowCustomEvent.WINDOW_VISUALLY_CREATED,this.handleWindowCreated);
         this.viewComponent = null;
         this.windowMediator = null;
         this.windowVars = null;
      }
   }
}

