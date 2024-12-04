package windows.custom.crafting
{
   import components.textfield.StandardText;
   import custom.card.component.CardGroupHolder;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.components.VGroup;
   import spark.primitives.BitmapImage;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   
   public class BlueprintCraftingRewardContent extends Group
   {
      private var _1332194002background:BitmapImage;
      
      private var _171849691cardGroupHolder:CardGroupHolder;
      
      private var _109757537stars:BitmapImage;
      
      private var _1867586707subtext:StandardText;
      
      private var _111576390uschi:BitmapImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function BlueprintCraftingRewardContent()
      {
         super();
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContent = [this._BlueprintCraftingRewardContent_InnerGroup1_c(),this._BlueprintCraftingRewardContent_OuterGroup1_c()];
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
      
      private function _BlueprintCraftingRewardContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._BlueprintCraftingRewardContent_VGroup1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _BlueprintCraftingRewardContent_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.horizontalCenter = 0;
         _loc1_.horizontalAlign = "center";
         _loc1_.y = 20;
         _loc1_.mxmlContent = [this._BlueprintCraftingRewardContent_Group2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _BlueprintCraftingRewardContent_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._BlueprintCraftingRewardContent_BitmapImage1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _BlueprintCraftingRewardContent_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.horizontalCenter = 0;
         _loc1_.initialized(this,"background");
         this.background = _loc1_;
         BindingManager.executeBindings(this,"background",this.background);
         return _loc1_;
      }
      
      private function _BlueprintCraftingRewardContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._BlueprintCraftingRewardContent_Group3_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _BlueprintCraftingRewardContent_Group3_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._BlueprintCraftingRewardContent_Group4_c(),this._BlueprintCraftingRewardContent_VGroup2_c(),this._BlueprintCraftingRewardContent_Group6_c(),this._BlueprintCraftingRewardContent_VGroup3_c(),this._BlueprintCraftingRewardContent_Group7_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _BlueprintCraftingRewardContent_Group4_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.horizontalCenter = 0;
         _loc1_.y = 300;
         _loc1_.mxmlContent = [this._BlueprintCraftingRewardContent_BitmapImage2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _BlueprintCraftingRewardContent_BitmapImage2_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.initialized(this,"stars");
         this.stars = _loc1_;
         BindingManager.executeBindings(this,"stars",this.stars);
         return _loc1_;
      }
      
      private function _BlueprintCraftingRewardContent_VGroup2_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.x = 30;
         _loc1_.y = 5;
         _loc1_.mxmlContent = [this._BlueprintCraftingRewardContent_Group5_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _BlueprintCraftingRewardContent_Group5_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._BlueprintCraftingRewardContent_BitmapImage3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _BlueprintCraftingRewardContent_BitmapImage3_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.initialized(this,"uschi");
         this.uschi = _loc1_;
         BindingManager.executeBindings(this,"uschi",this.uschi);
         return _loc1_;
      }
      
      private function _BlueprintCraftingRewardContent_Group6_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _BlueprintCraftingRewardContent_VGroup3_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.horizontalCenter = 42;
         _loc1_.y = 45;
         _loc1_.mxmlContent = [this._BlueprintCraftingRewardContent_StandardText1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _BlueprintCraftingRewardContent_StandardText1_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.width = 350;
         _loc1_.setStyle("fontSize",12);
         _loc1_.id = "subtext";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.subtext = _loc1_;
         BindingManager.executeBindings(this,"subtext",this.subtext);
         return _loc1_;
      }
      
      private function _BlueprintCraftingRewardContent_Group7_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._BlueprintCraftingRewardContent_CardGroupHolder1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _BlueprintCraftingRewardContent_CardGroupHolder1_i() : CardGroupHolder
      {
         var _loc1_:CardGroupHolder = null;
         _loc1_ = new CardGroupHolder();
         _loc1_.horizontalCenter = 85;
         _loc1_.y = 215;
         _loc1_.height = 175;
         _loc1_.width = 390;
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
      public function get stars() : BitmapImage
      {
         return this._109757537stars;
      }
      
      public function set stars(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._109757537stars;
         if(_loc2_ !== param1)
         {
            this._109757537stars = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"stars",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get subtext() : StandardText
      {
         return this._1867586707subtext;
      }
      
      public function set subtext(param1:StandardText) : void
      {
         var _loc2_:Object = this._1867586707subtext;
         if(_loc2_ !== param1)
         {
            this._1867586707subtext = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"subtext",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get uschi() : BitmapImage
      {
         return this._111576390uschi;
      }
      
      public function set uschi(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._111576390uschi;
         if(_loc2_ !== param1)
         {
            this._111576390uschi = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"uschi",_loc2_,param1));
            }
         }
      }
   }
}

