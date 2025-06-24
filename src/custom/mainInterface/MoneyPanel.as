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
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.graphics.BitmapFill;
   import mx.states.SetProperty;
   import mx.states.State;
   import mx.styles.*;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.VGroup;
   import spark.primitives.BitmapImage;
   import spark.primitives.Path;
   
   use namespace mx_internal;
   
   public class MoneyPanel extends Group implements IBindingClient, IStateClient2
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      public var _MoneyPanel_GradientText1:GradientText;
      
      public var _MoneyPanel_GradientText2:GradientText;
      
      private var _1206365389_MoneyPanel_Image2:Image;
      
      private var _1206365388_MoneyPanel_Image3:Image;
      
      private var _1206365387_MoneyPanel_Image4:Image;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _169673567firstValue:String = "";
      
      private var _256574813secondValue:String = "";
      
      private var _embed_mxml__general_Decorations_swf_ZooDollar_1091307755:Class;
      
      private var _embed_mxml__general_Decorations_swf_PetPaw_1083129188:Class;
      
      private var _embed_mxml__components_ComponentIcons_swf_MoneyBagSpecial_1184018718:Class;
      
      private var _embed_mxml__general_Decorations_swf_Trash_822848217:Class;
      
      private var _embed_mxml__general_Decorations_swf_Pearls_1082597138:Class;
      
      private var _embed_mxml__general_Patterns_swf_PatternNormal_213163820:Class;
      
      private var _embed_mxml__components_ComponentIcons_swf_MoneyBagNormal_574937856:Class;
      
      private var _embed_mxml__general_Patterns_swf_HPatternYellowLine_636921743:Class;
      
      private var _embed_mxml__general_Decorations_swf_PetPenny_869510186:Class;
      
      private var _embed_mxml__custom_HUD_swf_CurrencyForeground_1711629069:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function MoneyPanel()
      {
         var watchers:Array;
         var i:uint;
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__general_Decorations_swf_ZooDollar_1091307755 = MoneyPanel__embed_mxml__general_Decorations_swf_ZooDollar_1091307755;
         this._embed_mxml__general_Decorations_swf_PetPaw_1083129188 = MoneyPanel__embed_mxml__general_Decorations_swf_PetPaw_1083129188;
         this._embed_mxml__components_ComponentIcons_swf_MoneyBagSpecial_1184018718 = MoneyPanel__embed_mxml__components_ComponentIcons_swf_MoneyBagSpecial_1184018718;
         this._embed_mxml__general_Decorations_swf_Trash_822848217 = MoneyPanel__embed_mxml__general_Decorations_swf_Trash_822848217;
         this._embed_mxml__general_Decorations_swf_Pearls_1082597138 = MoneyPanel__embed_mxml__general_Decorations_swf_Pearls_1082597138;
         this._embed_mxml__general_Patterns_swf_PatternNormal_213163820 = MoneyPanel__embed_mxml__general_Patterns_swf_PatternNormal_213163820;
         this._embed_mxml__components_ComponentIcons_swf_MoneyBagNormal_574937856 = MoneyPanel__embed_mxml__components_ComponentIcons_swf_MoneyBagNormal_574937856;
         this._embed_mxml__general_Patterns_swf_HPatternYellowLine_636921743 = MoneyPanel__embed_mxml__general_Patterns_swf_HPatternYellowLine_636921743;
         this._embed_mxml__general_Decorations_swf_PetPenny_869510186 = MoneyPanel__embed_mxml__general_Decorations_swf_PetPenny_869510186;
         this._embed_mxml__custom_HUD_swf_CurrencyForeground_1711629069 = MoneyPanel__embed_mxml__custom_HUD_swf_CurrencyForeground_1711629069;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._MoneyPanel_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_custom_mainInterface_MoneyPanelWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return MoneyPanel[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mouseChildren = false;
         this.mouseEnabled = true;
         this.buttonMode = true;
         this.useHandCursor = true;
         this.cacheAsBitmap = true;
         this.mxmlContent = [this._MoneyPanel_Path1_c(),this._MoneyPanel_BitmapImage1_c(),this._MoneyPanel_Image1_c(),this._MoneyPanel_Image2_i(),this._MoneyPanel_VGroup1_c()];
         this.currentState = "normal";
         states = [new State({
            "name":"normal",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_MoneyPanel_Image2",
               "name":"source",
               "value":this._embed_mxml__components_ComponentIcons_swf_MoneyBagNormal_574937856
            }),new SetProperty().initializeFromObject({
               "target":"_MoneyPanel_Image3",
               "name":"source",
               "value":this._embed_mxml__general_Decorations_swf_ZooDollar_1091307755
            }),new SetProperty().initializeFromObject({
               "target":"_MoneyPanel_Image4",
               "name":"source",
               "value":this._embed_mxml__general_Decorations_swf_PetPenny_869510186
            })]
         }),new State({
            "name":"special",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_MoneyPanel_Image2",
               "name":"source",
               "value":this._embed_mxml__components_ComponentIcons_swf_MoneyBagSpecial_1184018718
            }),new SetProperty().initializeFromObject({
               "target":"_MoneyPanel_Image3",
               "name":"source",
               "value":this._embed_mxml__general_Decorations_swf_PetPaw_1083129188
            }),new SetProperty().initializeFromObject({
               "target":"_MoneyPanel_Image4",
               "name":"source",
               "value":this._embed_mxml__general_Decorations_swf_Trash_822848217
            })]
         }),new State({
            "name":"ocean",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_MoneyPanel_Image2",
               "name":"source",
               "value":this._embed_mxml__components_ComponentIcons_swf_MoneyBagSpecial_1184018718
            }),new SetProperty().initializeFromObject({
               "target":"_MoneyPanel_Image3",
               "name":"source",
               "value":this._embed_mxml__general_Decorations_swf_Pearls_1082597138
            }),new SetProperty().initializeFromObject({
               "target":"_MoneyPanel_Image4",
               "name":"source",
               "value":this._embed_mxml__general_Decorations_swf_Trash_822848217
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
         MoneyPanel._watcherSetupUtil = param1;
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
      
      private function _MoneyPanel_Path1_c() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.x = 4;
         _loc1_.y = 4;
         _loc1_.data = "M139.95 28.15Q140.6 32.05 139.8 33.55 139.05 34.8 137.95 35.15 136.75 35.45 133.2 35.45L44.05 35.45 43.9 35.75Q43 37.3 41.85 38.65L41.85 38.7Q38.55 42.65 33.85 44.9 29 47.25 23.6 47.25 13.85 47.25 6.95 40.35 0 33.4 0 23.6 0 13.85 6.95 6.95 13.85    0 23.6 0 28.6 0 33.2 2 37.6 3.95 40.85 7.5L41.05 7.7 125.75 7.8Q130.35 7.9 136.95 19.55 139.2 23.55 139.95 28.15";
         _loc1_.scaleX = 1.01;
         _loc1_.scaleY = 1.01;
         _loc1_.fill = this._MoneyPanel_BitmapFill1_c();
         _loc1_.initialized(this,null);
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _MoneyPanel_BitmapFill1_c() : BitmapFill
      {
         var _loc1_:BitmapFill = new BitmapFill();
         _loc1_.fillMode = "repeat";
         _loc1_.source = this._embed_mxml__general_Patterns_swf_PatternNormal_213163820;
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _MoneyPanel_BitmapImage1_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.x = 65;
         _loc1_.y = 25;
         _loc1_.width = 65;
         _loc1_.fillMode = "repeat";
         _loc1_.source = this._embed_mxml__general_Patterns_swf_HPatternYellowLine_636921743;
         _loc1_.initialized(this,null);
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _MoneyPanel_Image1_c() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.source = this._embed_mxml__custom_HUD_swf_CurrencyForeground_1711629069;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _MoneyPanel_Image2_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.left = 1;
         _loc1_.verticalCenter = 0;
         _loc1_.id = "_MoneyPanel_Image2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._MoneyPanel_Image2 = _loc1_;
         BindingManager.executeBindings(this,"_MoneyPanel_Image2",this._MoneyPanel_Image2);
         return _loc1_;
      }
      
      private function _MoneyPanel_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.left = 48;
         _loc1_.gap = -9;
         _loc1_.verticalCenter = -2;
         _loc1_.mxmlContent = [this._MoneyPanel_HGroup1_c(),this._MoneyPanel_HGroup2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _MoneyPanel_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.gap = -1;
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._MoneyPanel_Image3_i(),this._MoneyPanel_GradientText1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _MoneyPanel_Image3_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.scaleX = 0.42;
         _loc1_.scaleY = 0.42;
         _loc1_.id = "_MoneyPanel_Image3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._MoneyPanel_Image3 = _loc1_;
         BindingManager.executeBindings(this,"_MoneyPanel_Image3",this._MoneyPanel_Image3);
         return _loc1_;
      }
      
      private function _MoneyPanel_GradientText1_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.fontSize = 10;
         _loc1_.id = "_MoneyPanel_GradientText1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._MoneyPanel_GradientText1 = _loc1_;
         BindingManager.executeBindings(this,"_MoneyPanel_GradientText1",this._MoneyPanel_GradientText1);
         return _loc1_;
      }
      
      private function _MoneyPanel_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.gap = -1;
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._MoneyPanel_Image4_i(),this._MoneyPanel_GradientText2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _MoneyPanel_Image4_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.scaleX = 0.42;
         _loc1_.scaleY = 0.42;
         _loc1_.id = "_MoneyPanel_Image4";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._MoneyPanel_Image4 = _loc1_;
         BindingManager.executeBindings(this,"_MoneyPanel_Image4",this._MoneyPanel_Image4);
         return _loc1_;
      }
      
      private function _MoneyPanel_GradientText2_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.fontSize = 10;
         _loc1_.id = "_MoneyPanel_GradientText2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._MoneyPanel_GradientText2 = _loc1_;
         BindingManager.executeBindings(this,"_MoneyPanel_GradientText2",this._MoneyPanel_GradientText2);
         return _loc1_;
      }
      
      private function _MoneyPanel_bindingsSetup() : Array
      {
         var _loc1_:Array = [];
         _loc1_[0] = new Binding(this,null,null,"_MoneyPanel_GradientText1.text","firstValue");
         _loc1_[1] = new Binding(this,null,null,"_MoneyPanel_GradientText2.text","secondValue");
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _MoneyPanel_Image2() : Image
      {
         return this._1206365389_MoneyPanel_Image2;
      }
      
      public function set _MoneyPanel_Image2(param1:Image) : void
      {
         var _loc2_:Object = this._1206365389_MoneyPanel_Image2;
         if(_loc2_ !== param1)
         {
            this._1206365389_MoneyPanel_Image2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_MoneyPanel_Image2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _MoneyPanel_Image3() : Image
      {
         return this._1206365388_MoneyPanel_Image3;
      }
      
      public function set _MoneyPanel_Image3(param1:Image) : void
      {
         var _loc2_:Object = this._1206365388_MoneyPanel_Image3;
         if(_loc2_ !== param1)
         {
            this._1206365388_MoneyPanel_Image3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_MoneyPanel_Image3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _MoneyPanel_Image4() : Image
      {
         return this._1206365387_MoneyPanel_Image4;
      }
      
      public function set _MoneyPanel_Image4(param1:Image) : void
      {
         var _loc2_:Object = this._1206365387_MoneyPanel_Image4;
         if(_loc2_ !== param1)
         {
            this._1206365387_MoneyPanel_Image4 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_MoneyPanel_Image4",_loc2_,param1));
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
   }
}

