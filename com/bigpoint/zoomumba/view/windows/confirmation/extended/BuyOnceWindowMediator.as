package com.bigpoint.zoomumba.view.windows.confirmation.extended
{
   import com.bigpoint.zoomumba.constants.SHOP;
   import com.bigpoint.zoomumba.model.windows.confirmation.extended.BuyOnceConfirmationInitParams;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.confirmation.extended.BuyOnceContent;
   import windows.custom.confirmation.extended.BuyOnceWindow;
   import windows.events.WindowCustomEvent;
   
   public class BuyOnceWindowMediator extends WindowMediator
   {
      public static const NAME:String = "BuyOnceWindowMediator";
      
      private var winParams:BuyOnceConfirmationInitParams;
      
      public function BuyOnceWindowMediator(param1:BuyOnceWindow)
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
         this.winParams = param1 as BuyOnceConfirmationInitParams;
         this.content.header.text = TextResourceModule.getText("zoo.shop.buyitem");
         this.content.message.text = TextResourceModule.getText("zoo.window.buyonce.info");
         this.content.price.value = this.winParams.item.getBuyReal();
      }
      
      override protected function handleWindowConfirm(param1:WindowCustomEvent = null) : void
      {
         sendNotification(SHOP.SHOPCARD_BUY_CLICKED,this.winParams.item);
         super.handleWindowConfirm(param1);
      }
      
      override public function dispose() : void
      {
      }
      
      private function get window() : BuyOnceWindow
      {
         return this.viewComponent as BuyOnceWindow;
      }
      
      private function get content() : BuyOnceContent
      {
         return this.window.getContent() as BuyOnceContent;
      }
   }
}

