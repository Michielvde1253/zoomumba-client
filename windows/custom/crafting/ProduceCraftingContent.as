package windows.custom.crafting
{
   import buttons.skin.fluid.ButtonFluidGradientNormalSkin;
   import components.textfield.StandardText;
   import components.textfield.gradientText.GradientText;
   import components.textfield.labelDisplay.LabelDisplay;
   import components.textfield.labelDisplay.skin.LabelDisplayGoldSkin;
   import components.textfield.labelDisplay.skin.LabelDisplaySkin;
   import flash.accessibility.*;
   import flash.debugger.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.geom.*;
   import flash.media.*;
   import flash.net.*;
   import flash.printing.*;
   import flash.profiler.*;
   import flash.system.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   import flash.xml.*;
   import mx.binding.*;
   import mx.controls.Image;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.styles.*;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.VGroup;
   import spark.core.SpriteVisualElement;
   import spark.primitives.BitmapImage;
   import utils.Color;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   
   use namespace mx_internal;
   
   public class ProduceCraftingContent extends Group implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _750692891ZooDollarImage:HGroup;
      
      private var _205678947btnBack:Button;
      
      private var _2082508068btnCraft:Button;
      
      private var _163334105bubbleText:StandardText;
      
      private var _225963704cardtitle:StandardText;
      
      private var _742095713categorieTitle:StandardText;
      
      private var _1790267582characterIcon:BitmapImage;
      
      private var _1048103124clockDisplay:LabelDisplay;
      
      private var _213293257header_bg:BitmapImage;
      
      private var _1732882828materialbar:UIComponent;
      
      private var _1152811799materialcount1:LabelDisplay;
      
      private var _1152811798materialcount2:LabelDisplay;
      
      private var _1152811797materialcount3:LabelDisplay;
      
      private var _1152811796materialcount4:LabelDisplay;
      
      private var _1109279988petpawText:GradientText;
      
      private var _42782728previewProduce:SpriteVisualElement;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__general_Decorations_swf_PetPaw_1083129188:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ProduceCraftingContent()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__general_Decorations_swf_PetPaw_1083129188 = ProduceCraftingContent__embed_mxml__general_Decorations_swf_PetPaw_1083129188;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._ProduceCraftingContent_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_windows_custom_crafting_ProduceCraftingContentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ProduceCraftingContent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContent = [this._ProduceCraftingContent_InnerGroup1_c(),this._ProduceCraftingContent_OuterGroup1_c()];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         ProduceCraftingContent._watcherSetupUtil = param1;
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
      
      private function _ProduceCraftingContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._ProduceCraftingContent_BitmapImage1_i(),this._ProduceCraftingContent_VGroup1_c(),this._ProduceCraftingContent_VGroup2_c(),this._ProduceCraftingContent_VGroup3_c(),this._ProduceCraftingContent_SpriteVisualElement1_i(),this._ProduceCraftingContent_Group2_c(),this._ProduceCraftingContent_Group3_c(),this._ProduceCraftingContent_Group4_c(),this._ProduceCraftingContent_Group5_c(),this._ProduceCraftingContent_Group6_c(),this._ProduceCraftingContent_HGroup1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ProduceCraftingContent_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 10;
         _loc1_.initialized(this,"header_bg");
         this.header_bg = _loc1_;
         BindingManager.executeBindings(this,"header_bg",this.header_bg);
         return _loc1_;
      }
      
      private function _ProduceCraftingContent_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.horizontalCenter = 60;
         _loc1_.y = 105;
         _loc1_.mxmlContent = [this._ProduceCraftingContent_StandardText1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ProduceCraftingContent_StandardText1_i() : StandardText
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
      
      private function _ProduceCraftingContent_VGroup2_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.x = 77;
         _loc1_.y = 275;
         _loc1_.mxmlContent = [this._ProduceCraftingContent_StandardText2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ProduceCraftingContent_StandardText2_i() : StandardText
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
      
      private function _ProduceCraftingContent_VGroup3_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.x = 110;
         _loc1_.y = 315;
         _loc1_.mxmlContent = [this._ProduceCraftingContent_StandardText3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ProduceCraftingContent_StandardText3_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.width = 110;
         _loc1_.top = 11;
         _loc1_.horizontalCenter = 0;
         _loc1_.setStyle("textAlign","center");
         _loc1_.setStyle("fontSize",11);
         _loc1_.setStyle("fontAntiAliasType","normal");
         _loc1_.id = "cardtitle";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.cardtitle = _loc1_;
         BindingManager.executeBindings(this,"cardtitle",this.cardtitle);
         return _loc1_;
      }
      
      private function _ProduceCraftingContent_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.x = 105;
         _loc1_.y = 290;
         _loc1_.initialized(this,"previewProduce");
         this.previewProduce = _loc1_;
         BindingManager.executeBindings(this,"previewProduce",this.previewProduce);
         return _loc1_;
      }
      
      private function _ProduceCraftingContent_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 250;
         _loc1_.y = 327;
         _loc1_.mxmlContent = [this._ProduceCraftingContent_UIComponent1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ProduceCraftingContent_UIComponent1_i() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.id = "materialbar";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.materialbar = _loc1_;
         BindingManager.executeBindings(this,"materialbar",this.materialbar);
         return _loc1_;
      }
      
      private function _ProduceCraftingContent_Group3_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 210;
         _loc1_.y = 390;
         _loc1_.width = 150;
         _loc1_.mxmlContent = [this._ProduceCraftingContent_VGroup4_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ProduceCraftingContent_VGroup4_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.horizontalCenter = 0;
         _loc1_.mxmlContent = [this._ProduceCraftingContent_LabelDisplay1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ProduceCraftingContent_LabelDisplay1_i() : LabelDisplay
      {
         var _loc1_:LabelDisplay = new LabelDisplay();
         _loc1_.horizontalCenter = 0;
         _loc1_.mouseChildren = false;
         _loc1_.mouseEnabled = false;
         _loc1_.verticalCenter = 0;
         _loc1_.setStyle("skinClass",LabelDisplayGoldSkin);
         _loc1_.id = "materialcount1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.materialcount1 = _loc1_;
         BindingManager.executeBindings(this,"materialcount1",this.materialcount1);
         return _loc1_;
      }
      
      private function _ProduceCraftingContent_Group4_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 310;
         _loc1_.y = 390;
         _loc1_.width = 150;
         _loc1_.mxmlContent = [this._ProduceCraftingContent_VGroup5_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ProduceCraftingContent_VGroup5_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.horizontalCenter = 0;
         _loc1_.mxmlContent = [this._ProduceCraftingContent_LabelDisplay2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ProduceCraftingContent_LabelDisplay2_i() : LabelDisplay
      {
         var _loc1_:LabelDisplay = new LabelDisplay();
         _loc1_.horizontalCenter = 0;
         _loc1_.mouseChildren = false;
         _loc1_.mouseEnabled = false;
         _loc1_.verticalCenter = 0;
         _loc1_.setStyle("skinClass",LabelDisplayGoldSkin);
         _loc1_.id = "materialcount2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.materialcount2 = _loc1_;
         BindingManager.executeBindings(this,"materialcount2",this.materialcount2);
         return _loc1_;
      }
      
      private function _ProduceCraftingContent_Group5_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 410;
         _loc1_.y = 390;
         _loc1_.width = 150;
         _loc1_.mxmlContent = [this._ProduceCraftingContent_VGroup6_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ProduceCraftingContent_VGroup6_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.horizontalCenter = 0;
         _loc1_.mxmlContent = [this._ProduceCraftingContent_LabelDisplay3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ProduceCraftingContent_LabelDisplay3_i() : LabelDisplay
      {
         var _loc1_:LabelDisplay = new LabelDisplay();
         _loc1_.horizontalCenter = 0;
         _loc1_.mouseChildren = false;
         _loc1_.mouseEnabled = false;
         _loc1_.verticalCenter = 0;
         _loc1_.setStyle("skinClass",LabelDisplayGoldSkin);
         _loc1_.id = "materialcount3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.materialcount3 = _loc1_;
         BindingManager.executeBindings(this,"materialcount3",this.materialcount3);
         return _loc1_;
      }
      
      private function _ProduceCraftingContent_Group6_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 510;
         _loc1_.y = 390;
         _loc1_.width = 150;
         _loc1_.mxmlContent = [this._ProduceCraftingContent_VGroup7_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ProduceCraftingContent_VGroup7_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.horizontalCenter = 0;
         _loc1_.mxmlContent = [this._ProduceCraftingContent_LabelDisplay4_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ProduceCraftingContent_LabelDisplay4_i() : LabelDisplay
      {
         var _loc1_:LabelDisplay = new LabelDisplay();
         _loc1_.horizontalCenter = 0;
         _loc1_.mouseChildren = false;
         _loc1_.mouseEnabled = false;
         _loc1_.verticalCenter = 0;
         _loc1_.setStyle("skinClass",LabelDisplayGoldSkin);
         _loc1_.id = "materialcount4";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.materialcount4 = _loc1_;
         BindingManager.executeBindings(this,"materialcount4",this.materialcount4);
         return _loc1_;
      }
      
      private function _ProduceCraftingContent_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.x = 260;
         _loc1_.y = 280;
         _loc1_.gap = 80;
         _loc1_.mxmlContent = [this._ProduceCraftingContent_LabelDisplay5_i(),this._ProduceCraftingContent_HGroup2_c()];
         _loc1_.id = "ZooDollarImage";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.ZooDollarImage = _loc1_;
         BindingManager.executeBindings(this,"ZooDollarImage",this.ZooDollarImage);
         return _loc1_;
      }
      
      private function _ProduceCraftingContent_LabelDisplay5_i() : LabelDisplay
      {
         var _loc1_:LabelDisplay = new LabelDisplay();
         _loc1_.text = "00:00:00";
         _loc1_.type = "clock_red";
         _loc1_.setStyle("skinClass",LabelDisplaySkin);
         _loc1_.id = "clockDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.clockDisplay = _loc1_;
         BindingManager.executeBindings(this,"clockDisplay",this.clockDisplay);
         return _loc1_;
      }
      
      private function _ProduceCraftingContent_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.gap = -1;
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._ProduceCraftingContent_Image1_c(),this._ProduceCraftingContent_GradientText1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ProduceCraftingContent_Image1_c() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.scaleX = 0.6;
         _loc1_.scaleY = 0.6;
         _loc1_.source = this._embed_mxml__general_Decorations_swf_PetPaw_1083129188;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ProduceCraftingContent_GradientText1_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.fontSize = 12;
         _loc1_.id = "petpawText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.petpawText = _loc1_;
         BindingManager.executeBindings(this,"petpawText",this.petpawText);
         return _loc1_;
      }
      
      private function _ProduceCraftingContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._ProduceCraftingContent_Group7_c(),this._ProduceCraftingContent_HGroup3_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ProduceCraftingContent_Group7_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._ProduceCraftingContent_Group8_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ProduceCraftingContent_Group8_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 48;
         _loc1_.y = 70;
         _loc1_.mxmlContent = [this._ProduceCraftingContent_BitmapImage2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ProduceCraftingContent_BitmapImage2_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.initialized(this,"characterIcon");
         this.characterIcon = _loc1_;
         BindingManager.executeBindings(this,"characterIcon",this.characterIcon);
         return _loc1_;
      }
      
      private function _ProduceCraftingContent_HGroup3_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.bottom = 15;
         _loc1_.horizontalCenter = 0;
         _loc1_.mxmlContent = [this._ProduceCraftingContent_Button1_i(),this._ProduceCraftingContent_Button2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ProduceCraftingContent_Button1_i() : Button
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
      
      private function _ProduceCraftingContent_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.width = 136;
         _loc1_.height = 42;
         _loc1_.setStyle("skinClass",ButtonFluidGradientNormalSkin);
         _loc1_.id = "btnCraft";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnCraft = _loc1_;
         BindingManager.executeBindings(this,"btnCraft",this.btnCraft);
         return _loc1_;
      }
      
      private function _ProduceCraftingContent_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():uint
         {
            return Color.CRAFTING_COLOR_WHITEBLUE;
         },function(param1:uint):void
         {
            cardtitle.setStyle("color",param1);
         },"cardtitle.color");
         return result;
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
      public function get btnCraft() : Button
      {
         return this._2082508068btnCraft;
      }
      
      public function set btnCraft(param1:Button) : void
      {
         var _loc2_:Object = this._2082508068btnCraft;
         if(_loc2_ !== param1)
         {
            this._2082508068btnCraft = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnCraft",_loc2_,param1));
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
      public function get cardtitle() : StandardText
      {
         return this._225963704cardtitle;
      }
      
      public function set cardtitle(param1:StandardText) : void
      {
         var _loc2_:Object = this._225963704cardtitle;
         if(_loc2_ !== param1)
         {
            this._225963704cardtitle = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cardtitle",_loc2_,param1));
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
      public function get clockDisplay() : LabelDisplay
      {
         return this._1048103124clockDisplay;
      }
      
      public function set clockDisplay(param1:LabelDisplay) : void
      {
         var _loc2_:Object = this._1048103124clockDisplay;
         if(_loc2_ !== param1)
         {
            this._1048103124clockDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"clockDisplay",_loc2_,param1));
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
      public function get materialbar() : UIComponent
      {
         return this._1732882828materialbar;
      }
      
      public function set materialbar(param1:UIComponent) : void
      {
         var _loc2_:Object = this._1732882828materialbar;
         if(_loc2_ !== param1)
         {
            this._1732882828materialbar = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"materialbar",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get materialcount1() : LabelDisplay
      {
         return this._1152811799materialcount1;
      }
      
      public function set materialcount1(param1:LabelDisplay) : void
      {
         var _loc2_:Object = this._1152811799materialcount1;
         if(_loc2_ !== param1)
         {
            this._1152811799materialcount1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"materialcount1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get materialcount2() : LabelDisplay
      {
         return this._1152811798materialcount2;
      }
      
      public function set materialcount2(param1:LabelDisplay) : void
      {
         var _loc2_:Object = this._1152811798materialcount2;
         if(_loc2_ !== param1)
         {
            this._1152811798materialcount2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"materialcount2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get materialcount3() : LabelDisplay
      {
         return this._1152811797materialcount3;
      }
      
      public function set materialcount3(param1:LabelDisplay) : void
      {
         var _loc2_:Object = this._1152811797materialcount3;
         if(_loc2_ !== param1)
         {
            this._1152811797materialcount3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"materialcount3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get materialcount4() : LabelDisplay
      {
         return this._1152811796materialcount4;
      }
      
      public function set materialcount4(param1:LabelDisplay) : void
      {
         var _loc2_:Object = this._1152811796materialcount4;
         if(_loc2_ !== param1)
         {
            this._1152811796materialcount4 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"materialcount4",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get petpawText() : GradientText
      {
         return this._1109279988petpawText;
      }
      
      public function set petpawText(param1:GradientText) : void
      {
         var _loc2_:Object = this._1109279988petpawText;
         if(_loc2_ !== param1)
         {
            this._1109279988petpawText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"petpawText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get previewProduce() : SpriteVisualElement
      {
         return this._42782728previewProduce;
      }
      
      public function set previewProduce(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._42782728previewProduce;
         if(_loc2_ !== param1)
         {
            this._42782728previewProduce = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"previewProduce",_loc2_,param1));
            }
         }
      }
   }
}

