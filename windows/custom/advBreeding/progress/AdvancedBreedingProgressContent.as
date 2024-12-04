package windows.custom.advBreeding.progress
{
   import buttons.skin.fluid.ButtonFluidGradientNormalSkin;
   import components.counter.Counter;
   import components.counter.CounterCircleSkin;
   import components.image.StandardImage;
   import components.textfield.StandardText;
   import components.textfield.gradientText.GradientText;
   import components.textfield.labelDisplay.LabelDisplay;
   import components.textfield.labelDisplay.skin.LabelDisplayGoldSkin;
   import custom.generic.FillableSpot;
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
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.styles.*;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.VGroup;
   import spark.primitives.BitmapImage;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   import windows.core.WindowConstants;
   import windows.extensions.headers.WindowHeader;
   import windows.extensions.headers.skins.WindowHeaderIconBackgroundSkin;
   
   use namespace mx_internal;
   
   public class AdvancedBreedingProgressContent extends Group implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _1868335288btnPerfume:Button;
      
      private var _450399998countdownText:LabelDisplay;
      
      private var _717626615elixirAmount:Counter;
      
      private var _1221270899header:WindowHeader;
      
      private var _2053810961shadow1:StandardImage;
      
      private var _2053810962shadow2:StandardImage;
      
      private var _109620778sonia:StandardImage;
      
      private var _1320618578spotAnimal0:FillableSpot;
      
      private var _1320618579spotAnimal1:FillableSpot;
      
      private var _1996270068sprite1:StandardImage;
      
      private var _1996270067sprite2:StandardImage;
      
      private var _1004109969textDown:StandardText;
      
      private var _1003855738textMain:StandardText;
      
      private var _877021016textUp:StandardText;
      
      private var _873453350title2:GradientText;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__general_Decorations_swf_WoodLath_894941931:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function AdvancedBreedingProgressContent()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__general_Decorations_swf_WoodLath_894941931 = AdvancedBreedingProgressContent__embed_mxml__general_Decorations_swf_WoodLath_894941931;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._AdvancedBreedingProgressContent_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_windows_custom_advBreeding_progress_AdvancedBreedingProgressContentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return AdvancedBreedingProgressContent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._AdvancedBreedingProgressContent_InnerGroup1_c(),this._AdvancedBreedingProgressContent_OuterGroup1_c()];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         AdvancedBreedingProgressContent._watcherSetupUtil = param1;
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
      
      private function _AdvancedBreedingProgressContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._AdvancedBreedingProgressContent_WindowHeader1_i(),this._AdvancedBreedingProgressContent_VGroup1_c(),this._AdvancedBreedingProgressContent_Group2_c(),this._AdvancedBreedingProgressContent_Group3_c(),this._AdvancedBreedingProgressContent_Counter1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AdvancedBreedingProgressContent_WindowHeader1_i() : WindowHeader
      {
         var _loc1_:WindowHeader = new WindowHeader();
         _loc1_.text = "#Bredding#";
         _loc1_.fontSize = 20;
         _loc1_.setStyle("skinClass",WindowHeaderIconBackgroundSkin);
         _loc1_.id = "header";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.header = _loc1_;
         BindingManager.executeBindings(this,"header",this.header);
         return _loc1_;
      }
      
      private function _AdvancedBreedingProgressContent_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.top = 95;
         _loc1_.left = 50;
         _loc1_.right = 40;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._AdvancedBreedingProgressContent_VGroup2_c(),this._AdvancedBreedingProgressContent_BitmapImage1_c(),this._AdvancedBreedingProgressContent_VGroup3_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AdvancedBreedingProgressContent_VGroup2_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.paddingLeft = 110;
         _loc1_.width = 350;
         _loc1_.gap = -5;
         _loc1_.height = 120;
         _loc1_.mxmlContent = [this._AdvancedBreedingProgressContent_StandardText1_i(),this._AdvancedBreedingProgressContent_HGroup1_c(),this._AdvancedBreedingProgressContent_HGroup2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AdvancedBreedingProgressContent_StandardText1_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.text = "#You\'re currently breeding!#";
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("fontSize",10);
         _loc1_.id = "textMain";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.textMain = _loc1_;
         BindingManager.executeBindings(this,"textMain",this.textMain);
         return _loc1_;
      }
      
      private function _AdvancedBreedingProgressContent_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "top";
         _loc1_.height = 70;
         _loc1_.mxmlContent = [this._AdvancedBreedingProgressContent_FillableSpot1_i(),this._AdvancedBreedingProgressContent_FillableSpot2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AdvancedBreedingProgressContent_FillableSpot1_i() : FillableSpot
      {
         var _loc1_:FillableSpot = new FillableSpot();
         _loc1_.id = "spotAnimal0";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.spotAnimal0 = _loc1_;
         BindingManager.executeBindings(this,"spotAnimal0",this.spotAnimal0);
         return _loc1_;
      }
      
      private function _AdvancedBreedingProgressContent_FillableSpot2_i() : FillableSpot
      {
         var _loc1_:FillableSpot = new FillableSpot();
         _loc1_.id = "spotAnimal1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.spotAnimal1 = _loc1_;
         BindingManager.executeBindings(this,"spotAnimal1",this.spotAnimal1);
         return _loc1_;
      }
      
      private function _AdvancedBreedingProgressContent_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.height = 50;
         _loc1_.mxmlContent = [this._AdvancedBreedingProgressContent_StandardText2_i(),this._AdvancedBreedingProgressContent_LabelDisplay1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AdvancedBreedingProgressContent_StandardText2_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.text = "#Total time:#";
         _loc1_.setStyle("fontSize",10);
         _loc1_.id = "textUp";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.textUp = _loc1_;
         BindingManager.executeBindings(this,"textUp",this.textUp);
         return _loc1_;
      }
      
      private function _AdvancedBreedingProgressContent_LabelDisplay1_i() : LabelDisplay
      {
         var _loc1_:LabelDisplay = new LabelDisplay();
         _loc1_.text = "00:00:00";
         _loc1_.height = 30;
         _loc1_.type = "clock_red";
         _loc1_.setStyle("skinClass",LabelDisplayGoldSkin);
         _loc1_.id = "countdownText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.countdownText = _loc1_;
         BindingManager.executeBindings(this,"countdownText",this.countdownText);
         return _loc1_;
      }
      
      private function _AdvancedBreedingProgressContent_BitmapImage1_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.width = 355;
         _loc1_.fillMode = "scale";
         _loc1_.source = this._embed_mxml__general_Decorations_swf_WoodLath_894941931;
         _loc1_.initialized(this,null);
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AdvancedBreedingProgressContent_VGroup3_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.paddingLeft = 110;
         _loc1_.width = 350;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._AdvancedBreedingProgressContent_GradientText1_i(),this._AdvancedBreedingProgressContent_StandardText3_i(),this._AdvancedBreedingProgressContent_Button1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AdvancedBreedingProgressContent_GradientText1_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.text = "#Use elixir#";
         _loc1_.id = "title2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.title2 = _loc1_;
         BindingManager.executeBindings(this,"title2",this.title2);
         return _loc1_;
      }
      
      private function _AdvancedBreedingProgressContent_StandardText3_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.height = 35;
         _loc1_.text = "#Use elixir to reduce breeding time by 50%#";
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("fontSize",10);
         _loc1_.setStyle("paddingLeft",4);
         _loc1_.id = "textDown";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.textDown = _loc1_;
         BindingManager.executeBindings(this,"textDown",this.textDown);
         return _loc1_;
      }
      
      private function _AdvancedBreedingProgressContent_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.width = 165;
         _loc1_.label = "#Use perfume#";
         _loc1_.setStyle("skinClass",ButtonFluidGradientNormalSkin);
         _loc1_.addEventListener("click",this.__btnPerfume_click);
         _loc1_.id = "btnPerfume";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnPerfume = _loc1_;
         BindingManager.executeBindings(this,"btnPerfume",this.btnPerfume);
         return _loc1_;
      }
      
      public function __btnPerfume_click(param1:MouseEvent) : void
      {
         dispatchEvent(new Event("perfumeClicked"));
      }
      
      private function _AdvancedBreedingProgressContent_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 75;
         _loc1_.y = 195;
         _loc1_.mxmlContent = [this._AdvancedBreedingProgressContent_StandardImage1_i(),this._AdvancedBreedingProgressContent_StandardImage2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AdvancedBreedingProgressContent_StandardImage1_i() : StandardImage
      {
         var _loc1_:StandardImage = new StandardImage();
         _loc1_.horizontalCenter = 0;
         _loc1_.id = "shadow1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.shadow1 = _loc1_;
         BindingManager.executeBindings(this,"shadow1",this.shadow1);
         return _loc1_;
      }
      
      private function _AdvancedBreedingProgressContent_StandardImage2_i() : StandardImage
      {
         var _loc1_:StandardImage = new StandardImage();
         _loc1_.currentState = "imageCentered";
         _loc1_.displayScale = 0.45;
         _loc1_.horizontalCenter = 0;
         _loc1_.y = -15;
         _loc1_.id = "sprite1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sprite1 = _loc1_;
         BindingManager.executeBindings(this,"sprite1",this.sprite1);
         return _loc1_;
      }
      
      private function _AdvancedBreedingProgressContent_Group3_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 75;
         _loc1_.y = 300;
         _loc1_.mxmlContent = [this._AdvancedBreedingProgressContent_StandardImage3_i(),this._AdvancedBreedingProgressContent_StandardImage4_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AdvancedBreedingProgressContent_StandardImage3_i() : StandardImage
      {
         var _loc1_:StandardImage = new StandardImage();
         _loc1_.horizontalCenter = 0;
         _loc1_.id = "shadow2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.shadow2 = _loc1_;
         BindingManager.executeBindings(this,"shadow2",this.shadow2);
         return _loc1_;
      }
      
      private function _AdvancedBreedingProgressContent_StandardImage4_i() : StandardImage
      {
         var _loc1_:StandardImage = new StandardImage();
         _loc1_.currentState = "imageFree";
         _loc1_.horizontalCenter = 0;
         _loc1_.y = -25;
         _loc1_.id = "sprite2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sprite2 = _loc1_;
         BindingManager.executeBindings(this,"sprite2",this.sprite2);
         return _loc1_;
      }
      
      private function _AdvancedBreedingProgressContent_Counter1_i() : Counter
      {
         var _loc1_:Counter = new Counter();
         _loc1_.x = 50;
         _loc1_.y = 240;
         _loc1_.setStyle("skinClass",CounterCircleSkin);
         _loc1_.id = "elixirAmount";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.elixirAmount = _loc1_;
         BindingManager.executeBindings(this,"elixirAmount",this.elixirAmount);
         return _loc1_;
      }
      
      private function _AdvancedBreedingProgressContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._AdvancedBreedingProgressContent_StandardImage5_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AdvancedBreedingProgressContent_StandardImage5_i() : StandardImage
      {
         var _loc1_:StandardImage = new StandardImage();
         _loc1_.x = 28;
         _loc1_.y = 13;
         _loc1_.id = "sonia";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sonia = _loc1_;
         BindingManager.executeBindings(this,"sonia",this.sonia);
         return _loc1_;
      }
      
      private function _AdvancedBreedingProgressContent_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():int
         {
            return WindowConstants.SKIN_20;
         },null,"header.skinSize");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnPerfume() : Button
      {
         return this._1868335288btnPerfume;
      }
      
      public function set btnPerfume(param1:Button) : void
      {
         var _loc2_:Object = this._1868335288btnPerfume;
         if(_loc2_ !== param1)
         {
            this._1868335288btnPerfume = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnPerfume",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get countdownText() : LabelDisplay
      {
         return this._450399998countdownText;
      }
      
      public function set countdownText(param1:LabelDisplay) : void
      {
         var _loc2_:Object = this._450399998countdownText;
         if(_loc2_ !== param1)
         {
            this._450399998countdownText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"countdownText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get elixirAmount() : Counter
      {
         return this._717626615elixirAmount;
      }
      
      public function set elixirAmount(param1:Counter) : void
      {
         var _loc2_:Object = this._717626615elixirAmount;
         if(_loc2_ !== param1)
         {
            this._717626615elixirAmount = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"elixirAmount",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get header() : WindowHeader
      {
         return this._1221270899header;
      }
      
      public function set header(param1:WindowHeader) : void
      {
         var _loc2_:Object = this._1221270899header;
         if(_loc2_ !== param1)
         {
            this._1221270899header = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"header",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get shadow1() : StandardImage
      {
         return this._2053810961shadow1;
      }
      
      public function set shadow1(param1:StandardImage) : void
      {
         var _loc2_:Object = this._2053810961shadow1;
         if(_loc2_ !== param1)
         {
            this._2053810961shadow1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"shadow1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get shadow2() : StandardImage
      {
         return this._2053810962shadow2;
      }
      
      public function set shadow2(param1:StandardImage) : void
      {
         var _loc2_:Object = this._2053810962shadow2;
         if(_loc2_ !== param1)
         {
            this._2053810962shadow2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"shadow2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sonia() : StandardImage
      {
         return this._109620778sonia;
      }
      
      public function set sonia(param1:StandardImage) : void
      {
         var _loc2_:Object = this._109620778sonia;
         if(_loc2_ !== param1)
         {
            this._109620778sonia = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sonia",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get spotAnimal0() : FillableSpot
      {
         return this._1320618578spotAnimal0;
      }
      
      public function set spotAnimal0(param1:FillableSpot) : void
      {
         var _loc2_:Object = this._1320618578spotAnimal0;
         if(_loc2_ !== param1)
         {
            this._1320618578spotAnimal0 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"spotAnimal0",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get spotAnimal1() : FillableSpot
      {
         return this._1320618579spotAnimal1;
      }
      
      public function set spotAnimal1(param1:FillableSpot) : void
      {
         var _loc2_:Object = this._1320618579spotAnimal1;
         if(_loc2_ !== param1)
         {
            this._1320618579spotAnimal1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"spotAnimal1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sprite1() : StandardImage
      {
         return this._1996270068sprite1;
      }
      
      public function set sprite1(param1:StandardImage) : void
      {
         var _loc2_:Object = this._1996270068sprite1;
         if(_loc2_ !== param1)
         {
            this._1996270068sprite1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sprite1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sprite2() : StandardImage
      {
         return this._1996270067sprite2;
      }
      
      public function set sprite2(param1:StandardImage) : void
      {
         var _loc2_:Object = this._1996270067sprite2;
         if(_loc2_ !== param1)
         {
            this._1996270067sprite2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sprite2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get textDown() : StandardText
      {
         return this._1004109969textDown;
      }
      
      public function set textDown(param1:StandardText) : void
      {
         var _loc2_:Object = this._1004109969textDown;
         if(_loc2_ !== param1)
         {
            this._1004109969textDown = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"textDown",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get textMain() : StandardText
      {
         return this._1003855738textMain;
      }
      
      public function set textMain(param1:StandardText) : void
      {
         var _loc2_:Object = this._1003855738textMain;
         if(_loc2_ !== param1)
         {
            this._1003855738textMain = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"textMain",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get textUp() : StandardText
      {
         return this._877021016textUp;
      }
      
      public function set textUp(param1:StandardText) : void
      {
         var _loc2_:Object = this._877021016textUp;
         if(_loc2_ !== param1)
         {
            this._877021016textUp = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"textUp",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get title2() : GradientText
      {
         return this._873453350title2;
      }
      
      public function set title2(param1:GradientText) : void
      {
         var _loc2_:Object = this._873453350title2;
         if(_loc2_ !== param1)
         {
            this._873453350title2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"title2",_loc2_,param1));
            }
         }
      }
   }
}

