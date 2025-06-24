package windows.custom.mail.tabs
{
   import buttons.skin.fluid.ButtonFluidGradientNormalSkin;
   import components.textfield.gradientText.GradientText;
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
   import mx.core.ClassFactory;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.graphics.SolidColor;
   import mx.styles.*;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.List;
   import spark.primitives.BitmapImage;
   import spark.primitives.Rect;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   
   use namespace mx_internal;
   
   public class MailIOBoxTabContent extends Group implements IBindingClient
   {
      public static var _1723800326addBitmapData:BitmapData;
      
      public static var _329331684delBitmapData:BitmapData;
      
      public static var _1918786038repBitmapData:BitmapData;
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      public static var _768126978addToolTip:String = "";
      
      public static var _571287208delToolTip:String = "";
      
      public static var _646202234repToolTip:String = "";
      
      private static var _staticBindingEventDispatcher:EventDispatcher = new EventDispatcher();
      
      public var _MailIOBoxTabContent_Rect1:Rect;
      
      public var _MailIOBoxTabContent_Rect2:Rect;
      
      public var _MailIOBoxTabContent_Rect3:Rect;
      
      public var _MailIOBoxTabContent_Rect4:Rect;
      
      private var _1851862147actionText:GradientText;
      
      private var _3141bg:SolidColor;
      
      private var _205678947btnBack:Button;
      
      private var _2085027252btnFirst:Button;
      
      private var _205977362btnLast:Button;
      
      private var _206040943btnNext:Button;
      
      private var _686047489col2Text:GradientText;
      
      private var _1792745979dateText:GradientText;
      
      private var _291002278mailsList:List;
      
      private var _901392145pagesText:GradientText;
      
      private var _1011692561paginator:Paginator;
      
      private var _603219847subjectText:GradientText;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__general_Decorations_swf_WoodLath_894941931:Class;
      
      private var _embed_mxml__general_Patterns_swf_TileBG2_1819943852:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function MailIOBoxTabContent()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__general_Decorations_swf_WoodLath_894941931 = MailIOBoxTabContent__embed_mxml__general_Decorations_swf_WoodLath_894941931;
         this._embed_mxml__general_Patterns_swf_TileBG2_1819943852 = MailIOBoxTabContent__embed_mxml__general_Patterns_swf_TileBG2_1819943852;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._MailIOBoxTabContent_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_windows_custom_mail_tabs_MailIOBoxTabContentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return MailIOBoxTabContent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._MailIOBoxTabContent_InnerGroup1_c(),this._MailIOBoxTabContent_OuterGroup1_c()];
         this._MailIOBoxTabContent_SolidColor1_i();
         this._MailIOBoxTabContent_Paginator1_i();
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         MailIOBoxTabContent._watcherSetupUtil = param1;
      }
      
      [Bindable(event="propertyChange")]
      public static function get addBitmapData() : BitmapData
      {
         return MailIOBoxTabContent._1723800326addBitmapData;
      }
      
      public static function set addBitmapData(param1:BitmapData) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = MailIOBoxTabContent._1723800326addBitmapData;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(MailIOBoxTabContent,"addBitmapData",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get delBitmapData() : BitmapData
      {
         return MailIOBoxTabContent._329331684delBitmapData;
      }
      
      public static function set delBitmapData(param1:BitmapData) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = MailIOBoxTabContent._329331684delBitmapData;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(MailIOBoxTabContent,"delBitmapData",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get repBitmapData() : BitmapData
      {
         return MailIOBoxTabContent._1918786038repBitmapData;
      }
      
      public static function set repBitmapData(param1:BitmapData) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = MailIOBoxTabContent._1918786038repBitmapData;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(MailIOBoxTabContent,"repBitmapData",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get addToolTip() : String
      {
         return MailIOBoxTabContent._768126978addToolTip;
      }
      
      public static function set addToolTip(param1:String) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = MailIOBoxTabContent._768126978addToolTip;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(MailIOBoxTabContent,"addToolTip",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get delToolTip() : String
      {
         return MailIOBoxTabContent._571287208delToolTip;
      }
      
      public static function set delToolTip(param1:String) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = MailIOBoxTabContent._571287208delToolTip;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(MailIOBoxTabContent,"delToolTip",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get repToolTip() : String
      {
         return MailIOBoxTabContent._646202234repToolTip;
      }
      
      public static function set repToolTip(param1:String) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = MailIOBoxTabContent._646202234repToolTip;
         switch(param1)
         {
            default:
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(MailIOBoxTabContent,"repToolTip",_loc2_,param1));
               break;
            case _loc2_:
            case _loc3_:
         }
      }
      
      public static function get staticEventDispatcher() : IEventDispatcher
      {
         return _staticBindingEventDispatcher;
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
      
      private function _MailIOBoxTabContent_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 5451520;
         _loc1_.alpha = 0.3;
         this.bg = _loc1_;
         BindingManager.executeBindings(this,"bg",this.bg);
         return _loc1_;
      }
      
      private function _MailIOBoxTabContent_Paginator1_i() : Paginator
      {
         var _loc1_:Paginator = new Paginator();
         this.paginator = _loc1_;
         BindingManager.executeBindings(this,"paginator",this.paginator);
         return _loc1_;
      }
      
      private function _MailIOBoxTabContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._MailIOBoxTabContent_Rect1_i(),this._MailIOBoxTabContent_Rect2_i(),this._MailIOBoxTabContent_Rect3_i(),this._MailIOBoxTabContent_Rect4_i(),this._MailIOBoxTabContent_List1_i(),this._MailIOBoxTabContent_BitmapImage1_c(),this._MailIOBoxTabContent_BitmapImage2_c(),this._MailIOBoxTabContent_BitmapImage3_c(),this._MailIOBoxTabContent_Group2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _MailIOBoxTabContent_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 30;
         _loc1_.right = 30;
         _loc1_.height = 35;
         _loc1_.y = 210;
         _loc1_.initialized(this,"_MailIOBoxTabContent_Rect1");
         this._MailIOBoxTabContent_Rect1 = _loc1_;
         BindingManager.executeBindings(this,"_MailIOBoxTabContent_Rect1",this._MailIOBoxTabContent_Rect1);
         return _loc1_;
      }
      
      private function _MailIOBoxTabContent_Rect2_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 30;
         _loc1_.right = 30;
         _loc1_.height = 35;
         _loc1_.y = 280;
         _loc1_.initialized(this,"_MailIOBoxTabContent_Rect2");
         this._MailIOBoxTabContent_Rect2 = _loc1_;
         BindingManager.executeBindings(this,"_MailIOBoxTabContent_Rect2",this._MailIOBoxTabContent_Rect2);
         return _loc1_;
      }
      
      private function _MailIOBoxTabContent_Rect3_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 30;
         _loc1_.right = 30;
         _loc1_.height = 35;
         _loc1_.y = 350;
         _loc1_.initialized(this,"_MailIOBoxTabContent_Rect3");
         this._MailIOBoxTabContent_Rect3 = _loc1_;
         BindingManager.executeBindings(this,"_MailIOBoxTabContent_Rect3",this._MailIOBoxTabContent_Rect3);
         return _loc1_;
      }
      
      private function _MailIOBoxTabContent_Rect4_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 30;
         _loc1_.right = 30;
         _loc1_.height = 35;
         _loc1_.y = 420;
         _loc1_.initialized(this,"_MailIOBoxTabContent_Rect4");
         this._MailIOBoxTabContent_Rect4 = _loc1_;
         BindingManager.executeBindings(this,"_MailIOBoxTabContent_Rect4",this._MailIOBoxTabContent_Rect4);
         return _loc1_;
      }
      
      private function _MailIOBoxTabContent_List1_i() : List
      {
         var _loc1_:List = new List();
         _loc1_.width = 620;
         _loc1_.height = 285;
         _loc1_.x = 45;
         _loc1_.y = 210;
         _loc1_.itemRenderer = this._MailIOBoxTabContent_ClassFactory1_c();
         _loc1_.setStyle("borderAlpha",0);
         _loc1_.setStyle("contentBackgroundAlpha",0);
         _loc1_.id = "mailsList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.mailsList = _loc1_;
         BindingManager.executeBindings(this,"mailsList",this.mailsList);
         return _loc1_;
      }
      
      private function _MailIOBoxTabContent_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = MailIOBoxTabContentInnerClass0;
         _loc1_.properties = {"outerDocument":this};
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _MailIOBoxTabContent_BitmapImage1_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.left = 140;
         _loc1_.top = 200;
         _loc1_.bottom = 40;
         _loc1_.fillMode = "scale";
         _loc1_.rotation = 90;
         _loc1_.source = this._embed_mxml__general_Decorations_swf_WoodLath_894941931;
         _loc1_.initialized(this,null);
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _MailIOBoxTabContent_BitmapImage2_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.left = 270;
         _loc1_.top = 200;
         _loc1_.bottom = 40;
         _loc1_.fillMode = "scale";
         _loc1_.rotation = 90;
         _loc1_.source = this._embed_mxml__general_Decorations_swf_WoodLath_894941931;
         _loc1_.initialized(this,null);
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _MailIOBoxTabContent_BitmapImage3_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.right = 150;
         _loc1_.top = 200;
         _loc1_.bottom = 40;
         _loc1_.fillMode = "scale";
         _loc1_.rotation = 90;
         _loc1_.source = this._embed_mxml__general_Decorations_swf_WoodLath_894941931;
         _loc1_.initialized(this,null);
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _MailIOBoxTabContent_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 650;
         _loc1_.height = 50;
         _loc1_.x = 20;
         _loc1_.y = 160;
         _loc1_.mxmlContent = [this._MailIOBoxTabContent_BitmapImage4_c(),this._MailIOBoxTabContent_BitmapImage5_c(),this._MailIOBoxTabContent_BitmapImage6_c(),this._MailIOBoxTabContent_HGroup1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _MailIOBoxTabContent_BitmapImage4_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fillMode = "repeat";
         _loc1_.source = this._embed_mxml__general_Patterns_swf_TileBG2_1819943852;
         _loc1_.initialized(this,null);
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _MailIOBoxTabContent_BitmapImage5_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.fillMode = "scale";
         _loc1_.source = this._embed_mxml__general_Decorations_swf_WoodLath_894941931;
         _loc1_.initialized(this,null);
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _MailIOBoxTabContent_BitmapImage6_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.fillMode = "scale";
         _loc1_.source = this._embed_mxml__general_Decorations_swf_WoodLath_894941931;
         _loc1_.initialized(this,null);
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _MailIOBoxTabContent_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalCenter = 0;
         _loc1_.left = 27;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._MailIOBoxTabContent_GradientText1_i(),this._MailIOBoxTabContent_GradientText2_i(),this._MailIOBoxTabContent_GradientText3_i(),this._MailIOBoxTabContent_GradientText4_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _MailIOBoxTabContent_GradientText1_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.debugMode = false;
         _loc1_.fontSize = 14;
         _loc1_.width = 95;
         _loc1_.id = "actionText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.actionText = _loc1_;
         BindingManager.executeBindings(this,"actionText",this.actionText);
         return _loc1_;
      }
      
      private function _MailIOBoxTabContent_GradientText2_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.debugMode = false;
         _loc1_.fontSize = 14;
         _loc1_.width = 130;
         _loc1_.id = "col2Text";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.col2Text = _loc1_;
         BindingManager.executeBindings(this,"col2Text",this.col2Text);
         return _loc1_;
      }
      
      private function _MailIOBoxTabContent_GradientText3_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.debugMode = false;
         _loc1_.fontSize = 14;
         _loc1_.width = 275;
         _loc1_.id = "subjectText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.subjectText = _loc1_;
         BindingManager.executeBindings(this,"subjectText",this.subjectText);
         return _loc1_;
      }
      
      private function _MailIOBoxTabContent_GradientText4_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.debugMode = false;
         _loc1_.fontSize = 14;
         _loc1_.width = 112;
         _loc1_.id = "dateText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dateText = _loc1_;
         BindingManager.executeBindings(this,"dateText",this.dateText);
         return _loc1_;
      }
      
      private function _MailIOBoxTabContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._MailIOBoxTabContent_HGroup2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _MailIOBoxTabContent_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalAlign = "middle";
         _loc1_.bottom = 22;
         _loc1_.mxmlContent = [this._MailIOBoxTabContent_Button1_i(),this._MailIOBoxTabContent_Button2_i(),this._MailIOBoxTabContent_GradientText5_i(),this._MailIOBoxTabContent_Button3_i(),this._MailIOBoxTabContent_Button4_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _MailIOBoxTabContent_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.width = 50;
         _loc1_.enabled = false;
         _loc1_.setStyle("skinClass",ButtonFluidGradientNormalSkin);
         _loc1_.id = "btnFirst";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnFirst = _loc1_;
         BindingManager.executeBindings(this,"btnFirst",this.btnFirst);
         return _loc1_;
      }
      
      private function _MailIOBoxTabContent_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.width = 40;
         _loc1_.enabled = false;
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
      
      private function _MailIOBoxTabContent_GradientText5_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.id = "pagesText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.pagesText = _loc1_;
         BindingManager.executeBindings(this,"pagesText",this.pagesText);
         return _loc1_;
      }
      
      private function _MailIOBoxTabContent_Button3_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.width = 40;
         _loc1_.enabled = false;
         _loc1_.setStyle("skinClass",ButtonFluidGradientNormalSkin);
         _loc1_.id = "btnNext";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnNext = _loc1_;
         BindingManager.executeBindings(this,"btnNext",this.btnNext);
         return _loc1_;
      }
      
      private function _MailIOBoxTabContent_Button4_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.width = 50;
         _loc1_.enabled = false;
         _loc1_.setStyle("skinClass",ButtonFluidGradientNormalSkin);
         _loc1_.id = "btnLast";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnLast = _loc1_;
         BindingManager.executeBindings(this,"btnLast",this.btnLast);
         return _loc1_;
      }
      
      private function _MailIOBoxTabContent_bindingsSetup() : Array
      {
         var _loc1_:Array = [];
         _loc1_[0] = new Binding(this,null,null,"paginator.firstButton","btnFirst");
         _loc1_[1] = new Binding(this,null,null,"paginator.nextButton","btnNext");
         _loc1_[2] = new Binding(this,null,null,"paginator.prevButton","btnBack");
         _loc1_[3] = new Binding(this,null,null,"paginator.lastButton","btnLast");
         _loc1_[4] = new Binding(this,null,null,"_MailIOBoxTabContent_Rect1.fill","bg");
         _loc1_[5] = new Binding(this,null,null,"_MailIOBoxTabContent_Rect2.fill","bg");
         _loc1_[6] = new Binding(this,null,null,"_MailIOBoxTabContent_Rect3.fill","bg");
         _loc1_[7] = new Binding(this,null,null,"_MailIOBoxTabContent_Rect4.fill","bg");
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get actionText() : GradientText
      {
         return this._1851862147actionText;
      }
      
      public function set actionText(param1:GradientText) : void
      {
         var _loc2_:Object = this._1851862147actionText;
         if(_loc2_ !== param1)
         {
            this._1851862147actionText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"actionText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bg() : SolidColor
      {
         return this._3141bg;
      }
      
      public function set bg(param1:SolidColor) : void
      {
         var _loc2_:Object = this._3141bg;
         if(_loc2_ !== param1)
         {
            this._3141bg = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bg",_loc2_,param1));
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
      public function get btnFirst() : Button
      {
         return this._2085027252btnFirst;
      }
      
      public function set btnFirst(param1:Button) : void
      {
         var _loc2_:Object = this._2085027252btnFirst;
         if(_loc2_ !== param1)
         {
            this._2085027252btnFirst = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnFirst",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnLast() : Button
      {
         return this._205977362btnLast;
      }
      
      public function set btnLast(param1:Button) : void
      {
         var _loc2_:Object = this._205977362btnLast;
         if(_loc2_ !== param1)
         {
            this._205977362btnLast = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnLast",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnNext() : Button
      {
         return this._206040943btnNext;
      }
      
      public function set btnNext(param1:Button) : void
      {
         var _loc2_:Object = this._206040943btnNext;
         if(_loc2_ !== param1)
         {
            this._206040943btnNext = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnNext",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get col2Text() : GradientText
      {
         return this._686047489col2Text;
      }
      
      public function set col2Text(param1:GradientText) : void
      {
         var _loc2_:Object = this._686047489col2Text;
         if(_loc2_ !== param1)
         {
            this._686047489col2Text = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"col2Text",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get dateText() : GradientText
      {
         return this._1792745979dateText;
      }
      
      public function set dateText(param1:GradientText) : void
      {
         var _loc2_:Object = this._1792745979dateText;
         if(_loc2_ !== param1)
         {
            this._1792745979dateText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dateText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get mailsList() : List
      {
         return this._291002278mailsList;
      }
      
      public function set mailsList(param1:List) : void
      {
         var _loc2_:Object = this._291002278mailsList;
         if(_loc2_ !== param1)
         {
            this._291002278mailsList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mailsList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get pagesText() : GradientText
      {
         return this._901392145pagesText;
      }
      
      public function set pagesText(param1:GradientText) : void
      {
         var _loc2_:Object = this._901392145pagesText;
         if(_loc2_ !== param1)
         {
            this._901392145pagesText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pagesText",_loc2_,param1));
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
      public function get subjectText() : GradientText
      {
         return this._603219847subjectText;
      }
      
      public function set subjectText(param1:GradientText) : void
      {
         var _loc2_:Object = this._603219847subjectText;
         if(_loc2_ !== param1)
         {
            this._603219847subjectText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"subjectText",_loc2_,param1));
            }
         }
      }
   }
}

