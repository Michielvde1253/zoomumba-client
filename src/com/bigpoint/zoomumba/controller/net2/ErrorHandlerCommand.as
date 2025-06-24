package com.bigpoint.zoomumba.controller.net2
{
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.inventory.InventoryProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowParams;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.information.InformationInitParams;
   import com.bigpoint.zoomumba.view.windowSystem.WindowSystemMediator;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class ErrorHandlerCommand extends SimpleCommand
   {
      public static const REQUEST_OK:int = 1;
      
      public static const REQUEST_ERROR:int = 0;
      
      public function ErrorHandlerCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc3_:String = null;
         var _loc4_:Object = null;
         var _loc5_:String = null;
         var _loc2_:Object = param1.getBody() as Object;
         for(_loc3_ in _loc2_)
         {
            _loc4_ = _loc2_[_loc3_];
            for(_loc5_ in _loc4_)
            {
               this.compute(_loc4_[_loc5_]);
            }
         }
      }
      
      private function compute(param1:Object) : void
      {
         var errorBody:String = null;
         var errorObj:Object = param1;
         switch(errorObj.t)
         {
            case ErrorHandlerCommand.REQUEST_ERROR:
               if(errorObj.v)
               {
                  try
                  {
                     errorBody = errorObj.v.toString();
                  }
                  catch(e:Error)
                  {
                  }
               }
               if(errorBody)
               {
                  this.showErrorWindow(errorBody);
               }
               break;
            case ErrorHandlerCommand.REQUEST_OK:
               if(errorObj.v)
               {
                  try
                  {
                     errorBody = errorObj.v.toString();
                  }
                  catch(e:Error)
                  {
                  }
               }
               if(errorBody)
               {
                  this.handleRequestOK(errorBody);
               }
         }
      }
      
      private function handleRequestOK(param1:String) : void
      {
         var _loc2_:InventoryProxy = null;
         switch(param1)
         {
            case "zoo.info.circus.everythingBooked":
               sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.INFORMATION,"",new InformationInitParams(TextResourceModule.getText("zoo.event.circus.autoBookTitle"),TextResourceModule.getText("zoo.event.circus.autoBookText"))));
               break;
            case "zoo.success.coupon.redeemed":
               sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.INFORMATION,"",new InformationInitParams(TextResourceModule.getText("zoo.window.bonus.success.title"),TextResourceModule.getText("zoo.window.bonus.success.info"))));
               _loc2_ = facade.retrieveProxy(InventoryProxy.NAME) as InventoryProxy;
               _loc2_.reload = true;
         }
      }
      
      private function showErrorWindow(param1:String) : void
      {
         var _loc2_:WindowSystemMediator = null;
         sendNotification(Note.HIDE_LOADER_LAYER);
         switch(param1)
         {
            case "system.user.maintenance":
               navigateToURL(new URLRequest("/index.php?maintenance=1"),"_self");
               break;
            case "zoo.error.contact.noSuchUser":
               sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.INFORMATION,"",new InformationInitParams(TextResourceModule.getText("zoo.mail.info.noRecipientTitle"),TextResourceModule.getText("zoo.mail.info.noRecipientMessage"))));
               break;
            case "zoo.error.invite.recruitexists":
               sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.INFORMATION,"",new InformationInitParams(TextResourceModule.getText("zoo.error.login.100.title"),TextResourceModule.getText("zoo.error.invite.recruitexists"))));
               break;
            case "zoo.error.field.notHappy":
               sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.INFORMATION,"",new InformationInitParams(TextResourceModule.getText("zoo.inventory.store.error.title"),TextResourceModule.getText("zoo.inventory.store.error.info"))));
               break;
            case "zoo.error.coupon.invalid":
               sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.INFORMATION,"",new InformationInitParams(TextResourceModule.getText("zoo.window.bonus.error.invalid.title"),TextResourceModule.getText("zoo.window.bonus.error.invalid.info"))));
               break;
            case "zoo.error.coupon.participated":
               sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.INFORMATION,"",new InformationInitParams(TextResourceModule.getText("zoo.window.bonus.error.participated.title"),TextResourceModule.getText("zoo.window.bonus.error.participated.info"))));
               break;
            case "zoo.error.coupon.bruteForce":
               sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.INFORMATION,"",new InformationInitParams(TextResourceModule.getText("zoo.window.bonus.error.bruteforce.title"),TextResourceModule.getText("zoo.window.bonus.error.bruteforce.info"))));
               break;
            case "zoo.error.circus.limitReached":
               sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.INFORMATION,"",new InformationInitParams(TextResourceModule.getText("zoo.event.circus.warningTitle"),TextResourceModule.getText("zoo.event.circus.warningText"))));
               break;
            case "zoo.user.notAuth":
            case "system.user.notAuth":
               _loc2_ = facade.retrieveMediator(WindowSystemMediator.NAME) as WindowSystemMediator;
               if(_loc2_)
               {
                  sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.INFORMATION,"",new InformationInitParams(TextResourceModule.getText("zoo.user.notAuth.title"),TextResourceModule.getText("zoo.user.notAuth.info")),new WindowParams("",null,Note.CLOSE_GAME,null,Note.CLOSE_GAME)));
               }
               else
               {
                  sendNotification(Note.CLOSE_GAME);
               }
         }
      }
   }
}

