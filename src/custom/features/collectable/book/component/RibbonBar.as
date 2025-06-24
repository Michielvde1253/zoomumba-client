package custom.features.collectable.book.component
{
   import custom.features.collectable.book.events.BookEvents;
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
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.styles.*;
   import spark.components.Group;
   import spark.components.HGroup;
   
   use namespace mx_internal;
   
   public class RibbonBar extends Group implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _26105791ribbonAnimals:RibbonButton;
      
      private var _739595979ribbonAssistants:RibbonButton;
      
      private var _1702922308ribbonCluster:HGroup;
      
      private var _350697566ribbonHabitats:RibbonButton;
      
      private var _2146948656ribbonSpecials:RibbonButton;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _1371548952$ribbonAnimalsSource:*;
      
      private var _72409217$ribbonHabitatsSource:*;
      
      private var _1438430186$ribbonAssistantsSource:*;
      
      private var _1911723985$ribbonSpecialsSource:*;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function RibbonBar()
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
         bindings = this._RibbonBar_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_custom_features_collectable_book_component_RibbonBarWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return RibbonBar[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 520;
         this.mxmlContent = [this._RibbonBar_HGroup1_i()];
         this.addEventListener("creationComplete",this.___RibbonBar_Group1_creationComplete);
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         RibbonBar._watcherSetupUtil = param1;
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
      
      protected function init(param1:FlexEvent) : void
      {
         this.ribbonCluster.addEventListener(BookEvents.RIBBON_BUTTON_MOUSE_CLICK,this.handleRibbonClick);
      }
      
      public function get amount() : int
      {
         return this.ribbonCluster.numChildren;
      }
      
      public function activateRibbon(param1:int) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.amount)
         {
            if(RibbonButton(this.ribbonCluster.getChildAt(_loc2_)).internalID == param1)
            {
               RibbonButton(this.ribbonCluster.getChildAt(_loc2_)).active();
            }
            else
            {
               RibbonButton(this.ribbonCluster.getChildAt(_loc2_)).notActive();
            }
            _loc2_++;
         }
      }
      
      private function handleRibbonClick(param1:BookEvents) : void
      {
         this.activateRibbon(param1.ribbonId);
      }
      
      private function _RibbonBar_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.right = 0;
         _loc1_.gap = -21;
         _loc1_.mxmlContent = [this._RibbonBar_RibbonButton1_i(),this._RibbonBar_RibbonButton2_i(),this._RibbonBar_RibbonButton3_i(),this._RibbonBar_RibbonButton4_i()];
         _loc1_.id = "ribbonCluster";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.ribbonCluster = _loc1_;
         BindingManager.executeBindings(this,"ribbonCluster",this.ribbonCluster);
         return _loc1_;
      }
      
      private function _RibbonBar_RibbonButton1_i() : RibbonButton
      {
         var _loc1_:RibbonButton = new RibbonButton();
         _loc1_.internalID = 1;
         _loc1_.id = "ribbonAnimals";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.ribbonAnimals = _loc1_;
         BindingManager.executeBindings(this,"ribbonAnimals",this.ribbonAnimals);
         return _loc1_;
      }
      
      private function _RibbonBar_RibbonButton2_i() : RibbonButton
      {
         var _loc1_:RibbonButton = new RibbonButton();
         _loc1_.internalID = 2;
         _loc1_.id = "ribbonHabitats";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.ribbonHabitats = _loc1_;
         BindingManager.executeBindings(this,"ribbonHabitats",this.ribbonHabitats);
         return _loc1_;
      }
      
      private function _RibbonBar_RibbonButton3_i() : RibbonButton
      {
         var _loc1_:RibbonButton = new RibbonButton();
         _loc1_.internalID = 3;
         _loc1_.id = "ribbonAssistants";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.ribbonAssistants = _loc1_;
         BindingManager.executeBindings(this,"ribbonAssistants",this.ribbonAssistants);
         return _loc1_;
      }
      
      private function _RibbonBar_RibbonButton4_i() : RibbonButton
      {
         var _loc1_:RibbonButton = new RibbonButton();
         _loc1_.internalID = 4;
         _loc1_.id = "ribbonSpecials";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.ribbonSpecials = _loc1_;
         BindingManager.executeBindings(this,"ribbonSpecials",this.ribbonSpecials);
         return _loc1_;
      }
      
      public function ___RibbonBar_Group1_creationComplete(param1:FlexEvent) : void
      {
         this.init(param1);
      }
      
      private function _RibbonBar_bindingsSetup() : Array
      {
         var _loc1_:Array = [];
         _loc1_[0] = new Binding(this,null,null,"ribbonAnimals.imagePath","$ribbonAnimalsSource");
         _loc1_[1] = new Binding(this,null,null,"ribbonHabitats.imagePath","$ribbonHabitatsSource");
         _loc1_[2] = new Binding(this,null,null,"ribbonAssistants.imagePath","$ribbonAssistantsSource");
         _loc1_[3] = new Binding(this,null,null,"ribbonSpecials.imagePath","$ribbonSpecialsSource");
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get ribbonAnimals() : RibbonButton
      {
         return this._26105791ribbonAnimals;
      }
      
      public function set ribbonAnimals(param1:RibbonButton) : void
      {
         var _loc2_:Object = this._26105791ribbonAnimals;
         if(_loc2_ !== param1)
         {
            this._26105791ribbonAnimals = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ribbonAnimals",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ribbonAssistants() : RibbonButton
      {
         return this._739595979ribbonAssistants;
      }
      
      public function set ribbonAssistants(param1:RibbonButton) : void
      {
         var _loc2_:Object = this._739595979ribbonAssistants;
         if(_loc2_ !== param1)
         {
            this._739595979ribbonAssistants = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ribbonAssistants",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ribbonCluster() : HGroup
      {
         return this._1702922308ribbonCluster;
      }
      
      public function set ribbonCluster(param1:HGroup) : void
      {
         var _loc2_:Object = this._1702922308ribbonCluster;
         if(_loc2_ !== param1)
         {
            this._1702922308ribbonCluster = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ribbonCluster",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ribbonHabitats() : RibbonButton
      {
         return this._350697566ribbonHabitats;
      }
      
      public function set ribbonHabitats(param1:RibbonButton) : void
      {
         var _loc2_:Object = this._350697566ribbonHabitats;
         if(_loc2_ !== param1)
         {
            this._350697566ribbonHabitats = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ribbonHabitats",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ribbonSpecials() : RibbonButton
      {
         return this._2146948656ribbonSpecials;
      }
      
      public function set ribbonSpecials(param1:RibbonButton) : void
      {
         var _loc2_:Object = this._2146948656ribbonSpecials;
         if(_loc2_ !== param1)
         {
            this._2146948656ribbonSpecials = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ribbonSpecials",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get $ribbonAnimalsSource() : *
      {
         return this._1371548952$ribbonAnimalsSource;
      }
      
      public function set $ribbonAnimalsSource(param1:*) : void
      {
         var _loc2_:Object = this._1371548952$ribbonAnimalsSource;
         if(_loc2_ !== param1)
         {
            this._1371548952$ribbonAnimalsSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"$ribbonAnimalsSource",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get $ribbonHabitatsSource() : *
      {
         return this._72409217$ribbonHabitatsSource;
      }
      
      public function set $ribbonHabitatsSource(param1:*) : void
      {
         var _loc2_:Object = this._72409217$ribbonHabitatsSource;
         if(_loc2_ !== param1)
         {
            this._72409217$ribbonHabitatsSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"$ribbonHabitatsSource",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get $ribbonAssistantsSource() : *
      {
         return this._1438430186$ribbonAssistantsSource;
      }
      
      public function set $ribbonAssistantsSource(param1:*) : void
      {
         var _loc2_:Object = this._1438430186$ribbonAssistantsSource;
         if(_loc2_ !== param1)
         {
            this._1438430186$ribbonAssistantsSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"$ribbonAssistantsSource",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get $ribbonSpecialsSource() : *
      {
         return this._1911723985$ribbonSpecialsSource;
      }
      
      public function set $ribbonSpecialsSource(param1:*) : void
      {
         var _loc2_:Object = this._1911723985$ribbonSpecialsSource;
         if(_loc2_ !== param1)
         {
            this._1911723985$ribbonSpecialsSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"$ribbonSpecialsSource",_loc2_,param1));
            }
         }
      }
   }
}

