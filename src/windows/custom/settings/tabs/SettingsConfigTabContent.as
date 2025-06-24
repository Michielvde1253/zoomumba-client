package windows.custom.settings.tabs
{
   import components.radioButton.RadioButtonNormalSkin;
   import components.slider.HSilderAmmountSkin;
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
   import mx.controls.Text;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.styles.*;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.HSlider;
   import spark.components.RadioButton;
   import spark.components.RadioButtonGroup;
   import spark.components.VGroup;
   import spark.primitives.BitmapImage;
   import utils.Color;
   import windows.core.InnerGroup;
   
   use namespace mx_internal;
   
   public class SettingsConfigTabContent extends Group implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      public var _SettingsConfigTabContent_BitmapImage1:BitmapImage;
      
      public var _SettingsConfigTabContent_BitmapImage2:BitmapImage;
      
      public var _SettingsConfigTabContent_BitmapImage3:BitmapImage;
      
      public var _SettingsConfigTabContent_Group2:Group;
      
      public var _SettingsConfigTabContent_Group3:Group;
      
      public var _SettingsConfigTabContent_Group4:Group;
      
      public var _SettingsConfigTabContent_Group5:Group;
      
      public var _SettingsConfigTabContent_Group6:Group;
      
      public var _SettingsConfigTabContent_Group7:Group;
      
      public var _SettingsConfigTabContent_Group8:Group;
      
      private var _984000641animationTitleText:Text;
      
      private var _712643055animationsOptText:Text;
      
      private var _503163696animationsSlider:HSlider;
      
      private var _1447436701graphicTitleText:Text;
      
      private var _718256252localStorageOFFRadio:RadioButton;
      
      private var _1814475060localStorageONRadio:RadioButton;
      
      private var _810070064localStorageOptText:Text;
      
      private var _960068596localStorageRadioGroup:RadioButtonGroup;
      
      private var _2128766225musicOFFRadio:RadioButton;
      
      private var _383501417musicONRadio:RadioButton;
      
      private var _620903579musicOptText:Text;
      
      private var _749512887musicRadioGroup:RadioButtonGroup;
      
      private var _1474046382qualityHRadio:RadioButton;
      
      private var _1359529778qualityLRadio:RadioButton;
      
      private var _1330900627qualityMRadio:RadioButton;
      
      private var _47734913qualityOptText:Text;
      
      private var _772727203qualityRadioGroup:RadioButtonGroup;
      
      private var _1471423772soundEffectRadioGroup:RadioButtonGroup;
      
      private var _17863135soundEffectsOFFRadio:RadioButton;
      
      private var _1765162249soundEffectsONRadio:RadioButton;
      
      private var _1525400051soundEffectsOptText:Text;
      
      private var _994310314soundTitleText:Text;
      
      private var _643921681tooltipOFFRadio:RadioButton;
      
      private var _1165679623tooltipONRadio:RadioButton;
      
      private var _161274627tooltipOptText:Text;
      
      private var _1872100263tooltipRadioGroup:RadioButtonGroup;
      
      private var _1890963279visitorsOFFRadio:RadioButton;
      
      private var _1287945207visitorsONRadio:RadioButton;
      
      private var _2002617093visitorsOptText:Text;
      
      private var _1761000169visitorsRadioGroup:RadioButtonGroup;
      
      private var _1059506559wishesOFFRadio:RadioButton;
      
      private var _760577063wishesONRadio:RadioButton;
      
      private var _1764982059wishesOptText:Text;
      
      private var _1926991033wishesRadioGroup:RadioButtonGroup;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private const WIDTH_COLUMN:int = 260;
      
      private const WIDTH_BAR:int = 265;
      
      private var _embed_mxml__general_Patterns_swf_HPatternLine_1769938539:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function SettingsConfigTabContent()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__general_Patterns_swf_HPatternLine_1769938539 = SettingsConfigTabContent__embed_mxml__general_Patterns_swf_HPatternLine_1769938539;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._SettingsConfigTabContent_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_windows_custom_settings_tabs_SettingsConfigTabContentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return SettingsConfigTabContent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._SettingsConfigTabContent_InnerGroup1_c()];
         this._SettingsConfigTabContent_RadioButtonGroup7_i();
         this._SettingsConfigTabContent_RadioButtonGroup6_i();
         this._SettingsConfigTabContent_RadioButtonGroup1_i();
         this._SettingsConfigTabContent_RadioButtonGroup5_i();
         this._SettingsConfigTabContent_RadioButtonGroup2_i();
         this._SettingsConfigTabContent_RadioButtonGroup3_i();
         this._SettingsConfigTabContent_RadioButtonGroup4_i();
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         SettingsConfigTabContent._watcherSetupUtil = param1;
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
      
      private function _SettingsConfigTabContent_RadioButtonGroup7_i() : RadioButtonGroup
      {
         var _loc1_:RadioButtonGroup = new RadioButtonGroup();
         _loc1_.initialized(this,"localStorageRadioGroup");
         this.localStorageRadioGroup = _loc1_;
         BindingManager.executeBindings(this,"localStorageRadioGroup",this.localStorageRadioGroup);
         return _loc1_;
      }
      
      private function _SettingsConfigTabContent_RadioButtonGroup6_i() : RadioButtonGroup
      {
         var _loc1_:RadioButtonGroup = new RadioButtonGroup();
         _loc1_.initialized(this,"musicRadioGroup");
         this.musicRadioGroup = _loc1_;
         BindingManager.executeBindings(this,"musicRadioGroup",this.musicRadioGroup);
         return _loc1_;
      }
      
      private function _SettingsConfigTabContent_RadioButtonGroup1_i() : RadioButtonGroup
      {
         var _loc1_:RadioButtonGroup = new RadioButtonGroup();
         _loc1_.initialized(this,"qualityRadioGroup");
         this.qualityRadioGroup = _loc1_;
         BindingManager.executeBindings(this,"qualityRadioGroup",this.qualityRadioGroup);
         return _loc1_;
      }
      
      private function _SettingsConfigTabContent_RadioButtonGroup5_i() : RadioButtonGroup
      {
         var _loc1_:RadioButtonGroup = new RadioButtonGroup();
         _loc1_.initialized(this,"soundEffectRadioGroup");
         this.soundEffectRadioGroup = _loc1_;
         BindingManager.executeBindings(this,"soundEffectRadioGroup",this.soundEffectRadioGroup);
         return _loc1_;
      }
      
      private function _SettingsConfigTabContent_RadioButtonGroup2_i() : RadioButtonGroup
      {
         var _loc1_:RadioButtonGroup = new RadioButtonGroup();
         _loc1_.initialized(this,"tooltipRadioGroup");
         this.tooltipRadioGroup = _loc1_;
         BindingManager.executeBindings(this,"tooltipRadioGroup",this.tooltipRadioGroup);
         return _loc1_;
      }
      
      private function _SettingsConfigTabContent_RadioButtonGroup3_i() : RadioButtonGroup
      {
         var _loc1_:RadioButtonGroup = new RadioButtonGroup();
         _loc1_.initialized(this,"visitorsRadioGroup");
         this.visitorsRadioGroup = _loc1_;
         BindingManager.executeBindings(this,"visitorsRadioGroup",this.visitorsRadioGroup);
         return _loc1_;
      }
      
      private function _SettingsConfigTabContent_RadioButtonGroup4_i() : RadioButtonGroup
      {
         var _loc1_:RadioButtonGroup = new RadioButtonGroup();
         _loc1_.initialized(this,"wishesRadioGroup");
         this.wishesRadioGroup = _loc1_;
         BindingManager.executeBindings(this,"wishesRadioGroup",this.wishesRadioGroup);
         return _loc1_;
      }
      
      private function _SettingsConfigTabContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._SettingsConfigTabContent_HGroup1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _SettingsConfigTabContent_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.top = 160;
         _loc1_.left = 70;
         _loc1_.gap = 40;
         _loc1_.mxmlContent = [this._SettingsConfigTabContent_VGroup1_c(),this._SettingsConfigTabContent_VGroup2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _SettingsConfigTabContent_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.gap = 10;
         _loc1_.mxmlContent = [this._SettingsConfigTabContent_Text1_i(),this._SettingsConfigTabContent_BitmapImage1_i(),this._SettingsConfigTabContent_Group2_i(),this._SettingsConfigTabContent_Group3_i(),this._SettingsConfigTabContent_Group4_i(),this._SettingsConfigTabContent_Group5_i(),this._SettingsConfigTabContent_Group6_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _SettingsConfigTabContent_Text1_i() : Text
      {
         var _loc1_:Text = new Text();
         _loc1_.cachePolicy = "off";
         _loc1_.truncateToFit = false;
         _loc1_.selectable = false;
         _loc1_.mouseEnabled = false;
         _loc1_.setStyle("fontAntiAliasType","advanced");
         _loc1_.setStyle("fontFamily","Tahoma");
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("fontSize",15);
         _loc1_.setStyle("textAlign","left");
         _loc1_.setStyle("paddingBottom",-7);
         _loc1_.id = "graphicTitleText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.graphicTitleText = _loc1_;
         BindingManager.executeBindings(this,"graphicTitleText",this.graphicTitleText);
         return _loc1_;
      }
      
      private function _SettingsConfigTabContent_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.height = 8;
         _loc1_.fillMode = "repeat";
         _loc1_.source = this._embed_mxml__general_Patterns_swf_HPatternLine_1769938539;
         _loc1_.initialized(this,"_SettingsConfigTabContent_BitmapImage1");
         this._SettingsConfigTabContent_BitmapImage1 = _loc1_;
         BindingManager.executeBindings(this,"_SettingsConfigTabContent_BitmapImage1",this._SettingsConfigTabContent_BitmapImage1);
         return _loc1_;
      }
      
      private function _SettingsConfigTabContent_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._SettingsConfigTabContent_Text2_i(),this._SettingsConfigTabContent_HGroup2_c()];
         _loc1_.id = "_SettingsConfigTabContent_Group2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SettingsConfigTabContent_Group2 = _loc1_;
         BindingManager.executeBindings(this,"_SettingsConfigTabContent_Group2",this._SettingsConfigTabContent_Group2);
         return _loc1_;
      }
      
      private function _SettingsConfigTabContent_Text2_i() : Text
      {
         var _loc1_:Text = new Text();
         _loc1_.cachePolicy = "off";
         _loc1_.truncateToFit = false;
         _loc1_.selectable = false;
         _loc1_.mouseEnabled = false;
         _loc1_.verticalCenter = 0;
         _loc1_.left = 15;
         _loc1_.setStyle("fontAntiAliasType","advanced");
         _loc1_.setStyle("fontFamily","Tahoma");
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("fontSize",12);
         _loc1_.setStyle("textAlign","left");
         _loc1_.id = "qualityOptText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.qualityOptText = _loc1_;
         BindingManager.executeBindings(this,"qualityOptText",this.qualityOptText);
         return _loc1_;
      }
      
      private function _SettingsConfigTabContent_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.right = 0;
         _loc1_.gap = 40;
         _loc1_.mxmlContent = [this._SettingsConfigTabContent_RadioButton1_i(),this._SettingsConfigTabContent_RadioButton2_i(),this._SettingsConfigTabContent_RadioButton3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _SettingsConfigTabContent_RadioButton1_i() : RadioButton
      {
         var _loc1_:RadioButton = new RadioButton();
         _loc1_.value = 0;
         _loc1_.setStyle("skinClass",RadioButtonNormalSkin);
         _loc1_.id = "qualityLRadio";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.qualityLRadio = _loc1_;
         BindingManager.executeBindings(this,"qualityLRadio",this.qualityLRadio);
         return _loc1_;
      }
      
      private function _SettingsConfigTabContent_RadioButton2_i() : RadioButton
      {
         var _loc1_:RadioButton = new RadioButton();
         _loc1_.value = 1;
         _loc1_.setStyle("skinClass",RadioButtonNormalSkin);
         _loc1_.id = "qualityMRadio";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.qualityMRadio = _loc1_;
         BindingManager.executeBindings(this,"qualityMRadio",this.qualityMRadio);
         return _loc1_;
      }
      
      private function _SettingsConfigTabContent_RadioButton3_i() : RadioButton
      {
         var _loc1_:RadioButton = new RadioButton();
         _loc1_.value = 2;
         _loc1_.setStyle("skinClass",RadioButtonNormalSkin);
         _loc1_.id = "qualityHRadio";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.qualityHRadio = _loc1_;
         BindingManager.executeBindings(this,"qualityHRadio",this.qualityHRadio);
         return _loc1_;
      }
      
      private function _SettingsConfigTabContent_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._SettingsConfigTabContent_Text3_i(),this._SettingsConfigTabContent_HGroup3_c()];
         _loc1_.id = "_SettingsConfigTabContent_Group3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SettingsConfigTabContent_Group3 = _loc1_;
         BindingManager.executeBindings(this,"_SettingsConfigTabContent_Group3",this._SettingsConfigTabContent_Group3);
         return _loc1_;
      }
      
      private function _SettingsConfigTabContent_Text3_i() : Text
      {
         var _loc1_:Text = new Text();
         _loc1_.cachePolicy = "off";
         _loc1_.truncateToFit = false;
         _loc1_.selectable = false;
         _loc1_.mouseEnabled = false;
         _loc1_.left = 15;
         _loc1_.verticalCenter = 0;
         _loc1_.setStyle("fontAntiAliasType","advanced");
         _loc1_.setStyle("fontFamily","Tahoma");
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("fontSize",12);
         _loc1_.setStyle("textAlign","left");
         _loc1_.id = "tooltipOptText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.tooltipOptText = _loc1_;
         BindingManager.executeBindings(this,"tooltipOptText",this.tooltipOptText);
         return _loc1_;
      }
      
      private function _SettingsConfigTabContent_HGroup3_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.right = 0;
         _loc1_.gap = 40;
         _loc1_.mxmlContent = [this._SettingsConfigTabContent_RadioButton4_i(),this._SettingsConfigTabContent_RadioButton5_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _SettingsConfigTabContent_RadioButton4_i() : RadioButton
      {
         var _loc1_:RadioButton = new RadioButton();
         _loc1_.value = 1;
         _loc1_.setStyle("skinClass",RadioButtonNormalSkin);
         _loc1_.id = "tooltipONRadio";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.tooltipONRadio = _loc1_;
         BindingManager.executeBindings(this,"tooltipONRadio",this.tooltipONRadio);
         return _loc1_;
      }
      
      private function _SettingsConfigTabContent_RadioButton5_i() : RadioButton
      {
         var _loc1_:RadioButton = new RadioButton();
         _loc1_.value = 0;
         _loc1_.setStyle("skinClass",RadioButtonNormalSkin);
         _loc1_.id = "tooltipOFFRadio";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.tooltipOFFRadio = _loc1_;
         BindingManager.executeBindings(this,"tooltipOFFRadio",this.tooltipOFFRadio);
         return _loc1_;
      }
      
      private function _SettingsConfigTabContent_Group4_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._SettingsConfigTabContent_Text4_i(),this._SettingsConfigTabContent_HGroup4_c()];
         _loc1_.id = "_SettingsConfigTabContent_Group4";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SettingsConfigTabContent_Group4 = _loc1_;
         BindingManager.executeBindings(this,"_SettingsConfigTabContent_Group4",this._SettingsConfigTabContent_Group4);
         return _loc1_;
      }
      
      private function _SettingsConfigTabContent_Text4_i() : Text
      {
         var _loc1_:Text = new Text();
         _loc1_.cachePolicy = "off";
         _loc1_.truncateToFit = false;
         _loc1_.selectable = false;
         _loc1_.mouseEnabled = false;
         _loc1_.verticalCenter = 0;
         _loc1_.left = 15;
         _loc1_.setStyle("fontAntiAliasType","advanced");
         _loc1_.setStyle("fontFamily","Tahoma");
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("fontSize",12);
         _loc1_.setStyle("textAlign","left");
         _loc1_.id = "visitorsOptText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.visitorsOptText = _loc1_;
         BindingManager.executeBindings(this,"visitorsOptText",this.visitorsOptText);
         return _loc1_;
      }
      
      private function _SettingsConfigTabContent_HGroup4_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.right = 0;
         _loc1_.gap = 40;
         _loc1_.mxmlContent = [this._SettingsConfigTabContent_RadioButton6_i(),this._SettingsConfigTabContent_RadioButton7_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _SettingsConfigTabContent_RadioButton6_i() : RadioButton
      {
         var _loc1_:RadioButton = new RadioButton();
         _loc1_.value = 1;
         _loc1_.setStyle("skinClass",RadioButtonNormalSkin);
         _loc1_.id = "visitorsONRadio";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.visitorsONRadio = _loc1_;
         BindingManager.executeBindings(this,"visitorsONRadio",this.visitorsONRadio);
         return _loc1_;
      }
      
      private function _SettingsConfigTabContent_RadioButton7_i() : RadioButton
      {
         var _loc1_:RadioButton = new RadioButton();
         _loc1_.value = 0;
         _loc1_.setStyle("skinClass",RadioButtonNormalSkin);
         _loc1_.id = "visitorsOFFRadio";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.visitorsOFFRadio = _loc1_;
         BindingManager.executeBindings(this,"visitorsOFFRadio",this.visitorsOFFRadio);
         return _loc1_;
      }
      
      private function _SettingsConfigTabContent_Group5_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._SettingsConfigTabContent_Text5_i(),this._SettingsConfigTabContent_HGroup5_c()];
         _loc1_.id = "_SettingsConfigTabContent_Group5";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SettingsConfigTabContent_Group5 = _loc1_;
         BindingManager.executeBindings(this,"_SettingsConfigTabContent_Group5",this._SettingsConfigTabContent_Group5);
         return _loc1_;
      }
      
      private function _SettingsConfigTabContent_Text5_i() : Text
      {
         var _loc1_:Text = new Text();
         _loc1_.cachePolicy = "off";
         _loc1_.truncateToFit = false;
         _loc1_.selectable = false;
         _loc1_.mouseEnabled = false;
         _loc1_.verticalCenter = 0;
         _loc1_.left = 15;
         _loc1_.setStyle("fontAntiAliasType","advanced");
         _loc1_.setStyle("fontFamily","Tahoma");
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("fontSize",12);
         _loc1_.setStyle("textAlign","left");
         _loc1_.id = "wishesOptText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.wishesOptText = _loc1_;
         BindingManager.executeBindings(this,"wishesOptText",this.wishesOptText);
         return _loc1_;
      }
      
      private function _SettingsConfigTabContent_HGroup5_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.right = 0;
         _loc1_.gap = 40;
         _loc1_.mxmlContent = [this._SettingsConfigTabContent_RadioButton8_i(),this._SettingsConfigTabContent_RadioButton9_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _SettingsConfigTabContent_RadioButton8_i() : RadioButton
      {
         var _loc1_:RadioButton = new RadioButton();
         _loc1_.value = 1;
         _loc1_.setStyle("skinClass",RadioButtonNormalSkin);
         _loc1_.id = "wishesONRadio";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.wishesONRadio = _loc1_;
         BindingManager.executeBindings(this,"wishesONRadio",this.wishesONRadio);
         return _loc1_;
      }
      
      private function _SettingsConfigTabContent_RadioButton9_i() : RadioButton
      {
         var _loc1_:RadioButton = new RadioButton();
         _loc1_.value = 0;
         _loc1_.setStyle("skinClass",RadioButtonNormalSkin);
         _loc1_.id = "wishesOFFRadio";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.wishesOFFRadio = _loc1_;
         BindingManager.executeBindings(this,"wishesOFFRadio",this.wishesOFFRadio);
         return _loc1_;
      }
      
      private function _SettingsConfigTabContent_Group6_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._SettingsConfigTabContent_Text6_i(),this._SettingsConfigTabContent_HGroup6_c()];
         _loc1_.id = "_SettingsConfigTabContent_Group6";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SettingsConfigTabContent_Group6 = _loc1_;
         BindingManager.executeBindings(this,"_SettingsConfigTabContent_Group6",this._SettingsConfigTabContent_Group6);
         return _loc1_;
      }
      
      private function _SettingsConfigTabContent_Text6_i() : Text
      {
         var _loc1_:Text = new Text();
         _loc1_.cachePolicy = "off";
         _loc1_.truncateToFit = false;
         _loc1_.selectable = false;
         _loc1_.mouseEnabled = false;
         _loc1_.verticalCenter = 0;
         _loc1_.left = 15;
         _loc1_.setStyle("fontAntiAliasType","advanced");
         _loc1_.setStyle("fontFamily","Tahoma");
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("fontSize",12);
         _loc1_.setStyle("textAlign","left");
         _loc1_.id = "localStorageOptText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.localStorageOptText = _loc1_;
         BindingManager.executeBindings(this,"localStorageOptText",this.localStorageOptText);
         return _loc1_;
      }
      
      private function _SettingsConfigTabContent_HGroup6_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.right = 0;
         _loc1_.gap = 40;
         _loc1_.mxmlContent = [this._SettingsConfigTabContent_RadioButton10_i(),this._SettingsConfigTabContent_RadioButton11_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _SettingsConfigTabContent_RadioButton10_i() : RadioButton
      {
         var _loc1_:RadioButton = new RadioButton();
         _loc1_.value = 1;
         _loc1_.setStyle("skinClass",RadioButtonNormalSkin);
         _loc1_.id = "localStorageONRadio";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.localStorageONRadio = _loc1_;
         BindingManager.executeBindings(this,"localStorageONRadio",this.localStorageONRadio);
         return _loc1_;
      }
      
      private function _SettingsConfigTabContent_RadioButton11_i() : RadioButton
      {
         var _loc1_:RadioButton = new RadioButton();
         _loc1_.value = 0;
         _loc1_.setStyle("skinClass",RadioButtonNormalSkin);
         _loc1_.id = "localStorageOFFRadio";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.localStorageOFFRadio = _loc1_;
         BindingManager.executeBindings(this,"localStorageOFFRadio",this.localStorageOFFRadio);
         return _loc1_;
      }
      
      private function _SettingsConfigTabContent_VGroup2_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.gap = 10;
         _loc1_.mxmlContent = [this._SettingsConfigTabContent_Text7_i(),this._SettingsConfigTabContent_BitmapImage2_i(),this._SettingsConfigTabContent_Text8_i(),this._SettingsConfigTabContent_HSlider1_i(),this._SettingsConfigTabContent_Text9_i(),this._SettingsConfigTabContent_BitmapImage3_i(),this._SettingsConfigTabContent_Group7_i(),this._SettingsConfigTabContent_Group8_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _SettingsConfigTabContent_Text7_i() : Text
      {
         var _loc1_:Text = new Text();
         _loc1_.cachePolicy = "off";
         _loc1_.truncateToFit = false;
         _loc1_.selectable = false;
         _loc1_.mouseEnabled = false;
         _loc1_.setStyle("fontAntiAliasType","advanced");
         _loc1_.setStyle("fontFamily","Tahoma");
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("fontSize",15);
         _loc1_.setStyle("textAlign","left");
         _loc1_.setStyle("paddingBottom",-7);
         _loc1_.id = "animationTitleText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.animationTitleText = _loc1_;
         BindingManager.executeBindings(this,"animationTitleText",this.animationTitleText);
         return _loc1_;
      }
      
      private function _SettingsConfigTabContent_BitmapImage2_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.height = 8;
         _loc1_.fillMode = "repeat";
         _loc1_.source = this._embed_mxml__general_Patterns_swf_HPatternLine_1769938539;
         _loc1_.initialized(this,"_SettingsConfigTabContent_BitmapImage2");
         this._SettingsConfigTabContent_BitmapImage2 = _loc1_;
         BindingManager.executeBindings(this,"_SettingsConfigTabContent_BitmapImage2",this._SettingsConfigTabContent_BitmapImage2);
         return _loc1_;
      }
      
      private function _SettingsConfigTabContent_Text8_i() : Text
      {
         var _loc1_:Text = new Text();
         _loc1_.cachePolicy = "off";
         _loc1_.truncateToFit = false;
         _loc1_.selectable = false;
         _loc1_.mouseEnabled = false;
         _loc1_.verticalCenter = 0;
         _loc1_.setStyle("fontAntiAliasType","advanced");
         _loc1_.setStyle("fontFamily","Tahoma");
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("fontSize",12);
         _loc1_.setStyle("textAlign","left");
         _loc1_.setStyle("paddingTop",8);
         _loc1_.setStyle("paddingBottom",5);
         _loc1_.setStyle("paddingLeft",15);
         _loc1_.id = "animationsOptText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.animationsOptText = _loc1_;
         BindingManager.executeBindings(this,"animationsOptText",this.animationsOptText);
         return _loc1_;
      }
      
      private function _SettingsConfigTabContent_HSlider1_i() : HSlider
      {
         var _loc1_:HSlider = new HSlider();
         _loc1_.snapInterval = 2.5;
         _loc1_.setStyle("liveDragging",false);
         _loc1_.setStyle("skinClass",HSilderAmmountSkin);
         _loc1_.id = "animationsSlider";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.animationsSlider = _loc1_;
         BindingManager.executeBindings(this,"animationsSlider",this.animationsSlider);
         return _loc1_;
      }
      
      private function _SettingsConfigTabContent_Text9_i() : Text
      {
         var _loc1_:Text = new Text();
         _loc1_.cachePolicy = "off";
         _loc1_.truncateToFit = false;
         _loc1_.selectable = false;
         _loc1_.mouseEnabled = false;
         _loc1_.setStyle("fontAntiAliasType","advanced");
         _loc1_.setStyle("fontFamily","Tahoma");
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("fontSize",15);
         _loc1_.setStyle("textAlign","left");
         _loc1_.setStyle("paddingBottom",-7);
         _loc1_.setStyle("paddingTop",14);
         _loc1_.id = "soundTitleText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.soundTitleText = _loc1_;
         BindingManager.executeBindings(this,"soundTitleText",this.soundTitleText);
         return _loc1_;
      }
      
      private function _SettingsConfigTabContent_BitmapImage3_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.height = 8;
         _loc1_.fillMode = "repeat";
         _loc1_.source = this._embed_mxml__general_Patterns_swf_HPatternLine_1769938539;
         _loc1_.initialized(this,"_SettingsConfigTabContent_BitmapImage3");
         this._SettingsConfigTabContent_BitmapImage3 = _loc1_;
         BindingManager.executeBindings(this,"_SettingsConfigTabContent_BitmapImage3",this._SettingsConfigTabContent_BitmapImage3);
         return _loc1_;
      }
      
      private function _SettingsConfigTabContent_Group7_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._SettingsConfigTabContent_Text10_i(),this._SettingsConfigTabContent_HGroup7_c()];
         _loc1_.id = "_SettingsConfigTabContent_Group7";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SettingsConfigTabContent_Group7 = _loc1_;
         BindingManager.executeBindings(this,"_SettingsConfigTabContent_Group7",this._SettingsConfigTabContent_Group7);
         return _loc1_;
      }
      
      private function _SettingsConfigTabContent_Text10_i() : Text
      {
         var _loc1_:Text = new Text();
         _loc1_.cachePolicy = "off";
         _loc1_.truncateToFit = false;
         _loc1_.selectable = false;
         _loc1_.mouseEnabled = false;
         _loc1_.verticalCenter = 0;
         _loc1_.left = 15;
         _loc1_.setStyle("fontAntiAliasType","advanced");
         _loc1_.setStyle("fontFamily","Tahoma");
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("fontSize",12);
         _loc1_.setStyle("textAlign","left");
         _loc1_.id = "soundEffectsOptText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.soundEffectsOptText = _loc1_;
         BindingManager.executeBindings(this,"soundEffectsOptText",this.soundEffectsOptText);
         return _loc1_;
      }
      
      private function _SettingsConfigTabContent_HGroup7_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.right = 0;
         _loc1_.gap = 40;
         _loc1_.mxmlContent = [this._SettingsConfigTabContent_RadioButton12_i(),this._SettingsConfigTabContent_RadioButton13_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _SettingsConfigTabContent_RadioButton12_i() : RadioButton
      {
         var _loc1_:RadioButton = new RadioButton();
         _loc1_.value = 1;
         _loc1_.setStyle("skinClass",RadioButtonNormalSkin);
         _loc1_.id = "soundEffectsONRadio";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.soundEffectsONRadio = _loc1_;
         BindingManager.executeBindings(this,"soundEffectsONRadio",this.soundEffectsONRadio);
         return _loc1_;
      }
      
      private function _SettingsConfigTabContent_RadioButton13_i() : RadioButton
      {
         var _loc1_:RadioButton = new RadioButton();
         _loc1_.value = 0;
         _loc1_.setStyle("skinClass",RadioButtonNormalSkin);
         _loc1_.id = "soundEffectsOFFRadio";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.soundEffectsOFFRadio = _loc1_;
         BindingManager.executeBindings(this,"soundEffectsOFFRadio",this.soundEffectsOFFRadio);
         return _loc1_;
      }
      
      private function _SettingsConfigTabContent_Group8_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._SettingsConfigTabContent_Text11_i(),this._SettingsConfigTabContent_HGroup8_c()];
         _loc1_.id = "_SettingsConfigTabContent_Group8";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SettingsConfigTabContent_Group8 = _loc1_;
         BindingManager.executeBindings(this,"_SettingsConfigTabContent_Group8",this._SettingsConfigTabContent_Group8);
         return _loc1_;
      }
      
      private function _SettingsConfigTabContent_Text11_i() : Text
      {
         var _loc1_:Text = new Text();
         _loc1_.cachePolicy = "off";
         _loc1_.truncateToFit = false;
         _loc1_.selectable = false;
         _loc1_.mouseEnabled = false;
         _loc1_.verticalCenter = 0;
         _loc1_.left = 15;
         _loc1_.setStyle("fontAntiAliasType","advanced");
         _loc1_.setStyle("fontFamily","Tahoma");
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("fontSize",12);
         _loc1_.setStyle("textAlign","left");
         _loc1_.id = "musicOptText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.musicOptText = _loc1_;
         BindingManager.executeBindings(this,"musicOptText",this.musicOptText);
         return _loc1_;
      }
      
      private function _SettingsConfigTabContent_HGroup8_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.right = 0;
         _loc1_.gap = 40;
         _loc1_.mxmlContent = [this._SettingsConfigTabContent_RadioButton14_i(),this._SettingsConfigTabContent_RadioButton15_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _SettingsConfigTabContent_RadioButton14_i() : RadioButton
      {
         var _loc1_:RadioButton = new RadioButton();
         _loc1_.value = 1;
         _loc1_.setStyle("skinClass",RadioButtonNormalSkin);
         _loc1_.id = "musicONRadio";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.musicONRadio = _loc1_;
         BindingManager.executeBindings(this,"musicONRadio",this.musicONRadio);
         return _loc1_;
      }
      
      private function _SettingsConfigTabContent_RadioButton15_i() : RadioButton
      {
         var _loc1_:RadioButton = new RadioButton();
         _loc1_.value = 0;
         _loc1_.setStyle("skinClass",RadioButtonNormalSkin);
         _loc1_.id = "musicOFFRadio";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.musicOFFRadio = _loc1_;
         BindingManager.executeBindings(this,"musicOFFRadio",this.musicOFFRadio);
         return _loc1_;
      }
      
      private function _SettingsConfigTabContent_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():uint
         {
            return Color.NORMAL_TXT_COLOR_DARKER;
         },function(param1:uint):void
         {
            graphicTitleText.setStyle("color",param1);
         },"graphicTitleText.color");
         result[1] = new Binding(this,function():Number
         {
            return WIDTH_BAR;
         },null,"_SettingsConfigTabContent_BitmapImage1.width");
         result[2] = new Binding(this,function():Number
         {
            return WIDTH_COLUMN;
         },null,"_SettingsConfigTabContent_Group2.width");
         result[3] = new Binding(this,function():uint
         {
            return Color.NORMAL_TXT_COLOR_DARKER;
         },function(param1:uint):void
         {
            qualityOptText.setStyle("color",param1);
         },"qualityOptText.color");
         result[4] = new Binding(this,null,null,"qualityLRadio.group","qualityRadioGroup");
         result[5] = new Binding(this,null,null,"qualityMRadio.group","qualityRadioGroup");
         result[6] = new Binding(this,null,null,"qualityHRadio.group","qualityRadioGroup");
         result[7] = new Binding(this,function():Number
         {
            return WIDTH_COLUMN;
         },null,"_SettingsConfigTabContent_Group3.width");
         result[8] = new Binding(this,function():uint
         {
            return Color.NORMAL_TXT_COLOR_DARKER;
         },function(param1:uint):void
         {
            tooltipOptText.setStyle("color",param1);
         },"tooltipOptText.color");
         result[9] = new Binding(this,null,null,"tooltipONRadio.group","tooltipRadioGroup");
         result[10] = new Binding(this,null,null,"tooltipOFFRadio.group","tooltipRadioGroup");
         result[11] = new Binding(this,function():Number
         {
            return WIDTH_COLUMN;
         },null,"_SettingsConfigTabContent_Group4.width");
         result[12] = new Binding(this,function():uint
         {
            return Color.NORMAL_TXT_COLOR_DARKER;
         },function(param1:uint):void
         {
            visitorsOptText.setStyle("color",param1);
         },"visitorsOptText.color");
         result[13] = new Binding(this,null,null,"visitorsONRadio.group","visitorsRadioGroup");
         result[14] = new Binding(this,null,null,"visitorsOFFRadio.group","visitorsRadioGroup");
         result[15] = new Binding(this,function():Number
         {
            return WIDTH_COLUMN;
         },null,"_SettingsConfigTabContent_Group5.width");
         result[16] = new Binding(this,function():uint
         {
            return Color.NORMAL_TXT_COLOR_DARKER;
         },function(param1:uint):void
         {
            wishesOptText.setStyle("color",param1);
         },"wishesOptText.color");
         result[17] = new Binding(this,null,null,"wishesONRadio.group","wishesRadioGroup");
         result[18] = new Binding(this,null,null,"wishesOFFRadio.group","wishesRadioGroup");
         result[19] = new Binding(this,function():Number
         {
            return WIDTH_COLUMN;
         },null,"_SettingsConfigTabContent_Group6.width");
         result[20] = new Binding(this,function():uint
         {
            return Color.NORMAL_TXT_COLOR_DARKER;
         },function(param1:uint):void
         {
            localStorageOptText.setStyle("color",param1);
         },"localStorageOptText.color");
         result[21] = new Binding(this,null,null,"localStorageONRadio.group","localStorageRadioGroup");
         result[22] = new Binding(this,null,null,"localStorageOFFRadio.group","localStorageRadioGroup");
         result[23] = new Binding(this,function():uint
         {
            return Color.NORMAL_TXT_COLOR_DARKER;
         },function(param1:uint):void
         {
            animationTitleText.setStyle("color",param1);
         },"animationTitleText.color");
         result[24] = new Binding(this,function():Number
         {
            return WIDTH_BAR;
         },null,"_SettingsConfigTabContent_BitmapImage2.width");
         result[25] = new Binding(this,function():uint
         {
            return Color.NORMAL_TXT_COLOR_DARKER;
         },function(param1:uint):void
         {
            animationsOptText.setStyle("color",param1);
         },"animationsOptText.color");
         result[26] = new Binding(this,function():uint
         {
            return Color.NORMAL_TXT_COLOR_DARKER;
         },function(param1:uint):void
         {
            soundTitleText.setStyle("color",param1);
         },"soundTitleText.color");
         result[27] = new Binding(this,function():Number
         {
            return WIDTH_BAR;
         },null,"_SettingsConfigTabContent_BitmapImage3.width");
         result[28] = new Binding(this,function():Number
         {
            return WIDTH_COLUMN;
         },null,"_SettingsConfigTabContent_Group7.width");
         result[29] = new Binding(this,function():uint
         {
            return Color.NORMAL_TXT_COLOR_DARKER;
         },function(param1:uint):void
         {
            soundEffectsOptText.setStyle("color",param1);
         },"soundEffectsOptText.color");
         result[30] = new Binding(this,null,null,"soundEffectsONRadio.group","soundEffectRadioGroup");
         result[31] = new Binding(this,null,null,"soundEffectsOFFRadio.group","soundEffectRadioGroup");
         result[32] = new Binding(this,function():Number
         {
            return WIDTH_COLUMN;
         },null,"_SettingsConfigTabContent_Group8.width");
         result[33] = new Binding(this,function():uint
         {
            return Color.NORMAL_TXT_COLOR_DARKER;
         },function(param1:uint):void
         {
            musicOptText.setStyle("color",param1);
         },"musicOptText.color");
         result[34] = new Binding(this,null,null,"musicONRadio.group","musicRadioGroup");
         result[35] = new Binding(this,null,null,"musicOFFRadio.group","musicRadioGroup");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get animationTitleText() : Text
      {
         return this._984000641animationTitleText;
      }
      
      public function set animationTitleText(param1:Text) : void
      {
         var _loc2_:Object = this._984000641animationTitleText;
         if(_loc2_ !== param1)
         {
            this._984000641animationTitleText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"animationTitleText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get animationsOptText() : Text
      {
         return this._712643055animationsOptText;
      }
      
      public function set animationsOptText(param1:Text) : void
      {
         var _loc2_:Object = this._712643055animationsOptText;
         if(_loc2_ !== param1)
         {
            this._712643055animationsOptText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"animationsOptText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get animationsSlider() : HSlider
      {
         return this._503163696animationsSlider;
      }
      
      public function set animationsSlider(param1:HSlider) : void
      {
         var _loc2_:Object = this._503163696animationsSlider;
         if(_loc2_ !== param1)
         {
            this._503163696animationsSlider = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"animationsSlider",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get graphicTitleText() : Text
      {
         return this._1447436701graphicTitleText;
      }
      
      public function set graphicTitleText(param1:Text) : void
      {
         var _loc2_:Object = this._1447436701graphicTitleText;
         if(_loc2_ !== param1)
         {
            this._1447436701graphicTitleText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"graphicTitleText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get localStorageOFFRadio() : RadioButton
      {
         return this._718256252localStorageOFFRadio;
      }
      
      public function set localStorageOFFRadio(param1:RadioButton) : void
      {
         var _loc2_:Object = this._718256252localStorageOFFRadio;
         if(_loc2_ !== param1)
         {
            this._718256252localStorageOFFRadio = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"localStorageOFFRadio",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get localStorageONRadio() : RadioButton
      {
         return this._1814475060localStorageONRadio;
      }
      
      public function set localStorageONRadio(param1:RadioButton) : void
      {
         var _loc2_:Object = this._1814475060localStorageONRadio;
         if(_loc2_ !== param1)
         {
            this._1814475060localStorageONRadio = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"localStorageONRadio",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get localStorageOptText() : Text
      {
         return this._810070064localStorageOptText;
      }
      
      public function set localStorageOptText(param1:Text) : void
      {
         var _loc2_:Object = this._810070064localStorageOptText;
         if(_loc2_ !== param1)
         {
            this._810070064localStorageOptText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"localStorageOptText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get localStorageRadioGroup() : RadioButtonGroup
      {
         return this._960068596localStorageRadioGroup;
      }
      
      public function set localStorageRadioGroup(param1:RadioButtonGroup) : void
      {
         var _loc2_:Object = this._960068596localStorageRadioGroup;
         if(_loc2_ !== param1)
         {
            this._960068596localStorageRadioGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"localStorageRadioGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get musicOFFRadio() : RadioButton
      {
         return this._2128766225musicOFFRadio;
      }
      
      public function set musicOFFRadio(param1:RadioButton) : void
      {
         var _loc2_:Object = this._2128766225musicOFFRadio;
         if(_loc2_ !== param1)
         {
            this._2128766225musicOFFRadio = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"musicOFFRadio",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get musicONRadio() : RadioButton
      {
         return this._383501417musicONRadio;
      }
      
      public function set musicONRadio(param1:RadioButton) : void
      {
         var _loc2_:Object = this._383501417musicONRadio;
         if(_loc2_ !== param1)
         {
            this._383501417musicONRadio = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"musicONRadio",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get musicOptText() : Text
      {
         return this._620903579musicOptText;
      }
      
      public function set musicOptText(param1:Text) : void
      {
         var _loc2_:Object = this._620903579musicOptText;
         if(_loc2_ !== param1)
         {
            this._620903579musicOptText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"musicOptText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get musicRadioGroup() : RadioButtonGroup
      {
         return this._749512887musicRadioGroup;
      }
      
      public function set musicRadioGroup(param1:RadioButtonGroup) : void
      {
         var _loc2_:Object = this._749512887musicRadioGroup;
         if(_loc2_ !== param1)
         {
            this._749512887musicRadioGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"musicRadioGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get qualityHRadio() : RadioButton
      {
         return this._1474046382qualityHRadio;
      }
      
      public function set qualityHRadio(param1:RadioButton) : void
      {
         var _loc2_:Object = this._1474046382qualityHRadio;
         if(_loc2_ !== param1)
         {
            this._1474046382qualityHRadio = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"qualityHRadio",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get qualityLRadio() : RadioButton
      {
         return this._1359529778qualityLRadio;
      }
      
      public function set qualityLRadio(param1:RadioButton) : void
      {
         var _loc2_:Object = this._1359529778qualityLRadio;
         if(_loc2_ !== param1)
         {
            this._1359529778qualityLRadio = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"qualityLRadio",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get qualityMRadio() : RadioButton
      {
         return this._1330900627qualityMRadio;
      }
      
      public function set qualityMRadio(param1:RadioButton) : void
      {
         var _loc2_:Object = this._1330900627qualityMRadio;
         if(_loc2_ !== param1)
         {
            this._1330900627qualityMRadio = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"qualityMRadio",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get qualityOptText() : Text
      {
         return this._47734913qualityOptText;
      }
      
      public function set qualityOptText(param1:Text) : void
      {
         var _loc2_:Object = this._47734913qualityOptText;
         if(_loc2_ !== param1)
         {
            this._47734913qualityOptText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"qualityOptText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get qualityRadioGroup() : RadioButtonGroup
      {
         return this._772727203qualityRadioGroup;
      }
      
      public function set qualityRadioGroup(param1:RadioButtonGroup) : void
      {
         var _loc2_:Object = this._772727203qualityRadioGroup;
         if(_loc2_ !== param1)
         {
            this._772727203qualityRadioGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"qualityRadioGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get soundEffectRadioGroup() : RadioButtonGroup
      {
         return this._1471423772soundEffectRadioGroup;
      }
      
      public function set soundEffectRadioGroup(param1:RadioButtonGroup) : void
      {
         var _loc2_:Object = this._1471423772soundEffectRadioGroup;
         if(_loc2_ !== param1)
         {
            this._1471423772soundEffectRadioGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"soundEffectRadioGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get soundEffectsOFFRadio() : RadioButton
      {
         return this._17863135soundEffectsOFFRadio;
      }
      
      public function set soundEffectsOFFRadio(param1:RadioButton) : void
      {
         var _loc2_:Object = this._17863135soundEffectsOFFRadio;
         if(_loc2_ !== param1)
         {
            this._17863135soundEffectsOFFRadio = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"soundEffectsOFFRadio",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get soundEffectsONRadio() : RadioButton
      {
         return this._1765162249soundEffectsONRadio;
      }
      
      public function set soundEffectsONRadio(param1:RadioButton) : void
      {
         var _loc2_:Object = this._1765162249soundEffectsONRadio;
         if(_loc2_ !== param1)
         {
            this._1765162249soundEffectsONRadio = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"soundEffectsONRadio",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get soundEffectsOptText() : Text
      {
         return this._1525400051soundEffectsOptText;
      }
      
      public function set soundEffectsOptText(param1:Text) : void
      {
         var _loc2_:Object = this._1525400051soundEffectsOptText;
         if(_loc2_ !== param1)
         {
            this._1525400051soundEffectsOptText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"soundEffectsOptText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get soundTitleText() : Text
      {
         return this._994310314soundTitleText;
      }
      
      public function set soundTitleText(param1:Text) : void
      {
         var _loc2_:Object = this._994310314soundTitleText;
         if(_loc2_ !== param1)
         {
            this._994310314soundTitleText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"soundTitleText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get tooltipOFFRadio() : RadioButton
      {
         return this._643921681tooltipOFFRadio;
      }
      
      public function set tooltipOFFRadio(param1:RadioButton) : void
      {
         var _loc2_:Object = this._643921681tooltipOFFRadio;
         if(_loc2_ !== param1)
         {
            this._643921681tooltipOFFRadio = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tooltipOFFRadio",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get tooltipONRadio() : RadioButton
      {
         return this._1165679623tooltipONRadio;
      }
      
      public function set tooltipONRadio(param1:RadioButton) : void
      {
         var _loc2_:Object = this._1165679623tooltipONRadio;
         if(_loc2_ !== param1)
         {
            this._1165679623tooltipONRadio = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tooltipONRadio",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get tooltipOptText() : Text
      {
         return this._161274627tooltipOptText;
      }
      
      public function set tooltipOptText(param1:Text) : void
      {
         var _loc2_:Object = this._161274627tooltipOptText;
         if(_loc2_ !== param1)
         {
            this._161274627tooltipOptText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tooltipOptText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get tooltipRadioGroup() : RadioButtonGroup
      {
         return this._1872100263tooltipRadioGroup;
      }
      
      public function set tooltipRadioGroup(param1:RadioButtonGroup) : void
      {
         var _loc2_:Object = this._1872100263tooltipRadioGroup;
         if(_loc2_ !== param1)
         {
            this._1872100263tooltipRadioGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tooltipRadioGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get visitorsOFFRadio() : RadioButton
      {
         return this._1890963279visitorsOFFRadio;
      }
      
      public function set visitorsOFFRadio(param1:RadioButton) : void
      {
         var _loc2_:Object = this._1890963279visitorsOFFRadio;
         if(_loc2_ !== param1)
         {
            this._1890963279visitorsOFFRadio = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"visitorsOFFRadio",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get visitorsONRadio() : RadioButton
      {
         return this._1287945207visitorsONRadio;
      }
      
      public function set visitorsONRadio(param1:RadioButton) : void
      {
         var _loc2_:Object = this._1287945207visitorsONRadio;
         if(_loc2_ !== param1)
         {
            this._1287945207visitorsONRadio = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"visitorsONRadio",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get visitorsOptText() : Text
      {
         return this._2002617093visitorsOptText;
      }
      
      public function set visitorsOptText(param1:Text) : void
      {
         var _loc2_:Object = this._2002617093visitorsOptText;
         if(_loc2_ !== param1)
         {
            this._2002617093visitorsOptText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"visitorsOptText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get visitorsRadioGroup() : RadioButtonGroup
      {
         return this._1761000169visitorsRadioGroup;
      }
      
      public function set visitorsRadioGroup(param1:RadioButtonGroup) : void
      {
         var _loc2_:Object = this._1761000169visitorsRadioGroup;
         if(_loc2_ !== param1)
         {
            this._1761000169visitorsRadioGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"visitorsRadioGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get wishesOFFRadio() : RadioButton
      {
         return this._1059506559wishesOFFRadio;
      }
      
      public function set wishesOFFRadio(param1:RadioButton) : void
      {
         var _loc2_:Object = this._1059506559wishesOFFRadio;
         if(_loc2_ !== param1)
         {
            this._1059506559wishesOFFRadio = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"wishesOFFRadio",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get wishesONRadio() : RadioButton
      {
         return this._760577063wishesONRadio;
      }
      
      public function set wishesONRadio(param1:RadioButton) : void
      {
         var _loc2_:Object = this._760577063wishesONRadio;
         if(_loc2_ !== param1)
         {
            this._760577063wishesONRadio = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"wishesONRadio",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get wishesOptText() : Text
      {
         return this._1764982059wishesOptText;
      }
      
      public function set wishesOptText(param1:Text) : void
      {
         var _loc2_:Object = this._1764982059wishesOptText;
         if(_loc2_ !== param1)
         {
            this._1764982059wishesOptText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"wishesOptText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get wishesRadioGroup() : RadioButtonGroup
      {
         return this._1926991033wishesRadioGroup;
      }
      
      public function set wishesRadioGroup(param1:RadioButtonGroup) : void
      {
         var _loc2_:Object = this._1926991033wishesRadioGroup;
         if(_loc2_ !== param1)
         {
            this._1926991033wishesRadioGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"wishesRadioGroup",_loc2_,param1));
            }
         }
      }
   }
}

