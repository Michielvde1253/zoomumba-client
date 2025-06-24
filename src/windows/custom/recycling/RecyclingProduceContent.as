package windows.custom.recycling
{
   import buttons.skin.fluid.ButtonFluidGradientNormalSkin;
   import components.counter.Counter;
   import components.counter.CounterRectSmallSkin;
   import components.image.StandardImage;
   import components.textfield.StandardText;
   import components.textfield.gradientText.GradientText;
   import custom.card.component.CardGroupHolder;
   import mx.binding.BindingManager;
   import mx.controls.Image;
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
   
   public class RecyclingProduceContent extends Group
   {
      private var _750692891ZooDollarImage:HGroup;
      
      private var _1332194002background:StandardImage;
      
      private var _205678947btnBack:Button;
      
      private var _106632041btnRecycle:Button;
      
      private var _1777527070buttonLabel:Button;
      
      private var _171849691cardGroupHolder:CardGroupHolder;
      
      private var _258591588filterCounter:Counter;
      
      private var _213293257header_bg:BitmapImage;
      
      private var _1211109709infoImage:SpriteVisualElement;
      
      private var _872453529introtext:StandardText;
      
      private var _1599988714introtoptext:StandardText;
      
      private var _3343801main:VGroup;
      
      private var _818271447middleLine:SpriteVisualElement;
      
      private var _279664835rareChanceText:StandardText;
      
      private var _225181272superFilterBG:SpriteVisualElement;
      
      private var _347979627superFilterRarBG:SpriteVisualElement;
      
      private var _676065800superFilterRarSymbol:SpriteVisualElement;
      
      private var _2146757045superFilterSymbol:SpriteVisualElement;
      
      private var _342015728superfilterUsed:SpriteVisualElement;
      
      private var _280448154textSuperFilter:StandardText;
      
      private var _479888037titleSuperFilter:StandardText;
      
      private var _1697796767trashDollarText:GradientText;
      
      private var _251300293zooDollarImage:Image;
      
      private var _1931235453zooDollarText:GradientText;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__general_Decorations_swf_Trash_822848217:Class = RecyclingProduceContent__embed_mxml__general_Decorations_swf_Trash_822848217;
      
      public function RecyclingProduceContent()
      {
         super();
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContent = [this._RecyclingProduceContent_InnerGroup1_c(),this._RecyclingProduceContent_OuterGroup1_c()];
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
      
      private function _RecyclingProduceContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._RecyclingProduceContent_VGroup1_c(),this._RecyclingProduceContent_VGroup2_c(),this._RecyclingProduceContent_VGroup3_i(),this._RecyclingProduceContent_HGroup1_i(),this._RecyclingProduceContent_CardGroupHolder1_i(),this._RecyclingProduceContent_SpriteVisualElement1_i(),this._RecyclingProduceContent_VGroup4_c(),this._RecyclingProduceContent_Group5_c(),this._RecyclingProduceContent_VGroup5_c(),this._RecyclingProduceContent_VGroup6_c(),this._RecyclingProduceContent_VGroup7_c(),this._RecyclingProduceContent_BitmapImage1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _RecyclingProduceContent_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.horizontalCenter = 0;
         _loc1_.horizontalAlign = "center";
         _loc1_.y = 20;
         _loc1_.mxmlContent = [this._RecyclingProduceContent_Group2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _RecyclingProduceContent_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._RecyclingProduceContent_StandardImage1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _RecyclingProduceContent_StandardImage1_i() : StandardImage
      {
         var _loc1_:StandardImage = new StandardImage();
         _loc1_.horizontalCenter = 0;
         _loc1_.id = "background";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.background = _loc1_;
         BindingManager.executeBindings(this,"background",this.background);
         return _loc1_;
      }
      
      private function _RecyclingProduceContent_VGroup2_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.horizontalAlign = "center";
         _loc1_.horizontalCenter = 0;
         _loc1_.y = 65;
         _loc1_.mxmlContent = [this._RecyclingProduceContent_StandardText1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _RecyclingProduceContent_StandardText1_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.horizontalCenter = 0;
         _loc1_.setStyle("fontSize",24);
         _loc1_.id = "introtoptext";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.introtoptext = _loc1_;
         BindingManager.executeBindings(this,"introtoptext",this.introtoptext);
         return _loc1_;
      }
      
      private function _RecyclingProduceContent_VGroup3_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.x = 240;
         _loc1_.y = 150;
         _loc1_.gap = 15;
         _loc1_.mxmlContent = [this._RecyclingProduceContent_StandardText2_i()];
         _loc1_.id = "main";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.main = _loc1_;
         BindingManager.executeBindings(this,"main",this.main);
         return _loc1_;
      }
      
      private function _RecyclingProduceContent_StandardText2_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.width = 350;
         _loc1_.setStyle("fontSize",12);
         _loc1_.id = "introtext";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.introtext = _loc1_;
         BindingManager.executeBindings(this,"introtext",this.introtext);
         return _loc1_;
      }
      
      private function _RecyclingProduceContent_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.x = 240;
         _loc1_.y = 280;
         _loc1_.gap = 100;
         _loc1_.mxmlContent = [this._RecyclingProduceContent_HGroup2_c(),this._RecyclingProduceContent_HGroup3_c()];
         _loc1_.id = "ZooDollarImage";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.ZooDollarImage = _loc1_;
         BindingManager.executeBindings(this,"ZooDollarImage",this.ZooDollarImage);
         return _loc1_;
      }
      
      private function _RecyclingProduceContent_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.gap = -1;
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._RecyclingProduceContent_Image1_c(),this._RecyclingProduceContent_GradientText1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _RecyclingProduceContent_Image1_c() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.scaleX = 0.75;
         _loc1_.scaleY = 0.75;
         _loc1_.source = this._embed_mxml__general_Decorations_swf_Trash_822848217;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _RecyclingProduceContent_GradientText1_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.fontSize = 12;
         _loc1_.id = "trashDollarText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.trashDollarText = _loc1_;
         BindingManager.executeBindings(this,"trashDollarText",this.trashDollarText);
         return _loc1_;
      }
      
      private function _RecyclingProduceContent_HGroup3_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.gap = -1;
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._RecyclingProduceContent_Image2_i(),this._RecyclingProduceContent_GradientText2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _RecyclingProduceContent_Image2_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.scaleX = 0.75;
         _loc1_.scaleY = 0.75;
         _loc1_.id = "zooDollarImage";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.zooDollarImage = _loc1_;
         BindingManager.executeBindings(this,"zooDollarImage",this.zooDollarImage);
         return _loc1_;
      }
      
      private function _RecyclingProduceContent_GradientText2_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.fontSize = 12;
         _loc1_.id = "zooDollarText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.zooDollarText = _loc1_;
         BindingManager.executeBindings(this,"zooDollarText",this.zooDollarText);
         return _loc1_;
      }
      
      private function _RecyclingProduceContent_CardGroupHolder1_i() : CardGroupHolder
      {
         var _loc1_:CardGroupHolder = new CardGroupHolder();
         _loc1_.width = 80;
         _loc1_.x = 75;
         _loc1_.y = 145;
         _loc1_.currentState = "noArrows";
         _loc1_.id = "cardGroupHolder";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.cardGroupHolder = _loc1_;
         BindingManager.executeBindings(this,"cardGroupHolder",this.cardGroupHolder);
         return _loc1_;
      }
      
      private function _RecyclingProduceContent_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.x = 15;
         _loc1_.y = 335;
         _loc1_.initialized(this,"middleLine");
         this.middleLine = _loc1_;
         BindingManager.executeBindings(this,"middleLine",this.middleLine);
         return _loc1_;
      }
      
      private function _RecyclingProduceContent_VGroup4_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.x = 140;
         _loc1_.y = 385;
         _loc1_.gap = 30;
         _loc1_.mxmlContent = [this._RecyclingProduceContent_Group3_c(),this._RecyclingProduceContent_Group4_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _RecyclingProduceContent_Group3_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._RecyclingProduceContent_SpriteVisualElement2_i(),this._RecyclingProduceContent_SpriteVisualElement3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _RecyclingProduceContent_SpriteVisualElement2_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.initialized(this,"superFilterBG");
         this.superFilterBG = _loc1_;
         BindingManager.executeBindings(this,"superFilterBG",this.superFilterBG);
         return _loc1_;
      }
      
      private function _RecyclingProduceContent_SpriteVisualElement3_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.initialized(this,"superFilterSymbol");
         this.superFilterSymbol = _loc1_;
         BindingManager.executeBindings(this,"superFilterSymbol",this.superFilterSymbol);
         return _loc1_;
      }
      
      private function _RecyclingProduceContent_Group4_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._RecyclingProduceContent_Counter1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _RecyclingProduceContent_Counter1_i() : Counter
      {
         var _loc1_:Counter = new Counter();
         _loc1_.left = -22;
         _loc1_.setStyle("skinClass",CounterRectSmallSkin);
         _loc1_.id = "filterCounter";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.filterCounter = _loc1_;
         BindingManager.executeBindings(this,"filterCounter",this.filterCounter);
         return _loc1_;
      }
      
      private function _RecyclingProduceContent_Group5_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 605;
         _loc1_.y = 430;
         _loc1_.mxmlContent = [this._RecyclingProduceContent_SpriteVisualElement4_i(),this._RecyclingProduceContent_SpriteVisualElement5_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _RecyclingProduceContent_SpriteVisualElement4_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.initialized(this,"superFilterRarBG");
         this.superFilterRarBG = _loc1_;
         BindingManager.executeBindings(this,"superFilterRarBG",this.superFilterRarBG);
         return _loc1_;
      }
      
      private function _RecyclingProduceContent_SpriteVisualElement5_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.initialized(this,"superFilterRarSymbol");
         this.superFilterRarSymbol = _loc1_;
         BindingManager.executeBindings(this,"superFilterRarSymbol",this.superFilterRarSymbol);
         return _loc1_;
      }
      
      private function _RecyclingProduceContent_VGroup5_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.x = 190;
         _loc1_.y = 355;
         _loc1_.gap = 15;
         _loc1_.mxmlContent = [this._RecyclingProduceContent_Group6_c(),this._RecyclingProduceContent_Group7_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _RecyclingProduceContent_Group6_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._RecyclingProduceContent_StandardText3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _RecyclingProduceContent_StandardText3_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.width = 150;
         _loc1_.setStyle("fontSize",24);
         _loc1_.id = "titleSuperFilter";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.titleSuperFilter = _loc1_;
         BindingManager.executeBindings(this,"titleSuperFilter",this.titleSuperFilter);
         return _loc1_;
      }
      
      private function _RecyclingProduceContent_Group7_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._RecyclingProduceContent_StandardText4_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _RecyclingProduceContent_StandardText4_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.width = 150;
         _loc1_.setStyle("fontSize",14);
         _loc1_.id = "textSuperFilter";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.textSuperFilter = _loc1_;
         BindingManager.executeBindings(this,"textSuperFilter",this.textSuperFilter);
         return _loc1_;
      }
      
      private function _RecyclingProduceContent_VGroup6_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.x = 20;
         _loc1_.y = 330;
         _loc1_.gap = 15;
         _loc1_.mouseEnabled = false;
         _loc1_.mouseChildren = false;
         _loc1_.mxmlContent = [this._RecyclingProduceContent_SpriteVisualElement6_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _RecyclingProduceContent_SpriteVisualElement6_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.mouseEnabled = false;
         _loc1_.mouseChildren = false;
         _loc1_.initialized(this,"superfilterUsed");
         this.superfilterUsed = _loc1_;
         BindingManager.executeBindings(this,"superfilterUsed",this.superfilterUsed);
         return _loc1_;
      }
      
      private function _RecyclingProduceContent_VGroup7_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.x = 375;
         _loc1_.y = 365;
         _loc1_.gap = 15;
         _loc1_.mxmlContent = [this._RecyclingProduceContent_HGroup4_c(),this._RecyclingProduceContent_HGroup5_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _RecyclingProduceContent_HGroup4_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.gap = 20;
         _loc1_.verticalAlign = "middle";
         _loc1_.verticalCenter = 0;
         _loc1_.mxmlContent = [this._RecyclingProduceContent_Group8_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _RecyclingProduceContent_Group8_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._RecyclingProduceContent_StandardText5_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _RecyclingProduceContent_StandardText5_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.setStyle("fontSize",14);
         _loc1_.id = "rareChanceText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.rareChanceText = _loc1_;
         BindingManager.executeBindings(this,"rareChanceText",this.rareChanceText);
         return _loc1_;
      }
      
      private function _RecyclingProduceContent_HGroup5_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.gap = 20;
         _loc1_.verticalAlign = "middle";
         _loc1_.verticalCenter = 0;
         _loc1_.mxmlContent = [this._RecyclingProduceContent_Button1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _RecyclingProduceContent_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.bottom = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 15;
         _loc1_.width = 170;
         _loc1_.height = 30;
         _loc1_.setStyle("skinClass",ButtonFluidGradientNormalSkin);
         _loc1_.id = "buttonLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.buttonLabel = _loc1_;
         BindingManager.executeBindings(this,"buttonLabel",this.buttonLabel);
         return _loc1_;
      }
      
      private function _RecyclingProduceContent_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.initialized(this,"header_bg");
         this.header_bg = _loc1_;
         BindingManager.executeBindings(this,"header_bg",this.header_bg);
         return _loc1_;
      }
      
      private function _RecyclingProduceContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._RecyclingProduceContent_SpriteVisualElement7_i(),this._RecyclingProduceContent_HGroup6_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _RecyclingProduceContent_SpriteVisualElement7_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.x = 15;
         _loc1_.y = 35;
         _loc1_.initialized(this,"infoImage");
         this.infoImage = _loc1_;
         BindingManager.executeBindings(this,"infoImage",this.infoImage);
         return _loc1_;
      }
      
      private function _RecyclingProduceContent_HGroup6_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.bottom = 15;
         _loc1_.horizontalCenter = 0;
         _loc1_.mxmlContent = [this._RecyclingProduceContent_Button2_i(),this._RecyclingProduceContent_Button3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _RecyclingProduceContent_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.width = 136;
         _loc1_.height = 42;
         _loc1_.setStyle("skinClass",ButtonFluidGradientNormalSkin);
         _loc1_.id = "btnBack";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnBack = _loc1_;
         BindingManager.executeBindings(this,"btnBack",this.btnBack);
         return _loc1_;
      }
      
      private function _RecyclingProduceContent_Button3_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.width = 136;
         _loc1_.height = 42;
         _loc1_.setStyle("skinClass",ButtonFluidGradientNormalSkin);
         _loc1_.id = "btnRecycle";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnRecycle = _loc1_;
         BindingManager.executeBindings(this,"btnRecycle",this.btnRecycle);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get ZooDollarImage() : HGroup
      {
         return this._750692891ZooDollarImage;
      }
      
      public function set ZooDollarImage(param1:HGroup) : void
      {
         var _loc2_:Object = this._750692891ZooDollarImage;
         if(_loc2_ !== param1)
         {
            this._750692891ZooDollarImage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ZooDollarImage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get background() : StandardImage
      {
         return this._1332194002background;
      }
      
      public function set background(param1:StandardImage) : void
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
      public function get btnBack() : Button
      {
         return this._205678947btnBack;
      }
      
      public function set btnBack(param1:Button) : void
      {
         var _loc2_:Object = this._205678947btnBack;
         if(_loc2_ !== param1)
         {
            this._205678947btnBack = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnBack",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnRecycle() : Button
      {
         return this._106632041btnRecycle;
      }
      
      public function set btnRecycle(param1:Button) : void
      {
         var _loc2_:Object = this._106632041btnRecycle;
         if(_loc2_ !== param1)
         {
            this._106632041btnRecycle = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnRecycle",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get buttonLabel() : Button
      {
         return this._1777527070buttonLabel;
      }
      
      public function set buttonLabel(param1:Button) : void
      {
         var _loc2_:Object = this._1777527070buttonLabel;
         if(_loc2_ !== param1)
         {
            this._1777527070buttonLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"buttonLabel",_loc2_,param1));
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
      public function get filterCounter() : Counter
      {
         return this._258591588filterCounter;
      }
      
      public function set filterCounter(param1:Counter) : void
      {
         var _loc2_:Object = this._258591588filterCounter;
         if(_loc2_ !== param1)
         {
            this._258591588filterCounter = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"filterCounter",_loc2_,param1));
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
      public function get infoImage() : SpriteVisualElement
      {
         return this._1211109709infoImage;
      }
      
      public function set infoImage(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._1211109709infoImage;
         if(_loc2_ !== param1)
         {
            this._1211109709infoImage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"infoImage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get introtext() : StandardText
      {
         return this._872453529introtext;
      }
      
      public function set introtext(param1:StandardText) : void
      {
         var _loc2_:Object = this._872453529introtext;
         if(_loc2_ !== param1)
         {
            this._872453529introtext = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"introtext",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get introtoptext() : StandardText
      {
         return this._1599988714introtoptext;
      }
      
      public function set introtoptext(param1:StandardText) : void
      {
         var _loc2_:Object = this._1599988714introtoptext;
         if(_loc2_ !== param1)
         {
            this._1599988714introtoptext = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"introtoptext",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get main() : VGroup
      {
         return this._3343801main;
      }
      
      public function set main(param1:VGroup) : void
      {
         var _loc2_:Object = this._3343801main;
         if(_loc2_ !== param1)
         {
            this._3343801main = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"main",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get middleLine() : SpriteVisualElement
      {
         return this._818271447middleLine;
      }
      
      public function set middleLine(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._818271447middleLine;
         if(_loc2_ !== param1)
         {
            this._818271447middleLine = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"middleLine",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get rareChanceText() : StandardText
      {
         return this._279664835rareChanceText;
      }
      
      public function set rareChanceText(param1:StandardText) : void
      {
         var _loc2_:Object = this._279664835rareChanceText;
         if(_loc2_ !== param1)
         {
            this._279664835rareChanceText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rareChanceText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get superFilterBG() : SpriteVisualElement
      {
         return this._225181272superFilterBG;
      }
      
      public function set superFilterBG(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._225181272superFilterBG;
         if(_loc2_ !== param1)
         {
            this._225181272superFilterBG = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"superFilterBG",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get superFilterRarBG() : SpriteVisualElement
      {
         return this._347979627superFilterRarBG;
      }
      
      public function set superFilterRarBG(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._347979627superFilterRarBG;
         if(_loc2_ !== param1)
         {
            this._347979627superFilterRarBG = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"superFilterRarBG",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get superFilterRarSymbol() : SpriteVisualElement
      {
         return this._676065800superFilterRarSymbol;
      }
      
      public function set superFilterRarSymbol(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._676065800superFilterRarSymbol;
         if(_loc2_ !== param1)
         {
            this._676065800superFilterRarSymbol = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"superFilterRarSymbol",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get superFilterSymbol() : SpriteVisualElement
      {
         return this._2146757045superFilterSymbol;
      }
      
      public function set superFilterSymbol(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._2146757045superFilterSymbol;
         if(_loc2_ !== param1)
         {
            this._2146757045superFilterSymbol = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"superFilterSymbol",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get superfilterUsed() : SpriteVisualElement
      {
         return this._342015728superfilterUsed;
      }
      
      public function set superfilterUsed(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._342015728superfilterUsed;
         if(_loc2_ !== param1)
         {
            this._342015728superfilterUsed = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"superfilterUsed",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get textSuperFilter() : StandardText
      {
         return this._280448154textSuperFilter;
      }
      
      public function set textSuperFilter(param1:StandardText) : void
      {
         var _loc2_:Object = this._280448154textSuperFilter;
         if(_loc2_ !== param1)
         {
            this._280448154textSuperFilter = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"textSuperFilter",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get titleSuperFilter() : StandardText
      {
         return this._479888037titleSuperFilter;
      }
      
      public function set titleSuperFilter(param1:StandardText) : void
      {
         var _loc2_:Object = this._479888037titleSuperFilter;
         if(_loc2_ !== param1)
         {
            this._479888037titleSuperFilter = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"titleSuperFilter",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get trashDollarText() : GradientText
      {
         return this._1697796767trashDollarText;
      }
      
      public function set trashDollarText(param1:GradientText) : void
      {
         var _loc2_:Object = this._1697796767trashDollarText;
         if(_loc2_ !== param1)
         {
            this._1697796767trashDollarText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"trashDollarText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get zooDollarImage() : Image
      {
         return this._251300293zooDollarImage;
      }
      
      public function set zooDollarImage(param1:Image) : void
      {
         var _loc2_:Object = this._251300293zooDollarImage;
         if(_loc2_ !== param1)
         {
            this._251300293zooDollarImage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"zooDollarImage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get zooDollarText() : GradientText
      {
         return this._1931235453zooDollarText;
      }
      
      public function set zooDollarText(param1:GradientText) : void
      {
         var _loc2_:Object = this._1931235453zooDollarText;
         if(_loc2_ !== param1)
         {
            this._1931235453zooDollarText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"zooDollarText",_loc2_,param1));
            }
         }
      }
   }
}

