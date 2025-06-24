package windows.custom.waterStoreHouse
{
   import buttons.extended.ButtonBuy;
   import components.textfield.StandardText;
   import components.textfield.gradientText.GradientText;
   import mx.binding.BindingManager;
   import mx.controls.Image;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.VGroup;
   import spark.core.SpriteVisualElement;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   
   public class WaterStoreHouseUpdateContent extends Group
   {
      private var _651029653buyPetPenny:ButtonBuy;
      
      private var _169548112buyZooDollar:ButtonBuy;
      
      private var _648376546capCountPetPennyPanel:GradientText;
      
      private var _2035465173capCountZooDollarPanel:GradientText;
      
      private var _1211109709infoImage:SpriteVisualElement;
      
      private var _872453529introtext:StandardText;
      
      private var _1599988714introtoptext:StandardText;
      
      private var _3343801main:VGroup;
      
      private var _818271447middleLine:SpriteVisualElement;
      
      private var _1651349837newCapPetPennyPanel:StandardText;
      
      private var _1008064224newCapZooDollarPanel:StandardText;
      
      private var _110760pay:VGroup;
      
      private var _467801797petPenny:Image;
      
      private var _593449970petpennyUpdate:GradientText;
      
      private var _1806469695petpennypanel:VGroup;
      
      private var _598532371petpennypanelCap:HGroup;
      
      private var _2135991700titleLine:SpriteVisualElement;
      
      private var _493584694zooDollar:Image;
      
      private var _257419886zooDollarPanel:VGroup;
      
      private var _2015699324zooDollarPanelCap:HGroup;
      
      private var _453220961zooDollarUpdate:GradientText;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__general_Decorations_swf_ZooDollar_1091307755:Class = WaterStoreHouseUpdateContent__embed_mxml__general_Decorations_swf_ZooDollar_1091307755;
      
      private var _embed_mxml__general_Decorations_swf_PetPenny_869510186:Class = WaterStoreHouseUpdateContent__embed_mxml__general_Decorations_swf_PetPenny_869510186;
      
      public function WaterStoreHouseUpdateContent()
      {
         super();
         this.mxmlContent = [this._WaterStoreHouseUpdateContent_InnerGroup1_c(),this._WaterStoreHouseUpdateContent_OuterGroup1_c()];
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
      
      private function _WaterStoreHouseUpdateContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._WaterStoreHouseUpdateContent_VGroup1_c(),this._WaterStoreHouseUpdateContent_SpriteVisualElement1_i(),this._WaterStoreHouseUpdateContent_SpriteVisualElement2_i(),this._WaterStoreHouseUpdateContent_Image1_i(),this._WaterStoreHouseUpdateContent_Image2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _WaterStoreHouseUpdateContent_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.x = 220;
         _loc1_.y = 85;
         _loc1_.gap = 10;
         _loc1_.mxmlContent = [this._WaterStoreHouseUpdateContent_VGroup2_i(),this._WaterStoreHouseUpdateContent_VGroup3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _WaterStoreHouseUpdateContent_VGroup2_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.gap = 15;
         _loc1_.mxmlContent = [this._WaterStoreHouseUpdateContent_StandardText1_i(),this._WaterStoreHouseUpdateContent_StandardText2_i()];
         _loc1_.id = "main";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.main = _loc1_;
         BindingManager.executeBindings(this,"main",this.main);
         return _loc1_;
      }
      
      private function _WaterStoreHouseUpdateContent_StandardText1_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.width = 410;
         _loc1_.setStyle("fontSize",20);
         _loc1_.id = "introtoptext";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.introtoptext = _loc1_;
         BindingManager.executeBindings(this,"introtoptext",this.introtoptext);
         return _loc1_;
      }
      
      private function _WaterStoreHouseUpdateContent_StandardText2_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.width = 410;
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
      
      private function _WaterStoreHouseUpdateContent_VGroup3_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.gap = 33;
         _loc1_.mxmlContent = [this._WaterStoreHouseUpdateContent_VGroup4_i(),this._WaterStoreHouseUpdateContent_VGroup5_i()];
         _loc1_.id = "pay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.pay = _loc1_;
         BindingManager.executeBindings(this,"pay",this.pay);
         return _loc1_;
      }
      
      private function _WaterStoreHouseUpdateContent_VGroup4_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.gap = 1;
         _loc1_.mxmlContent = [this._WaterStoreHouseUpdateContent_GradientText1_i(),this._WaterStoreHouseUpdateContent_HGroup1_i(),this._WaterStoreHouseUpdateContent_ButtonBuy1_i()];
         _loc1_.id = "petpennypanel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.petpennypanel = _loc1_;
         BindingManager.executeBindings(this,"petpennypanel",this.petpennypanel);
         return _loc1_;
      }
      
      private function _WaterStoreHouseUpdateContent_GradientText1_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.fontSize = 14;
         _loc1_.id = "petpennyUpdate";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.petpennyUpdate = _loc1_;
         BindingManager.executeBindings(this,"petpennyUpdate",this.petpennyUpdate);
         return _loc1_;
      }
      
      private function _WaterStoreHouseUpdateContent_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.gap = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.verticalAlign = "middle";
         _loc1_.horizontalAlign = "left";
         _loc1_.mxmlContent = [this._WaterStoreHouseUpdateContent_StandardText3_i(),this._WaterStoreHouseUpdateContent_GradientText2_i()];
         _loc1_.id = "petpennypanelCap";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.petpennypanelCap = _loc1_;
         BindingManager.executeBindings(this,"petpennypanelCap",this.petpennypanelCap);
         return _loc1_;
      }
      
      private function _WaterStoreHouseUpdateContent_StandardText3_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.setStyle("fontSize",12);
         _loc1_.id = "newCapPetPennyPanel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.newCapPetPennyPanel = _loc1_;
         BindingManager.executeBindings(this,"newCapPetPennyPanel",this.newCapPetPennyPanel);
         return _loc1_;
      }
      
      private function _WaterStoreHouseUpdateContent_GradientText2_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.fontSize = 14;
         _loc1_.id = "capCountPetPennyPanel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.capCountPetPennyPanel = _loc1_;
         BindingManager.executeBindings(this,"capCountPetPennyPanel",this.capCountPetPennyPanel);
         return _loc1_;
      }
      
      private function _WaterStoreHouseUpdateContent_ButtonBuy1_i() : ButtonBuy
      {
         var _loc1_:ButtonBuy = new ButtonBuy();
         _loc1_.width = 140;
         _loc1_.id = "buyPetPenny";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.buyPetPenny = _loc1_;
         BindingManager.executeBindings(this,"buyPetPenny",this.buyPetPenny);
         return _loc1_;
      }
      
      private function _WaterStoreHouseUpdateContent_VGroup5_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.gap = 1;
         _loc1_.mxmlContent = [this._WaterStoreHouseUpdateContent_GradientText3_i(),this._WaterStoreHouseUpdateContent_HGroup2_i(),this._WaterStoreHouseUpdateContent_ButtonBuy2_i()];
         _loc1_.id = "zooDollarPanel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.zooDollarPanel = _loc1_;
         BindingManager.executeBindings(this,"zooDollarPanel",this.zooDollarPanel);
         return _loc1_;
      }
      
      private function _WaterStoreHouseUpdateContent_GradientText3_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.fontSize = 14;
         _loc1_.id = "zooDollarUpdate";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.zooDollarUpdate = _loc1_;
         BindingManager.executeBindings(this,"zooDollarUpdate",this.zooDollarUpdate);
         return _loc1_;
      }
      
      private function _WaterStoreHouseUpdateContent_HGroup2_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.gap = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.verticalAlign = "middle";
         _loc1_.horizontalAlign = "left";
         _loc1_.mxmlContent = [this._WaterStoreHouseUpdateContent_StandardText4_i(),this._WaterStoreHouseUpdateContent_GradientText4_i()];
         _loc1_.id = "zooDollarPanelCap";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.zooDollarPanelCap = _loc1_;
         BindingManager.executeBindings(this,"zooDollarPanelCap",this.zooDollarPanelCap);
         return _loc1_;
      }
      
      private function _WaterStoreHouseUpdateContent_StandardText4_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.setStyle("fontSize",12);
         _loc1_.id = "newCapZooDollarPanel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.newCapZooDollarPanel = _loc1_;
         BindingManager.executeBindings(this,"newCapZooDollarPanel",this.newCapZooDollarPanel);
         return _loc1_;
      }
      
      private function _WaterStoreHouseUpdateContent_GradientText4_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.fontSize = 14;
         _loc1_.id = "capCountZooDollarPanel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.capCountZooDollarPanel = _loc1_;
         BindingManager.executeBindings(this,"capCountZooDollarPanel",this.capCountZooDollarPanel);
         return _loc1_;
      }
      
      private function _WaterStoreHouseUpdateContent_ButtonBuy2_i() : ButtonBuy
      {
         var _loc1_:ButtonBuy = new ButtonBuy();
         _loc1_.width = 140;
         _loc1_.id = "buyZooDollar";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.buyZooDollar = _loc1_;
         BindingManager.executeBindings(this,"buyZooDollar",this.buyZooDollar);
         return _loc1_;
      }
      
      private function _WaterStoreHouseUpdateContent_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.x = 180;
         _loc1_.y = 120;
         _loc1_.initialized(this,"titleLine");
         this.titleLine = _loc1_;
         BindingManager.executeBindings(this,"titleLine",this.titleLine);
         return _loc1_;
      }
      
      private function _WaterStoreHouseUpdateContent_SpriteVisualElement2_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.x = 80;
         _loc1_.y = 280;
         _loc1_.initialized(this,"middleLine");
         this.middleLine = _loc1_;
         BindingManager.executeBindings(this,"middleLine",this.middleLine);
         return _loc1_;
      }
      
      private function _WaterStoreHouseUpdateContent_Image1_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.source = this._embed_mxml__general_Decorations_swf_PetPenny_869510186;
         _loc1_.scaleX = 1.6;
         _loc1_.scaleY = 1.6;
         _loc1_.x = 100;
         _loc1_.y = 200;
         _loc1_.id = "petPenny";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.petPenny = _loc1_;
         BindingManager.executeBindings(this,"petPenny",this.petPenny);
         return _loc1_;
      }
      
      private function _WaterStoreHouseUpdateContent_Image2_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.source = this._embed_mxml__general_Decorations_swf_ZooDollar_1091307755;
         _loc1_.scaleX = 1.6;
         _loc1_.scaleY = 1.6;
         _loc1_.x = 100;
         _loc1_.y = 330;
         _loc1_.id = "zooDollar";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.zooDollar = _loc1_;
         BindingManager.executeBindings(this,"zooDollar",this.zooDollar);
         return _loc1_;
      }
      
      private function _WaterStoreHouseUpdateContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._WaterStoreHouseUpdateContent_SpriteVisualElement3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _WaterStoreHouseUpdateContent_SpriteVisualElement3_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.x = 45;
         _loc1_.y = 50;
         _loc1_.initialized(this,"infoImage");
         this.infoImage = _loc1_;
         BindingManager.executeBindings(this,"infoImage",this.infoImage);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get buyPetPenny() : ButtonBuy
      {
         return this._651029653buyPetPenny;
      }
      
      public function set buyPetPenny(param1:ButtonBuy) : void
      {
         var _loc2_:Object = this._651029653buyPetPenny;
         if(_loc2_ !== param1)
         {
            this._651029653buyPetPenny = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"buyPetPenny",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get buyZooDollar() : ButtonBuy
      {
         return this._169548112buyZooDollar;
      }
      
      public function set buyZooDollar(param1:ButtonBuy) : void
      {
         var _loc2_:Object = this._169548112buyZooDollar;
         if(_loc2_ !== param1)
         {
            this._169548112buyZooDollar = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"buyZooDollar",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get capCountPetPennyPanel() : GradientText
      {
         return this._648376546capCountPetPennyPanel;
      }
      
      public function set capCountPetPennyPanel(param1:GradientText) : void
      {
         var _loc2_:Object = this._648376546capCountPetPennyPanel;
         if(_loc2_ !== param1)
         {
            this._648376546capCountPetPennyPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"capCountPetPennyPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get capCountZooDollarPanel() : GradientText
      {
         return this._2035465173capCountZooDollarPanel;
      }
      
      public function set capCountZooDollarPanel(param1:GradientText) : void
      {
         var _loc2_:Object = this._2035465173capCountZooDollarPanel;
         if(_loc2_ !== param1)
         {
            this._2035465173capCountZooDollarPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"capCountZooDollarPanel",_loc2_,param1));
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
      public function get newCapPetPennyPanel() : StandardText
      {
         return this._1651349837newCapPetPennyPanel;
      }
      
      public function set newCapPetPennyPanel(param1:StandardText) : void
      {
         var _loc2_:Object = this._1651349837newCapPetPennyPanel;
         if(_loc2_ !== param1)
         {
            this._1651349837newCapPetPennyPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"newCapPetPennyPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get newCapZooDollarPanel() : StandardText
      {
         return this._1008064224newCapZooDollarPanel;
      }
      
      public function set newCapZooDollarPanel(param1:StandardText) : void
      {
         var _loc2_:Object = this._1008064224newCapZooDollarPanel;
         if(_loc2_ !== param1)
         {
            this._1008064224newCapZooDollarPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"newCapZooDollarPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get pay() : VGroup
      {
         return this._110760pay;
      }
      
      public function set pay(param1:VGroup) : void
      {
         var _loc2_:Object = this._110760pay;
         if(_loc2_ !== param1)
         {
            this._110760pay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get petPenny() : Image
      {
         return this._467801797petPenny;
      }
      
      public function set petPenny(param1:Image) : void
      {
         var _loc2_:Object = this._467801797petPenny;
         if(_loc2_ !== param1)
         {
            this._467801797petPenny = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"petPenny",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get petpennyUpdate() : GradientText
      {
         return this._593449970petpennyUpdate;
      }
      
      public function set petpennyUpdate(param1:GradientText) : void
      {
         var _loc2_:Object = this._593449970petpennyUpdate;
         if(_loc2_ !== param1)
         {
            this._593449970petpennyUpdate = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"petpennyUpdate",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get petpennypanel() : VGroup
      {
         return this._1806469695petpennypanel;
      }
      
      public function set petpennypanel(param1:VGroup) : void
      {
         var _loc2_:Object = this._1806469695petpennypanel;
         if(_loc2_ !== param1)
         {
            this._1806469695petpennypanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"petpennypanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get petpennypanelCap() : HGroup
      {
         return this._598532371petpennypanelCap;
      }
      
      public function set petpennypanelCap(param1:HGroup) : void
      {
         var _loc2_:Object = this._598532371petpennypanelCap;
         if(_loc2_ !== param1)
         {
            this._598532371petpennypanelCap = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"petpennypanelCap",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get titleLine() : SpriteVisualElement
      {
         return this._2135991700titleLine;
      }
      
      public function set titleLine(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._2135991700titleLine;
         if(_loc2_ !== param1)
         {
            this._2135991700titleLine = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"titleLine",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get zooDollar() : Image
      {
         return this._493584694zooDollar;
      }
      
      public function set zooDollar(param1:Image) : void
      {
         var _loc2_:Object = this._493584694zooDollar;
         if(_loc2_ !== param1)
         {
            this._493584694zooDollar = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"zooDollar",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get zooDollarPanel() : VGroup
      {
         return this._257419886zooDollarPanel;
      }
      
      public function set zooDollarPanel(param1:VGroup) : void
      {
         var _loc2_:Object = this._257419886zooDollarPanel;
         if(_loc2_ !== param1)
         {
            this._257419886zooDollarPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"zooDollarPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get zooDollarPanelCap() : HGroup
      {
         return this._2015699324zooDollarPanelCap;
      }
      
      public function set zooDollarPanelCap(param1:HGroup) : void
      {
         var _loc2_:Object = this._2015699324zooDollarPanelCap;
         if(_loc2_ !== param1)
         {
            this._2015699324zooDollarPanelCap = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"zooDollarPanelCap",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get zooDollarUpdate() : GradientText
      {
         return this._453220961zooDollarUpdate;
      }
      
      public function set zooDollarUpdate(param1:GradientText) : void
      {
         var _loc2_:Object = this._453220961zooDollarUpdate;
         if(_loc2_ !== param1)
         {
            this._453220961zooDollarUpdate = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"zooDollarUpdate",_loc2_,param1));
            }
         }
      }
   }
}

