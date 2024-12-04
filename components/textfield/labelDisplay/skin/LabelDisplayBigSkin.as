package components.textfield.labelDisplay.skin
{
   import components.textfield.gradientText.GradientText;
   import components.textfield.labelDisplay.LabelDisplay;
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
   import mx.states.SetProperty;
   import mx.states.State;
   import mx.styles.*;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.supportClasses.Skin;
   import utils.GUIHelper;
   
   use namespace mx_internal;
   
   public class LabelDisplayBigSkin extends Skin implements IBindingClient, IStateClient2
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      public var _LabelDisplayBigSkin_GradientText1:GradientText;
      
      public var _LabelDisplayBigSkin_Group1:Group;
      
      private var _1474884516_image:Image;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__general_Decorations_swf_PetPawIcon_912647759:Class;
      
      private var _embed_mxml__general_Decorations_swf_ClockRedIcon_694477795:Class;
      
      private var _embed_mxml__general_Decorations_swf_CurrencyColl1_631097573:Class;
      
      private var _embed_mxml__general_Decorations_swf_XpIcon_1230327042:Class;
      
      private var _embed_mxml__general_Decorations_swf_CurrencyGold_1982390658:Class;
      
      private var _embed_mxml__general_Decorations_swf_CurrencySilver_1694188131:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:LabelDisplay;
      
      public function LabelDisplayBigSkin()
      {
         var watchers:Array;
         var i:uint;
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__general_Decorations_swf_PetPawIcon_912647759 = LabelDisplayBigSkin__embed_mxml__general_Decorations_swf_PetPawIcon_912647759;
         this._embed_mxml__general_Decorations_swf_ClockRedIcon_694477795 = LabelDisplayBigSkin__embed_mxml__general_Decorations_swf_ClockRedIcon_694477795;
         this._embed_mxml__general_Decorations_swf_CurrencyColl1_631097573 = LabelDisplayBigSkin__embed_mxml__general_Decorations_swf_CurrencyColl1_631097573;
         this._embed_mxml__general_Decorations_swf_XpIcon_1230327042 = LabelDisplayBigSkin__embed_mxml__general_Decorations_swf_XpIcon_1230327042;
         this._embed_mxml__general_Decorations_swf_CurrencyGold_1982390658 = LabelDisplayBigSkin__embed_mxml__general_Decorations_swf_CurrencyGold_1982390658;
         this._embed_mxml__general_Decorations_swf_CurrencySilver_1694188131 = LabelDisplayBigSkin__embed_mxml__general_Decorations_swf_CurrencySilver_1694188131;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._LabelDisplayBigSkin_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_components_textfield_labelDisplay_skin_LabelDisplayBigSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return LabelDisplayBigSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._LabelDisplayBigSkin_HGroup1_c()];
         this.currentState = "none";
         states = [new State({
            "name":"none",
            "overrides":[]
         }),new State({
            "name":"xp",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_image",
               "name":"source",
               "value":this._embed_mxml__general_Decorations_swf_XpIcon_1230327042
            })]
         }),new State({
            "name":"petPenny",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_image",
               "name":"source",
               "value":this._embed_mxml__general_Decorations_swf_CurrencySilver_1694188131
            })]
         }),new State({
            "name":"petPaw",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_image",
               "name":"source",
               "value":this._embed_mxml__general_Decorations_swf_PetPawIcon_912647759
            })]
         }),new State({
            "name":"zooDollar",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_image",
               "name":"source",
               "value":this._embed_mxml__general_Decorations_swf_CurrencyGold_1982390658
            })]
         }),new State({
            "name":"hourglass",
            "overrides":[]
         }),new State({
            "name":"clock_red",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_image",
               "name":"source",
               "value":this._embed_mxml__general_Decorations_swf_ClockRedIcon_694477795
            })]
         }),new State({
            "name":"collectable_1",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_image",
               "name":"source",
               "value":this._embed_mxml__general_Decorations_swf_CurrencyColl1_631097573
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
         LabelDisplayBigSkin._watcherSetupUtil = param1;
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
      
      private function _LabelDisplayBigSkin_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.gap = 0;
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._LabelDisplayBigSkin_Group1_i(),this._LabelDisplayBigSkin_GradientText1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _LabelDisplayBigSkin_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._LabelDisplayBigSkin_Image1_i()];
         _loc1_.id = "_LabelDisplayBigSkin_Group1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._LabelDisplayBigSkin_Group1 = _loc1_;
         BindingManager.executeBindings(this,"_LabelDisplayBigSkin_Group1",this._LabelDisplayBigSkin_Group1);
         return _loc1_;
      }
      
      private function _LabelDisplayBigSkin_Image1_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.id = "_image";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._image = _loc1_;
         BindingManager.executeBindings(this,"_image",this._image);
         return _loc1_;
      }
      
      private function _LabelDisplayBigSkin_GradientText1_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.fontFamily = "Tahoma";
         _loc1_.fontWeight = "bold";
         _loc1_.fontSize = 15;
         _loc1_.textAlign = "right";
         _loc1_.paddingLeft = 3;
         _loc1_.id = "_LabelDisplayBigSkin_GradientText1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._LabelDisplayBigSkin_GradientText1 = _loc1_;
         BindingManager.executeBindings(this,"_LabelDisplayBigSkin_GradientText1",this._LabelDisplayBigSkin_GradientText1);
         return _loc1_;
      }
      
      private function _LabelDisplayBigSkin_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Number
         {
            return hostComponent._imgWidth;
         },null,"_LabelDisplayBigSkin_Group1.width");
         result[1] = new Binding(this,function():Number
         {
            return hostComponent._imgHeight;
         },null,"_LabelDisplayBigSkin_Group1.height");
         result[2] = new Binding(this,function():Number
         {
            return hostComponent._scale;
         },null,"_LabelDisplayBigSkin_Group1.scaleX");
         result[3] = new Binding(this,function():Number
         {
            return hostComponent._scale;
         },null,"_LabelDisplayBigSkin_Group1.scaleY");
         result[4] = new Binding(this,function():String
         {
            var _loc1_:* = GUIHelper.getStringFormattedValue(hostComponent.value);
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_LabelDisplayBigSkin_GradientText1.text");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _image() : Image
      {
         return this._1474884516_image;
      }
      
      public function set _image(param1:Image) : void
      {
         var _loc2_:Object = this._1474884516_image;
         if(_loc2_ !== param1)
         {
            this._1474884516_image = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_image",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : LabelDisplay
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:LabelDisplay) : void
      {
         var _loc2_:Object = this._213507019hostComponent;
         if(_loc2_ !== param1)
         {
            this._213507019hostComponent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hostComponent",_loc2_,param1));
            }
         }
      }
   }
}
