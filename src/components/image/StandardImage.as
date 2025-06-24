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
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.graphics.BitmapFill;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import mx.styles.*;
   import spark.components.Group;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class StandardImage extends Group implements IBindingClient, IStateClient2
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _801453926_StandardImage_SetProperty1:SetProperty;
      
      private var _801453925_StandardImage_SetProperty2:SetProperty;
      
      private var _655458063_bitmapFill:BitmapFill;
      
      private var _655104686_bitmapRect:Rect;
      
      private var _1474884516_image:Image;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _initialized:Boolean = false;
      
      private var _displayClass:Boolean = false;
      
      private var _pendingDisplayIni:Boolean = false;
      
      private var _1603676584displayScale:Number = 1;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function StandardImage()
      {
         var watchers:Array;
         var i:uint;
         var bindings:Array = null;
         var target:Object = null;
         var _StandardImage_Image1_factory:DeferredInstanceFromFunction = null;
         var _StandardImage_Rect1_factory:DeferredInstanceFromFunction = null;
         var watcherSetupUtilClass:Object = null;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._StandardImage_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_components_image_StandardImageWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return StandardImage[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.maxWidth = 1;
         this.maxHeight = 1;
         this.mxmlContent = [];
         this.currentState = "bitmap";
         this.addEventListener("creationComplete",this.___StandardImage_Group1_creationComplete);
         _StandardImage_Image1_factory = new DeferredInstanceFromFunction(this._StandardImage_Image1_i);
         _StandardImage_Rect1_factory = new DeferredInstanceFromFunction(this._StandardImage_Rect1_i);
         states = [new State({
            "name":"bitmap",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_StandardImage_Rect1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),this._StandardImage_SetProperty1 = SetProperty(new SetProperty().initializeFromObject({
               "name":"maxWidth",
               "value":undefined
            })),this._StandardImage_SetProperty2 = SetProperty(new SetProperty().initializeFromObject({
               "name":"maxHeight",
               "value":undefined
            }))]
         }),new State({
            "name":"imageCentered",
            "stateGroups":["image"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_StandardImage_Image1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new SetProperty().initializeFromObject({
               "target":"_image",
               "name":"horizontalCenter",
               "value":0
            }),new SetProperty().initializeFromObject({
               "target":"_image",
               "name":"verticalCenter",
               "value":0
            })]
         }),new State({
            "name":"imageFree",
            "stateGroups":["image"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_StandardImage_Image1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         })];
         BindingManager.executeBindings(this,"_StandardImage_SetProperty1",this._StandardImage_SetProperty1);
         BindingManager.executeBindings(this,"_StandardImage_SetProperty2",this._StandardImage_SetProperty2);
         _StandardImage_Rect1_factory.getInstance();
         _StandardImage_Image1_factory.getInstance();
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         StandardImage._watcherSetupUtil = param1;
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
      
      private function init(param1:FlexEvent) : void
      {
         this._initialized = true;
         if(this._pendingDisplayIni)
         {
            this.displayClass = this._displayClass;
         }
      }
      
      public function dispose() : void
      {
         switch(currentState)
         {
            case "bitmap":
               if(this._bitmapFill.source)
               {
                  (this._bitmapFill.source as BitmapData).dispose();
                  this._bitmapFill.source = null;
               }
               break;
            case "imageCentered":
            case "imageFree":
               if(this._image.source)
               {
                  this._image.unloadAndStop(true);
               }
         }
      }
      
      public function set displayClass(param1:*) : void
      {
         this.dispose();
         switch(currentState)
         {
            case "bitmap":
               if(param1 != null && !(param1 is BitmapData))
               {
                  throw new Error("StandardImage :: " + param1 + " MUST be an BitmapData");
               }
               this._bitmapFill.source = param1;
               this._bitmapRect.width = (param1 as BitmapData).width;
               this._bitmapRect.height = (param1 as BitmapData).height;
               break;
            case "imageCentered":
            case "imageFree":
               this._image.source = param1;
         }
      }
      
      public function get displayClass() : *
      {
         switch(currentState)
         {
            case "bitmap":
               return this._bitmapFill.source;
            case "imageCentered":
            case "imageFree":
               return this._image.source;
            default:
               return null;
         }
      }
      
      private function _StandardImage_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.fill = this._StandardImage_BitmapFill1_i();
         _loc1_.initialized(this,"_bitmapRect");
         this._bitmapRect = _loc1_;
         BindingManager.executeBindings(this,"_bitmapRect",this._bitmapRect);
         return _loc1_;
      }
      
      private function _StandardImage_BitmapFill1_i() : BitmapFill
      {
         var _loc1_:BitmapFill = new BitmapFill();
         _loc1_.smooth = true;
         this._bitmapFill = _loc1_;
         BindingManager.executeBindings(this,"_bitmapFill",this._bitmapFill);
         return _loc1_;
      }
      
      private function _StandardImage_Image1_i() : Image
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
      
      public function ___StandardImage_Group1_creationComplete(param1:FlexEvent) : void
      {
         this.init(param1);
      }
      
      private function _StandardImage_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():*
         {
            return _bitmapRect.width;
         },null,"_StandardImage_SetProperty1.value");
         result[1] = new Binding(this,function():*
         {
            return _bitmapRect.width;
         },null,"_StandardImage_SetProperty2.value");
         result[2] = new Binding(this,null,null,"_bitmapRect.scaleX","displayScale");
         result[3] = new Binding(this,null,null,"_bitmapRect.scaleY","displayScale");
         result[4] = new Binding(this,null,null,"_image.scaleX","displayScale");
         result[5] = new Binding(this,null,null,"_image.scaleY","displayScale");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _StandardImage_SetProperty1() : SetProperty
      {
         return this._801453926_StandardImage_SetProperty1;
      }
      
      public function set _StandardImage_SetProperty1(param1:SetProperty) : void
      {
         var _loc2_:Object = this._801453926_StandardImage_SetProperty1;
         if(_loc2_ !== param1)
         {
            this._801453926_StandardImage_SetProperty1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_StandardImage_SetProperty1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _StandardImage_SetProperty2() : SetProperty
      {
         return this._801453925_StandardImage_SetProperty2;
      }
      
      public function set _StandardImage_SetProperty2(param1:SetProperty) : void
      {
         var _loc2_:Object = this._801453925_StandardImage_SetProperty2;
         if(_loc2_ !== param1)
         {
            this._801453925_StandardImage_SetProperty2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_StandardImage_SetProperty2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _bitmapFill() : BitmapFill
      {
         return this._655458063_bitmapFill;
      }
      
      public function set _bitmapFill(param1:BitmapFill) : void
      {
         var _loc2_:Object = this._655458063_bitmapFill;
         if(_loc2_ !== param1)
         {
            this._655458063_bitmapFill = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_bitmapFill",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _bitmapRect() : Rect
      {
         return this._655104686_bitmapRect;
      }
      
      public function set _bitmapRect(param1:Rect) : void
      {
         var _loc2_:Object = this._655104686_bitmapRect;
         if(_loc2_ !== param1)
         {
            this._655104686_bitmapRect = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_bitmapRect",_loc2_,param1));
            }
         }
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
      public function get displayScale() : Number
      {
         return this._1603676584displayScale;
      }
      
      public function set displayScale(param1:Number) : void
      {
         var _loc2_:Object = this._1603676584displayScale;
         if(_loc2_ !== param1)
         {
            this._1603676584displayScale = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"displayScale",_loc2_,param1));
            }
         }
      }
   }
}

