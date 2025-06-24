package com.bigpoint.zoorama.view.bank
{
   import com.bigpoint.utils.ColorHelper;
   import com.bigpoint.utils.StringHelper;
   import com.bigpoint.utils.functions.AddAssetItem;
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.payment.PaymentUrlProxy;
   import com.bigpoint.zoomumba.model.user.core.UserProxy;
   import com.bigpoint.zoomumba.tempModel.TempGetterProxy;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.data.LocalizationPath;
   import com.bigpoint.zoorama.data.OldWindowTypes;
   import com.bigpoint.zoorama.notices.core.ExternalLinkNotice;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.styleModule.StyleModule;
   import com.bigpoint.zoorama.view.gui.GUITemplates;
   import com.bigpoint.zoorama.view.gui.GuiNotice;
   import com.bigpoint.zoorama.view.gui.btn.BasicButton;
   import com.bigpoint.zoorama.view.gui.btn.HoldonFireButton;
   import com.bigpoint.zoorama.view.gui.btn.SpriteButtonController;
   import com.bigpoint.zoorama.view.gui.core.Coreponent;
   import com.bigpoint.zoorama.view.gui.win.generals.SizedMediumWindow;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import org.puremvc.as3.patterns.facade.Facade;
   
   public class BankWindow extends SizedMediumWindow
   {
      private static const EXCHANGE_RATE:int = 10;
      
      private var panelCurrencyAmount:MovieClip;
      
      private var btnCurrencyAmountDec:HoldonFireButton;
      
      private var btnCurrencyAmountInc:HoldonFireButton;
      
      private var tfCurrencyAmountValue:TextField;
      
      private var tfVirtualAmountValue:TextField;
      
      private var btnBuyZoo:BankActionButton;
      
      private var btnPremium:BankActionButton;
      
      private var btnStartpaket:BankActionButton;
      
      private var btnCashForAction:BankActionButton;
      
      private var skinBuyZoo:MovieClip;
      
      private var skinPremium:MovieClip;
      
      private var skinStartPaket:MovieClip;
      
      private var skinCashAction:MovieClip;
      
      private var btnConfirmSwapCurrency:BasicButton;
      
      private var paymentProxy:PaymentUrlProxy;
      
      public function BankWindow(param1:Notifier)
      {
         var _loc2_:String = null;
         _loc2_ = "Bank";
         name = OldWindowTypes.BANK.toString();
         modal = true;
         useHeaderLoader = true;
         headerFilename = "header_bank";
         super(param1,_loc2_);
         halign = Coreponent.ALIGN_H_LEFT;
         valign = Coreponent.ALIGN_V_TOP;
         this.x = 143;
         this.y = 70;
      }
      
      override public function show() : void
      {
         if(Boolean(this.skinBuyZoo) && Boolean(this.skinCashAction) && Boolean(this.skinPremium) && Boolean(this.skinStartPaket))
         {
            GUITemplates.redrawText(((loadedContent.getChildByName("SC_TF_INFO") as MovieClip).content as MovieClip).tf as TextField,(loadedContent.getChildByName("currencyPanel") as MovieClip).txtAmount as TextField,loadedContent.getChildByName("TF_CHANGE_CURRENCY_TITLE") as TextField,loadedContent.getChildByName("TF_CHANGE_CURRENCY_INFO") as TextField,loadedContent.getChildByName("txtVirtualMoney") as TextField,this.skinBuyZoo.TF_TITLE as TextField,this.skinCashAction.TF_TITLE as TextField,this.skinPremium.TF_TITLE as TextField,this.skinStartPaket.TF_TITLE as TextField,this.skinBuyZoo.TF_INFO as TextField,this.skinCashAction.TF_INFO as TextField,this.skinPremium.TF_INFO as TextField,this.skinStartPaket.TF_INFO as TextField);
         }
         super.show();
      }
      
      override protected function autoClose() : void
      {
         super.autoClose();
         notifier.dispatchNotice(new GuiNotice(GuiNotice.CLOSE_MAIN_WINDOW));
      }
      
      override protected function assignLoadedContentGUI() : void
      {
         var _loc1_:UserProxy = Facade.getInstance().getProxy(UserProxy);
         this.skinBuyZoo = loadedContent.getChildByName("skinBuyZoo") as MovieClip;
         this.btnBuyZoo = new BankActionButton();
         this.btnBuyZoo.skin = this.skinBuyZoo;
         this.btnBuyZoo.addEventListener(MouseEvent.CLICK,this.handleBuyZooDollarButtonClick);
         this.btnBuyZoo.buttonMode = this.btnBuyZoo.useHandCursor = true;
         loadedContent.addChild(this.btnBuyZoo);
         this.skinPremium = loadedContent.getChildByName("skinPremium") as MovieClip;
         this.btnPremium = new BankActionButton();
         this.btnPremium.skin = this.skinPremium;
         this.btnPremium.addEventListener(MouseEvent.CLICK,this.handleBuyPremiumButtonClick);
         this.btnPremium.buttonMode = this.btnPremium.useHandCursor = true;
         loadedContent.addChild(this.btnPremium);
         this.skinStartPaket = loadedContent.getChildByName("skinStarterPaket") as MovieClip;
         this.btnStartpaket = new BankActionButton();
         this.btnStartpaket.skin = this.skinStartPaket;
         this.paymentProxy = Facade.getInstance().retrieveProxy(PaymentUrlProxy.NAME) as PaymentUrlProxy;
         if(this.paymentProxy.paymentUrlVO.urlStart == null)
         {
            this.btnStartpaket.buttonMode = this.btnStartpaket.useHandCursor = true;
            ColorHelper.applyColor(this.btnStartpaket.skin,ColorHelper.GRAYSCALE_LIGHT);
            this.btnStartpaket.disable();
         }
         else
         {
            this.btnStartpaket.addEventListener(MouseEvent.CLICK,this.handleBuyStarterPackButtonClick);
         }
         loadedContent.addChild(this.btnStartpaket);
         this.skinCashAction = loadedContent.getChildByName("skinCashForAction") as MovieClip;
         this.btnCashForAction = new BankActionButton();
         this.btnCashForAction.skin = this.skinCashAction;
         this.btnCashForAction.addEventListener(MouseEvent.CLICK,this.handleCashOffersButtonClick);
         loadedContent.addChild(this.btnCashForAction);
         this.panelCurrencyAmount = loadedContent.getChildByName("currencyPanel") as MovieClip;
         var _loc2_:MovieClip = this.panelCurrencyAmount.getChildByName("btnIncSkin") as MovieClip;
         this.btnCurrencyAmountInc = new HoldonFireButton();
         this.btnCurrencyAmountInc.skin = _loc2_;
         this.btnCurrencyAmountInc.tweenMouseOverParams = [null,0.3,{"colorMatrixFilter":{
            "contrast":1.4,
            "brightness":1.4
         }}];
         this.btnCurrencyAmountInc.tweenMouseOutParams = [null,0.3,{"colorMatrixFilter":{
            "contrast":0.9,
            "brightness":0.9
         }}];
         this.btnCurrencyAmountInc.addEventListener(MouseEvent.CLICK,this.handleButtonCurrencyAmountIncClick);
         this.btnCurrencyAmountInc.addEventListener(HoldonFireButton.EVENT_HOLDON_MOUSE_FIRE,this.handleButtonCurrencyAmountIncHoldonMouseFire);
         this.btnCurrencyAmountInc.delay = 200;
         this.btnCurrencyAmountInc.buttonMode = true;
         this.btnCurrencyAmountInc.useHandCursor = true;
         this.panelCurrencyAmount.addChild(this.btnCurrencyAmountInc);
         var _loc3_:MovieClip = this.panelCurrencyAmount.getChildByName("btnDecSkin") as MovieClip;
         this.btnCurrencyAmountDec = new HoldonFireButton();
         this.btnCurrencyAmountDec.skin = _loc3_;
         this.btnCurrencyAmountDec.tweenMouseOverParams = [null,0.3,{"colorMatrixFilter":{
            "contrast":1.4,
            "brightness":1.4
         }}];
         this.btnCurrencyAmountDec.tweenMouseOutParams = [null,0.3,{"colorMatrixFilter":{
            "contrast":0.9,
            "brightness":0.9
         }}];
         this.btnCurrencyAmountDec.addEventListener(MouseEvent.CLICK,this.handleButtonCurrencyAmountDecClick);
         this.btnCurrencyAmountDec.addEventListener(HoldonFireButton.EVENT_HOLDON_MOUSE_FIRE,this.handleButtonCurrencyAmountDecHoldonMouseFire);
         this.btnCurrencyAmountDec.delay = 200;
         this.btnCurrencyAmountDec.buttonMode = true;
         this.btnCurrencyAmountDec.useHandCursor = true;
         this.panelCurrencyAmount.addChild(this.btnCurrencyAmountDec);
         this.tfCurrencyAmountValue = this.panelCurrencyAmount.getChildByName("txtAmount") as TextField;
         if(_loc1_.realAmount == 0)
         {
            this.tfCurrencyAmountValue.text = "0";
         }
         else
         {
            this.tfCurrencyAmountValue.text = "1";
         }
         StyleModule.setTextFieldStyle(this.tfCurrencyAmountValue,StyleModule.HEADER_BOLD_11_CENTER);
         this.tfVirtualAmountValue = loadedContent.getChildByName("txtVirtualMoney") as TextField;
         StyleModule.setTextFieldStyle(this.tfVirtualAmountValue,StyleModule.HEADER_BOLD_11_CENTER);
         this.showVirtualManeyExchangeResult();
         var _loc4_:Sprite = AddAssetItem.addSpriteToContainer(loadedContent,AssetConfig.COMMONS_SMALL_ST_DARK_BUTTON,"commons",566,403,true);
         new SpriteButtonController(_loc4_,true,this.handleConfirmationSwapCurrrencyButtonClick,"zoo.window.bank.exchange.btnLabel",null,true);
         super.assignLoadedContentGUI();
      }
      
      private function handleConfirmationSwapCurrrencyButtonClick(param1:MouseEvent) : void
      {
         var _loc2_:int = parseInt(this.tfCurrencyAmountValue.text);
         if(_loc2_ > 0)
         {
            TempGetterProxy.sendNotification(NET.SWAP_CURRENCY,[_loc2_]);
         }
      }
      
      private function handleBuyZooDollarButtonClick(param1:MouseEvent) : void
      {
         TempGetterProxy.sendNotification(Note.EXIT_FULLSCREEN_MODE);
         notifier.dispatchNotice(new ExternalLinkNotice(ExternalLinkNotice.OPEN_EXTERNAL_PAYMENT));
      }
      
      private function handleBuyPremiumButtonClick(param1:MouseEvent) : void
      {
         TempGetterProxy.sendNotification(Note.EXIT_FULLSCREEN_MODE);
         notifier.dispatchNotice(new ExternalLinkNotice(ExternalLinkNotice.OPEN_EXTERNAL_PAYMENT_PREMIUM));
      }
      
      private function handleCashOffersButtonClick(param1:MouseEvent) : void
      {
         TempGetterProxy.sendNotification(Note.EXIT_FULLSCREEN_MODE);
         notifier.dispatchNotice(new ExternalLinkNotice(ExternalLinkNotice.OPEN_EXTERNAL_CASH_OFFERS));
      }
      
      private function handleBuyStarterPackButtonClick(param1:MouseEvent) : void
      {
         TempGetterProxy.sendNotification(Note.EXIT_FULLSCREEN_MODE);
         notifier.dispatchNotice(new ExternalLinkNotice(ExternalLinkNotice.OPEN_EXTERNAL_PAYMENT_STARTER_PACK));
      }
      
      private function handleButtonCurrencyAmountIncClick(param1:MouseEvent) : void
      {
         this.increaseCurrencyAmountValue();
      }
      
      private function handleButtonCurrencyAmountIncHoldonMouseFire(param1:MouseEvent) : void
      {
         this.increaseCurrencyAmountValue();
      }
      
      private function handleButtonCurrencyAmountDecClick(param1:MouseEvent) : void
      {
         this.decreaseCurrencyAmountValue();
      }
      
      private function handleButtonCurrencyAmountDecHoldonMouseFire(param1:MouseEvent) : void
      {
         this.decreaseCurrencyAmountValue();
      }
      
      private function increaseCurrencyAmountValue() : void
      {
         var _loc1_:int = parseInt(this.tfCurrencyAmountValue.text);
         var _loc2_:UserProxy = Facade.getInstance().getProxy(UserProxy);
         _loc1_++;
         if(_loc1_ > _loc2_.realAmount)
         {
            _loc1_ = _loc2_.realAmount;
         }
         this.tfCurrencyAmountValue.text = StringHelper.numberFormater(_loc1_,TextResourceModule.getText(LocalizationPath.NUMBER_THOUSAND_SEPARATOR),int(TextResourceModule.getText(LocalizationPath.NUMBER_DIGITS_SEPARATOR)));
         this.showVirtualManeyExchangeResult();
      }
      
      private function decreaseCurrencyAmountValue() : void
      {
         var _loc1_:int = parseInt(this.tfCurrencyAmountValue.text);
         _loc1_--;
         if(_loc1_ > 0)
         {
            this.tfCurrencyAmountValue.text = _loc1_.toString();
            this.showVirtualManeyExchangeResult();
         }
      }
      
      private function showVirtualManeyExchangeResult() : void
      {
         this.tfVirtualAmountValue.text = StringHelper.numberFormater(int(this.tfCurrencyAmountValue.text) * EXCHANGE_RATE,TextResourceModule.getText(LocalizationPath.NUMBER_THOUSAND_SEPARATOR),int(TextResourceModule.getText(LocalizationPath.NUMBER_DIGITS_SEPARATOR)));
      }
   }
}

