package custom.card.component
{
   import components.textfield.labelDisplay.LabelDisplay;
   import components.textfield.labelDisplay.skin.LabelDisplayGoldSkin;
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
   import mx.states.State;
   import mx.styles.*;
   import spark.components.Group;
   
   use namespace mx_internal;
   
   public class CardNail extends Group implements IBindingClient, IStateClient2
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      public var _CardNail_Image1:Image;
      
      public var _CardNail_Image2:Image;
      
      public var _CardNail_Image3:Image;
      
      private var _549242255discountInfo:LabelDisplay;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _141734736discountValue:String;
      
      private var _embed_mxml__general_Decorations_swf_StartsPin_1387574699:Class;
      
      private var _embed_mxml__general_Decorations_swf_DiscountInfo_1020215532:Class;
      
      private var _embed_mxml__general_Decorations_swf_Nail_897896331:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function CardNail()
      {
         var watchers:Array;
         var _CardNail_Image1_factory:DeferredInstanceFromFunction;
         var _CardNail_Image2_factory:DeferredInstanceFromFunction;
         var _CardNail_Image3_factory:DeferredInstanceFromFunction;
         var _CardNail_LabelDisplay1_factory:DeferredInstanceFromFunction;
         var i:uint;
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__general_Decorations_swf_StartsPin_1387574699 = CardNail__embed_mxml__general_Decorations_swf_StartsPin_1387574699;
         this._embed_mxml__general_Decorations_swf_DiscountInfo_1020215532 = CardNail__embed_mxml__general_Decorations_swf_DiscountInfo_1020215532;
         this._embed_mxml__general_Decorations_swf_Nail_897896331 = CardNail__embed_mxml__general_Decorations_swf_Nail_897896331;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._CardNail_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_custom_card_component_CardNailWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return CardNail[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContent = [];
         this.currentState = "nail";
         _CardNail_Image1_factory = new DeferredInstanceFromFunction(this._CardNail_Image1_i);
         _CardNail_Image2_factory = new DeferredInstanceFromFunction(this._CardNail_Image2_i);
         _CardNail_Image3_factory = new DeferredInstanceFromFunction(this._CardNail_Image3_i);
         _CardNail_LabelDisplay1_factory = new DeferredInstanceFromFunction(this._CardNail_LabelDisplay1_i);
         states = [new State({
            "name":"nail",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_CardNail_Image1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"stars",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_CardNail_Image2_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"discount",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_CardNail_LabelDisplay1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_CardNail_Image3_factory,
               "destination":null,
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
         CardNail._watcherSetupUtil = param1;
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
      
      private function _CardNail_Image1_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.top = 7;
         _loc1_.horizontalCenter = 2;
         _loc1_.source = this._embed_mxml__general_Decorations_swf_Nail_897896331;
         _loc1_.id = "_CardNail_Image1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CardNail_Image1 = _loc1_;
         BindingManager.executeBindings(this,"_CardNail_Image1",this._CardNail_Image1);
         return _loc1_;
      }
      
      private function _CardNail_Image2_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.top = 2;
         _loc1_.horizontalCenter = 2;
         _loc1_.source = this._embed_mxml__general_Decorations_swf_StartsPin_1387574699;
         _loc1_.id = "_CardNail_Image2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CardNail_Image2 = _loc1_;
         BindingManager.executeBindings(this,"_CardNail_Image2",this._CardNail_Image2);
         return _loc1_;
      }
      
      private function _CardNail_Image3_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.top = 13;
         _loc1_.horizontalCenter = 1;
         _loc1_.source = this._embed_mxml__general_Decorations_swf_DiscountInfo_1020215532;
         _loc1_.id = "_CardNail_Image3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CardNail_Image3 = _loc1_;
         BindingManager.executeBindings(this,"_CardNail_Image3",this._CardNail_Image3);
         return _loc1_;
      }
      
      private function _CardNail_LabelDisplay1_i() : LabelDisplay
      {
         var _loc1_:LabelDisplay = new LabelDisplay();
         _loc1_.top = 9;
         _loc1_.fontSize = 11;
         _loc1_.horizontalCenter = 0;
         _loc1_.mouseChildren = false;
         _loc1_.mouseEnabled = false;
         _loc1_.setStyle("skinClass",LabelDisplayGoldSkin);
         _loc1_.id = "discountInfo";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.discountInfo = _loc1_;
         BindingManager.executeBindings(this,"discountInfo",this.discountInfo);
         return _loc1_;
      }
      
      private function _CardNail_bindingsSetup() : Array
      {
         var _loc1_:Array = [];
         _loc1_[0] = new Binding(this,null,null,"discountInfo.text","discountValue");
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get discountInfo() : LabelDisplay
      {
         return this._549242255discountInfo;
      }
      
      public function set discountInfo(param1:LabelDisplay) : void
      {
         var _loc2_:Object = this._549242255discountInfo;
         if(_loc2_ !== param1)
         {
            this._549242255discountInfo = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"discountInfo",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get discountValue() : String
      {
         return this._141734736discountValue;
      }
      
      public function set discountValue(param1:String) : void
      {
         var _loc2_:Object = this._141734736discountValue;
         if(_loc2_ !== param1)
         {
            this._141734736discountValue = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"discountValue",_loc2_,param1));
            }
         }
      }
   }
}

