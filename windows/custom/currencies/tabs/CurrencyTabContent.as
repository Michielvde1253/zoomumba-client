package windows.custom.currencies.tabs
{
   import components.textfield.StandardText;
   import components.textfield.gradientText.GradientText;
   import components.textfield.labelDisplay.LabelDisplay;
   import components.textfield.labelDisplay.skin.LabelDisplayBigSkin;
   import mx.binding.BindingManager;
   import mx.controls.Image;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.BitmapFill;
   import spark.components.Group;
   import spark.primitives.BitmapImage;
   import spark.primitives.Path;
   import windows.core.InnerGroup;
   
   public class CurrencyTabContent extends Group
   {
      private var _720774612bitmapForest:BitmapImage;
      
      private var _1778861511bitmapGrass:BitmapFill;
      
      private var _1743591997bitmapLine:BitmapImage;
      
      private var _1743258500bitmapWood:BitmapImage;
      
      private var _94420469cage1:Image;
      
      private var _94420470cage2:Image;
      
      private var _575402001currency:LabelDisplay;
      
      private var _105914587pPaw1:BitmapImage;
      
      private var _105914588pPaw2:BitmapImage;
      
      private var _3433613paws:GradientText;
      
      private var _3556653text:StandardText;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function CurrencyTabContent()
      {
         super();
         this.mxmlContent = [this._CurrencyTabContent_InnerGroup1_c()];
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
      
      private function _CurrencyTabContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._CurrencyTabContent_Path1_c(),this._CurrencyTabContent_Group2_c(),this._CurrencyTabContent_BitmapImage2_i(),this._CurrencyTabContent_BitmapImage3_i(),this._CurrencyTabContent_Group3_c(),this._CurrencyTabContent_Group4_c(),this._CurrencyTabContent_BitmapImage4_i(),this._CurrencyTabContent_BitmapImage5_i(),this._CurrencyTabContent_Group5_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CurrencyTabContent_Path1_c() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.left = 20;
         _loc1_.bottom = 25;
         _loc1_.data = "M353 300 62 300 0 238 0 0 353 0 353 300";
         _loc1_.fill = this._CurrencyTabContent_BitmapFill1_i();
         _loc1_.initialized(this,null);
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CurrencyTabContent_BitmapFill1_i() : BitmapFill
      {
         var _loc1_:BitmapFill = new BitmapFill();
         _loc1_.fillMode = "repeat";
         this.bitmapGrass = _loc1_;
         BindingManager.executeBindings(this,"bitmapGrass",this.bitmapGrass);
         return _loc1_;
      }
      
      private function _CurrencyTabContent_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.right = 30;
         _loc1_.bottom = 140;
         _loc1_.mxmlContent = [this._CurrencyTabContent_BitmapImage1_i(),this._CurrencyTabContent_LabelDisplay1_i(),this._CurrencyTabContent_GradientText1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CurrencyTabContent_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.width = 300;
         _loc1_.fillMode = "clip";
         _loc1_.initialized(this,"bitmapWood");
         this.bitmapWood = _loc1_;
         BindingManager.executeBindings(this,"bitmapWood",this.bitmapWood);
         return _loc1_;
      }
      
      private function _CurrencyTabContent_LabelDisplay1_i() : LabelDisplay
      {
         var _loc1_:LabelDisplay = new LabelDisplay();
         _loc1_.left = 10;
         _loc1_.verticalCenter = 0;
         _loc1_.setStyle("skinClass",LabelDisplayBigSkin);
         _loc1_.id = "currency";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.currency = _loc1_;
         BindingManager.executeBindings(this,"currency",this.currency);
         return _loc1_;
      }
      
      private function _CurrencyTabContent_GradientText1_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.fontSize = 14;
         _loc1_.id = "paws";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.paws = _loc1_;
         BindingManager.executeBindings(this,"paws",this.paws);
         return _loc1_;
      }
      
      private function _CurrencyTabContent_BitmapImage2_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.left = 370;
         _loc1_.bottom = 20;
         _loc1_.height = 290;
         _loc1_.fillMode = "clip";
         _loc1_.initialized(this,"bitmapLine");
         this.bitmapLine = _loc1_;
         BindingManager.executeBindings(this,"bitmapLine",this.bitmapLine);
         return _loc1_;
      }
      
      private function _CurrencyTabContent_BitmapImage3_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.left = 30;
         _loc1_.bottom = 285;
         _loc1_.initialized(this,"bitmapForest");
         this.bitmapForest = _loc1_;
         BindingManager.executeBindings(this,"bitmapForest",this.bitmapForest);
         return _loc1_;
      }
      
      private function _CurrencyTabContent_Group3_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 140;
         _loc1_.bottom = 190;
         _loc1_.maxWidth = 1;
         _loc1_.maxHeight = 1;
         _loc1_.mxmlContent = [this._CurrencyTabContent_Image1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CurrencyTabContent_Image1_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.scaleX = 0.7;
         _loc1_.scaleY = 0.7;
         _loc1_.id = "cage1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.cage1 = _loc1_;
         BindingManager.executeBindings(this,"cage1",this.cage1);
         return _loc1_;
      }
      
      private function _CurrencyTabContent_Group4_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 260;
         _loc1_.bottom = 140;
         _loc1_.maxWidth = 1;
         _loc1_.maxHeight = 1;
         _loc1_.mxmlContent = [this._CurrencyTabContent_Image2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CurrencyTabContent_Image2_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.scaleX = 0.7;
         _loc1_.scaleY = 0.7;
         _loc1_.id = "cage2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.cage2 = _loc1_;
         BindingManager.executeBindings(this,"cage2",this.cage2);
         return _loc1_;
      }
      
      private function _CurrencyTabContent_BitmapImage4_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.left = 80;
         _loc1_.bottom = 50;
         _loc1_.initialized(this,"pPaw1");
         this.pPaw1 = _loc1_;
         BindingManager.executeBindings(this,"pPaw1",this.pPaw1);
         return _loc1_;
      }
      
      private function _CurrencyTabContent_BitmapImage5_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.left = 200;
         _loc1_.bottom = 210;
         _loc1_.initialized(this,"pPaw2");
         this.pPaw2 = _loc1_;
         BindingManager.executeBindings(this,"pPaw2",this.pPaw2);
         return _loc1_;
      }
      
      private function _CurrencyTabContent_Group5_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 385;
         _loc1_.y = 155;
         _loc1_.width = 270;
         _loc1_.height = 155;
         _loc1_.mxmlContent = [this._CurrencyTabContent_StandardText1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CurrencyTabContent_StandardText1_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.width = 255;
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.id = "text";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.text = _loc1_;
         BindingManager.executeBindings(this,"text",this.text);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get bitmapForest() : BitmapImage
      {
         return this._720774612bitmapForest;
      }
      
      public function set bitmapForest(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._720774612bitmapForest;
         if(_loc2_ !== param1)
         {
            this._720774612bitmapForest = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bitmapForest",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bitmapGrass() : BitmapFill
      {
         return this._1778861511bitmapGrass;
      }
      
      public function set bitmapGrass(param1:BitmapFill) : void
      {
         var _loc2_:Object = this._1778861511bitmapGrass;
         if(_loc2_ !== param1)
         {
            this._1778861511bitmapGrass = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bitmapGrass",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bitmapLine() : BitmapImage
      {
         return this._1743591997bitmapLine;
      }
      
      public function set bitmapLine(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1743591997bitmapLine;
         if(_loc2_ !== param1)
         {
            this._1743591997bitmapLine = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bitmapLine",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bitmapWood() : BitmapImage
      {
         return this._1743258500bitmapWood;
      }
      
      public function set bitmapWood(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1743258500bitmapWood;
         if(_loc2_ !== param1)
         {
            this._1743258500bitmapWood = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bitmapWood",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get cage1() : Image
      {
         return this._94420469cage1;
      }
      
      public function set cage1(param1:Image) : void
      {
         var _loc2_:Object = this._94420469cage1;
         if(_loc2_ !== param1)
         {
            this._94420469cage1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cage1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get cage2() : Image
      {
         return this._94420470cage2;
      }
      
      public function set cage2(param1:Image) : void
      {
         var _loc2_:Object = this._94420470cage2;
         if(_loc2_ !== param1)
         {
            this._94420470cage2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cage2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get currency() : LabelDisplay
      {
         return this._575402001currency;
      }
      
      public function set currency(param1:LabelDisplay) : void
      {
         var _loc2_:Object = this._575402001currency;
         if(_loc2_ !== param1)
         {
            this._575402001currency = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"currency",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get pPaw1() : BitmapImage
      {
         return this._105914587pPaw1;
      }
      
      public function set pPaw1(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._105914587pPaw1;
         if(_loc2_ !== param1)
         {
            this._105914587pPaw1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pPaw1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get pPaw2() : BitmapImage
      {
         return this._105914588pPaw2;
      }
      
      public function set pPaw2(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._105914588pPaw2;
         if(_loc2_ !== param1)
         {
            this._105914588pPaw2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pPaw2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get paws() : GradientText
      {
         return this._3433613paws;
      }
      
      public function set paws(param1:GradientText) : void
      {
         var _loc2_:Object = this._3433613paws;
         if(_loc2_ !== param1)
         {
            this._3433613paws = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"paws",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get text() : StandardText
      {
         return this._3556653text;
      }
      
      public function set text(param1:StandardText) : void
      {
         var _loc2_:Object = this._3556653text;
         if(_loc2_ !== param1)
         {
            this._3556653text = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"text",_loc2_,param1));
            }
         }
      }
   }
}

