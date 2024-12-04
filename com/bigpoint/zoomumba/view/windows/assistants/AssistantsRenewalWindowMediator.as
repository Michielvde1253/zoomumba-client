package com.bigpoint.zoomumba.view.windows.assistants
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.GUINote;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.PreloaderTypes;
   import com.bigpoint.zoomumba.constants.UserResources;
   import com.bigpoint.zoomumba.model.app.items.ItemPackVO;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.model.user.assistances.vo.AssistantsVO;
   import com.bigpoint.zoomumba.model.user.currency.CurrencyProxy;
   import com.bigpoint.zoomumba.model.windows.assistants.AssistantsRenewalWindowInitParams;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.data.settings.AssistanceShopData;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import custom.card.events.CardNumericStepperChangeEvent;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.assistants.AssistantRenewContent;
   import windows.custom.assistants.AssistantRenewWindow;
   import windows.events.WindowCustomEvent;
   
   public class AssistantsRenewalWindowMediator extends WindowMediator
   {
      public static const NAME:String = "AssistantsRenewalWindowMediator";
      
      private static const LOCALIZATION_ASSISTANCE_TITLE:String = "zoo.premium.assist.title.";
      
      private var itemConfigProxy:ItemConfigProxy;
      
      private var _canAfford:Boolean = false;
      
      private var currencyProxy:CurrencyProxy;
      
      private var assistantConfig:AssistanceShopData;
      
      public function AssistantsRenewalWindowMediator(param1:AssistantRenewWindow)
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
      
      private function getNameById(param1:int) : String
      {
         var _loc2_:String = LOCALIZATION_ASSISTANCE_TITLE + param1.toString();
         return TextResourceModule.getText(_loc2_);
      }
      
      override public function onRegister() : void
      {
         this.itemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         this.currencyProxy = facade.retrieveProxy(CurrencyProxy.NAME) as CurrencyProxy;
      }
      
      override public function init(param1:Object) : void
      {
         var _loc2_:AssistantsRenewalWindowInitParams = null;
         var _loc3_:ItemConfigProxy = null;
         if(param1 != null)
         {
            _loc2_ = param1 as AssistantsRenewalWindowInitParams;
            _loc3_ = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
            this.assistantConfig = _loc3_.getAssistanceData(_loc2_.assistantId);
            this.switchContentToId(_loc2_.assistantId);
         }
         this.content.amountStepper;
         this.content.amountStepper.valueFormatFunction = this.stepperFormatter;
         this.content.amountStepper.valueParseFunction = this.valueParseFunction;
         this.content.amountStepper.maximum = this.assistantConfig.assistLifeTimers.length - 1;
         this.content.amountStepper.minimum = 0;
         this.content.amountStepper.stepSize = 1;
         this.assistantConfig.selectedType = 1;
         this.content.addEventListener(CardNumericStepperChangeEvent.CHANGED,this.handleNumericChange);
      }
      
      private function handleNumericChange(param1:CardNumericStepperChangeEvent) : void
      {
         this.assistantConfig.selectedType = param1.value + 1;
         this.content.priceTag.value = this.assistantConfig.assistBuyReal[param1.value];
         this.content.priceTag.canAfford = this.canAffordAssistant(this.assistantConfig.assistId);
      }
      
      private function stepperFormatter(param1:int) : String
      {
         var _loc2_:int = this.assistantConfig.assistLifeTimers[param1] / 3600 / 24;
         if(_loc2_ > 1)
         {
            return _loc2_ + " " + TextResourceModule.getText("zoo.window.general.days");
         }
         return _loc2_ + " " + TextResourceModule.getText("zoo.window.general.day");
      }
      
      private function valueParseFunction(param1:String) : int
      {
         var _loc2_:int = int(param1.split(" ")[0]);
         return this.assistantConfig.assistLifeTimers.indexOf(_loc2_ * 3600 * 24);
      }
      
      private function switchContentToId(param1:int) : void
      {
         var _loc2_:AssistanceShopData = this.getAssistantData(param1);
         var _loc3_:AssistantRenewContent = this.window.getContent() as AssistantRenewContent;
         _loc3_.header.title.text = this.getNameById(param1);
         _loc3_.message.text = TextResourceModule.getText("zoo.premium.window.renew.text");
         _loc3_.priceTag.type = "zooDollar";
         _loc3_.priceTag.canAfford = this.canAffordAssistant(param1);
         _loc3_.priceTag.value = this.getCostForAssistant(param1);
         if(param1 != AssistantsVO.HEAL_ASSIST)
         {
            _loc3_.labelDisplay2.text = this.getBonusValue(param1);
            _loc3_.labelDisplay2.type = "xp";
         }
         _loc3_.assistantImage.addChild(new WrapedSprite(AssetIds.getPreviewAssetId(Categories.ASSISTANCE,param1),AssetConfig.DEFAULT_INFO_SPR,PreloaderTypes.NORMAL));
         switch(param1)
         {
            case AssistantsVO.CASH_ASSIST:
               _loc3_.labelDisplay2.type = "petPenny";
               break;
            case AssistantsVO.HEAL_ASSIST:
               _loc3_.labelDisplay2.enabled = false;
               _loc3_.labelDisplay2.setVisible(false);
         }
      }
      
      override protected function handleWindowConfirm(param1:WindowCustomEvent = null) : void
      {
         var _loc3_:ItemPackVO = null;
         var _loc2_:CurrencyProxy = facade.retrieveProxy(CurrencyProxy.NAME) as CurrencyProxy;
         if(this.content.priceTag.canAfford)
         {
            sendNotification(NET.BUY_ASSISTANT,[this.assistantConfig.assistId,1,this.assistantConfig.selectedType]);
            _loc3_ = new ItemPackVO();
            _loc3_.category = Categories.USER;
            _loc3_.itemId = UserResources.REAL_MONEY;
            _loc3_.count = -this.content.priceTag.value;
            sendNotification(Note.UPDATE_RESOURCE_COUNT,_loc3_);
         }
         else
         {
            sendNotification(GUINote.BANK_MENU_BUTTON_CLICKED);
         }
         super.handleWindowConfirm(param1);
      }
      
      private function canAffordAssistant(param1:int) : Boolean
      {
         return this.currencyProxy.realMoney >= this.content.priceTag.value;
      }
      
      private function getBonusValue(param1:int) : String
      {
         var _loc2_:Number = this.itemConfigProxy.getAssistanceData(param1).experienceMod;
         return String(_loc2_ * 100) + "%";
      }
      
      private function getCostForAssistant(param1:int) : int
      {
         return this.itemConfigProxy.getAssistanceData(param1).getBuyReal();
      }
      
      private function getAssistantData(param1:int) : AssistanceShopData
      {
         return this.itemConfigProxy.getAssistanceData(param1);
      }
      
      override public function dispose() : void
      {
      }
      
      private function get content() : AssistantRenewContent
      {
         return this.window.getContent() as AssistantRenewContent;
      }
      
      private function get window() : AssistantRenewWindow
      {
         return this.viewComponent as AssistantRenewWindow;
      }
   }
}

