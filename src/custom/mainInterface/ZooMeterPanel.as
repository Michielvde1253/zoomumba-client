package custom.mainInterface
{
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
   import mx.binding.*;
   import mx.controls.Image;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.graphics.BitmapFill;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import mx.styles.*;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.VGroup;
   import spark.primitives.BitmapImage;
   import spark.primitives.Path;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class ZooMeterPanel extends Group implements IBindingClient, IStateClient2
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      public var _ZooMeterPanel_GradientText1:GradientText;
      
      public var _ZooMeterPanel_GradientText2:GradientText;
      
      private var _209669309_ZooMeterPanel_Group3:Group;
      
      public var _ZooMeterPanel_Group6:Group;
      
      public var _ZooMeterPanel_Image1:Image;
      
      public var _ZooMeterPanel_Image2:Image;
      
      private var _261879137_ZooMeterPanel_Image3:Image;
      
      private var _1743778772bitmapFace:BitmapImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _169673567firstValue:String = "000.000";
      
      private var _256574813secondValue:String = "000.000";
      
      private var face5:Class;
      
      private var face4:Class;
      
      private var face3:Class;
      
      private var face2:Class;
      
      private var face1:Class;
      
      private var _3135069face:Class;
      
      private var _1001078227progress:Number = 0;
      
      private var _embed_mxml__custom_HUD_swf_BubbleMeter_1971302708:Class;
      
      private var _embed_mxml__general_Patterns_swf_PatternNormal_213163820:Class;
      
      private var _embed_mxml__general_Decorations_swf_Attraction_1169780356:Class;
      
      private var _embed_mxml__general_Patterns_swf_HPatternYellowLine_636921743:Class;
      
      private var _embed_mxml__custom_HUD_swf_BarMeter_2048180235:Class;
      
      private var _embed_mxml__custom_HUD_swf_ScaleMeter_769349874:Class;
      
      private var _embed_mxml__custom_HUD_swf_CurrencyForeground_1711629069:Class;
      
      private var _embed_mxml__general_Decorations_swf_PennyClock_837654735:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ZooMeterPanel()
      {
         var watchers:Array;
         var _ZooMeterPanel_Group6_factory:DeferredInstanceFromFunction;
         var i:uint;
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this.face5 = ZooMeterPanel_face5;
         this.face4 = ZooMeterPanel_face4;
         this.face3 = ZooMeterPanel_face3;
         this.face2 = ZooMeterPanel_face2;
         this.face1 = ZooMeterPanel_face1;
         this._3135069face = this.face1;
         this._embed_mxml__custom_HUD_swf_BubbleMeter_1971302708 = ZooMeterPanel__embed_mxml__custom_HUD_swf_BubbleMeter_1971302708;
         this._embed_mxml__general_Patterns_swf_PatternNormal_213163820 = ZooMeterPanel__embed_mxml__general_Patterns_swf_PatternNormal_213163820;
         this._embed_mxml__general_Decorations_swf_Attraction_1169780356 = ZooMeterPanel__embed_mxml__general_Decorations_swf_Attraction_1169780356;
         this._embed_mxml__general_Patterns_swf_HPatternYellowLine_636921743 = ZooMeterPanel__embed_mxml__general_Patterns_swf_HPatternYellowLine_636921743;
         this._embed_mxml__custom_HUD_swf_BarMeter_2048180235 = ZooMeterPanel__embed_mxml__custom_HUD_swf_BarMeter_2048180235;
         this._embed_mxml__custom_HUD_swf_ScaleMeter_769349874 = ZooMeterPanel__embed_mxml__custom_HUD_swf_ScaleMeter_769349874;
         this._embed_mxml__custom_HUD_swf_CurrencyForeground_1711629069 = ZooMeterPanel__embed_mxml__custom_HUD_swf_CurrencyForeground_1711629069;
         this._embed_mxml__general_Decorations_swf_PennyClock_837654735 = ZooMeterPanel__embed_mxml__general_Decorations_swf_PennyClock_837654735;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._ZooMeterPanel_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_custom_mainInterface_ZooMeterPanelWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ZooMeterPanel[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mouseChildren = false;
         this.mouseEnabled = true;
         this.buttonMode = true;
         this.useHandCursor = true;
         this.cacheAsBitmap = true;
         this.maxWidth = 1;
         this.width = 1;
         this.mxmlContent = [this._ZooMeterPanel_Group2_c(),this._ZooMeterPanel_Image4_c(),this._ZooMeterPanel_BitmapImage1_i()];
         this.currentState = "progress";
         this.addEventListener("mouseOver",this.___ZooMeterPanel_Group1_mouseOver);
         this.addEventListener("mouseOut",this.___ZooMeterPanel_Group1_mouseOut);
         _ZooMeterPanel_Group6_factory = new DeferredInstanceFromFunction(this._ZooMeterPanel_Group6_i);
         states = [new State({
            "name":"progress",
            "overrides":[]
         }),new State({
            "name":"numbers",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_ZooMeterPanel_Group6_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["bitmapFace"]
            }),new SetProperty().initializeFromObject({
               "target":"_ZooMeterPanel_Group3",
               "name":"alpha",
               "value":0.3
            }),new SetProperty().initializeFromObject({
               "target":"_ZooMeterPanel_Image3",
               "name":"visible",
               "value":false
            })]
         })];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         ZooMeterPanel._watcherSetupUtil = param1;
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
      
      public function set percentage(param1:Number) : void
      {
         switch(Math.max(0,Math.min(Math.ceil(param1 * 5),5)))
         {
            case 5:
               this.bitmapFace.source = this.face5;
               this.bitmapFace.x = -56;
               this.bitmapFace.y = -3;
               break;
            case 4:
               this.bitmapFace.source = this.face4;
               this.bitmapFace.x = -57;
               this.bitmapFace.y = -3;
               break;
            case 3:
               this.bitmapFace.source = this.face3;
               this.bitmapFace.x = -58;
               this.bitmapFace.y = -2;
               break;
            case 2:
               this.bitmapFace.source = this.face2;
               this.bitmapFace.x = -58;
               this.bitmapFace.y = -2;
               break;
            case 1:
            case 0:
               this.bitmapFace.source = this.face1;
               this.bitmapFace.x = -57;
               this.bitmapFace.y = -2;
         }
         this.progress = param1;
      }
      
      private function _ZooMeterPanel_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.maxWidth = 160;
         _loc1_.mxmlContent = [this._ZooMeterPanel_Path1_c(),this._ZooMeterPanel_Group3_i(),this._ZooMeterPanel_Image3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ZooMeterPanel_Path1_c() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.x = -4;
         _loc1_.y = 4;
         _loc1_.data = "M139.95 28.15Q140.6 32.05 139.8 33.55 139.05 34.8 137.95 35.15 136.75 35.45 133.2 35.45L44.05 35.45 43.9 35.75Q43 37.3 41.85 38.65L41.85 38.7Q38.55 42.65 33.85 44.9 29 47.25 23.6 47.25 13.85 47.25 6.95 40.35 0 33.4 0 23.6 0 13.85 6.95 6.95 13.85    0 23.6 0 28.6 0 33.2 2 37.6 3.95 40.85 7.5L41.05 7.7 125.75 7.8Q130.35 7.9 136.95 19.55 139.2 23.55 139.95 28.15";
         _loc1_.scaleX = -1.01;
         _loc1_.scaleY = 1.01;
         _loc1_.fill = this._ZooMeterPanel_BitmapFill1_c();
         _loc1_.initialized(this,null);
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ZooMeterPanel_BitmapFill1_c() : BitmapFill
      {
         var _loc1_:BitmapFill = new BitmapFill();
         _loc1_.fillMode = "repeat";
         _loc1_.source = this._embed_mxml__general_Patterns_swf_PatternNormal_213163820;
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ZooMeterPanel_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = -135;
         _loc1_.y = 16;
         _loc1_.mxmlContent = [this._ZooMeterPanel_Rect1_c(),this._ZooMeterPanel_Image1_i(),this._ZooMeterPanel_Group4_c()];
         _loc1_.id = "_ZooMeterPanel_Group3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ZooMeterPanel_Group3 = _loc1_;
         BindingManager.executeBindings(this,"_ZooMeterPanel_Group3",this._ZooMeterPanel_Group3);
         return _loc1_;
      }
      
      private function _ZooMeterPanel_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.width = 83;
         _loc1_.height = 18;
         _loc1_.radiusX = 10;
         _loc1_.radiusY = 10;
         _loc1_.fill = this._ZooMeterPanel_SolidColor1_c();
         _loc1_.stroke = this._ZooMeterPanel_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ZooMeterPanel_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 4597760;
         _loc1_.alpha = 1;
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ZooMeterPanel_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 0;
         _loc1_.weight = 1;
         _loc1_.pixelHinting = true;
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ZooMeterPanel_Image1_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.x = 2;
         _loc1_.y = 2;
         _loc1_.scaleContent = false;
         _loc1_.source = this._embed_mxml__custom_HUD_swf_BarMeter_2048180235;
         _loc1_.id = "_ZooMeterPanel_Image1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ZooMeterPanel_Image1 = _loc1_;
         BindingManager.executeBindings(this,"_ZooMeterPanel_Image1",this._ZooMeterPanel_Image1);
         return _loc1_;
      }
      
      private function _ZooMeterPanel_Group4_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.maskType = "clip";
         _loc1_.mask = this._ZooMeterPanel_Group5_c();
         _loc1_.mxmlContent = [this._ZooMeterPanel_Image2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ZooMeterPanel_Group5_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._ZooMeterPanel_Rect2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ZooMeterPanel_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.width = 83;
         _loc1_.height = 18;
         _loc1_.radiusX = 10;
         _loc1_.radiusY = 10;
         _loc1_.fill = this._ZooMeterPanel_SolidColor2_c();
         _loc1_.initialized(this,null);
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ZooMeterPanel_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 4597760;
         _loc1_.alpha = 1;
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ZooMeterPanel_Image2_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.y = -3;
         _loc1_.rotation = 90;
         _loc1_.source = this._embed_mxml__custom_HUD_swf_BubbleMeter_1971302708;
         _loc1_.id = "_ZooMeterPanel_Image2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ZooMeterPanel_Image2 = _loc1_;
         BindingManager.executeBindings(this,"_ZooMeterPanel_Image2",this._ZooMeterPanel_Image2);
         return _loc1_;
      }
      
      private function _ZooMeterPanel_Image3_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.x = -118;
         _loc1_.y = 16;
         _loc1_.source = this._embed_mxml__custom_HUD_swf_ScaleMeter_769349874;
         _loc1_.id = "_ZooMeterPanel_Image3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ZooMeterPanel_Image3 = _loc1_;
         BindingManager.executeBindings(this,"_ZooMeterPanel_Image3",this._ZooMeterPanel_Image3);
         return _loc1_;
      }
      
      private function _ZooMeterPanel_Image4_c() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.source = this._embed_mxml__custom_HUD_swf_CurrencyForeground_1711629069;
         _loc1_.scaleX = -1;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ZooMeterPanel_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.initialized(this,"bitmapFace");
         this.bitmapFace = _loc1_;
         BindingManager.executeBindings(this,"bitmapFace",this.bitmapFace);
         return _loc1_;
      }
      
      private function _ZooMeterPanel_Group6_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = -140;
         _loc1_.height = 52;
         _loc1_.mxmlContent = [this._ZooMeterPanel_BitmapImage2_c(),this._ZooMeterPanel_VGroup1_c()];
         _loc1_.id = "_ZooMeterPanel_Group6";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ZooMeterPanel_Group6 = _loc1_;
         BindingManager.executeBindings(this,"_ZooMeterPanel_Group6",this._ZooMeterPanel_Group6);
         return _loc1_;
      }
      
      private function _ZooMeterPanel_BitmapImage2_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.left = 15;
         _loc1_.verticalCenter = -1;
         _loc1_.width = 65;
         _loc1_.fillMode = "repeat";
         _loc1_.source = this._embed_mxml__general_Patterns_swf_HPatternYellowLine_636921743;
         _loc1_.initialized(this,null);
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ZooMeterPanel_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.left = 0;
         _loc1_.gap = -9;
         _loc1_.verticalCenter = 0;
         _loc1_.mxmlContent = [this._ZooMeterPanel_HGroup1_c(),this._ZooMeterPanel_HGroup2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ZooMeterPanel_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.gap = -1;
         _loc1_.verticalAlign = "middle";
         _loc1_.paddingLeft = -3;
         _loc1_.height = 25;
         _loc1_.mxmlContent = [this._ZooMeterPanel_Image5_c(),this._ZooMeterPanel_GradientText1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ZooMeterPanel_Image5_c() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.scaleX = 0.3;
         _loc1_.scaleY = 0.3;
         _loc1_.source = this._embed_mxml__general_Decorations_swf_Attraction_1169780356;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ZooMeterPanel_GradientText1_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.fontSize = 10;
         _loc1_.id = "_ZooMeterPanel_GradientText1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ZooMeterPanel_GradientText1 = _loc1_;
         BindingManager.executeBindings(this,"_ZooMeterPanel_GradientText1",this._ZooMeterPanel_GradientText1);
         return _loc1_;
      }
      
      private function _ZooMeterPanel_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.gap = -1;
         _loc1_.verticalAlign = "middle";
         _loc1_.height = 25;
         _loc1_.mxmlContent = [this._ZooMeterPanel_Image6_c(),this._ZooMeterPanel_GradientText2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ZooMeterPanel_Image6_c() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.scaleX = 0.42;
         _loc1_.scaleY = 0.42;
         _loc1_.source = this._embed_mxml__general_Decorations_swf_PennyClock_837654735;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ZooMeterPanel_GradientText2_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.paddingLeft = 5;
         _loc1_.fontSize = 10;
         _loc1_.id = "_ZooMeterPanel_GradientText2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ZooMeterPanel_GradientText2 = _loc1_;
         BindingManager.executeBindings(this,"_ZooMeterPanel_GradientText2",this._ZooMeterPanel_GradientText2);
         return _loc1_;
      }
      
      public function ___ZooMeterPanel_Group1_mouseOver(param1:MouseEvent) : void
      {
         currentState = "numbers";
      }
      
      public function ___ZooMeterPanel_Group1_mouseOut(param1:MouseEvent) : void
      {
         currentState = "progress";
      }
      
      private function _ZooMeterPanel_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Number
         {
            return 80 * progress + 4;
         },null,"_ZooMeterPanel_Image1.width");
         result[1] = new Binding(this,function():Number
         {
            return 80 * progress - 4;
         },null,"_ZooMeterPanel_Image2.x");
         result[2] = new Binding(this,null,null,"_ZooMeterPanel_GradientText1.text","firstValue");
         result[3] = new Binding(this,null,null,"_ZooMeterPanel_GradientText2.text","secondValue");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _ZooMeterPanel_Group3() : Group
      {
         return this._209669309_ZooMeterPanel_Group3;
      }
      
      public function set _ZooMeterPanel_Group3(param1:Group) : void
      {
         var _loc2_:Object = this._209669309_ZooMeterPanel_Group3;
         if(_loc2_ !== param1)
         {
            this._209669309_ZooMeterPanel_Group3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ZooMeterPanel_Group3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _ZooMeterPanel_Image3() : Image
      {
         return this._261879137_ZooMeterPanel_Image3;
      }
      
      public function set _ZooMeterPanel_Image3(param1:Image) : void
      {
         var _loc2_:Object = this._261879137_ZooMeterPanel_Image3;
         if(_loc2_ !== param1)
         {
            this._261879137_ZooMeterPanel_Image3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ZooMeterPanel_Image3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bitmapFace() : BitmapImage
      {
         return this._1743778772bitmapFace;
      }
      
      public function set bitmapFace(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1743778772bitmapFace;
         if(_loc2_ !== param1)
         {
            this._1743778772bitmapFace = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bitmapFace",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get firstValue() : String
      {
         return this._169673567firstValue;
      }
      
      public function set firstValue(param1:String) : void
      {
         var _loc2_:Object = this._169673567firstValue;
         if(_loc2_ !== param1)
         {
            this._169673567firstValue = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"firstValue",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get secondValue() : String
      {
         return this._256574813secondValue;
      }
      
      public function set secondValue(param1:String) : void
      {
         var _loc2_:Object = this._256574813secondValue;
         if(_loc2_ !== param1)
         {
            this._256574813secondValue = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"secondValue",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get face() : Class
      {
         return this._3135069face;
      }
      
      private function set face(param1:Class) : void
      {
         var _loc2_:Object = this._3135069face;
         if(_loc2_ !== param1)
         {
            this._3135069face = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"face",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get progress() : Number
      {
         return this._1001078227progress;
      }
      
      private function set progress(param1:Number) : void
      {
         var _loc2_:Object = this._1001078227progress;
         if(_loc2_ !== param1)
         {
            this._1001078227progress = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"progress",_loc2_,param1));
            }
         }
      }
   }
}

