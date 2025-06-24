package windows.custom.gifts
{
   import buttons.simpleButton.BuyButtonBigSkin;
   import components.textfield.gradientText.GradientText;
   import mx.binding.BindingManager;
   import mx.controls.Text;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.VGroup;
   import spark.core.SpriteVisualElement;
   import spark.primitives.BitmapImage;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   
   public class SendGiftContent extends Group
   {
      private var _1126464094addUserButton:SpriteVisualElement;
      
      private var _1332194002background:BitmapImage;
      
      private var _97739box:BitmapImage;
      
      private var _792593582buddyListInfo:Text;
      
      private var _842839668downButton:BitmapImage;
      
      private var _657809535downButtonHit:Group;
      
      private var _849114606giftList:VGroup;
      
      private var _849166299giftName:GradientText;
      
      private var _849349245giftText:GradientText;
      
      private var _713510sendButton:Button;
      
      private var _367690157upButton:BitmapImage;
      
      private var _1690934950upButtonHit:Group;
      
      private var _1290163347userIdText:GradientText;
      
      private var _1008002851usernameText:GradientText;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function SendGiftContent()
      {
         super();
         this.mxmlContent = [this._SendGiftContent_InnerGroup1_c(),this._SendGiftContent_OuterGroup1_c()];
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
      
      private function _SendGiftContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._SendGiftContent_BitmapImage1_i(),this._SendGiftContent_BitmapImage2_i(),this._SendGiftContent_Text1_i(),this._SendGiftContent_GradientText1_i(),this._SendGiftContent_GradientText2_i(),this._SendGiftContent_GradientText3_i(),this._SendGiftContent_GradientText4_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _SendGiftContent_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.x = 24;
         _loc1_.y = 30;
         _loc1_.initialized(this,"background");
         this.background = _loc1_;
         BindingManager.executeBindings(this,"background",this.background);
         return _loc1_;
      }
      
      private function _SendGiftContent_BitmapImage2_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.x = 67;
         _loc1_.y = 260;
         _loc1_.initialized(this,"box");
         this.box = _loc1_;
         BindingManager.executeBindings(this,"box",this.box);
         return _loc1_;
      }
      
      private function _SendGiftContent_Text1_i() : Text
      {
         var _loc1_:Text = new Text();
         _loc1_.x = 70;
         _loc1_.y = 185;
         _loc1_.width = 180;
         _loc1_.height = 150;
         _loc1_.selectable = false;
         _loc1_.setStyle("fontFamily","Tahoma");
         _loc1_.setStyle("fontSize",12);
         _loc1_.setStyle("color",3676672);
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.id = "buddyListInfo";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.buddyListInfo = _loc1_;
         BindingManager.executeBindings(this,"buddyListInfo",this.buddyListInfo);
         return _loc1_;
      }
      
      private function _SendGiftContent_GradientText1_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.x = 95;
         _loc1_.y = 245;
         _loc1_.text = "5x Superfutter";
         _loc1_.fontSize = 13;
         _loc1_.fontWeight = "bold";
         _loc1_.id = "giftName";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.giftName = _loc1_;
         BindingManager.executeBindings(this,"giftName",this.giftName);
         return _loc1_;
      }
      
      private function _SendGiftContent_GradientText2_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.x = 100;
         _loc1_.y = 128;
         _loc1_.text = "Spielername";
         _loc1_.fontSize = 13;
         _loc1_.fontWeight = "bold";
         _loc1_.id = "giftText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.giftText = _loc1_;
         BindingManager.executeBindings(this,"giftText",this.giftText);
         return _loc1_;
      }
      
      private function _SendGiftContent_GradientText3_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.x = 352;
         _loc1_.y = 128;
         _loc1_.text = "Spielername";
         _loc1_.fontSize = 13;
         _loc1_.fontWeight = "bold";
         _loc1_.id = "usernameText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.usernameText = _loc1_;
         BindingManager.executeBindings(this,"usernameText",this.usernameText);
         return _loc1_;
      }
      
      private function _SendGiftContent_GradientText4_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.x = 555;
         _loc1_.y = 128;
         _loc1_.text = "Spieler-ID";
         _loc1_.fontSize = 13;
         _loc1_.fontWeight = "bold";
         _loc1_.id = "userIdText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.userIdText = _loc1_;
         BindingManager.executeBindings(this,"userIdText",this.userIdText);
         return _loc1_;
      }
      
      private function _SendGiftContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._SendGiftContent_SpriteVisualElement1_i(),this._SendGiftContent_VGroup1_i(),this._SendGiftContent_Group2_i(),this._SendGiftContent_Group3_i(),this._SendGiftContent_Button1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _SendGiftContent_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.x = 600;
         _loc1_.y = 82;
         _loc1_.initialized(this,"addUserButton");
         this.addUserButton = _loc1_;
         BindingManager.executeBindings(this,"addUserButton",this.addUserButton);
         return _loc1_;
      }
      
      private function _SendGiftContent_VGroup1_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.gap = 1;
         _loc1_.x = 260;
         _loc1_.y = 165;
         _loc1_.width = 390;
         _loc1_.height = 230;
         _loc1_.id = "giftList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.giftList = _loc1_;
         BindingManager.executeBindings(this,"giftList",this.giftList);
         return _loc1_;
      }
      
      private function _SendGiftContent_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 647;
         _loc1_.y = 273;
         _loc1_.mxmlContent = [this._SendGiftContent_BitmapImage3_i()];
         _loc1_.id = "upButtonHit";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.upButtonHit = _loc1_;
         BindingManager.executeBindings(this,"upButtonHit",this.upButtonHit);
         return _loc1_;
      }
      
      private function _SendGiftContent_BitmapImage3_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.initialized(this,"upButton");
         this.upButton = _loc1_;
         BindingManager.executeBindings(this,"upButton",this.upButton);
         return _loc1_;
      }
      
      private function _SendGiftContent_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 647;
         _loc1_.y = 313;
         _loc1_.mxmlContent = [this._SendGiftContent_BitmapImage4_i()];
         _loc1_.id = "downButtonHit";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.downButtonHit = _loc1_;
         BindingManager.executeBindings(this,"downButtonHit",this.downButtonHit);
         return _loc1_;
      }
      
      private function _SendGiftContent_BitmapImage4_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.initialized(this,"downButton");
         this.downButton = _loc1_;
         BindingManager.executeBindings(this,"downButton",this.downButton);
         return _loc1_;
      }
      
      private function _SendGiftContent_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.x = 275;
         _loc1_.y = 435;
         _loc1_.label = "send";
         _loc1_.setStyle("skinClass",BuyButtonBigSkin);
         _loc1_.id = "sendButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sendButton = _loc1_;
         BindingManager.executeBindings(this,"sendButton",this.sendButton);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get addUserButton() : SpriteVisualElement
      {
         return this._1126464094addUserButton;
      }
      
      public function set addUserButton(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._1126464094addUserButton;
         if(_loc2_ !== param1)
         {
            this._1126464094addUserButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"addUserButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get background() : BitmapImage
      {
         return this._1332194002background;
      }
      
      public function set background(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1332194002background;
         if(_loc2_ !== param1)
         {
            this._1332194002background = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"background",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get box() : BitmapImage
      {
         return this._97739box;
      }
      
      public function set box(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._97739box;
         if(_loc2_ !== param1)
         {
            this._97739box = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"box",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get buddyListInfo() : Text
      {
         return this._792593582buddyListInfo;
      }
      
      public function set buddyListInfo(param1:Text) : void
      {
         var _loc2_:Object = this._792593582buddyListInfo;
         if(_loc2_ !== param1)
         {
            this._792593582buddyListInfo = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"buddyListInfo",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get downButton() : BitmapImage
      {
         return this._842839668downButton;
      }
      
      public function set downButton(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._842839668downButton;
         if(_loc2_ !== param1)
         {
            this._842839668downButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"downButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get downButtonHit() : Group
      {
         return this._657809535downButtonHit;
      }
      
      public function set downButtonHit(param1:Group) : void
      {
         var _loc2_:Object = this._657809535downButtonHit;
         if(_loc2_ !== param1)
         {
            this._657809535downButtonHit = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"downButtonHit",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get giftList() : VGroup
      {
         return this._849114606giftList;
      }
      
      public function set giftList(param1:VGroup) : void
      {
         var _loc2_:Object = this._849114606giftList;
         if(_loc2_ !== param1)
         {
            this._849114606giftList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"giftList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get giftName() : GradientText
      {
         return this._849166299giftName;
      }
      
      public function set giftName(param1:GradientText) : void
      {
         var _loc2_:Object = this._849166299giftName;
         if(_loc2_ !== param1)
         {
            this._849166299giftName = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"giftName",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get giftText() : GradientText
      {
         return this._849349245giftText;
      }
      
      public function set giftText(param1:GradientText) : void
      {
         var _loc2_:Object = this._849349245giftText;
         if(_loc2_ !== param1)
         {
            this._849349245giftText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"giftText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sendButton() : Button
      {
         return this._713510sendButton;
      }
      
      public function set sendButton(param1:Button) : void
      {
         var _loc2_:Object = this._713510sendButton;
         if(_loc2_ !== param1)
         {
            this._713510sendButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sendButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get upButton() : BitmapImage
      {
         return this._367690157upButton;
      }
      
      public function set upButton(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._367690157upButton;
         if(_loc2_ !== param1)
         {
            this._367690157upButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"upButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get upButtonHit() : Group
      {
         return this._1690934950upButtonHit;
      }
      
      public function set upButtonHit(param1:Group) : void
      {
         var _loc2_:Object = this._1690934950upButtonHit;
         if(_loc2_ !== param1)
         {
            this._1690934950upButtonHit = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"upButtonHit",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get userIdText() : GradientText
      {
         return this._1290163347userIdText;
      }
      
      public function set userIdText(param1:GradientText) : void
      {
         var _loc2_:Object = this._1290163347userIdText;
         if(_loc2_ !== param1)
         {
            this._1290163347userIdText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"userIdText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get usernameText() : GradientText
      {
         return this._1008002851usernameText;
      }
      
      public function set usernameText(param1:GradientText) : void
      {
         var _loc2_:Object = this._1008002851usernameText;
         if(_loc2_ !== param1)
         {
            this._1008002851usernameText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"usernameText",_loc2_,param1));
            }
         }
      }
   }
}

