package windows.custom.nursery.progress
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
   
   public class NurseryProgressContent extends Group implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _882556679btnInstantRaise:Button;
      
      private var _964507107btnPotionRaise:Button;
      
      private var _1221270899header:WindowHeader;
      
      private var _1755484944instantBreedConst:LabelDisplay;
      
      private var _268134773instantRaise:Group;
      
      private var _1461072949potionAmount:Counter;
      
      private var _1971457511potionRaise:Group;
      
      private var _2053810961shadow1:StandardImage;
      
      private var _2053810962shadow2:StandardImage;
      
      private var _2053810963shadow3:StandardImage;
      
      private var _109620778sonia:StandardImage;
      
      private var _109651822spot0:FillableSpot;
      
      private var _1996270068sprite1:StandardImage;
      
      private var _1996270067sprite2:StandardImage;
      
      private var _1996270066sprite3:StandardImage;
      
      private var _1004109969textDown:StandardText;
      
      private var _1169499618textDownPotion:StandardText;
      
      private var _1003855738textMain:StandardText;
      
      private var _877021016textUp:StandardText;
      
      private var _2077607820timeLeft:LabelDisplay;
      
      private var _873453350title2:GradientText;
      
      private var _1407790323title2Potion:GradientText;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__general_Decorations_swf_WoodLath_894941931:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function NurseryProgressContent()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__general_Decorations_swf_WoodLath_894941931 = NurseryProgressContent__embed_mxml__general_Decorations_swf_WoodLath_894941931;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._NurseryProgressContent_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_windows_custom_nursery_progress_NurseryProgressContentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return NurseryProgressContent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._NurseryProgressContent_InnerGroup1_c(),this._NurseryProgressContent_OuterGroup1_c()];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         NurseryProgressContent._watcherSetupUtil = param1;
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
      
      private function _NurseryProgressContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._NurseryProgressContent_WindowHeader1_i(),this._NurseryProgressContent_VGroup1_c(),this._NurseryProgressContent_Group2_c(),this._NurseryProgressContent_Group3_i(),this._NurseryProgressContent_Group5_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _NurseryProgressContent_WindowHeader1_i() : WindowHeader
      {
         var _loc1_:WindowHeader = new WindowHeader();
         _loc1_.text = "#Bredding#";
         _loc1_.fontSize = 20;
         _loc1_.bgScale = 1.1;
         _loc1_.bgLeft = -40;
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
      
      private function _NurseryProgressContent_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.top = 90;
         _loc1_.left = 50;
         _loc1_.right = 55;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._NurseryProgressContent_VGroup2_c(),this._NurseryProgressContent_BitmapImage1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _NurseryProgressContent_VGroup2_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.paddingTop = 20;
         _loc1_.paddingLeft = 150;
         _loc1_.width = 450;
         _loc1_.gap = 5;
         _loc1_.height = 120;
         _loc1_.mxmlContent = [this._NurseryProgressContent_StandardText1_i(),this._NurseryProgressContent_HGroup1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _NurseryProgressContent_StandardText1_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.text = "#You\'re currently breeding!#";
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("textAlign","left");
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
      
      private function _NurseryProgressContent_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._NurseryProgressContent_HGroup2_c(),this._NurseryProgressContent_VGroup3_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _NurseryProgressContent_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.width = 170;
         _loc1_.verticalAlign = "top";
         _loc1_.height = 60;
         _loc1_.paddingTop = -5;
         _loc1_.horizontalAlign = "center";
         _loc1_.mxmlContent = [this._NurseryProgressContent_FillableSpot1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _NurseryProgressContent_FillableSpot1_i() : FillableSpot
      {
         var _loc1_:FillableSpot = new FillableSpot();
         _loc1_.id = "spot0";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.spot0 = _loc1_;
         BindingManager.executeBindings(this,"spot0",this.spot0);
         return _loc1_;
      }
      
      private function _NurseryProgressContent_VGroup3_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.gap = 0;
         _loc1_.horizontalCenter = "center";
         _loc1_.mxmlContent = [this._NurseryProgressContent_StandardText2_i(),this._NurseryProgressContent_LabelDisplay1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _NurseryProgressContent_StandardText2_i() : StandardText
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
      
      private function _NurseryProgressContent_LabelDisplay1_i() : LabelDisplay
      {
         var _loc1_:LabelDisplay = new LabelDisplay();
         _loc1_.text = "00:00";
         _loc1_.height = 30;
         _loc1_.type = "clock_red";
         _loc1_.setStyle("skinClass",LabelDisplayGoldSkin);
         _loc1_.id = "timeLeft";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.timeLeft = _loc1_;
         BindingManager.executeBindings(this,"timeLeft",this.timeLeft);
         return _loc1_;
      }
      
      private function _NurseryProgressContent_BitmapImage1_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.width = 427;
         _loc1_.fillMode = "scale";
         _loc1_.source = this._embed_mxml__general_Decorations_swf_WoodLath_894941931;
         _loc1_.initialized(this,null);
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _NurseryProgressContent_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 109;
         _loc1_.y = 194;
         _loc1_.mxmlContent = [this._NurseryProgressContent_StandardImage1_i(),this._NurseryProgressContent_StandardImage2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _NurseryProgressContent_StandardImage1_i() : StandardImage
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
      
      private function _NurseryProgressContent_StandardImage2_i() : StandardImage
      {
         var _loc1_:StandardImage = new StandardImage();
         _loc1_.currentState = "imageCentered";
         _loc1_.displayScale = 0.45;
         _loc1_.horizontalCenter = 0;
         _loc1_.y = -20;
         _loc1_.id = "sprite1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sprite1 = _loc1_;
         BindingManager.executeBindings(this,"sprite1",this.sprite1);
         return _loc1_;
      }
      
      private function _NurseryProgressContent_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 96;
         _loc1_.y = 275;
         _loc1_.width = 350;
         _loc1_.mxmlContent = [this._NurseryProgressContent_Group4_c(),this._NurseryProgressContent_GradientText1_i(),this._NurseryProgressContent_StandardText3_i(),this._NurseryProgressContent_LabelDisplay2_i(),this._NurseryProgressContent_Button1_i()];
         _loc1_.id = "instantRaise";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.instantRaise = _loc1_;
         BindingManager.executeBindings(this,"instantRaise",this.instantRaise);
         return _loc1_;
      }
      
      private function _NurseryProgressContent_Group4_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = -56;
         _loc1_.y = -18;
         _loc1_.mxmlContent = [this._NurseryProgressContent_StandardImage3_i(),this._NurseryProgressContent_StandardImage4_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _NurseryProgressContent_StandardImage3_i() : StandardImage
      {
         var _loc1_:StandardImage = new StandardImage();
         _loc1_.id = "shadow3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.shadow3 = _loc1_;
         BindingManager.executeBindings(this,"shadow3",this.shadow3);
         return _loc1_;
      }
      
      private function _NurseryProgressContent_StandardImage4_i() : StandardImage
      {
         var _loc1_:StandardImage = new StandardImage();
         _loc1_.currentState = "imageFree";
         _loc1_.displayScale = 0.45;
         _loc1_.y = -25;
         _loc1_.id = "sprite3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sprite3 = _loc1_;
         BindingManager.executeBindings(this,"sprite3",this.sprite3);
         return _loc1_;
      }
      
      private function _NurseryProgressContent_GradientText1_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.x = 11;
         _loc1_.y = -64;
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
      
      private function _NurseryProgressContent_StandardText3_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.text = "#Use elixir to reduce breeding time by 50%#";
         _loc1_.width = 150;
         _loc1_.x = 9;
         _loc1_.y = -43;
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
      
      private function _NurseryProgressContent_LabelDisplay2_i() : LabelDisplay
      {
         var _loc1_:LabelDisplay = new LabelDisplay();
         _loc1_.x = 8;
         _loc1_.y = -21;
         _loc1_.setStyle("skinClass",LabelDisplayGoldSkin);
         _loc1_.id = "instantBreedConst";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.instantBreedConst = _loc1_;
         BindingManager.executeBindings(this,"instantBreedConst",this.instantBreedConst);
         return _loc1_;
      }
      
      private function _NurseryProgressContent_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.width = 165;
         _loc1_.label = "#Use perfume#";
         _loc1_.setStyle("skinClass",ButtonFluidGradientNormalSkin);
         _loc1_.addEventListener("click",this.__btnInstantRaise_click);
         _loc1_.id = "btnInstantRaise";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnInstantRaise = _loc1_;
         BindingManager.executeBindings(this,"btnInstantRaise",this.btnInstantRaise);
         return _loc1_;
      }
      
      public function __btnInstantRaise_click(param1:MouseEvent) : void
      {
         dispatchEvent(new Event("instantRaiseClicked"));
      }
      
      private function _NurseryProgressContent_Group5_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 144;
         _loc1_.y = 0;
         _loc1_.width = 350;
         _loc1_.mxmlContent = [this._NurseryProgressContent_Group6_c(),this._NurseryProgressContent_GradientText2_i(),this._NurseryProgressContent_StandardText4_i(),this._NurseryProgressContent_Button2_i(),this._NurseryProgressContent_Counter1_i()];
         _loc1_.id = "potionRaise";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.potionRaise = _loc1_;
         BindingManager.executeBindings(this,"potionRaise",this.potionRaise);
         return _loc1_;
      }
      
      private function _NurseryProgressContent_Group6_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 123;
         _loc1_.y = 290;
         _loc1_.mxmlContent = [this._NurseryProgressContent_StandardImage5_i(),this._NurseryProgressContent_StandardImage6_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _NurseryProgressContent_StandardImage5_i() : StandardImage
      {
         var _loc1_:StandardImage = new StandardImage();
         _loc1_.id = "shadow2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.shadow2 = _loc1_;
         BindingManager.executeBindings(this,"shadow2",this.shadow2);
         return _loc1_;
      }
      
      private function _NurseryProgressContent_StandardImage6_i() : StandardImage
      {
         var _loc1_:StandardImage = new StandardImage();
         _loc1_.currentState = "imageFree";
         _loc1_.horizontalCenter = 0;
         _loc1_.displayScale = 0.45;
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
      
      private function _NurseryProgressContent_GradientText2_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.text = "#Use elixir#";
         _loc1_.x = 178;
         _loc1_.y = 210;
         _loc1_.id = "title2Potion";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.title2Potion = _loc1_;
         BindingManager.executeBindings(this,"title2Potion",this.title2Potion);
         return _loc1_;
      }
      
      private function _NurseryProgressContent_StandardText4_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.text = "#Use elixir to reduce breeding time by 50%#";
         _loc1_.percentWidth = 100;
         _loc1_.x = 177;
         _loc1_.y = 241;
         _loc1_.setStyle("fontSize",10);
         _loc1_.setStyle("paddingLeft",4);
         _loc1_.id = "textDownPotion";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.textDownPotion = _loc1_;
         BindingManager.executeBindings(this,"textDownPotion",this.textDownPotion);
         return _loc1_;
      }
      
      private function _NurseryProgressContent_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.width = 165;
         _loc1_.x = 174;
         _loc1_.y = 278;
         _loc1_.label = "#Use perfume#";
         _loc1_.setStyle("skinClass",ButtonFluidGradientNormalSkin);
         _loc1_.addEventListener("click",this.__btnPotionRaise_click);
         _loc1_.id = "btnPotionRaise";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnPotionRaise = _loc1_;
         BindingManager.executeBindings(this,"btnPotionRaise",this.btnPotionRaise);
         return _loc1_;
      }
      
      public function __btnPotionRaise_click(param1:MouseEvent) : void
      {
         dispatchEvent(new Event("potionRaiseClicked"));
      }
      
      private function _NurseryProgressContent_Counter1_i() : Counter
      {
         var _loc1_:Counter = new Counter();
         _loc1_.x = 110;
         _loc1_.y = 221;
         _loc1_.setStyle("skinClass",CounterCircleSkin);
         _loc1_.id = "potionAmount";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.potionAmount = _loc1_;
         BindingManager.executeBindings(this,"potionAmount",this.potionAmount);
         return _loc1_;
      }
      
      private function _NurseryProgressContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._NurseryProgressContent_StandardImage7_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _NurseryProgressContent_StandardImage7_i() : StandardImage
      {
         var _loc1_:StandardImage = new StandardImage();
         _loc1_.x = 37;
         _loc1_.y = 35;
         _loc1_.id = "sonia";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sonia = _loc1_;
         BindingManager.executeBindings(this,"sonia",this.sonia);
         return _loc1_;
      }
      
      private function _NurseryProgressContent_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():int
         {
            return WindowConstants.SKIN_30;
         },null,"header.skinSize");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnInstantRaise() : Button
      {
         return this._882556679btnInstantRaise;
      }
      
      public function set btnInstantRaise(param1:Button) : void
      {
         var _loc2_:Object = this._882556679btnInstantRaise;
         if(_loc2_ !== param1)
         {
            this._882556679btnInstantRaise = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnInstantRaise",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnPotionRaise() : Button
      {
         return this._964507107btnPotionRaise;
      }
      
      public function set btnPotionRaise(param1:Button) : void
      {
         var _loc2_:Object = this._964507107btnPotionRaise;
         if(_loc2_ !== param1)
         {
            this._964507107btnPotionRaise = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnPotionRaise",_loc2_,param1));
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
      public function get instantBreedConst() : LabelDisplay
      {
         return this._1755484944instantBreedConst;
      }
      
      public function set instantBreedConst(param1:LabelDisplay) : void
      {
         var _loc2_:Object = this._1755484944instantBreedConst;
         if(_loc2_ !== param1)
         {
            this._1755484944instantBreedConst = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"instantBreedConst",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get instantRaise() : Group
      {
         return this._268134773instantRaise;
      }
      
      public function set instantRaise(param1:Group) : void
      {
         var _loc2_:Object = this._268134773instantRaise;
         if(_loc2_ !== param1)
         {
            this._268134773instantRaise = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"instantRaise",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get potionAmount() : Counter
      {
         return this._1461072949potionAmount;
      }
      
      public function set potionAmount(param1:Counter) : void
      {
         var _loc2_:Object = this._1461072949potionAmount;
         if(_loc2_ !== param1)
         {
            this._1461072949potionAmount = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"potionAmount",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get potionRaise() : Group
      {
         return this._1971457511potionRaise;
      }
      
      public function set potionRaise(param1:Group) : void
      {
         var _loc2_:Object = this._1971457511potionRaise;
         if(_loc2_ !== param1)
         {
            this._1971457511potionRaise = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"potionRaise",_loc2_,param1));
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
      public function get shadow3() : StandardImage
      {
         return this._2053810963shadow3;
      }
      
      public function set shadow3(param1:StandardImage) : void
      {
         var _loc2_:Object = this._2053810963shadow3;
         if(_loc2_ !== param1)
         {
            this._2053810963shadow3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"shadow3",_loc2_,param1));
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
      public function get spot0() : FillableSpot
      {
         return this._109651822spot0;
      }
      
      public function set spot0(param1:FillableSpot) : void
      {
         var _loc2_:Object = this._109651822spot0;
         if(_loc2_ !== param1)
         {
            this._109651822spot0 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"spot0",_loc2_,param1));
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
      public function get sprite3() : StandardImage
      {
         return this._1996270066sprite3;
      }
      
      public function set sprite3(param1:StandardImage) : void
      {
         var _loc2_:Object = this._1996270066sprite3;
         if(_loc2_ !== param1)
         {
            this._1996270066sprite3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sprite3",_loc2_,param1));
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
      public function get textDownPotion() : StandardText
      {
         return this._1169499618textDownPotion;
      }
      
      public function set textDownPotion(param1:StandardText) : void
      {
         var _loc2_:Object = this._1169499618textDownPotion;
         if(_loc2_ !== param1)
         {
            this._1169499618textDownPotion = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"textDownPotion",_loc2_,param1));
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
      public function get timeLeft() : LabelDisplay
      {
         return this._2077607820timeLeft;
      }
      
      public function set timeLeft(param1:LabelDisplay) : void
      {
         var _loc2_:Object = this._2077607820timeLeft;
         if(_loc2_ !== param1)
         {
            this._2077607820timeLeft = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"timeLeft",_loc2_,param1));
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
      
      [Bindable(event="propertyChange")]
      public function get title2Potion() : GradientText
      {
         return this._1407790323title2Potion;
      }
      
      public function set title2Potion(param1:GradientText) : void
      {
         var _loc2_:Object = this._1407790323title2Potion;
         if(_loc2_ !== param1)
         {
            this._1407790323title2Potion = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"title2Potion",_loc2_,param1));
            }
         }
      }
   }
}

