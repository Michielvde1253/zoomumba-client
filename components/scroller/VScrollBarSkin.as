package components.scroller
{
   import buttons.skin.ButtonShowBitmapSkin;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Button;
   import spark.components.VScrollBar;
   import spark.primitives.BitmapImage;
   import spark.skins.SparkSkin;
   import spark.skins.spark.HScrollBarTrackSkin;
   
   public class VScrollBarSkin extends SparkSkin implements IStateClient2
   {
      private var _853009829decrementButton:Button;
      
      private var _454226047incrementButton:Button;
      
      private var _110342614thumb:Button;
      
      private var _110621003track:Button;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__components_Components_swf_ScrollerArrowUp_2050925903:Class = VScrollBarSkin__embed_mxml__components_Components_swf_ScrollerArrowUp_2050925903;
      
      private var _embed_mxml__components_Components_swf_ScrollerThumb_1286575677:Class = VScrollBarSkin__embed_mxml__components_Components_swf_ScrollerThumb_1286575677;
      
      private var _embed_mxml__general_Patterns_swf_VPatternWood8_1720359342:Class = VScrollBarSkin__embed_mxml__general_Patterns_swf_VPatternWood8_1720359342;
      
      private var _213507019hostComponent:VScrollBar;
      
      public function VScrollBarSkin()
      {
         super();
         this.minWidth = 25;
         this.maxWidth = 25;
         this.mxmlContent = [this._VScrollBarSkin_BitmapImage1_c(),this._VScrollBarSkin_Button1_i(),this._VScrollBarSkin_Button2_i(),this._VScrollBarSkin_Button3_i(),this._VScrollBarSkin_Button4_i()];
         this.currentState = "normal";
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"disabled",
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            })]
         }),new State({
            "name":"inactive",
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            }),new SetProperty().initializeFromObject({
               "target":"decrementButton",
               "name":"enabled",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"incrementButton",
               "name":"enabled",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"thumb",
               "name":"visible",
               "value":false
            })]
         })];
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         super.moduleFactory = param1;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      private function _VScrollBarSkin_BitmapImage1_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.x = 6;
         _loc1_.top = 8;
         _loc1_.bottom = 8;
         _loc1_.source = this._embed_mxml__general_Patterns_swf_VPatternWood8_1720359342;
         _loc1_.initialized(this,null);
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _VScrollBarSkin_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.top = 17;
         _loc1_.bottom = 17;
         _loc1_.width = 20;
         _loc1_.alpha = 0;
         _loc1_.focusEnabled = false;
         _loc1_.setStyle("skinClass",HScrollBarTrackSkin);
         _loc1_.id = "track";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.track = _loc1_;
         BindingManager.executeBindings(this,"track",this.track);
         return _loc1_;
      }
      
      private function _VScrollBarSkin_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.top = 0;
         _loc1_.buttonMode = true;
         _loc1_.content = this._embed_mxml__components_Components_swf_ScrollerArrowUp_2050925903;
         _loc1_.focusEnabled = false;
         _loc1_.useHandCursor = true;
         _loc1_.setStyle("skinClass",ButtonShowBitmapSkin);
         _loc1_.id = "decrementButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.decrementButton = _loc1_;
         BindingManager.executeBindings(this,"decrementButton",this.decrementButton);
         return _loc1_;
      }
      
      private function _VScrollBarSkin_Button3_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.bottom = 0;
         _loc1_.buttonMode = true;
         _loc1_.content = this._embed_mxml__components_Components_swf_ScrollerArrowUp_2050925903;
         _loc1_.focusEnabled = false;
         _loc1_.scaleY = -1;
         _loc1_.useHandCursor = true;
         _loc1_.setStyle("skinClass",ButtonShowBitmapSkin);
         _loc1_.id = "incrementButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.incrementButton = _loc1_;
         BindingManager.executeBindings(this,"incrementButton",this.incrementButton);
         return _loc1_;
      }
      
      private function _VScrollBarSkin_Button4_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.content = this._embed_mxml__components_Components_swf_ScrollerThumb_1286575677;
         _loc1_.focusEnabled = false;
         _loc1_.useHandCursor = true;
         _loc1_.setStyle("skinClass",ButtonShowBitmapSkin);
         _loc1_.id = "thumb";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.thumb = _loc1_;
         BindingManager.executeBindings(this,"thumb",this.thumb);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get decrementButton() : Button
      {
         return this._853009829decrementButton;
      }
      
      public function set decrementButton(param1:Button) : void
      {
         var _loc2_:Object = this._853009829decrementButton;
         if(_loc2_ !== param1)
         {
            this._853009829decrementButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"decrementButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get incrementButton() : Button
      {
         return this._454226047incrementButton;
      }
      
      public function set incrementButton(param1:Button) : void
      {
         var _loc2_:Object = this._454226047incrementButton;
         if(_loc2_ !== param1)
         {
            this._454226047incrementButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"incrementButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get thumb() : Button
      {
         return this._110342614thumb;
      }
      
      public function set thumb(param1:Button) : void
      {
         var _loc2_:Object = this._110342614thumb;
         if(_loc2_ !== param1)
         {
            this._110342614thumb = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"thumb",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get track() : Button
      {
         return this._110621003track;
      }
      
      public function set track(param1:Button) : void
      {
         var _loc2_:Object = this._110621003track;
         if(_loc2_ !== param1)
         {
            this._110621003track = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"track",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : VScrollBar
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:VScrollBar) : void
      {
         var _loc2_:Object = this._213507019hostComponent;
         if(_loc2_ !== param1)
         {
            this._213507019hostComponent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hostComponent",_loc2_,param1));
            }
         }
      }
   }
}

