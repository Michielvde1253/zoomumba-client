package custom.previews.reward
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
   import mx.states.State;
   import mx.styles.*;
   import spark.components.Group;
   import spark.core.SpriteVisualElement;
   
   use namespace mx_internal;
   
   public class RewardItemPreview extends Group implements IBindingClient, IStateClient2
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      public var _RewardItemPreview_BackgroundImage1:BackgroundImage;
      
      public var _RewardItemPreview_GradientText1:GradientText;
      
      private var _1145924875_RewardItemPreview_Group2:Group;
      
      private var _410956671container:SpriteVisualElement;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _3556653text:String = "";
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function RewardItemPreview()
      {
         var bindings:Array;
         var watchers:Array;
         var _RewardItemPreview_BackgroundImage1_factory:DeferredInstanceFromFunction;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._RewardItemPreview_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_custom_previews_reward_RewardItemPreviewWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return RewardItemPreview[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.maxHeight = 80;
         this.maxWidth = 80;
         this.width = 80;
         this.height = 80;
         this.mxmlContent = [this._RewardItemPreview_Group2_i(),this._RewardItemPreview_GradientText1_i()];
         this.currentState = "default";
         _RewardItemPreview_BackgroundImage1_factory = new DeferredInstanceFromFunction(this._RewardItemPreview_BackgroundImage1_i);
         states = [new State({
            "name":"default",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_RewardItemPreview_BackgroundImage1_factory,
               "destination":"_RewardItemPreview_Group2",
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"noBG",
            "overrides":[]
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
         RewardItemPreview._watcherSetupUtil = param1;
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
      
      public function addContent(param1:DisplayObject) : void
      {
         if(Boolean(param1) && Boolean(this.container))
         {
            if(!this.container.contains(param1))
            {
               this.container.addChild(param1);
            }
         }
      }
      
      public function clean() : void
      {
         var _loc1_:DisplayObject = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.container.numChildren)
         {
            _loc1_ = this.container.getChildAt(_loc2_);
            this.container.removeChild(_loc1_);
            _loc2_++;
         }
      }
      
      private function _RewardItemPreview_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.verticalCenter = -8;
         _loc1_.horizontalCenter = 0;
         _loc1_.mxmlContent = [this._RewardItemPreview_SpriteVisualElement1_i()];
         _loc1_.id = "_RewardItemPreview_Group2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._RewardItemPreview_Group2 = _loc1_;
         BindingManager.executeBindings(this,"_RewardItemPreview_Group2",this._RewardItemPreview_Group2);
         return _loc1_;
      }
      
      private function _RewardItemPreview_BackgroundImage1_i() : BackgroundImage
      {
         var _loc1_:BackgroundImage = new BackgroundImage();
         _loc1_.verticalCenter = -5;
         _loc1_.horizontalCenter = 0;
         _loc1_.scale = 0.52;
         _loc1_.id = "_RewardItemPreview_BackgroundImage1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._RewardItemPreview_BackgroundImage1 = _loc1_;
         BindingManager.executeBindings(this,"_RewardItemPreview_BackgroundImage1",this._RewardItemPreview_BackgroundImage1);
         return _loc1_;
      }
      
      private function _RewardItemPreview_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.verticalCenter = -10;
         _loc1_.horizontalCenter = 0;
         _loc1_.initialized(this,"container");
         this.container = _loc1_;
         BindingManager.executeBindings(this,"container",this.container);
         return _loc1_;
      }
      
      private function _RewardItemPreview_GradientText1_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.bottom = -2;
         _loc1_.horizontalCenter = 0;
         _loc1_.id = "_RewardItemPreview_GradientText1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._RewardItemPreview_GradientText1 = _loc1_;
         BindingManager.executeBindings(this,"_RewardItemPreview_GradientText1",this._RewardItemPreview_GradientText1);
         return _loc1_;
      }
      
      private function _RewardItemPreview_bindingsSetup() : Array
      {
         var _loc1_:Array = [];
         _loc1_[0] = new Binding(this,null,null,"_RewardItemPreview_GradientText1.text","text");
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _RewardItemPreview_Group2() : Group
      {
         return this._1145924875_RewardItemPreview_Group2;
      }
      
      public function set _RewardItemPreview_Group2(param1:Group) : void
      {
         var _loc2_:Object = this._1145924875_RewardItemPreview_Group2;
         if(_loc2_ !== param1)
         {
            this._1145924875_RewardItemPreview_Group2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_RewardItemPreview_Group2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get container() : SpriteVisualElement
      {
         return this._410956671container;
      }
      
      public function set container(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._410956671container;
         if(_loc2_ !== param1)
         {
            this._410956671container = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"container",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get text() : String
      {
         return this._3556653text;
      }
      
      public function set text(param1:String) : void
      {
         var _loc2_:Object = this._3556653text;
         if(_loc2_ !== param1)
         {
            this._3556653text = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"text",_loc2_,param1));
            }
         }
      }
   }
}

