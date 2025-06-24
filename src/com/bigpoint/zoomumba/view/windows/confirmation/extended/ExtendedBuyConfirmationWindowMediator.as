package com.bigpoint.zoomumba.view.windows.confirmation.extended
{
   import com.bigpoint.zoomumba.model.windows.confirmation.extended.ExtendedBuyConfirmationWindowInitParams;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.confirmation.extended.ExtendedBuyConfirmationContent;
   import windows.custom.confirmation.extended.ExtendedBuyConfirmationWindow;
   
   public class ExtendedBuyConfirmationWindowMediator extends WindowMediator
   {
      public static const NAME:String = "ExtendedBuyConfirmationWindowMediator";
      
      public function ExtendedBuyConfirmationWindowMediator(param1:ExtendedBuyConfirmationWindow)
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
         var _loc2_:ExtendedBuyConfirmationWindowInitParams = param1 as ExtendedBuyConfirmationWindowInitParams;
      }
      
      override public function dispose() : void
      {
      }
      
      private function get window() : ExtendedBuyConfirmationWindow
      {
         return this.viewComponent as ExtendedBuyConfirmationWindow;
      }
      
      private function get content() : ExtendedBuyConfirmationContent
      {
         return this.window.getContent(0) as ExtendedBuyConfirmationContent;
      }
   }
}

