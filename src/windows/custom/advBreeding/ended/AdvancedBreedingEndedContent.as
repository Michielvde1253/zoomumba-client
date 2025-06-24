package windows.custom.advBreeding.ended
{
   import components.image.StandardImage;
   import components.textfield.StandardText;
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
   import mx.graphics.SolidColor;
   import mx.styles.*;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.VGroup;
   import spark.primitives.BitmapImage;
   import spark.primitives.Rect;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   import windows.core.WindowConstants;
   import windows.extensions.headers.WindowHeader;
   import windows.extensions.headers.skins.WindowHeaderExclamationMarkSkin;
   
   use namespace mx_internal;
   
   public class AdvancedBreedingEndedContent extends Group implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _93090825arrow:StandardImage;
      
      private var _1221270899header:WindowHeader;
      
      private var _157587484previewAnimal:StandardImage;
      
      private var _420846728previewSecondAnimal:StandardImage;
      
      private var _264074855rewardPreview:StandardImage;
      
      private var _1320618578spotAnimal0:FillableSpot;
      
      private var _1320618579spotAnimal1:FillableSpot;
      
      private var _1378472934spotChance0:FillableSpot;
      
      private var _1378472933spotChance1:FillableSpot;
      
      private var _1378472932spotChance2:FillableSpot;
      
      private var _2130460664starsLeft:StandardImage;
      
      private var _1614110149starsRight:StandardImage;
      
      private var _1360623032textBottom:StandardText;
      
      private var _1809525436textReward:StandardText;
      
      private var _1417848600textTop:StandardText;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__general_Decorations_swf_WoodLath_894941931:Class;
      
      private var _embed_mxml__general_Decorations_swf_ArrowGreen_1061508191:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function AdvancedBreedingEndedContent()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__general_Decorations_swf_WoodLath_894941931 = AdvancedBreedingEndedContent__embed_mxml__general_Decorations_swf_WoodLath_894941931;
         this._embed_mxml__general_Decorations_swf_ArrowGreen_1061508191 = AdvancedBreedingEndedContent__embed_mxml__general_Decorations_swf_ArrowGreen_1061508191;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._AdvancedBreedingEndedContent_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_windows_custom_advBreeding_ended_AdvancedBreedingEndedContentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return AdvancedBreedingEndedContent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._AdvancedBreedingEndedContent_InnerGroup1_c(),this._AdvancedBreedingEndedContent_OuterGroup1_c()];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         AdvancedBreedingEndedContent._watcherSetupUtil = param1;
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
      
      private function _AdvancedBreedingEndedContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._AdvancedBreedingEndedContent_StandardText1_i(),this._AdvancedBreedingEndedContent_Group2_c(),this._AdvancedBreedingEndedContent_HGroup1_c(),this._AdvancedBreedingEndedContent_StandardText3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AdvancedBreedingEndedContent_StandardText1_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.width = 400;
         _loc1_.htmlText = "#Hooray! \\nYour zoo just got a new baby animal!#";
         _loc1_.top = 120;
         _loc1_.horizontalCenter = 0;
         _loc1_.setStyle("textAlign","center");
         _loc1_.id = "textTop";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.textTop = _loc1_;
         BindingManager.executeBindings(this,"textTop",this.textTop);
         return _loc1_;
      }
      
      private function _AdvancedBreedingEndedContent_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 40;
         _loc1_.right = 40;
         _loc1_.top = 160;
         _loc1_.height = 170;
         _loc1_.mxmlContent = [this._AdvancedBreedingEndedContent_Rect1_c(),this._AdvancedBreedingEndedContent_BitmapImage1_c(),this._AdvancedBreedingEndedContent_BitmapImage2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AdvancedBreedingEndedContent_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._AdvancedBreedingEndedContent_SolidColor1_c();
         _loc1_.initialized(this,null);
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AdvancedBreedingEndedContent_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.alpha = 0.15;
         _loc1_.color = 9778689;
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AdvancedBreedingEndedContent_BitmapImage1_c() : BitmapImage
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
      
      private function _AdvancedBreedingEndedContent_BitmapImage2_c() : BitmapImage
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
      
      private function _AdvancedBreedingEndedContent_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.x = 70;
         _loc1_.y = 172;
         _loc1_.verticalAlign = "middle";
         _loc1_.gap = 30;
         _loc1_.height = 140;
         _loc1_.mxmlContent = [this._AdvancedBreedingEndedContent_VGroup1_c(),this._AdvancedBreedingEndedContent_StandardImage1_i(),this._AdvancedBreedingEndedContent_Group3_c(),this._AdvancedBreedingEndedContent_VGroup2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AdvancedBreedingEndedContent_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.horizontalAlign = "center";
         _loc1_.mxmlContent = [this._AdvancedBreedingEndedContent_HGroup2_c(),this._AdvancedBreedingEndedContent_HGroup3_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AdvancedBreedingEndedContent_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.mxmlContent = [this._AdvancedBreedingEndedContent_FillableSpot1_i(),this._AdvancedBreedingEndedContent_FillableSpot2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AdvancedBreedingEndedContent_FillableSpot1_i() : FillableSpot
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
      
      private function _AdvancedBreedingEndedContent_FillableSpot2_i() : FillableSpot
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
      
      private function _AdvancedBreedingEndedContent_HGroup3_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.mxmlContent = [this._AdvancedBreedingEndedContent_FillableSpot3_i(),this._AdvancedBreedingEndedContent_FillableSpot4_i(),this._AdvancedBreedingEndedContent_FillableSpot5_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AdvancedBreedingEndedContent_FillableSpot3_i() : FillableSpot
      {
         var _loc1_:FillableSpot = new FillableSpot();
         _loc1_.id = "spotChance0";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.spotChance0 = _loc1_;
         BindingManager.executeBindings(this,"spotChance0",this.spotChance0);
         return _loc1_;
      }
      
      private function _AdvancedBreedingEndedContent_FillableSpot4_i() : FillableSpot
      {
         var _loc1_:FillableSpot = new FillableSpot();
         _loc1_.id = "spotChance1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.spotChance1 = _loc1_;
         BindingManager.executeBindings(this,"spotChance1",this.spotChance1);
         return _loc1_;
      }
      
      private function _AdvancedBreedingEndedContent_FillableSpot5_i() : FillableSpot
      {
         var _loc1_:FillableSpot = new FillableSpot();
         _loc1_.id = "spotChance2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.spotChance2 = _loc1_;
         BindingManager.executeBindings(this,"spotChance2",this.spotChance2);
         return _loc1_;
      }
      
      private function _AdvancedBreedingEndedContent_StandardImage1_i() : StandardImage
      {
         var _loc1_:StandardImage = new StandardImage();
         _loc1_.width = 60;
         _loc1_.currentState = "imageCentered";
         _loc1_.displayClass = this._embed_mxml__general_Decorations_swf_ArrowGreen_1061508191;
         _loc1_.id = "arrow";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.arrow = _loc1_;
         BindingManager.executeBindings(this,"arrow",this.arrow);
         return _loc1_;
      }
      
      private function _AdvancedBreedingEndedContent_Group3_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 130;
         _loc1_.mxmlContent = [this._AdvancedBreedingEndedContent_StandardImage2_i(),this._AdvancedBreedingEndedContent_StandardImage3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AdvancedBreedingEndedContent_StandardImage2_i() : StandardImage
      {
         var _loc1_:StandardImage = new StandardImage();
         _loc1_.currentState = "imageFree";
         _loc1_.horizontalCenter = 0;
         _loc1_.id = "previewAnimal";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.previewAnimal = _loc1_;
         BindingManager.executeBindings(this,"previewAnimal",this.previewAnimal);
         return _loc1_;
      }
      
      private function _AdvancedBreedingEndedContent_StandardImage3_i() : StandardImage
      {
         var _loc1_:StandardImage = new StandardImage();
         _loc1_.currentState = "imageFree";
         _loc1_.horizontalCenter = 0;
         _loc1_.visible = false;
         _loc1_.id = "previewSecondAnimal";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.previewSecondAnimal = _loc1_;
         BindingManager.executeBindings(this,"previewSecondAnimal",this.previewSecondAnimal);
         return _loc1_;
      }
      
      private function _AdvancedBreedingEndedContent_VGroup2_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.paddingLeft = 15;
         _loc1_.horizontalAlign = "center";
         _loc1_.verticalAlign = "top";
         _loc1_.width = 1;
         _loc1_.height = 1;
         _loc1_.gap = 25;
         _loc1_.mxmlContent = [this._AdvancedBreedingEndedContent_StandardImage4_i(),this._AdvancedBreedingEndedContent_StandardText2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AdvancedBreedingEndedContent_StandardImage4_i() : StandardImage
      {
         var _loc1_:StandardImage = new StandardImage();
         _loc1_.currentState = "imageFree";
         _loc1_.id = "rewardPreview";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.rewardPreview = _loc1_;
         BindingManager.executeBindings(this,"rewardPreview",this.rewardPreview);
         return _loc1_;
      }
      
      private function _AdvancedBreedingEndedContent_StandardText2_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.text = "#3.600#";
         _loc1_.id = "textReward";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.textReward = _loc1_;
         BindingManager.executeBindings(this,"textReward",this.textReward);
         return _loc1_;
      }
      
      private function _AdvancedBreedingEndedContent_StandardText3_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.width = 420;
         _loc1_.text = "#Now go to nursery.#";
         _loc1_.bottom = 75;
         _loc1_.horizontalCenter = 0;
         _loc1_.setStyle("textAlign","center");
         _loc1_.id = "textBottom";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.textBottom = _loc1_;
         BindingManager.executeBindings(this,"textBottom",this.textBottom);
         return _loc1_;
      }
      
      private function _AdvancedBreedingEndedContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._AdvancedBreedingEndedContent_WindowHeader1_i(),this._AdvancedBreedingEndedContent_StandardImage5_i(),this._AdvancedBreedingEndedContent_StandardImage6_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AdvancedBreedingEndedContent_WindowHeader1_i() : WindowHeader
      {
         var _loc1_:WindowHeader = new WindowHeader();
         _loc1_.text = "#New Baby Animal#";
         _loc1_.fontSize = 20;
         _loc1_.setStyle("skinClass",WindowHeaderExclamationMarkSkin);
         _loc1_.id = "header";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.header = _loc1_;
         BindingManager.executeBindings(this,"header",this.header);
         return _loc1_;
      }
      
      private function _AdvancedBreedingEndedContent_StandardImage5_i() : StandardImage
      {
         var _loc1_:StandardImage = new StandardImage();
         _loc1_.left = 0;
         _loc1_.bottom = 0;
         _loc1_.mouseChildren = false;
         _loc1_.mouseEnabled = false;
         _loc1_.id = "starsLeft";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.starsLeft = _loc1_;
         BindingManager.executeBindings(this,"starsLeft",this.starsLeft);
         return _loc1_;
      }
      
      private function _AdvancedBreedingEndedContent_StandardImage6_i() : StandardImage
      {
         var _loc1_:StandardImage = new StandardImage();
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.mouseChildren = false;
         _loc1_.mouseEnabled = false;
         _loc1_.scaleX = -1;
         _loc1_.id = "starsRight";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.starsRight = _loc1_;
         BindingManager.executeBindings(this,"starsRight",this.starsRight);
         return _loc1_;
      }
      
      private function _AdvancedBreedingEndedContent_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():int
         {
            return WindowConstants.SKIN_40;
         },null,"header.skinSize");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get arrow() : StandardImage
      {
         return this._93090825arrow;
      }
      
      public function set arrow(param1:StandardImage) : void
      {
         var _loc2_:Object = this._93090825arrow;
         if(_loc2_ !== param1)
         {
            this._93090825arrow = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"arrow",_loc2_,param1));
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
      public function get previewAnimal() : StandardImage
      {
         return this._157587484previewAnimal;
      }
      
      public function set previewAnimal(param1:StandardImage) : void
      {
         var _loc2_:Object = this._157587484previewAnimal;
         if(_loc2_ !== param1)
         {
            this._157587484previewAnimal = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"previewAnimal",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get previewSecondAnimal() : StandardImage
      {
         return this._420846728previewSecondAnimal;
      }
      
      public function set previewSecondAnimal(param1:StandardImage) : void
      {
         var _loc2_:Object = this._420846728previewSecondAnimal;
         if(_loc2_ !== param1)
         {
            this._420846728previewSecondAnimal = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"previewSecondAnimal",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get rewardPreview() : StandardImage
      {
         return this._264074855rewardPreview;
      }
      
      public function set rewardPreview(param1:StandardImage) : void
      {
         var _loc2_:Object = this._264074855rewardPreview;
         if(_loc2_ !== param1)
         {
            this._264074855rewardPreview = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rewardPreview",_loc2_,param1));
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
      public function get spotChance0() : FillableSpot
      {
         return this._1378472934spotChance0;
      }
      
      public function set spotChance0(param1:FillableSpot) : void
      {
         var _loc2_:Object = this._1378472934spotChance0;
         if(_loc2_ !== param1)
         {
            this._1378472934spotChance0 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"spotChance0",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get spotChance1() : FillableSpot
      {
         return this._1378472933spotChance1;
      }
      
      public function set spotChance1(param1:FillableSpot) : void
      {
         var _loc2_:Object = this._1378472933spotChance1;
         if(_loc2_ !== param1)
         {
            this._1378472933spotChance1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"spotChance1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get spotChance2() : FillableSpot
      {
         return this._1378472932spotChance2;
      }
      
      public function set spotChance2(param1:FillableSpot) : void
      {
         var _loc2_:Object = this._1378472932spotChance2;
         if(_loc2_ !== param1)
         {
            this._1378472932spotChance2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"spotChance2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get starsLeft() : StandardImage
      {
         return this._2130460664starsLeft;
      }
      
      public function set starsLeft(param1:StandardImage) : void
      {
         var _loc2_:Object = this._2130460664starsLeft;
         if(_loc2_ !== param1)
         {
            this._2130460664starsLeft = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"starsLeft",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get starsRight() : StandardImage
      {
         return this._1614110149starsRight;
      }
      
      public function set starsRight(param1:StandardImage) : void
      {
         var _loc2_:Object = this._1614110149starsRight;
         if(_loc2_ !== param1)
         {
            this._1614110149starsRight = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"starsRight",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get textBottom() : StandardText
      {
         return this._1360623032textBottom;
      }
      
      public function set textBottom(param1:StandardText) : void
      {
         var _loc2_:Object = this._1360623032textBottom;
         if(_loc2_ !== param1)
         {
            this._1360623032textBottom = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"textBottom",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get textReward() : StandardText
      {
         return this._1809525436textReward;
      }
      
      public function set textReward(param1:StandardText) : void
      {
         var _loc2_:Object = this._1809525436textReward;
         if(_loc2_ !== param1)
         {
            this._1809525436textReward = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"textReward",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get textTop() : StandardText
      {
         return this._1417848600textTop;
      }
      
      public function set textTop(param1:StandardText) : void
      {
         var _loc2_:Object = this._1417848600textTop;
         if(_loc2_ !== param1)
         {
            this._1417848600textTop = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"textTop",_loc2_,param1));
            }
         }
      }
   }
}

