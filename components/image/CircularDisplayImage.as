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
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.graphics.SolidColor;
   import mx.states.AddItems;
   import mx.states.State;
   import mx.styles.*;
   import spark.components.Group;
   import spark.primitives.Path;
   
   use namespace mx_internal;
   
   public class CircularDisplayImage extends Group implements IBindingClient, IStateClient2
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _1496519163_CircularDisplayImage_Group2:Group;
      
      public var _CircularDisplayImage_Path1:Path;
      
      public var _CircularDisplayImage_Path2:Path;
      
      private var _1498356383_standardImage:StandardImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _63404610maskScale:Number = 1;
      
      private var _682098937paddingDisplayX:int = 0;
      
      private var _682098936paddingDisplayY:int = 0;
      
      private var _633806967bitmapDisplayScale:Number = 1;
      
      private var _1789390533maskRectBottom:int = 30;
      
      private var _1745596342automaticCentralize:Boolean = true;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function CircularDisplayImage()
      {
         var watchers:Array;
         var _CircularDisplayImage_Group3_factory:DeferredInstanceFromFunction;
         var _CircularDisplayImage_Path1_factory:DeferredInstanceFromFunction;
         var _CircularDisplayImage_Path2_factory:DeferredInstanceFromFunction;
         var i:uint;
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._CircularDisplayImage_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_components_image_CircularDisplayImageWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return CircularDisplayImage[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._CircularDisplayImage_Group2_i()];
         this.currentState = "normal";
         _CircularDisplayImage_Group3_factory = new DeferredInstanceFromFunction(this._CircularDisplayImage_Group3_i);
         _CircularDisplayImage_Path1_factory = new DeferredInstanceFromFunction(this._CircularDisplayImage_Path1_i);
         _CircularDisplayImage_Path2_factory = new DeferredInstanceFromFunction(this._CircularDisplayImage_Path2_i);
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"maskCircle",
            "stateGroups":["mask"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_CircularDisplayImage_Path1_factory,
               "destination":"mask",
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_CircularDisplayImage_Group3_factory,
               "destination":"_CircularDisplayImage_Group2",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_standardImage"]
            })]
         }),new State({
            "name":"maskRect",
            "stateGroups":["mask"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_CircularDisplayImage_Path2_factory,
               "destination":"mask",
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_CircularDisplayImage_Group3_factory,
               "destination":"_CircularDisplayImage_Group2",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_standardImage"]
            })]
         }),new State({
            "name":"maskCombined",
            "stateGroups":["mask"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_CircularDisplayImage_Path2_factory,
               "destination":"mask",
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_CircularDisplayImage_Path1_factory,
               "destination":"mask",
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_CircularDisplayImage_Group3_factory,
               "destination":"_CircularDisplayImage_Group2",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_standardImage"]
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
         CircularDisplayImage._watcherSetupUtil = param1;
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
      
      public function set spriteClassDisplay(param1:*) : void
      {
         this._standardImage.currentState = this.automaticCentralize ? "imageCentered" : "imageFree";
         this._standardImage.displayClass = param1;
      }
      
      public function get spriteClassDisplay() : *
      {
         return this._standardImage.displayClass;
      }
      
      public function set bitmapDataDisplay(param1:BitmapData) : void
      {
         this._standardImage.currentState = "bitmap";
         this._standardImage.displayClass = param1;
      }
      
      public function dispose() : void
      {
         this._standardImage.dispose();
      }
      
      private function _CircularDisplayImage_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.maxWidth = 1;
         _loc1_.maxHeight = 1;
         _loc1_.mxmlContent = [this._CircularDisplayImage_StandardImage1_i()];
         _loc1_.id = "_CircularDisplayImage_Group2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CircularDisplayImage_Group2 = _loc1_;
         BindingManager.executeBindings(this,"_CircularDisplayImage_Group2",this._CircularDisplayImage_Group2);
         return _loc1_;
      }
      
      private function _CircularDisplayImage_StandardImage1_i() : StandardImage
      {
         var _loc1_:StandardImage = new StandardImage();
         _loc1_.mouseEnabled = false;
         _loc1_.focusEnabled = false;
         _loc1_.id = "_standardImage";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._standardImage = _loc1_;
         BindingManager.executeBindings(this,"_standardImage",this._standardImage);
         return _loc1_;
      }
      
      private function _CircularDisplayImage_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [];
         _loc1_.id = "mask";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         mask = _loc1_;
         BindingManager.executeBindings(this,"mask",mask);
         return _loc1_;
      }
      
      private function _CircularDisplayImage_Path1_i() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.data = "M78.35 21.4Q90.35 33.35 90.35 49.85 90.35 66.8 78.35 78.4 66.7 90.4 49.95 90.4 33.25 90.4 21.3 78.4 9.65 66.8 9.65 49.85 9.65 33.35 21.3 21.4 33.25 9.6 49.95 9.6 66.7 9.6 78.35 21.4";
         _loc1_.fill = this._CircularDisplayImage_SolidColor1_c();
         _loc1_.initialized(this,"_CircularDisplayImage_Path1");
         this._CircularDisplayImage_Path1 = _loc1_;
         BindingManager.executeBindings(this,"_CircularDisplayImage_Path1",this._CircularDisplayImage_Path1);
         return _loc1_;
      }
      
      private function _CircularDisplayImage_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16711680;
         _loc1_.alpha = 0.5;
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CircularDisplayImage_Path2_i() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.data = "M200 90.95 -100 90.95 -100 -209 200 -209 200 90.95";
         _loc1_.fill = this._CircularDisplayImage_SolidColor2_c();
         _loc1_.initialized(this,"_CircularDisplayImage_Path2");
         this._CircularDisplayImage_Path2 = _loc1_;
         BindingManager.executeBindings(this,"_CircularDisplayImage_Path2",this._CircularDisplayImage_Path2);
         return _loc1_;
      }
      
      private function _CircularDisplayImage_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16711680;
         _loc1_.alpha = 0.5;
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CircularDisplayImage_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,null,null,"_standardImage.displayScale","bitmapDisplayScale");
         result[1] = new Binding(this,function():Object
         {
            return maskScale * 68 + paddingDisplayY;
         },null,"_standardImage.verticalCenter");
         result[2] = new Binding(this,function():Object
         {
            return maskScale * 66 + paddingDisplayX;
         },null,"_standardImage.horizontalCenter");
         result[3] = new Binding(this,function():Number
         {
            return maskScale * 18;
         },null,"mask.x");
         result[4] = new Binding(this,function():Number
         {
            return maskScale * 16;
         },null,"mask.y");
         result[5] = new Binding(this,null,null,"mask.scaleX","maskScale");
         result[6] = new Binding(this,null,null,"mask.scaleY","maskScale");
         result[7] = new Binding(this,function():Number
         {
            return -maskRectBottom;
         },null,"_CircularDisplayImage_Path2.y");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _CircularDisplayImage_Group2() : Group
      {
         return this._1496519163_CircularDisplayImage_Group2;
      }
      
      public function set _CircularDisplayImage_Group2(param1:Group) : void
      {
         var _loc2_:Object = this._1496519163_CircularDisplayImage_Group2;
         if(_loc2_ !== param1)
         {
            this._1496519163_CircularDisplayImage_Group2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_CircularDisplayImage_Group2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _standardImage() : StandardImage
      {
         return this._1498356383_standardImage;
      }
      
      public function set _standardImage(param1:StandardImage) : void
      {
         var _loc2_:Object = this._1498356383_standardImage;
         if(_loc2_ !== param1)
         {
            this._1498356383_standardImage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_standardImage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get maskScale() : Number
      {
         return this._63404610maskScale;
      }
      
      public function set maskScale(param1:Number) : void
      {
         var _loc2_:Object = this._63404610maskScale;
         if(_loc2_ !== param1)
         {
            this._63404610maskScale = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"maskScale",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get paddingDisplayX() : int
      {
         return this._682098937paddingDisplayX;
      }
      
      public function set paddingDisplayX(param1:int) : void
      {
         var _loc2_:Object = this._682098937paddingDisplayX;
         if(_loc2_ !== param1)
         {
            this._682098937paddingDisplayX = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"paddingDisplayX",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get paddingDisplayY() : int
      {
         return this._682098936paddingDisplayY;
      }
      
      public function set paddingDisplayY(param1:int) : void
      {
         var _loc2_:Object = this._682098936paddingDisplayY;
         if(_loc2_ !== param1)
         {
            this._682098936paddingDisplayY = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"paddingDisplayY",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bitmapDisplayScale() : Number
      {
         return this._633806967bitmapDisplayScale;
      }
      
      public function set bitmapDisplayScale(param1:Number) : void
      {
         var _loc2_:Object = this._633806967bitmapDisplayScale;
         if(_loc2_ !== param1)
         {
            this._633806967bitmapDisplayScale = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bitmapDisplayScale",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get maskRectBottom() : int
      {
         return this._1789390533maskRectBottom;
      }
      
      public function set maskRectBottom(param1:int) : void
      {
         var _loc2_:Object = this._1789390533maskRectBottom;
         if(_loc2_ !== param1)
         {
            this._1789390533maskRectBottom = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"maskRectBottom",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get automaticCentralize() : Boolean
      {
         return this._1745596342automaticCentralize;
      }
      
      public function set automaticCentralize(param1:Boolean) : void
      {
         var _loc2_:Object = this._1745596342automaticCentralize;
         if(_loc2_ !== param1)
         {
            this._1745596342automaticCentralize = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"automaticCentralize",_loc2_,param1));
            }
         }
      }
   }
}

