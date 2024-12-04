package com.bigpoint.zoomumba.view.windows.fortuneWheel
{
   import com.bigpoint.zoomumba.model.user.currency.CurrencyProxy;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.zooWheel.buySpin.BuySpinContent;
   import windows.custom.zooWheel.buySpin.BuySpinWindow;
   
   public class BuySpinMediator extends WindowMediator
   {
      public static const NAME:String = "BuySpinMediator";
      
      public static const PRICE_PER_TURN:int = 2;
      
      public function BuySpinMediator(param1:BuySpinWindow)
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
         this.windowContent.priceLabel.type = "zooDollar";
         this.windowContent.priceLabel.value = PRICE_PER_TURN;
         this.windowContent.priceLabel.canAfford = this.afford;
         this.windowContent.header.title.text = TextResourceModule.getText("zoo.wheel.extraturn.title");
         this.windowContent.question.text = TextResourceModule.getText("zoo.wheel.extraturn.text");
         super.init(param1);
      }
      
      private function get afford() : Boolean
      {
         var _loc1_:CurrencyProxy = facade.retrieveProxy(CurrencyProxy.NAME) as CurrencyProxy;
         if(_loc1_.realMoney >= PRICE_PER_TURN)
         {
            return true;
         }
         return false;
      }
      
      private function get windowContent() : BuySpinContent
      {
         return this.buySpinWindow.getContent(0) as BuySpinContent;
      }
      
      private function get buySpinWindow() : BuySpinWindow
      {
         return this.viewComponent as BuySpinWindow;
      }
      
      override public function dispose() : void
      {
      }
   }
}

