package windows.custom.inventoryWindow
{
   import components.counter.Counter;
   import components.counter.CounterRectSmallSkin;
   import components.stepper.NumericStepperAmmountSkin;
   import components.textfield.StandardText;
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
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.styles.*;
   import spark.components.Group;
   import spark.components.NumericStepper;
   import spark.core.SpriteVisualElement;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   import windows.core.WindowConstants;
   import windows.extensions.headers.WindowHeader;
   import windows.extensions.headers.skins.WindowHeaderQuestionMarkSkin;
   
   use namespace mx_internal;
   
   public class AnimalToInventoryContent extends Group implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _1118247406animalPic:SpriteVisualElement;
      
      private var _279521806countSelector:NumericStepper;
      
      private var _957830652counter:Counter;
      
      private var _1221270899header:WindowHeader;
      
      private var _1165870106question:StandardText;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function AnimalToInventoryContent()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._AnimalToInventoryContent_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_windows_custom_inventoryWindow_AnimalToInventoryContentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return AnimalToInventoryContent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 400;
         this.height = 300;
         this.mxmlContent = [this._AnimalToInventoryContent_OuterGroup1_c(),this._AnimalToInventoryContent_InnerGroup1_c()];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         AnimalToInventoryContent._watcherSetupUtil = param1;
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
      
      private function _AnimalToInventoryContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._AnimalToInventoryContent_WindowHeader1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AnimalToInventoryContent_WindowHeader1_i() : WindowHeader
      {
         var _loc1_:WindowHeader = new WindowHeader();
         _loc1_.fontSize = 20;
         _loc1_.setStyle("skinClass",WindowHeaderQuestionMarkSkin);
         _loc1_.id = "header";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.header = _loc1_;
         BindingManager.executeBindings(this,"header",this.header);
         return _loc1_;
      }
      
      private function _AnimalToInventoryContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._AnimalToInventoryContent_StandardText1_i(),this._AnimalToInventoryContent_SpriteVisualElement1_i(),this._AnimalToInventoryContent_NumericStepper1_i(),this._AnimalToInventoryContent_Counter1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AnimalToInventoryContent_StandardText1_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.x = 231;
         _loc1_.y = 102;
         _loc1_.width = 175;
         _loc1_.height = 190;
         _loc1_.id = "question";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.question = _loc1_;
         BindingManager.executeBindings(this,"question",this.question);
         return _loc1_;
      }
      
      private function _AnimalToInventoryContent_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.x = 115;
         _loc1_.y = 198;
         _loc1_.width = 120;
         _loc1_.height = 120;
         _loc1_.initialized(this,"animalPic");
         this.animalPic = _loc1_;
         BindingManager.executeBindings(this,"animalPic",this.animalPic);
         return _loc1_;
      }
      
      private function _AnimalToInventoryContent_NumericStepper1_i() : NumericStepper
      {
         var _loc1_:NumericStepper = new NumericStepper();
         _loc1_.x = 73;
         _loc1_.y = 266;
         _loc1_.setStyle("skinClass",NumericStepperAmmountSkin);
         _loc1_.id = "countSelector";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.countSelector = _loc1_;
         BindingManager.executeBindings(this,"countSelector",this.countSelector);
         return _loc1_;
      }
      
      private function _AnimalToInventoryContent_Counter1_i() : Counter
      {
         var _loc1_:Counter = new Counter();
         _loc1_.x = 50;
         _loc1_.y = 133;
         _loc1_.setStyle("skinClass",CounterRectSmallSkin);
         _loc1_.id = "counter";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.counter = _loc1_;
         BindingManager.executeBindings(this,"counter",this.counter);
         return _loc1_;
      }
      
      private function _AnimalToInventoryContent_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():int
         {
            return WindowConstants.SKIN_20;
         },null,"header.skinSize");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get animalPic() : SpriteVisualElement
      {
         return this._1118247406animalPic;
      }
      
      public function set animalPic(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._1118247406animalPic;
         if(_loc2_ !== param1)
         {
            this._1118247406animalPic = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"animalPic",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get countSelector() : NumericStepper
      {
         return this._279521806countSelector;
      }
      
      public function set countSelector(param1:NumericStepper) : void
      {
         var _loc2_:Object = this._279521806countSelector;
         if(_loc2_ !== param1)
         {
            this._279521806countSelector = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"countSelector",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get counter() : Counter
      {
         return this._957830652counter;
      }
      
      public function set counter(param1:Counter) : void
      {
         var _loc2_:Object = this._957830652counter;
         if(_loc2_ !== param1)
         {
            this._957830652counter = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"counter",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get header() : WindowHeader
      {
         return this._1221270899header;
      }
      
      public function set header(param1:WindowHeader) : void
      {
         var _loc2_:Object = this._1221270899header;
         if(_loc2_ !== param1)
         {
            this._1221270899header = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"header",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get question() : StandardText
      {
         return this._1165870106question;
      }
      
      public function set question(param1:StandardText) : void
      {
         var _loc2_:Object = this._1165870106question;
         if(_loc2_ !== param1)
         {
            this._1165870106question = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"question",_loc2_,param1));
            }
         }
      }
   }
}

