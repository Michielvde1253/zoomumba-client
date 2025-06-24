package windows.custom.currencies.tabs
{
   import components.textfield.StandardText;
   import components.textfield.labelDisplay.LabelDisplay;
   import components.textfield.labelDisplay.skin.LabelDisplayBigSkin;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.BitmapFill;
   import spark.components.Group;
   import spark.primitives.BitmapImage;
   import spark.primitives.Path;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   
   public class TrashTabContent extends Group
   {
      private var _1424876123amountText:StandardText;
      
      private var _1778861511bitmapGrass:BitmapFill;
      
      private var _1743591997bitmapLine:BitmapImage;
      
      private var _1743258500bitmapWood:BitmapImage;
      
      private var _575402001currency:LabelDisplay;
      
      private var _831008017mainPic:BitmapImage;
      
      private var _423863233secondText:StandardText;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function TrashTabContent()
      {
         super();
         this.mxmlContent = [this._TrashTabContent_InnerGroup1_c(),this._TrashTabContent_OuterGroup1_c()];
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
      
      private function _TrashTabContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._TrashTabContent_Path1_c(),this._TrashTabContent_Group2_c(),this._TrashTabContent_BitmapImage2_i(),this._TrashTabContent_BitmapImage3_i(),this._TrashTabContent_Group3_c(),this._TrashTabContent_Group4_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _TrashTabContent_Path1_c() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.left = 20;
         _loc1_.bottom = 25;
         _loc1_.data = "M353 300 62 300 0 238 0 0 353 0 353 300";
         _loc1_.fill = this._TrashTabContent_BitmapFill1_i();
         _loc1_.initialized(this,null);
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _TrashTabContent_BitmapFill1_i() : BitmapFill
      {
         var _loc1_:BitmapFill = new BitmapFill();
         _loc1_.fillMode = "repeat";
         this.bitmapGrass = _loc1_;
         BindingManager.executeBindings(this,"bitmapGrass",this.bitmapGrass);
         return _loc1_;
      }
      
      private function _TrashTabContent_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.right = 30;
         _loc1_.bottom = 140;
         _loc1_.mxmlContent = [this._TrashTabContent_BitmapImage1_i(),this._TrashTabContent_LabelDisplay1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _TrashTabContent_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.width = 300;
         _loc1_.fillMode = "clip";
         _loc1_.initialized(this,"bitmapWood");
         this.bitmapWood = _loc1_;
         BindingManager.executeBindings(this,"bitmapWood",this.bitmapWood);
         return _loc1_;
      }
      
      private function _TrashTabContent_LabelDisplay1_i() : LabelDisplay
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
      
      private function _TrashTabContent_BitmapImage2_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.left = 370;
         _loc1_.bottom = 20;
         _loc1_.height = 300;
         _loc1_.fillMode = "clip";
         _loc1_.initialized(this,"bitmapLine");
         this.bitmapLine = _loc1_;
         BindingManager.executeBindings(this,"bitmapLine",this.bitmapLine);
         return _loc1_;
      }
      
      private function _TrashTabContent_BitmapImage3_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.left = 37;
         _loc1_.bottom = 30;
         _loc1_.initialized(this,"mainPic");
         this.mainPic = _loc1_;
         BindingManager.executeBindings(this,"mainPic",this.mainPic);
         return _loc1_;
      }
      
      private function _TrashTabContent_Group3_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 385;
         _loc1_.y = 170;
         _loc1_.width = 270;
         _loc1_.height = 155;
         _loc1_.mxmlContent = [this._TrashTabContent_StandardText1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _TrashTabContent_StandardText1_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.width = 270;
         _loc1_.id = "secondText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.secondText = _loc1_;
         BindingManager.executeBindings(this,"secondText",this.secondText);
         return _loc1_;
      }
      
      private function _TrashTabContent_Group4_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 385;
         _loc1_.y = 290;
         _loc1_.width = 270;
         _loc1_.height = 155;
         _loc1_.mxmlContent = [this._TrashTabContent_StandardText2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _TrashTabContent_StandardText2_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.width = 270;
         _loc1_.id = "amountText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.amountText = _loc1_;
         BindingManager.executeBindings(this,"amountText",this.amountText);
         return _loc1_;
      }
      
      private function _TrashTabContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get amountText() : StandardText
      {
         return this._1424876123amountText;
      }
      
      public function set amountText(param1:StandardText) : void
      {
         var _loc2_:Object = this._1424876123amountText;
         if(_loc2_ !== param1)
         {
            this._1424876123amountText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"amountText",_loc2_,param1));
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
      public function get mainPic() : BitmapImage
      {
         return this._831008017mainPic;
      }
      
      public function set mainPic(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._831008017mainPic;
         if(_loc2_ !== param1)
         {
            this._831008017mainPic = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mainPic",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get secondText() : StandardText
      {
         return this._423863233secondText;
      }
      
      public function set secondText(param1:StandardText) : void
      {
         var _loc2_:Object = this._423863233secondText;
         if(_loc2_ !== param1)
         {
            this._423863233secondText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"secondText",_loc2_,param1));
            }
         }
      }
   }
}

