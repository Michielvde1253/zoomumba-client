package com.bigpoint.zoorama.core.feature.safari.windows
{
   import com.bigpoint.utils.StringHelper;
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoorama.Settings;
   import com.bigpoint.zoorama.data.LocalizationPath;
   import com.bigpoint.zoorama.utils.configModules.TextReplace;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.styleModule.StyleModule;
   import com.bigpoint.zoorama.view.gui.btn.HoldonFireButton;
   import com.bigpoint.zoorama.view.gui.core.Coreponent;
   import com.bigpoint.zoorama.view.gui.win.generals.WindowButtonParams;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class SafariBuyGasWindow extends SafariSizedSmallWindow
   {
      private var _scrollContainer:Sprite;
      
      private var _tfTitle:TextField;
      
      private var _tfInfo:TextField;
      
      private var _titleTxt:String = "";
      
      private var _infoTxt:String = "";
      
      private var _numStepperPanel:MovieClip;
      
      private var _btnAmountInc:HoldonFireButton;
      
      private var _btnAmountDec:HoldonFireButton;
      
      private var _fuelAmountTextField:TextField;
      
      private var _priceTextField:TextField;
      
      private var _fuelAmount:int;
      
      private var _minFuelAmount:int;
      
      private var _maxFuelAmount:int;
      
      private var _currentFuel:int;
      
      private var _fuelPrice:int;
      
      public function SafariBuyGasWindow(param1:Notifier, param2:int, param3:String, param4:int, param5:int, param6:int, param7:WindowButtonParams = null)
      {
         var _loc8_:String = null;
         _loc8_ = "SafariBuyGas";
         this._currentFuel = param4;
         this._fuelPrice = param6;
         this._titleTxt = TextResourceModule.getText("zoo.safari.title");
         var _loc9_:TextReplace = new TextReplace("%neededGas%",(param2 + param4).toString());
         var _loc10_:TextReplace = new TextReplace("%missingGas%",this._currentFuel.toString());
         var _loc11_:Vector.<TextReplace> = new Vector.<TextReplace>();
         _loc11_.push(_loc9_);
         _loc11_.push(_loc10_);
         this._infoTxt = TextResourceModule.getTextReplaced(param3,_loc11_);
         this._minFuelAmount = this._fuelAmount = param2;
         this._maxFuelAmount = param5 - param4;
         name = _loc8_.toString();
         modal = true;
         super(param1,_loc8_,param7);
      }
      
      private function createCurrencyPanel() : void
      {
         this._numStepperPanel = loadedContent.getChildByName("numStepperPanel") as MovieClip;
         var _loc1_:MovieClip = this._numStepperPanel.getChildByName("btnIncSkin") as MovieClip;
         this._btnAmountInc = new HoldonFireButton();
         this._btnAmountInc.skin = _loc1_;
         this._btnAmountInc.tweenMouseOverParams = [null,0.3,{"colorMatrixFilter":{
            "contrast":1.4,
            "brightness":1.4
         }}];
         this._btnAmountInc.tweenMouseOutParams = [null,0.3,{"colorMatrixFilter":{
            "contrast":0.9,
            "brightness":0.9
         }}];
         this._btnAmountInc.addEventListener(MouseEvent.CLICK,this.handleButtonCurrencyAmountIncClick);
         this._btnAmountInc.addEventListener(HoldonFireButton.EVENT_HOLDON_MOUSE_FIRE,this.handleButtonCurrencyAmountIncHoldonMouseFire);
         this._btnAmountInc.delay = 200;
         this._btnAmountInc.buttonMode = true;
         this._btnAmountInc.useHandCursor = true;
         this._numStepperPanel.addChild(this._btnAmountInc);
         var _loc2_:MovieClip = this._numStepperPanel.getChildByName("btnDecSkin") as MovieClip;
         this._btnAmountDec = new HoldonFireButton();
         this._btnAmountDec.skin = _loc2_;
         this._btnAmountDec.tweenMouseOverParams = [null,0.3,{"colorMatrixFilter":{
            "contrast":1.4,
            "brightness":1.4
         }}];
         this._btnAmountDec.tweenMouseOutParams = [null,0.3,{"colorMatrixFilter":{
            "contrast":0.9,
            "brightness":0.9
         }}];
         this._btnAmountDec.addEventListener(MouseEvent.CLICK,this.handleButtonCurrencyAmountDecClick);
         this._btnAmountDec.addEventListener(HoldonFireButton.EVENT_HOLDON_MOUSE_FIRE,this.handleButtonCurrencyAmountDecHoldonMouseFire);
         this._btnAmountDec.delay = 200;
         this._btnAmountDec.buttonMode = true;
         this._btnAmountDec.useHandCursor = true;
         this._numStepperPanel.addChild(this._btnAmountDec);
         this._fuelAmountTextField = this._numStepperPanel.getChildByName("txtAmount") as TextField;
         this._fuelAmountTextField.text = this._fuelAmount.toString();
         StyleModule.setTextFieldStyle(this._fuelAmountTextField,StyleModule.HEADER_BOLD_11_CENTER);
         this._priceTextField = loadedContent.getChildByName("txtPrice") as TextField;
         StyleModule.setTextFieldStyle(this._priceTextField,StyleModule.HEADER_BOLD_12_RIGHT);
         StyleModule.setTextFieldCSS(this._priceTextField);
         this.setPriceText();
      }
      
      private function setPriceText() : void
      {
         var _loc1_:int = this._fuelAmount * this._fuelPrice;
         this._priceTextField.text = "<span class=\'right12\'>" + _loc1_ + "</span>";
      }
      
      private function handleButtonCurrencyAmountIncClick(param1:MouseEvent) : void
      {
         this.increaseAmountValue();
      }
      
      private function handleButtonCurrencyAmountIncHoldonMouseFire(param1:MouseEvent) : void
      {
         this.increaseAmountValue();
      }
      
      private function handleButtonCurrencyAmountDecClick(param1:MouseEvent) : void
      {
         this.decreaseAmountValue();
      }
      
      private function handleButtonCurrencyAmountDecHoldonMouseFire(param1:MouseEvent) : void
      {
         this.decreaseAmountValue();
      }
      
      private function increaseAmountValue() : void
      {
         this._fuelAmount = Math.min(this._maxFuelAmount,++this._fuelAmount);
         this._fuelAmountTextField.text = StringHelper.numberFormater(this._fuelAmount,TextResourceModule.getText(LocalizationPath.NUMBER_THOUSAND_SEPARATOR),int(TextResourceModule.getText(LocalizationPath.NUMBER_DIGITS_SEPARATOR)));
         this.setPriceText();
      }
      
      private function decreaseAmountValue() : void
      {
         this._fuelAmount = Math.max(this._minFuelAmount,--this._fuelAmount);
         this._fuelAmountTextField.text = this._fuelAmount.toString();
         this.setPriceText();
      }
      
      override protected function assignLoadedContentGUI() : void
      {
         var _loc1_:Sprite = null;
         this.createCurrencyPanel();
         this._tfTitle = loadedContent.getChildByName("txt_title") as TextField;
         StyleModule.setTextFieldStyle(this._tfTitle,StyleModule.HEADER_22_CENTER);
         StyleModule.setTextFieldCSS(this._tfTitle);
         if(this._titleTxt)
         {
            this._tfTitle.text = "<span class=\'center22\'>" + this._titleTxt + "</span>";
         }
         this._scrollContainer = loadedContent.getChildByName("SC_TF_INFO") as Sprite;
         if(this._scrollContainer)
         {
            _loc1_ = this._scrollContainer.getChildByName("content") as Sprite;
            this._tfInfo = _loc1_.getChildByName("TF_INFO") as TextField;
            StyleModule.setTextFieldStyle(this._tfInfo,StyleModule.HEADER_12_CENTER);
            StyleModule.setTextFieldCSS(this._tfInfo);
            if(this._infoTxt)
            {
               this._tfInfo.text = "<span class=\'center12\'>" + this._infoTxt + "</span>";
            }
         }
         traceAllChilds();
         super.assignLoadedContentGUI();
      }
      
      override public function draw() : void
      {
         if(Settings.SCALE_TEST)
         {
            halign = Coreponent.ALIGN_H_LEFT;
            valign = Coreponent.ALIGN_V_TOP;
            this.x = 243;
            this.y = 110;
         }
         super.draw();
      }
      
      public function get fuelAmount() : int
      {
         return this._fuelAmount;
      }
   }
}

