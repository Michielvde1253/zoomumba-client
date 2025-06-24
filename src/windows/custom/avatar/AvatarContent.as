package windows.custom.avatar
{
   import buttons.skin.sign.ButtonArrowSkin;
   import components.radioButton.RadioButtonSexFemaleSkin;
   import components.radioButton.RadioButtonSexMaleSkin;
   import components.textfield.StandardText;
   import components.textfield.gradientText.GradientText;
   import custom.features.avatar.AvatarOption;
   import custom.features.avatar.RadioButtonAvatarCatSkin;
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
   import general.paginator.Paginator;
   import mx.binding.*;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.graphics.SolidColor;
   import mx.styles.*;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.RadioButton;
   import spark.components.RadioButtonGroup;
   import spark.core.SpriteVisualElement;
   import spark.layouts.TileLayout;
   import spark.primitives.BitmapImage;
   import spark.primitives.Rect;
   import windows.core.InnerGroup;
   
   use namespace mx_internal;
   
   public class AvatarContent extends Group implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      public var _AvatarContent_RadioButton7:RadioButton;
      
      public var _AvatarContent_RadioButton8:RadioButton;
      
      private var _205980803btnLeft:Button;
      
      private var _2096098592btnRight:Button;
      
      private var _1016012555catRadio0:RadioButton;
      
      private var _1016012556catRadio1:RadioButton;
      
      private var _1016012557catRadio2:RadioButton;
      
      private var _1016012558catRadio3:RadioButton;
      
      private var _1016012559catRadio4:RadioButton;
      
      private var _1016012560catRadio5:RadioButton;
      
      private var _506334423groupCat:RadioButtonGroup;
      
      private var _506349927groupSex:RadioButtonGroup;
      
      private var _1102672931lineH1:BitmapImage;
      
      private var _1102672930lineH2:BitmapImage;
      
      private var _1102672929lineH3:BitmapImage;
      
      private var _1102672497lineV1:BitmapImage;
      
      private var _1102672496lineV2:BitmapImage;
      
      private var _1249474914options:Group;
      
      private var _1011692561paginator:Paginator;
      
      private var _1065137588sprContainer:SpriteVisualElement;
      
      private var _878845122txtInfo:StandardText;
      
      private var _486912902txtUserName:GradientText;
      
      private var _782182478woodBG:BitmapImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _1367605390cardBd:BitmapData;
      
      private var _embed_mxml__general_Patterns_swf_TileBG2_1819943852:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function AvatarContent()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__general_Patterns_swf_TileBG2_1819943852 = AvatarContent__embed_mxml__general_Patterns_swf_TileBG2_1819943852;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._AvatarContent_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_windows_custom_avatar_AvatarContentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return AvatarContent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._AvatarContent_InnerGroup1_c()];
         this._AvatarContent_RadioButtonGroup2_i();
         this._AvatarContent_RadioButtonGroup1_i();
         this._AvatarContent_Paginator1_i();
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         AvatarContent._watcherSetupUtil = param1;
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
      
      public function clearOptions() : void
      {
         this.options.removeAllElements();
      }
      
      public function checkOption(param1:AvatarOption) : int
      {
         var _loc2_:int = this.options.numElements - 1;
         while(_loc2_ >= 0)
         {
            (this.options.getElementAt(_loc2_) as AvatarOption).currentState = "default";
            _loc2_--;
         }
         param1.currentState = "selected";
         return param1.value;
      }
      
      public function addOption(param1:int, param2:Sprite, param3:String = "default") : void
      {
         var _loc4_:AvatarOption = new AvatarOption();
         _loc4_.spriteContainer.addChild(param2);
         _loc4_.value = param1;
         _loc4_.cardBd = this.cardBd;
         _loc4_.currentState = param3;
         this.options.addElement(_loc4_);
      }
      
      private function _AvatarContent_RadioButtonGroup2_i() : RadioButtonGroup
      {
         var _loc1_:RadioButtonGroup = new RadioButtonGroup();
         _loc1_.initialized(this,"groupCat");
         this.groupCat = _loc1_;
         BindingManager.executeBindings(this,"groupCat",this.groupCat);
         return _loc1_;
      }
      
      private function _AvatarContent_RadioButtonGroup1_i() : RadioButtonGroup
      {
         var _loc1_:RadioButtonGroup = new RadioButtonGroup();
         _loc1_.initialized(this,"groupSex");
         this.groupSex = _loc1_;
         BindingManager.executeBindings(this,"groupSex",this.groupSex);
         return _loc1_;
      }
      
      private function _AvatarContent_Paginator1_i() : Paginator
      {
         var _loc1_:Paginator = new Paginator();
         _loc1_.entriesPerPage = 6;
         this.paginator = _loc1_;
         BindingManager.executeBindings(this,"paginator",this.paginator);
         return _loc1_;
      }
      
      private function _AvatarContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._AvatarContent_Group2_c(),this._AvatarContent_Group3_c(),this._AvatarContent_BitmapImage6_i(),this._AvatarContent_HGroup2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AvatarContent_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 100;
         _loc1_.y = 150;
         _loc1_.width = 185;
         _loc1_.height = 275;
         _loc1_.mxmlContent = [this._AvatarContent_Rect1_c(),this._AvatarContent_BitmapImage1_i(),this._AvatarContent_BitmapImage2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AvatarContent_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._AvatarContent_SolidColor1_c();
         _loc1_.initialized(this,null);
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AvatarContent_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 9778689;
         _loc1_.alpha = 0.5;
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AvatarContent_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.width = 275;
         _loc1_.rotation = 90;
         _loc1_.left = 0;
         _loc1_.initialized(this,"lineV1");
         this.lineV1 = _loc1_;
         BindingManager.executeBindings(this,"lineV1",this.lineV1);
         return _loc1_;
      }
      
      private function _AvatarContent_BitmapImage2_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.width = 275;
         _loc1_.rotation = 90;
         _loc1_.right = 0;
         _loc1_.initialized(this,"lineV2");
         this.lineV2 = _loc1_;
         BindingManager.executeBindings(this,"lineV2",this.lineV2);
         return _loc1_;
      }
      
      private function _AvatarContent_Group3_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 50;
         _loc1_.y = 100;
         _loc1_.height = 55;
         _loc1_.mxmlContent = [this._AvatarContent_BitmapImage3_i(),this._AvatarContent_BitmapImage4_i(),this._AvatarContent_BitmapImage5_i(),this._AvatarContent_HGroup1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AvatarContent_BitmapImage3_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.verticalCenter = 0;
         _loc1_.width = 620;
         _loc1_.height = 55;
         _loc1_.fillMode = "repeat";
         _loc1_.source = this._embed_mxml__general_Patterns_swf_TileBG2_1819943852;
         _loc1_.initialized(this,"woodBG");
         this.woodBG = _loc1_;
         BindingManager.executeBindings(this,"woodBG",this.woodBG);
         return _loc1_;
      }
      
      private function _AvatarContent_BitmapImage4_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.top = 0;
         _loc1_.initialized(this,"lineH1");
         this.lineH1 = _loc1_;
         BindingManager.executeBindings(this,"lineH1",this.lineH1);
         return _loc1_;
      }
      
      private function _AvatarContent_BitmapImage5_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.bottom = 0;
         _loc1_.initialized(this,"lineH2");
         this.lineH2 = _loc1_;
         BindingManager.executeBindings(this,"lineH2",this.lineH2);
         return _loc1_;
      }
      
      private function _AvatarContent_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalCenter = -6;
         _loc1_.right = 80;
         _loc1_.gap = 15;
         _loc1_.mxmlContent = [this._AvatarContent_RadioButton1_i(),this._AvatarContent_RadioButton2_i(),this._AvatarContent_RadioButton3_i(),this._AvatarContent_RadioButton4_i(),this._AvatarContent_RadioButton5_i(),this._AvatarContent_RadioButton6_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AvatarContent_RadioButton1_i() : RadioButton
      {
         var _loc1_:RadioButton = new RadioButton();
         _loc1_.value = "fa";
         _loc1_.styleName = "maskCombined";
         _loc1_.setStyle("skinClass",RadioButtonAvatarCatSkin);
         _loc1_.id = "catRadio0";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.catRadio0 = _loc1_;
         BindingManager.executeBindings(this,"catRadio0",this.catRadio0);
         return _loc1_;
      }
      
      private function _AvatarContent_RadioButton2_i() : RadioButton
      {
         var _loc1_:RadioButton = new RadioButton();
         _loc1_.value = "ey";
         _loc1_.styleName = "maskCombined";
         _loc1_.setStyle("skinClass",RadioButtonAvatarCatSkin);
         _loc1_.id = "catRadio1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.catRadio1 = _loc1_;
         BindingManager.executeBindings(this,"catRadio1",this.catRadio1);
         return _loc1_;
      }
      
      private function _AvatarContent_RadioButton3_i() : RadioButton
      {
         var _loc1_:RadioButton = new RadioButton();
         _loc1_.value = "mo";
         _loc1_.styleName = "maskCombined";
         _loc1_.setStyle("skinClass",RadioButtonAvatarCatSkin);
         _loc1_.id = "catRadio2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.catRadio2 = _loc1_;
         BindingManager.executeBindings(this,"catRadio2",this.catRadio2);
         return _loc1_;
      }
      
      private function _AvatarContent_RadioButton4_i() : RadioButton
      {
         var _loc1_:RadioButton = new RadioButton();
         _loc1_.value = "ha";
         _loc1_.styleName = "maskCombined";
         _loc1_.setStyle("skinClass",RadioButtonAvatarCatSkin);
         _loc1_.id = "catRadio3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.catRadio3 = _loc1_;
         BindingManager.executeBindings(this,"catRadio3",this.catRadio3);
         return _loc1_;
      }
      
      private function _AvatarContent_RadioButton5_i() : RadioButton
      {
         var _loc1_:RadioButton = new RadioButton();
         _loc1_.value = "ht";
         _loc1_.styleName = "maskCombined";
         _loc1_.setStyle("skinClass",RadioButtonAvatarCatSkin);
         _loc1_.id = "catRadio4";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.catRadio4 = _loc1_;
         BindingManager.executeBindings(this,"catRadio4",this.catRadio4);
         return _loc1_;
      }
      
      private function _AvatarContent_RadioButton6_i() : RadioButton
      {
         var _loc1_:RadioButton = new RadioButton();
         _loc1_.value = "cl";
         _loc1_.styleName = "normal";
         _loc1_.setStyle("skinClass",RadioButtonAvatarCatSkin);
         _loc1_.id = "catRadio5";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.catRadio5 = _loc1_;
         BindingManager.executeBindings(this,"catRadio5",this.catRadio5);
         return _loc1_;
      }
      
      private function _AvatarContent_BitmapImage6_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.x = 50;
         _loc1_.y = 423;
         _loc1_.initialized(this,"lineH3");
         this.lineH3 = _loc1_;
         BindingManager.executeBindings(this,"lineH3",this.lineH3);
         return _loc1_;
      }
      
      private function _AvatarContent_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.x = 100;
         _loc1_.y = 155;
         _loc1_.mxmlContent = [this._AvatarContent_Group4_c(),this._AvatarContent_Group5_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AvatarContent_Group4_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 185;
         _loc1_.height = 275;
         _loc1_.mxmlContent = [this._AvatarContent_GradientText1_i(),this._AvatarContent_SpriteVisualElement1_i(),this._AvatarContent_HGroup3_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AvatarContent_GradientText1_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.top = 20;
         _loc1_.horizontalCenter = 0;
         _loc1_.id = "txtUserName";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.txtUserName = _loc1_;
         BindingManager.executeBindings(this,"txtUserName",this.txtUserName);
         return _loc1_;
      }
      
      private function _AvatarContent_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.verticalCenter = 10;
         _loc1_.horizontalCenter = 0;
         _loc1_.initialized(this,"sprContainer");
         this.sprContainer = _loc1_;
         BindingManager.executeBindings(this,"sprContainer",this.sprContainer);
         return _loc1_;
      }
      
      private function _AvatarContent_HGroup3_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.horizontalCenter = 0;
         _loc1_.bottom = -20;
         _loc1_.gap = -5;
         _loc1_.mxmlContent = [this._AvatarContent_RadioButton7_i(),this._AvatarContent_RadioButton8_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AvatarContent_RadioButton7_i() : RadioButton
      {
         var _loc1_:RadioButton = new RadioButton();
         _loc1_.value = "f";
         _loc1_.scaleX = 1.5;
         _loc1_.scaleY = 1.5;
         _loc1_.setStyle("skinClass",RadioButtonSexFemaleSkin);
         _loc1_.id = "_AvatarContent_RadioButton7";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._AvatarContent_RadioButton7 = _loc1_;
         BindingManager.executeBindings(this,"_AvatarContent_RadioButton7",this._AvatarContent_RadioButton7);
         return _loc1_;
      }
      
      private function _AvatarContent_RadioButton8_i() : RadioButton
      {
         var _loc1_:RadioButton = new RadioButton();
         _loc1_.value = "m";
         _loc1_.scaleX = 1.5;
         _loc1_.scaleY = 1.5;
         _loc1_.setStyle("skinClass",RadioButtonSexMaleSkin);
         _loc1_.id = "_AvatarContent_RadioButton8";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._AvatarContent_RadioButton8 = _loc1_;
         BindingManager.executeBindings(this,"_AvatarContent_RadioButton8",this._AvatarContent_RadioButton8);
         return _loc1_;
      }
      
      private function _AvatarContent_Group5_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 370;
         _loc1_.height = 275;
         _loc1_.mxmlContent = [this._AvatarContent_StandardText1_i(),this._AvatarContent_HGroup4_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AvatarContent_StandardText1_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.top = 20;
         _loc1_.horizontalCenter = 0;
         _loc1_.width = 300;
         _loc1_.id = "txtInfo";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.txtInfo = _loc1_;
         BindingManager.executeBindings(this,"txtInfo",this.txtInfo);
         return _loc1_;
      }
      
      private function _AvatarContent_HGroup4_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.top = 100;
         _loc1_.height = 160;
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._AvatarContent_Button1_i(),this._AvatarContent_Group6_i(),this._AvatarContent_Button2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AvatarContent_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.scaleX = -0.6;
         _loc1_.scaleY = 0.6;
         _loc1_.setStyle("skinClass",ButtonArrowSkin);
         _loc1_.id = "btnLeft";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnLeft = _loc1_;
         BindingManager.executeBindings(this,"btnLeft",this.btnLeft);
         return _loc1_;
      }
      
      private function _AvatarContent_Group6_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.layout = this._AvatarContent_TileLayout1_c();
         _loc1_.id = "options";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.options = _loc1_;
         BindingManager.executeBindings(this,"options",this.options);
         return _loc1_;
      }
      
      private function _AvatarContent_TileLayout1_c() : TileLayout
      {
         var _loc1_:TileLayout = new TileLayout();
         _loc1_.requestedColumnCount = 3;
         _loc1_.orientation = "rows";
         _loc1_.columnWidth = 72;
         _loc1_.horizontalGap = 5;
         _loc1_.verticalGap = 0;
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AvatarContent_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.scaleX = 0.6;
         _loc1_.scaleY = 0.6;
         _loc1_.setStyle("skinClass",ButtonArrowSkin);
         _loc1_.id = "btnRight";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnRight = _loc1_;
         BindingManager.executeBindings(this,"btnRight",this.btnRight);
         return _loc1_;
      }
      
      private function _AvatarContent_bindingsSetup() : Array
      {
         var _loc1_:Array = [];
         _loc1_[0] = new Binding(this,null,null,"paginator.prevButton","btnLeft");
         _loc1_[1] = new Binding(this,null,null,"paginator.nextButton","btnRight");
         _loc1_[2] = new Binding(this,null,null,"catRadio0.group","groupCat");
         _loc1_[3] = new Binding(this,null,null,"catRadio1.group","groupCat");
         _loc1_[4] = new Binding(this,null,null,"catRadio2.group","groupCat");
         _loc1_[5] = new Binding(this,null,null,"catRadio3.group","groupCat");
         _loc1_[6] = new Binding(this,null,null,"catRadio4.group","groupCat");
         _loc1_[7] = new Binding(this,null,null,"catRadio5.group","groupCat");
         _loc1_[8] = new Binding(this,null,null,"_AvatarContent_RadioButton7.group","groupSex");
         _loc1_[9] = new Binding(this,null,null,"_AvatarContent_RadioButton8.group","groupSex");
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnLeft() : Button
      {
         return this._205980803btnLeft;
      }
      
      public function set btnLeft(param1:Button) : void
      {
         var _loc2_:Object = this._205980803btnLeft;
         if(_loc2_ !== param1)
         {
            this._205980803btnLeft = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnLeft",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnRight() : Button
      {
         return this._2096098592btnRight;
      }
      
      public function set btnRight(param1:Button) : void
      {
         var _loc2_:Object = this._2096098592btnRight;
         if(_loc2_ !== param1)
         {
            this._2096098592btnRight = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnRight",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get catRadio0() : RadioButton
      {
         return this._1016012555catRadio0;
      }
      
      public function set catRadio0(param1:RadioButton) : void
      {
         var _loc2_:Object = this._1016012555catRadio0;
         if(_loc2_ !== param1)
         {
            this._1016012555catRadio0 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"catRadio0",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get catRadio1() : RadioButton
      {
         return this._1016012556catRadio1;
      }
      
      public function set catRadio1(param1:RadioButton) : void
      {
         var _loc2_:Object = this._1016012556catRadio1;
         if(_loc2_ !== param1)
         {
            this._1016012556catRadio1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"catRadio1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get catRadio2() : RadioButton
      {
         return this._1016012557catRadio2;
      }
      
      public function set catRadio2(param1:RadioButton) : void
      {
         var _loc2_:Object = this._1016012557catRadio2;
         if(_loc2_ !== param1)
         {
            this._1016012557catRadio2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"catRadio2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get catRadio3() : RadioButton
      {
         return this._1016012558catRadio3;
      }
      
      public function set catRadio3(param1:RadioButton) : void
      {
         var _loc2_:Object = this._1016012558catRadio3;
         if(_loc2_ !== param1)
         {
            this._1016012558catRadio3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"catRadio3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get catRadio4() : RadioButton
      {
         return this._1016012559catRadio4;
      }
      
      public function set catRadio4(param1:RadioButton) : void
      {
         var _loc2_:Object = this._1016012559catRadio4;
         if(_loc2_ !== param1)
         {
            this._1016012559catRadio4 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"catRadio4",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get catRadio5() : RadioButton
      {
         return this._1016012560catRadio5;
      }
      
      public function set catRadio5(param1:RadioButton) : void
      {
         var _loc2_:Object = this._1016012560catRadio5;
         if(_loc2_ !== param1)
         {
            this._1016012560catRadio5 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"catRadio5",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get groupCat() : RadioButtonGroup
      {
         return this._506334423groupCat;
      }
      
      public function set groupCat(param1:RadioButtonGroup) : void
      {
         var _loc2_:Object = this._506334423groupCat;
         if(_loc2_ !== param1)
         {
            this._506334423groupCat = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"groupCat",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get groupSex() : RadioButtonGroup
      {
         return this._506349927groupSex;
      }
      
      public function set groupSex(param1:RadioButtonGroup) : void
      {
         var _loc2_:Object = this._506349927groupSex;
         if(_loc2_ !== param1)
         {
            this._506349927groupSex = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"groupSex",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lineH1() : BitmapImage
      {
         return this._1102672931lineH1;
      }
      
      public function set lineH1(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1102672931lineH1;
         if(_loc2_ !== param1)
         {
            this._1102672931lineH1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lineH1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lineH2() : BitmapImage
      {
         return this._1102672930lineH2;
      }
      
      public function set lineH2(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1102672930lineH2;
         if(_loc2_ !== param1)
         {
            this._1102672930lineH2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lineH2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lineH3() : BitmapImage
      {
         return this._1102672929lineH3;
      }
      
      public function set lineH3(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1102672929lineH3;
         if(_loc2_ !== param1)
         {
            this._1102672929lineH3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lineH3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lineV1() : BitmapImage
      {
         return this._1102672497lineV1;
      }
      
      public function set lineV1(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1102672497lineV1;
         if(_loc2_ !== param1)
         {
            this._1102672497lineV1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lineV1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lineV2() : BitmapImage
      {
         return this._1102672496lineV2;
      }
      
      public function set lineV2(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1102672496lineV2;
         if(_loc2_ !== param1)
         {
            this._1102672496lineV2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lineV2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get options() : Group
      {
         return this._1249474914options;
      }
      
      public function set options(param1:Group) : void
      {
         var _loc2_:Object = this._1249474914options;
         if(_loc2_ !== param1)
         {
            this._1249474914options = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"options",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get paginator() : Paginator
      {
         return this._1011692561paginator;
      }
      
      public function set paginator(param1:Paginator) : void
      {
         var _loc2_:Object = this._1011692561paginator;
         if(_loc2_ !== param1)
         {
            this._1011692561paginator = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"paginator",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sprContainer() : SpriteVisualElement
      {
         return this._1065137588sprContainer;
      }
      
      public function set sprContainer(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._1065137588sprContainer;
         if(_loc2_ !== param1)
         {
            this._1065137588sprContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sprContainer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get txtInfo() : StandardText
      {
         return this._878845122txtInfo;
      }
      
      public function set txtInfo(param1:StandardText) : void
      {
         var _loc2_:Object = this._878845122txtInfo;
         if(_loc2_ !== param1)
         {
            this._878845122txtInfo = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"txtInfo",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get txtUserName() : GradientText
      {
         return this._486912902txtUserName;
      }
      
      public function set txtUserName(param1:GradientText) : void
      {
         var _loc2_:Object = this._486912902txtUserName;
         if(_loc2_ !== param1)
         {
            this._486912902txtUserName = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"txtUserName",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get woodBG() : BitmapImage
      {
         return this._782182478woodBG;
      }
      
      public function set woodBG(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._782182478woodBG;
         if(_loc2_ !== param1)
         {
            this._782182478woodBG = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"woodBG",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get cardBd() : BitmapData
      {
         return this._1367605390cardBd;
      }
      
      public function set cardBd(param1:BitmapData) : void
      {
         var _loc2_:Object = this._1367605390cardBd;
         if(_loc2_ !== param1)
         {
            this._1367605390cardBd = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cardBd",_loc2_,param1));
            }
         }
      }
   }
}

