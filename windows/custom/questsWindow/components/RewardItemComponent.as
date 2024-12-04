package windows.custom.questsWindow.components
{
   import components.image.BackgroundImage;
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
   import spark.components.HGroup;
   import spark.components.VGroup;
   import spark.core.SpriteVisualElement;
   import spark.primitives.BitmapImage;
   
   use namespace mx_internal;
   
   public class RewardItemComponent extends Group implements IBindingClient, IStateClient2
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      public var _RewardItemComponent_GradientText1:GradientText;
      
      public var _RewardItemComponent_GradientText2:GradientText;
      
      public var _RewardItemComponent_Group2:Group;
      
      private var _436593641_RewardItemComponent_HGroup1:HGroup;
      
      public var _RewardItemComponent_VGroup1:VGroup;
      
      private var _110342614thumb:SpriteVisualElement;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _1413853096amount:String = "000";
      
      private var _embed_mxml__general_Decorations_swf_LaurelWreath_1955236053:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function RewardItemComponent()
      {
         var watchers:Array;
         var _RewardItemComponent_GradientText1_factory:DeferredInstanceFromFunction;
         var _RewardItemComponent_GradientText2_factory:DeferredInstanceFromFunction;
         var i:uint;
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__general_Decorations_swf_LaurelWreath_1955236053 = RewardItemComponent__embed_mxml__general_Decorations_swf_LaurelWreath_1955236053;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._RewardItemComponent_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_windows_custom_questsWindow_components_RewardItemComponentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return RewardItemComponent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.maxHeight = 50;
         this.mxmlContent = [this._RewardItemComponent_HGroup1_i()];
         this.currentState = "horizontal";
         _RewardItemComponent_GradientText1_factory = new DeferredInstanceFromFunction(this._RewardItemComponent_GradientText1_i);
         _RewardItemComponent_GradientText2_factory = new DeferredInstanceFromFunction(this._RewardItemComponent_GradientText2_i);
         states = [new State({
            "name":"horizontal",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_RewardItemComponent_GradientText2_factory,
               "destination":"_RewardItemComponent_HGroup1",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_RewardItemComponent_VGroup1"]
            })]
         }),new State({
            "name":"vertical",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_RewardItemComponent_GradientText1_factory,
               "destination":"_RewardItemComponent_VGroup1",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_RewardItemComponent_Group2"]
            }),new SetProperty().initializeFromObject({
               "name":"maxWidth",
               "value":50
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
         RewardItemComponent._watcherSetupUtil = param1;
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
      
      private function _RewardItemComponent_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.gap = 20;
         _loc1_.mxmlContent = [this._RewardItemComponent_VGroup1_i()];
         _loc1_.id = "_RewardItemComponent_HGroup1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._RewardItemComponent_HGroup1 = _loc1_;
         BindingManager.executeBindings(this,"_RewardItemComponent_HGroup1",this._RewardItemComponent_HGroup1);
         return _loc1_;
      }
      
      private function _RewardItemComponent_VGroup1_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.horizontalAlign = "center";
         _loc1_.gap = -5;
         _loc1_.mxmlContent = [this._RewardItemComponent_Group2_i()];
         _loc1_.id = "_RewardItemComponent_VGroup1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._RewardItemComponent_VGroup1 = _loc1_;
         BindingManager.executeBindings(this,"_RewardItemComponent_VGroup1",this._RewardItemComponent_VGroup1);
         return _loc1_;
      }
      
      private function _RewardItemComponent_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 50;
         _loc1_.height = 50;
         _loc1_.maxHeight = 50;
         _loc1_.maxWidth = 50;
         _loc1_.mxmlContent = [this._RewardItemComponent_BackgroundImage1_c(),this._RewardItemComponent_SpriteVisualElement1_i(),this._RewardItemComponent_BitmapImage1_c()];
         _loc1_.id = "_RewardItemComponent_Group2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._RewardItemComponent_Group2 = _loc1_;
         BindingManager.executeBindings(this,"_RewardItemComponent_Group2",this._RewardItemComponent_Group2);
         return _loc1_;
      }
      
      private function _RewardItemComponent_BackgroundImage1_c() : BackgroundImage
      {
         var _loc1_:BackgroundImage = new BackgroundImage();
         _loc1_.currentState = "inner";
         _loc1_.verticalCenter = -5;
         _loc1_.horizontalCenter = 0;
         _loc1_.scale = 0.5;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _RewardItemComponent_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.scaleX = 0.7;
         _loc1_.scaleY = 0.7;
         _loc1_.verticalCenter = -6;
         _loc1_.horizontalCenter = 0;
         _loc1_.initialized(this,"thumb");
         this.thumb = _loc1_;
         BindingManager.executeBindings(this,"thumb",this.thumb);
         return _loc1_;
      }
      
      private function _RewardItemComponent_BitmapImage1_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__general_Decorations_swf_LaurelWreath_1955236053;
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.initialized(this,null);
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _RewardItemComponent_GradientText1_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.fontSize = 14;
         _loc1_.fontWeight = "bold";
         _loc1_.fontFamily = "Tahoma";
         _loc1_.id = "_RewardItemComponent_GradientText1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._RewardItemComponent_GradientText1 = _loc1_;
         BindingManager.executeBindings(this,"_RewardItemComponent_GradientText1",this._RewardItemComponent_GradientText1);
         return _loc1_;
      }
      
      private function _RewardItemComponent_GradientText2_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.fontSize = 14;
         _loc1_.fontWeight = "bold";
         _loc1_.fontFamily = "Tahoma";
         _loc1_.id = "_RewardItemComponent_GradientText2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._RewardItemComponent_GradientText2 = _loc1_;
         BindingManager.executeBindings(this,"_RewardItemComponent_GradientText2",this._RewardItemComponent_GradientText2);
         return _loc1_;
      }
      
      private function _RewardItemComponent_bindingsSetup() : Array
      {
         var _loc1_:Array = [];
         _loc1_[0] = new Binding(this,null,null,"_RewardItemComponent_GradientText1.text","amount");
         _loc1_[1] = new Binding(this,null,null,"_RewardItemComponent_GradientText2.text","amount");
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _RewardItemComponent_HGroup1() : HGroup
      {
         return this._436593641_RewardItemComponent_HGroup1;
      }
      
      public function set _RewardItemComponent_HGroup1(param1:HGroup) : void
      {
         var _loc2_:Object = this._436593641_RewardItemComponent_HGroup1;
         if(_loc2_ !== param1)
         {
            this._436593641_RewardItemComponent_HGroup1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_RewardItemComponent_HGroup1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get thumb() : SpriteVisualElement
      {
         return this._110342614thumb;
      }
      
      public function set thumb(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._110342614thumb;
         if(_loc2_ !== param1)
         {
            this._110342614thumb = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"thumb",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get amount() : String
      {
         return this._1413853096amount;
      }
      
      public function set amount(param1:String) : void
      {
         var _loc2_:Object = this._1413853096amount;
         if(_loc2_ !== param1)
         {
            this._1413853096amount = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"amount",_loc2_,param1));
            }
         }
      }
   }
}

