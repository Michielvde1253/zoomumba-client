package components.image
{
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
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import mx.styles.*;
   import spark.components.Group;
   import spark.primitives.BitmapImage;
   
   use namespace mx_internal;
   
   public class BackgroundImage extends Group implements IBindingClient, IStateClient2
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      public var _BackgroundImage_BitmapImage1:BitmapImage;
      
      private var _1889045177_BackgroundImage_Image1:Image;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _109250890scale:Number = 1;
      
      private var _embed_mxml__components_ComponentsBackgrounds_swf_BackgroundCircle2SPR_359357210:Class;
      
      private var _embed_mxml__components_ComponentsBackgrounds_swf_CircleWood_514364998:Class;
      
      private var _embed_mxml__components_ComponentsBackgrounds_swf_BackgroundCircle1SPR_359319743:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function BackgroundImage()
      {
         var watchers:Array;
         var _BackgroundImage_BitmapImage1_factory:DeferredInstanceFromFunction;
         var i:uint;
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__components_ComponentsBackgrounds_swf_BackgroundCircle2SPR_359357210 = BackgroundImage__embed_mxml__components_ComponentsBackgrounds_swf_BackgroundCircle2SPR_359357210;
         this._embed_mxml__components_ComponentsBackgrounds_swf_CircleWood_514364998 = BackgroundImage__embed_mxml__components_ComponentsBackgrounds_swf_CircleWood_514364998;
         this._embed_mxml__components_ComponentsBackgrounds_swf_BackgroundCircle1SPR_359319743 = BackgroundImage__embed_mxml__components_ComponentsBackgrounds_swf_BackgroundCircle1SPR_359319743;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._BackgroundImage_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_components_image_BackgroundImageWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return BackgroundImage[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._BackgroundImage_Image1_i()];
         this.currentState = "bevel";
         _BackgroundImage_BitmapImage1_factory = new DeferredInstanceFromFunction(this._BackgroundImage_BitmapImage1_i);
         states = [new State({
            "name":"bevel",
            "stateGroups":["bevelGroup"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_BackgroundImage_Image1",
               "name":"source",
               "value":this._embed_mxml__components_ComponentsBackgrounds_swf_BackgroundCircle1SPR_359319743
            })]
         }),new State({
            "name":"inner",
            "stateGroups":["innerGroup"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_BackgroundImage_Image1",
               "name":"source",
               "value":this._embed_mxml__components_ComponentsBackgrounds_swf_BackgroundCircle2SPR_359357210
            })]
         }),new State({
            "name":"bevelWood",
            "stateGroups":["wood","bevelGroup"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_BackgroundImage_BitmapImage1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new SetProperty().initializeFromObject({
               "target":"_BackgroundImage_Image1",
               "name":"source",
               "value":this._embed_mxml__components_ComponentsBackgrounds_swf_BackgroundCircle1SPR_359319743
            })]
         }),new State({
            "name":"innerWood",
            "stateGroups":["wood","innerGroup"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_BackgroundImage_BitmapImage1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new SetProperty().initializeFromObject({
               "target":"_BackgroundImage_Image1",
               "name":"source",
               "value":this._embed_mxml__components_ComponentsBackgrounds_swf_BackgroundCircle2SPR_359357210
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
         BackgroundImage._watcherSetupUtil = param1;
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
      
      private function _BackgroundImage_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.horizontalCenter = 0;
         _loc1_.scaleX = 1.8;
         _loc1_.scaleY = 1.8;
         _loc1_.smooth = true;
         _loc1_.source = this._embed_mxml__components_ComponentsBackgrounds_swf_CircleWood_514364998;
         _loc1_.verticalCenter = 0;
         _loc1_.initialized(this,"_BackgroundImage_BitmapImage1");
         this._BackgroundImage_BitmapImage1 = _loc1_;
         BindingManager.executeBindings(this,"_BackgroundImage_BitmapImage1",this._BackgroundImage_BitmapImage1);
         return _loc1_;
      }
      
      private function _BackgroundImage_Image1_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.width = 118;
         _loc1_.height = 118;
         _loc1_.maxWidth = 118;
         _loc1_.maxHeight = 118;
         _loc1_.cacheAsBitmap = true;
         _loc1_.horizontalCenter = 9;
         _loc1_.verticalCenter = 8;
         _loc1_.id = "_BackgroundImage_Image1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._BackgroundImage_Image1 = _loc1_;
         BindingManager.executeBindings(this,"_BackgroundImage_Image1",this._BackgroundImage_Image1);
         return _loc1_;
      }
      
      private function _BackgroundImage_bindingsSetup() : Array
      {
         var _loc1_:Array = [];
         _loc1_[0] = new Binding(this,null,null,"this.scaleX","scale");
         _loc1_[1] = new Binding(this,null,null,"this.scaleY","scale");
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _BackgroundImage_Image1() : Image
      {
         return this._1889045177_BackgroundImage_Image1;
      }
      
      public function set _BackgroundImage_Image1(param1:Image) : void
      {
         var _loc2_:Object = this._1889045177_BackgroundImage_Image1;
         if(_loc2_ !== param1)
         {
            this._1889045177_BackgroundImage_Image1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_BackgroundImage_Image1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get scale() : Number
      {
         return this._109250890scale;
      }
      
      public function set scale(param1:Number) : void
      {
         var _loc2_:Object = this._109250890scale;
         if(_loc2_ !== param1)
         {
            this._109250890scale = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scale",_loc2_,param1));
            }
         }
      }
   }
}

