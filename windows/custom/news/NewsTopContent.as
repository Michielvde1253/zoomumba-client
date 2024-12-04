package windows.custom.news
{
   import components.image.BackgroundImage;
   import components.image.StandardImage;
   import components.textfield.StandardText;
   import components.textfield.gradientText.GradientText;
   import components.textfield.labelDisplay.LabelDisplay;
   import components.textfield.labelDisplay.skin.LabelDisplayGoldSkin;
   import custom.card.component.CardGroupHolder;
   import custom.loader.Prealoder;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.VGroup;
   import spark.primitives.BitmapImage;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   
   public class NewsTopContent extends Group
   {
      private var _1378241396bubble:StandardImage;
      
      private var _171849691cardGroupHolder:CardGroupHolder;
      
      private var _100355670inner:InnerGroup;
      
      private var _1666258388labelMoney:LabelDisplay;
      
      private var _102977236lineH:BitmapImage;
      
      private var _102977250lineV:BitmapImage;
      
      private var _1591714401moneyGroup:Group;
      
      private var _332380445moneyImg:StandardImage;
      
      private var _1113514890preloader:Prealoder;
      
      private var _109620778sonia:StandardImage;
      
      private var _1055437424textLine1:StandardText;
      
      private var _1055437423textLine2:GradientText;
      
      private var _1055437422textLine3:StandardText;
      
      private var _1088781901textNewItems:GradientText;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function NewsTopContent()
      {
         super();
         this.mxmlContent = [this._NewsTopContent_InnerGroup1_i(),this._NewsTopContent_OuterGroup1_c()];
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
      
      private function _NewsTopContent_InnerGroup1_i() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._NewsTopContent_BitmapImage1_i(),this._NewsTopContent_BitmapImage2_i(),this._NewsTopContent_HGroup1_c(),this._NewsTopContent_GradientText1_i(),this._NewsTopContent_Prealoder1_i()];
         _loc1_.id = "inner";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.inner = _loc1_;
         BindingManager.executeBindings(this,"inner",this.inner);
         return _loc1_;
      }
      
      private function _NewsTopContent_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.width = 280;
         _loc1_.fillMode = "scale";
         _loc1_.x = 390;
         _loc1_.y = 255;
         _loc1_.initialized(this,"lineH");
         this.lineH = _loc1_;
         BindingManager.executeBindings(this,"lineH",this.lineH);
         return _loc1_;
      }
      
      private function _NewsTopContent_BitmapImage2_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.rotation = 90;
         _loc1_.width = 350;
         _loc1_.x = 390;
         _loc1_.y = 150;
         _loc1_.fillMode = "scale";
         _loc1_.initialized(this,"lineV");
         this.lineV = _loc1_;
         BindingManager.executeBindings(this,"lineV",this.lineV);
         return _loc1_;
      }
      
      private function _NewsTopContent_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.x = 392;
         _loc1_.y = 210;
         _loc1_.verticalAlign = "middle";
         _loc1_.horizontalCenter = 165;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._NewsTopContent_Group2_i(),this._NewsTopContent_LabelDisplay1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _NewsTopContent_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._NewsTopContent_BackgroundImage1_c(),this._NewsTopContent_StandardImage1_i()];
         _loc1_.id = "moneyGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.moneyGroup = _loc1_;
         BindingManager.executeBindings(this,"moneyGroup",this.moneyGroup);
         return _loc1_;
      }
      
      private function _NewsTopContent_BackgroundImage1_c() : BackgroundImage
      {
         var _loc1_:BackgroundImage = new BackgroundImage();
         _loc1_.currentState = "inner";
         _loc1_.scale = 0.35;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _NewsTopContent_StandardImage1_i() : StandardImage
      {
         var _loc1_:StandardImage = new StandardImage();
         _loc1_.currentState = "imageFree";
         _loc1_.displayScale = 0.6;
         _loc1_.x = 23;
         _loc1_.y = 22;
         _loc1_.id = "moneyImg";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.moneyImg = _loc1_;
         BindingManager.executeBindings(this,"moneyImg",this.moneyImg);
         return _loc1_;
      }
      
      private function _NewsTopContent_LabelDisplay1_i() : LabelDisplay
      {
         var _loc1_:LabelDisplay = new LabelDisplay();
         _loc1_.type = "petPenny";
         _loc1_.value = 200;
         _loc1_.setStyle("skinClass",LabelDisplayGoldSkin);
         _loc1_.id = "labelMoney";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.labelMoney = _loc1_;
         BindingManager.executeBindings(this,"labelMoney",this.labelMoney);
         return _loc1_;
      }
      
      private function _NewsTopContent_GradientText1_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.x = 395;
         _loc1_.y = 260;
         _loc1_.fontSize = 14;
         _loc1_.text = "New items:";
         _loc1_.id = "textNewItems";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.textNewItems = _loc1_;
         BindingManager.executeBindings(this,"textNewItems",this.textNewItems);
         return _loc1_;
      }
      
      private function _NewsTopContent_Prealoder1_i() : Prealoder
      {
         var _loc1_:Prealoder = new Prealoder();
         _loc1_.x = 196;
         _loc1_.y = 279;
         _loc1_.id = "preloader";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.preloader = _loc1_;
         BindingManager.executeBindings(this,"preloader",this.preloader);
         return _loc1_;
      }
      
      private function _NewsTopContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._NewsTopContent_Group3_c(),this._NewsTopContent_CardGroupHolder1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _NewsTopContent_Group3_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 330;
         _loc1_.y = 90;
         _loc1_.mxmlContent = [this._NewsTopContent_BackgroundImage2_c(),this._NewsTopContent_StandardImage2_i(),this._NewsTopContent_StandardImage3_i(),this._NewsTopContent_VGroup1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _NewsTopContent_BackgroundImage2_c() : BackgroundImage
      {
         var _loc1_:BackgroundImage = new BackgroundImage();
         _loc1_.scale = 0.85;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _NewsTopContent_StandardImage2_i() : StandardImage
      {
         var _loc1_:StandardImage = new StandardImage();
         _loc1_.x = 80;
         _loc1_.y = 4;
         _loc1_.id = "bubble";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.bubble = _loc1_;
         BindingManager.executeBindings(this,"bubble",this.bubble);
         return _loc1_;
      }
      
      private function _NewsTopContent_StandardImage3_i() : StandardImage
      {
         var _loc1_:StandardImage = new StandardImage();
         _loc1_.x = 26;
         _loc1_.y = -5;
         _loc1_.id = "sonia";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sonia = _loc1_;
         BindingManager.executeBindings(this,"sonia",this.sonia);
         return _loc1_;
      }
      
      private function _NewsTopContent_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.x = 130;
         _loc1_.y = 23;
         _loc1_.gap = -6;
         _loc1_.mxmlContent = [this._NewsTopContent_StandardText1_i(),this._NewsTopContent_GradientText2_i(),this._NewsTopContent_StandardText2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _NewsTopContent_StandardText1_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.text = "Hello";
         _loc1_.setStyle("paddingLeft",3);
         _loc1_.id = "textLine1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.textLine1 = _loc1_;
         BindingManager.executeBindings(this,"textLine1",this.textLine1);
         return _loc1_;
      }
      
      private function _NewsTopContent_GradientText2_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.text = "Name";
         _loc1_.id = "textLine2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.textLine2 = _loc1_;
         BindingManager.executeBindings(this,"textLine2",this.textLine2);
         return _loc1_;
      }
      
      private function _NewsTopContent_StandardText2_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.text = "Welcome";
         _loc1_.width = 200;
         _loc1_.setStyle("paddingLeft",3);
         _loc1_.id = "textLine3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.textLine3 = _loc1_;
         BindingManager.executeBindings(this,"textLine3",this.textLine3);
         return _loc1_;
      }
      
      private function _NewsTopContent_CardGroupHolder1_i() : CardGroupHolder
      {
         var _loc1_:CardGroupHolder = new CardGroupHolder();
         _loc1_.x = 460;
         _loc1_.y = 288;
         _loc1_.height = 175;
         _loc1_.width = 130;
         _loc1_.currentState = "noForwardArrows";
         _loc1_.id = "cardGroupHolder";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.cardGroupHolder = _loc1_;
         BindingManager.executeBindings(this,"cardGroupHolder",this.cardGroupHolder);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get bubble() : StandardImage
      {
         return this._1378241396bubble;
      }
      
      public function set bubble(param1:StandardImage) : void
      {
         var _loc2_:Object = this._1378241396bubble;
         if(_loc2_ !== param1)
         {
            this._1378241396bubble = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bubble",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get cardGroupHolder() : CardGroupHolder
      {
         return this._171849691cardGroupHolder;
      }
      
      public function set cardGroupHolder(param1:CardGroupHolder) : void
      {
         var _loc2_:Object = this._171849691cardGroupHolder;
         if(_loc2_ !== param1)
         {
            this._171849691cardGroupHolder = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cardGroupHolder",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get inner() : InnerGroup
      {
         return this._100355670inner;
      }
      
      public function set inner(param1:InnerGroup) : void
      {
         var _loc2_:Object = this._100355670inner;
         if(_loc2_ !== param1)
         {
            this._100355670inner = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"inner",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get labelMoney() : LabelDisplay
      {
         return this._1666258388labelMoney;
      }
      
      public function set labelMoney(param1:LabelDisplay) : void
      {
         var _loc2_:Object = this._1666258388labelMoney;
         if(_loc2_ !== param1)
         {
            this._1666258388labelMoney = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"labelMoney",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lineH() : BitmapImage
      {
         return this._102977236lineH;
      }
      
      public function set lineH(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._102977236lineH;
         if(_loc2_ !== param1)
         {
            this._102977236lineH = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lineH",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lineV() : BitmapImage
      {
         return this._102977250lineV;
      }
      
      public function set lineV(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._102977250lineV;
         if(_loc2_ !== param1)
         {
            this._102977250lineV = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lineV",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get moneyGroup() : Group
      {
         return this._1591714401moneyGroup;
      }
      
      public function set moneyGroup(param1:Group) : void
      {
         var _loc2_:Object = this._1591714401moneyGroup;
         if(_loc2_ !== param1)
         {
            this._1591714401moneyGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"moneyGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get moneyImg() : StandardImage
      {
         return this._332380445moneyImg;
      }
      
      public function set moneyImg(param1:StandardImage) : void
      {
         var _loc2_:Object = this._332380445moneyImg;
         if(_loc2_ !== param1)
         {
            this._332380445moneyImg = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"moneyImg",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get preloader() : Prealoder
      {
         return this._1113514890preloader;
      }
      
      public function set preloader(param1:Prealoder) : void
      {
         var _loc2_:Object = this._1113514890preloader;
         if(_loc2_ !== param1)
         {
            this._1113514890preloader = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"preloader",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sonia() : StandardImage
      {
         return this._109620778sonia;
      }
      
      public function set sonia(param1:StandardImage) : void
      {
         var _loc2_:Object = this._109620778sonia;
         if(_loc2_ !== param1)
         {
            this._109620778sonia = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sonia",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get textLine1() : StandardText
      {
         return this._1055437424textLine1;
      }
      
      public function set textLine1(param1:StandardText) : void
      {
         var _loc2_:Object = this._1055437424textLine1;
         if(_loc2_ !== param1)
         {
            this._1055437424textLine1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"textLine1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get textLine2() : GradientText
      {
         return this._1055437423textLine2;
      }
      
      public function set textLine2(param1:GradientText) : void
      {
         var _loc2_:Object = this._1055437423textLine2;
         if(_loc2_ !== param1)
         {
            this._1055437423textLine2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"textLine2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get textLine3() : StandardText
      {
         return this._1055437422textLine3;
      }
      
      public function set textLine3(param1:StandardText) : void
      {
         var _loc2_:Object = this._1055437422textLine3;
         if(_loc2_ !== param1)
         {
            this._1055437422textLine3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"textLine3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get textNewItems() : GradientText
      {
         return this._1088781901textNewItems;
      }
      
      public function set textNewItems(param1:GradientText) : void
      {
         var _loc2_:Object = this._1088781901textNewItems;
         if(_loc2_ !== param1)
         {
            this._1088781901textNewItems = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"textNewItems",_loc2_,param1));
            }
         }
      }
   }
}

