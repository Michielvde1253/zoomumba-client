package windows.custom.crafting
{
   import buttons.skin.fluid.ButtonFluidGradientNormalSkin;
   import components.textfield.StandardText;
   import components.textfield.gradientText.GradientText;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.VGroup;
   import spark.core.SpriteVisualElement;
   import spark.primitives.BitmapImage;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   
   public class IntroCraftingContent extends Group
   {
      private var _529987311blueprintRewards:GradientText;
      
      private var _163334105bubbleText:StandardText;
      
      private var _1923805780categorie1Button:Button;
      
      private var _1036302099categorie2Button:Button;
      
      private var _148798418categorie3Button:Button;
      
      private var _738705263categorie4Button:Button;
      
      private var _742095713categorieTitle:StandardText;
      
      private var _1790267582characterIcon:BitmapImage;
      
      private var _213293257header_bg:BitmapImage;
      
      private var _1086227994iconBlueprint:BitmapImage;
      
      private var _1302741632infoButton:SpriteVisualElement;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function IntroCraftingContent()
      {
         super();
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContent = [this._IntroCraftingContent_InnerGroup1_c(),this._IntroCraftingContent_OuterGroup1_c()];
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
      
      private function _IntroCraftingContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._IntroCraftingContent_BitmapImage1_i(),this._IntroCraftingContent_VGroup1_c(),this._IntroCraftingContent_HGroup1_c(),this._IntroCraftingContent_VGroup3_c(),this._IntroCraftingContent_Group2_c(),this._IntroCraftingContent_Group3_c(),this._IntroCraftingContent_Group4_c(),this._IntroCraftingContent_Group5_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _IntroCraftingContent_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 10;
         _loc1_.initialized(this,"header_bg");
         this.header_bg = _loc1_;
         BindingManager.executeBindings(this,"header_bg",this.header_bg);
         return _loc1_;
      }
      
      private function _IntroCraftingContent_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.horizontalCenter = 60;
         _loc1_.y = 105;
         _loc1_.mxmlContent = [this._IntroCraftingContent_StandardText1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _IntroCraftingContent_StandardText1_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.width = 340;
         _loc1_.setStyle("fontSize",12);
         _loc1_.id = "bubbleText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.bubbleText = _loc1_;
         BindingManager.executeBindings(this,"bubbleText",this.bubbleText);
         return _loc1_;
      }
      
      private function _IntroCraftingContent_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.width = 300;
         _loc1_.horizontalCenter = 0;
         _loc1_.y = 222;
         _loc1_.mxmlContent = [this._IntroCraftingContent_VGroup2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _IntroCraftingContent_VGroup2_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.gap = 5;
         _loc1_.verticalAlign = "middle";
         _loc1_.height = 40;
         _loc1_.width = 25;
         _loc1_.verticalCenter = 0;
         _loc1_.mxmlContent = [this._IntroCraftingContent_HGroup2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _IntroCraftingContent_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.gap = 5;
         _loc1_.width = 250;
         _loc1_.verticalAlign = "middle";
         _loc1_.horizontalCenter = 0;
         _loc1_.mxmlContent = [this._IntroCraftingContent_BitmapImage2_i(),this._IntroCraftingContent_GradientText1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _IntroCraftingContent_BitmapImage2_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.initialized(this,"iconBlueprint");
         this.iconBlueprint = _loc1_;
         BindingManager.executeBindings(this,"iconBlueprint",this.iconBlueprint);
         return _loc1_;
      }
      
      private function _IntroCraftingContent_GradientText1_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.fontSize = 12;
         _loc1_.id = "blueprintRewards";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.blueprintRewards = _loc1_;
         BindingManager.executeBindings(this,"blueprintRewards",this.blueprintRewards);
         return _loc1_;
      }
      
      private function _IntroCraftingContent_VGroup3_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.x = 77;
         _loc1_.y = 269;
         _loc1_.mxmlContent = [this._IntroCraftingContent_StandardText2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _IntroCraftingContent_StandardText2_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.width = 500;
         _loc1_.setStyle("fontSize",14);
         _loc1_.id = "categorieTitle";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.categorieTitle = _loc1_;
         BindingManager.executeBindings(this,"categorieTitle",this.categorieTitle);
         return _loc1_;
      }
      
      private function _IntroCraftingContent_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 66;
         _loc1_.y = 425;
         _loc1_.mxmlContent = [this._IntroCraftingContent_Button1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _IntroCraftingContent_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.bottom = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 15;
         _loc1_.width = 110;
         _loc1_.height = 30;
         _loc1_.setStyle("skinClass",ButtonFluidGradientNormalSkin);
         _loc1_.id = "categorie1Button";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.categorie1Button = _loc1_;
         BindingManager.executeBindings(this,"categorie1Button",this.categorie1Button);
         return _loc1_;
      }
      
      private function _IntroCraftingContent_Group3_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 208;
         _loc1_.y = 425;
         _loc1_.mxmlContent = [this._IntroCraftingContent_Button2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _IntroCraftingContent_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.bottom = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 15;
         _loc1_.width = 110;
         _loc1_.height = 30;
         _loc1_.setStyle("skinClass",ButtonFluidGradientNormalSkin);
         _loc1_.id = "categorie2Button";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.categorie2Button = _loc1_;
         BindingManager.executeBindings(this,"categorie2Button",this.categorie2Button);
         return _loc1_;
      }
      
      private function _IntroCraftingContent_Group4_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 349;
         _loc1_.y = 425;
         _loc1_.mxmlContent = [this._IntroCraftingContent_Button3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _IntroCraftingContent_Button3_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.bottom = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 15;
         _loc1_.width = 110;
         _loc1_.height = 30;
         _loc1_.setStyle("skinClass",ButtonFluidGradientNormalSkin);
         _loc1_.id = "categorie3Button";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.categorie3Button = _loc1_;
         BindingManager.executeBindings(this,"categorie3Button",this.categorie3Button);
         return _loc1_;
      }
      
      private function _IntroCraftingContent_Group5_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 494;
         _loc1_.y = 425;
         _loc1_.mxmlContent = [this._IntroCraftingContent_Button4_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _IntroCraftingContent_Button4_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.bottom = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 15;
         _loc1_.width = 110;
         _loc1_.height = 30;
         _loc1_.setStyle("skinClass",ButtonFluidGradientNormalSkin);
         _loc1_.id = "categorie4Button";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.categorie4Button = _loc1_;
         BindingManager.executeBindings(this,"categorie4Button",this.categorie4Button);
         return _loc1_;
      }
      
      private function _IntroCraftingContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._IntroCraftingContent_Group6_c(),this._IntroCraftingContent_SpriteVisualElement1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _IntroCraftingContent_Group6_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 48;
         _loc1_.y = 70;
         _loc1_.mxmlContent = [this._IntroCraftingContent_BitmapImage3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _IntroCraftingContent_BitmapImage3_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.initialized(this,"characterIcon");
         this.characterIcon = _loc1_;
         BindingManager.executeBindings(this,"characterIcon",this.characterIcon);
         return _loc1_;
      }
      
      private function _IntroCraftingContent_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.x = 625;
         _loc1_.y = 206;
         _loc1_.initialized(this,"infoButton");
         this.infoButton = _loc1_;
         BindingManager.executeBindings(this,"infoButton",this.infoButton);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get blueprintRewards() : GradientText
      {
         return this._529987311blueprintRewards;
      }
      
      public function set blueprintRewards(param1:GradientText) : void
      {
         var _loc2_:Object = this._529987311blueprintRewards;
         if(_loc2_ !== param1)
         {
            this._529987311blueprintRewards = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"blueprintRewards",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bubbleText() : StandardText
      {
         return this._163334105bubbleText;
      }
      
      public function set bubbleText(param1:StandardText) : void
      {
         var _loc2_:Object = this._163334105bubbleText;
         if(_loc2_ !== param1)
         {
            this._163334105bubbleText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bubbleText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get categorie1Button() : Button
      {
         return this._1923805780categorie1Button;
      }
      
      public function set categorie1Button(param1:Button) : void
      {
         var _loc2_:Object = this._1923805780categorie1Button;
         if(_loc2_ !== param1)
         {
            this._1923805780categorie1Button = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"categorie1Button",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get categorie2Button() : Button
      {
         return this._1036302099categorie2Button;
      }
      
      public function set categorie2Button(param1:Button) : void
      {
         var _loc2_:Object = this._1036302099categorie2Button;
         if(_loc2_ !== param1)
         {
            this._1036302099categorie2Button = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"categorie2Button",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get categorie3Button() : Button
      {
         return this._148798418categorie3Button;
      }
      
      public function set categorie3Button(param1:Button) : void
      {
         var _loc2_:Object = this._148798418categorie3Button;
         if(_loc2_ !== param1)
         {
            this._148798418categorie3Button = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"categorie3Button",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get categorie4Button() : Button
      {
         return this._738705263categorie4Button;
      }
      
      public function set categorie4Button(param1:Button) : void
      {
         var _loc2_:Object = this._738705263categorie4Button;
         if(_loc2_ !== param1)
         {
            this._738705263categorie4Button = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"categorie4Button",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get categorieTitle() : StandardText
      {
         return this._742095713categorieTitle;
      }
      
      public function set categorieTitle(param1:StandardText) : void
      {
         var _loc2_:Object = this._742095713categorieTitle;
         if(_loc2_ !== param1)
         {
            this._742095713categorieTitle = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"categorieTitle",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get characterIcon() : BitmapImage
      {
         return this._1790267582characterIcon;
      }
      
      public function set characterIcon(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1790267582characterIcon;
         if(_loc2_ !== param1)
         {
            this._1790267582characterIcon = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"characterIcon",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get header_bg() : BitmapImage
      {
         return this._213293257header_bg;
      }
      
      public function set header_bg(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._213293257header_bg;
         if(_loc2_ !== param1)
         {
            this._213293257header_bg = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"header_bg",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get iconBlueprint() : BitmapImage
      {
         return this._1086227994iconBlueprint;
      }
      
      public function set iconBlueprint(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1086227994iconBlueprint;
         if(_loc2_ !== param1)
         {
            this._1086227994iconBlueprint = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"iconBlueprint",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get infoButton() : SpriteVisualElement
      {
         return this._1302741632infoButton;
      }
      
      public function set infoButton(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._1302741632infoButton;
         if(_loc2_ !== param1)
         {
            this._1302741632infoButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"infoButton",_loc2_,param1));
            }
         }
      }
   }
}

