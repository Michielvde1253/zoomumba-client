package custom.features.zooWheel
{
   import com.bigpoint.utils.AngleUtils;
   import com.greensock.TweenMax;
   import com.greensock.easing.Linear;
   import com.greensock.easing.Quart;
   import custom.features.zooWheel.events.ZooWheelRewardEvent;
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
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.states.AddItems;
   import mx.states.State;
   import mx.states.Transition;
   import mx.styles.*;
   import spark.components.Group;
   import spark.effects.Fade;
   import spark.primitives.BitmapImage;
   
   use namespace mx_internal;
   
   public class ZooWheelBirdArrow extends Group implements IBindingClient, IStateClient2
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      public static var TIMES_NORMAL_SPINNING:uint = 5;
      
      public static var TIMES_FAST_FORWARD_SPINNING:uint = 5;
      
      public var _ZooWheelBirdArrow_BitmapImage5:BitmapImage;
      
      public var _ZooWheelBirdArrow_Fade1:Fade;
      
      private var _1027673278_ZooWheelBirdArrow_Group2:Group;
      
      private var _237548704bitmapImageIdle:BitmapImage;
      
      private var _1831206366bitmapImagePointing:BitmapImage;
      
      private var _644152451bitmapImageSpinFull:BitmapImage;
      
      private var _1518076212bitmapImageSpinStart:BitmapImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private const ANGLE_IMAGE_POINTING:int = 27;
      
      private var _1111633711sourceNail:Object;
      
      private var _1111779697sourceIdle:Object;
      
      private var _897377907sourcePointing:Object;
      
      private var _922230572sourceSpinFull:Object;
      
      private var _1463657627sourceSpinStart:Object;
      
      private var _birdGroup:Group;
      
      private var _indexEnd:int;
      
      private var _rewardEvent:ZooWheelRewardEvent;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ZooWheelBirdArrow()
      {
         var bindings:Array;
         var watchers:Array;
         var _ZooWheelBirdArrow_BitmapImage1_factory:DeferredInstanceFromFunction;
         var _ZooWheelBirdArrow_BitmapImage2_factory:DeferredInstanceFromFunction;
         var _ZooWheelBirdArrow_BitmapImage3_factory:DeferredInstanceFromFunction;
         var _ZooWheelBirdArrow_BitmapImage4_factory:DeferredInstanceFromFunction;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._rewardEvent = new ZooWheelRewardEvent(ZooWheelRewardEvent.STOPPED_AT_REWARD);
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._ZooWheelBirdArrow_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_custom_features_zooWheel_ZooWheelBirdArrowWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ZooWheelBirdArrow[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 363;
         this.height = 340;
         this.transitions = [this._ZooWheelBirdArrow_Transition1_c()];
         this.mxmlContent = [this._ZooWheelBirdArrow_Group2_i(),this._ZooWheelBirdArrow_BitmapImage5_i()];
         this.currentState = "idle";
         _ZooWheelBirdArrow_BitmapImage1_factory = new DeferredInstanceFromFunction(this._ZooWheelBirdArrow_BitmapImage1_i);
         _ZooWheelBirdArrow_BitmapImage2_factory = new DeferredInstanceFromFunction(this._ZooWheelBirdArrow_BitmapImage2_i);
         _ZooWheelBirdArrow_BitmapImage3_factory = new DeferredInstanceFromFunction(this._ZooWheelBirdArrow_BitmapImage3_i);
         _ZooWheelBirdArrow_BitmapImage4_factory = new DeferredInstanceFromFunction(this._ZooWheelBirdArrow_BitmapImage4_i);
         states = [new State({
            "name":"idle",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_ZooWheelBirdArrow_BitmapImage1_factory,
               "destination":"_ZooWheelBirdArrow_Group2",
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"spinningSlow",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_ZooWheelBirdArrow_BitmapImage2_factory,
               "destination":"_ZooWheelBirdArrow_Group2",
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"spinningFast",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_ZooWheelBirdArrow_BitmapImage3_factory,
               "destination":"_ZooWheelBirdArrow_Group2",
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"pointing",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_ZooWheelBirdArrow_BitmapImage4_factory,
               "destination":"_ZooWheelBirdArrow_Group2",
               "propertyName":"mxmlContent",
               "position":"first"
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
         ZooWheelBirdArrow._watcherSetupUtil = param1;
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
      
      private function internalGroupInit(param1:FlexEvent) : void
      {
         this._birdGroup = param1.currentTarget as Group;
      }
      
      public function spin() : void
      {
         this._indexEnd = -1;
         TweenMax.killTweensOf(this._birdGroup);
         TweenMax.to(this._birdGroup,1,{
            "rotation":-360,
            "ease":Quart.easeIn,
            "onComplete":this.spinSlow
         });
      }
      
      public function reset() : void
      {
         this._indexEnd = -1;
         currentState = "idle";
         TweenMax.killTweensOf(this._birdGroup);
         TweenMax.to(this._birdGroup,1,{
            "rotation":-360,
            "ease":Quart.easeInOut
         });
      }
      
      private function spinSlow() : void
      {
         currentState = "spinningSlow";
         TweenMax.killTweensOf(this._birdGroup);
         TweenMax.to(this._birdGroup,0.2 * TIMES_NORMAL_SPINNING,{
            "rotation":-360 * TIMES_NORMAL_SPINNING,
            "ease":Linear.easeNone,
            "onComplete":this.spinFast
         });
      }
      
      private function spinFast() : void
      {
         currentState = "spinningFast";
         TweenMax.killTweensOf(this._birdGroup);
         TweenMax.to(this._birdGroup,0.1,{
            "rotation":-360,
            "onComplete":this.spinFast
         });
      }
      
      public function stopAt(param1:int) : void
      {
         if(currentState != "pointing")
         {
            currentState = "pointing";
            this._rewardEvent.index = this._indexEnd = param1;
            TweenMax.killTweensOf(this._birdGroup);
            TweenMax.to(this._birdGroup,0.2 * TIMES_FAST_FORWARD_SPINNING,{
               "rotation":-360 * TIMES_FAST_FORWARD_SPINNING + AngleUtils.getDegreeRotation(this._indexEnd,-Math.PI / 8,Math.PI / 4) + this.ANGLE_IMAGE_POINTING,
               "ease":Quart.easeOut,
               "onComplete":this.pointingEnd
            });
         }
      }
      
      private function pointingEnd() : void
      {
         dispatchEvent(this._rewardEvent);
      }
      
      public function dispose() : void
      {
         currentState = "idle";
         TweenMax.killTweensOf(this._birdGroup);
      }
      
      private function _ZooWheelBirdArrow_Transition1_c() : Transition
      {
         var _loc1_:Transition = new Transition();
         _loc1_.autoReverse = true;
         _loc1_.effect = this._ZooWheelBirdArrow_Fade1_i();
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ZooWheelBirdArrow_Fade1_i() : Fade
      {
         var _loc1_:Fade = new Fade();
         _loc1_.duration = 500;
         this._ZooWheelBirdArrow_Fade1 = _loc1_;
         BindingManager.executeBindings(this,"_ZooWheelBirdArrow_Fade1",this._ZooWheelBirdArrow_Fade1);
         return _loc1_;
      }
      
      private function _ZooWheelBirdArrow_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.rotation = 0;
         _loc1_.mxmlContent = [];
         _loc1_.addEventListener("preinitialize",this.___ZooWheelBirdArrow_Group2_preinitialize);
         _loc1_.id = "_ZooWheelBirdArrow_Group2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ZooWheelBirdArrow_Group2 = _loc1_;
         BindingManager.executeBindings(this,"_ZooWheelBirdArrow_Group2",this._ZooWheelBirdArrow_Group2);
         return _loc1_;
      }
      
      private function _ZooWheelBirdArrow_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.x = -45;
         _loc1_.y = -65;
         _loc1_.smooth = true;
         _loc1_.initialized(this,"bitmapImageIdle");
         this.bitmapImageIdle = _loc1_;
         BindingManager.executeBindings(this,"bitmapImageIdle",this.bitmapImageIdle);
         return _loc1_;
      }
      
      private function _ZooWheelBirdArrow_BitmapImage2_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.x = -110;
         _loc1_.y = -170;
         _loc1_.smooth = true;
         _loc1_.initialized(this,"bitmapImageSpinStart");
         this.bitmapImageSpinStart = _loc1_;
         BindingManager.executeBindings(this,"bitmapImageSpinStart",this.bitmapImageSpinStart);
         return _loc1_;
      }
      
      private function _ZooWheelBirdArrow_BitmapImage3_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.x = -180;
         _loc1_.y = -168;
         _loc1_.smooth = true;
         _loc1_.initialized(this,"bitmapImageSpinFull");
         this.bitmapImageSpinFull = _loc1_;
         BindingManager.executeBindings(this,"bitmapImageSpinFull",this.bitmapImageSpinFull);
         return _loc1_;
      }
      
      private function _ZooWheelBirdArrow_BitmapImage4_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.x = -90;
         _loc1_.y = -140;
         _loc1_.smooth = true;
         _loc1_.initialized(this,"bitmapImagePointing");
         this.bitmapImagePointing = _loc1_;
         BindingManager.executeBindings(this,"bitmapImagePointing",this.bitmapImagePointing);
         return _loc1_;
      }
      
      public function ___ZooWheelBirdArrow_Group2_preinitialize(param1:FlexEvent) : void
      {
         this.internalGroupInit(param1);
      }
      
      private function _ZooWheelBirdArrow_BitmapImage5_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.x = -18.5;
         _loc1_.y = -18.5;
         _loc1_.smooth = true;
         _loc1_.initialized(this,"_ZooWheelBirdArrow_BitmapImage5");
         this._ZooWheelBirdArrow_BitmapImage5 = _loc1_;
         BindingManager.executeBindings(this,"_ZooWheelBirdArrow_BitmapImage5",this._ZooWheelBirdArrow_BitmapImage5);
         return _loc1_;
      }
      
      private function _ZooWheelBirdArrow_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Array
         {
            var _loc1_:* = [bitmapImageIdle,bitmapImageSpinStart,bitmapImageSpinFull,bitmapImagePointing];
            return _loc1_ == null || _loc1_ is Array || _loc1_ is Proxy ? _loc1_ : [_loc1_];
         },null,"_ZooWheelBirdArrow_Fade1.targets");
         result[1] = new Binding(this,null,null,"bitmapImageIdle.source","sourceIdle");
         result[2] = new Binding(this,null,null,"bitmapImageSpinStart.source","sourceSpinStart");
         result[3] = new Binding(this,null,null,"bitmapImageSpinFull.source","sourceSpinFull");
         result[4] = new Binding(this,null,null,"bitmapImagePointing.source","sourcePointing");
         result[5] = new Binding(this,null,null,"_ZooWheelBirdArrow_BitmapImage5.source","sourceNail");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _ZooWheelBirdArrow_Group2() : Group
      {
         return this._1027673278_ZooWheelBirdArrow_Group2;
      }
      
      public function set _ZooWheelBirdArrow_Group2(param1:Group) : void
      {
         var _loc2_:Object = this._1027673278_ZooWheelBirdArrow_Group2;
         if(_loc2_ !== param1)
         {
            this._1027673278_ZooWheelBirdArrow_Group2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ZooWheelBirdArrow_Group2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bitmapImageIdle() : BitmapImage
      {
         return this._237548704bitmapImageIdle;
      }
      
      public function set bitmapImageIdle(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._237548704bitmapImageIdle;
         if(_loc2_ !== param1)
         {
            this._237548704bitmapImageIdle = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bitmapImageIdle",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bitmapImagePointing() : BitmapImage
      {
         return this._1831206366bitmapImagePointing;
      }
      
      public function set bitmapImagePointing(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1831206366bitmapImagePointing;
         if(_loc2_ !== param1)
         {
            this._1831206366bitmapImagePointing = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bitmapImagePointing",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bitmapImageSpinFull() : BitmapImage
      {
         return this._644152451bitmapImageSpinFull;
      }
      
      public function set bitmapImageSpinFull(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._644152451bitmapImageSpinFull;
         if(_loc2_ !== param1)
         {
            this._644152451bitmapImageSpinFull = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bitmapImageSpinFull",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bitmapImageSpinStart() : BitmapImage
      {
         return this._1518076212bitmapImageSpinStart;
      }
      
      public function set bitmapImageSpinStart(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1518076212bitmapImageSpinStart;
         if(_loc2_ !== param1)
         {
            this._1518076212bitmapImageSpinStart = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bitmapImageSpinStart",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sourceNail() : Object
      {
         return this._1111633711sourceNail;
      }
      
      public function set sourceNail(param1:Object) : void
      {
         var _loc2_:Object = this._1111633711sourceNail;
         if(_loc2_ !== param1)
         {
            this._1111633711sourceNail = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sourceNail",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sourceIdle() : Object
      {
         return this._1111779697sourceIdle;
      }
      
      public function set sourceIdle(param1:Object) : void
      {
         var _loc2_:Object = this._1111779697sourceIdle;
         if(_loc2_ !== param1)
         {
            this._1111779697sourceIdle = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sourceIdle",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sourcePointing() : Object
      {
         return this._897377907sourcePointing;
      }
      
      public function set sourcePointing(param1:Object) : void
      {
         var _loc2_:Object = this._897377907sourcePointing;
         if(_loc2_ !== param1)
         {
            this._897377907sourcePointing = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sourcePointing",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sourceSpinFull() : Object
      {
         return this._922230572sourceSpinFull;
      }
      
      public function set sourceSpinFull(param1:Object) : void
      {
         var _loc2_:Object = this._922230572sourceSpinFull;
         if(_loc2_ !== param1)
         {
            this._922230572sourceSpinFull = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sourceSpinFull",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sourceSpinStart() : Object
      {
         return this._1463657627sourceSpinStart;
      }
      
      public function set sourceSpinStart(param1:Object) : void
      {
         var _loc2_:Object = this._1463657627sourceSpinStart;
         if(_loc2_ !== param1)
         {
            this._1463657627sourceSpinStart = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sourceSpinStart",_loc2_,param1));
            }
         }
      }
   }
}

