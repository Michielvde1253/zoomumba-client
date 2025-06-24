package com.bigpoint.zoomumba.view.windows.safari
{
   import com.bigpoint.zoomumba.constants.GUINote;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.user.currency.CurrencyProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.safari.SafariBuyGasWindowInitParams;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import custom.card.events.CardNumericStepperChangeEvent;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.safari.SafariBuyFuelContent;
   import windows.custom.safari.SafariBuyFuelWindow;
   import windows.events.WindowCustomEvent;
   
   public class SafariBuyFuelWindowMediator extends WindowMediator
   {
      public static const NAME:String = "SafariBuyFuelWindowMediator";
      
      private var winConfig:SafariBuyGasWindowInitParams;
      
      public function SafariBuyFuelWindowMediator(param1:SafariBuyFuelWindow)
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
         this.winConfig = SafariBuyGasWindowInitParams(param1);
         this.content.header.title.text = TextResourceModule.getText("zoo.safari.title");
         this.content.fuelInfo.text = this.winConfig.infoText;
         this.content.addEventListener(CardNumericStepperChangeEvent.CHANGED,this.handleAmountChanged);
         this.content.amountStepper.maximum = this.winConfig.maxFuel - this.winConfig.currentAmount;
         this.content.amountStepper.minimum = 1;
         this.content.priceTag.value = this.winConfig.cost;
         this.content.canister.source = new WrapedSprite(AssetConfig.SAFARI_ASSET_FILE,AssetConfig.SAFARI_GAS_CANISTER);
      }
      
      override protected function handleWindowConfirm(param1:WindowCustomEvent = null) : void
      {
         var _loc2_:CurrencyProxy = facade.retrieveProxy(CurrencyProxy.NAME) as CurrencyProxy;
         if(_loc2_.realMoney >= this.content.amountStepper.value * this.winConfig.cost)
         {
            sendNotification(NET.BUY_SAFARI_FUEL,[this.content.amountStepper.value]);
            sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(WindowTypes.SAFARI_BUY_FUEL_WINDOW));
         }
         else
         {
            sendNotification(GUINote.BANK_MENU_BUTTON_CLICKED);
         }
      }
      
      private function handleAmountChanged(param1:CardNumericStepperChangeEvent) : void
      {
         this.content.priceTag.value = this.winConfig.cost * param1.value;
      }
      
      private function get content() : SafariBuyFuelContent
      {
         return this.window.getContent() as SafariBuyFuelContent;
      }
      
      private function get window() : SafariBuyFuelWindow
      {
         return this.viewComponent as SafariBuyFuelWindow;
      }
      
      override public function dispose() : void
      {
      }
   }
}

