package com.bigpoint.zoomumba.view.windows.confirmation
{
   import com.bigpoint.zoomumba.model.windows.confirmation.ConfirmationInitParams;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.confirmation.ConfirmationContent;
   import windows.custom.confirmation.ConfirmationWindow;
   
   public class ConfirmationWindowMediator extends WindowMediator
   {
      public static const NAME:String = "ConfirmationWindowMediator";
      
      public function ConfirmationWindowMediator(param1:ConfirmationWindow)
      {
         super(NAME,param1);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:* = param1.getName();
         switch(0)
         {
         }
      }
      
      override public function init(param1:Object) : void
      {
         var _loc2_:ConfirmationInitParams = param1 as ConfirmationInitParams;
         var _loc3_:ConfirmationContent = (viewComponent as ConfirmationWindow).getContent(0) as ConfirmationContent;
         _loc3_.header.title.text = _loc2_.title;
         _loc3_.message.htmlText = _loc2_.message;
      }
      
      override public function dispose() : void
      {
      }
   }
}

