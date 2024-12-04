package fr.kapit.events
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import fr.kapit.introspection.ClassDescriptor;
   import fr.kapit.introspection.ClassProxy;
   import fr.kapit.introspection.components.CheckTreeRenderer;
   import fr.kapit.utils.ClassUtils;
   import mx.collections.ArrayCollection;
   import mx.events.PropertyChangeEvent;
   
   public class EventTreeItem implements IEventDispatcher
   {
      private var _748366993descriptor:ClassDescriptor;
      
      private var _2058297232isEvent:Boolean = true;
      
      private var _102727412label:String;
      
      private var _109757585state:String = "unchecked";
      
      private var _children:ArrayCollection;
      
      private var _bindingEventDispatcher:EventDispatcher = new EventDispatcher(IEventDispatcher(this));
      
      public function EventTreeItem(param1:Object = null)
      {
         super();
         if(param1)
         {
            this.descriptor = ClassProxy.getInstance().getDescriptor(param1);
            this.label = this.descriptor.label;
         }
      }
      
      public static function buildTree(param1:Object, param2:EventFilters) : EventTreeItem
      {
         var _loc5_:EventTreeItem = null;
         var _loc3_:EventTreeItem = new EventTreeItem(param1);
         var _loc4_:ClassDescriptor = _loc3_.descriptor.parent;
         while(_loc4_)
         {
            _loc5_ = new EventTreeItem();
            _loc5_.isEvent = false;
            _loc5_.descriptor = _loc4_;
            _loc5_.label = _loc4_.label;
            _loc5_.addChild(_loc3_);
            _loc3_ = _loc5_;
            _loc4_ = _loc4_.parent;
         }
         buildEvents(_loc3_,param2);
         _setStates(_loc3_);
         return _loc3_;
      }
      
      public static function buildTreeByEventClass(param1:Object, param2:EventFilters) : EventTreeItem
      {
         var _loc7_:String = null;
         var _loc8_:Array = null;
         var _loc9_:Array = null;
         var _loc10_:String = null;
         var _loc11_:Class = null;
         var _loc12_:String = null;
         var _loc13_:Array = null;
         var _loc14_:EventTreeItem = null;
         var _loc15_:EventTreeItem = null;
         var _loc3_:EventTreeItem = new EventTreeItem(Event);
         var _loc4_:Array = [];
         var _loc5_:ClassDescriptor = ClassProxy.getInstance().getDescriptor(param1);
         do
         {
            _loc9_ = BuitinEvents.getEventsForClass(_loc5_.type);
            for each(_loc10_ in _loc9_)
            {
               _loc4_.push(_loc10_);
            }
         }
         while(_loc5_ = _loc5_.parent, _loc5_);
         
         var _loc6_:Object = {};
         for each(_loc7_ in _loc4_)
         {
            _loc11_ = BuiltinEventNames.eventClasses[_loc7_];
            _loc12_ = ClassUtils.getShortClassName(_loc11_);
            if(_loc11_ == null || _loc12_ == "null")
            {
               _loc12_ = "unkwnown";
            }
            _loc13_ = _loc6_[_loc12_];
            if(!_loc13_)
            {
               _loc13_ = [];
               _loc6_[_loc12_] = _loc13_;
            }
            _loc13_.push(_loc7_);
         }
         _loc8_ = [];
         for(_loc12_ in _loc6_)
         {
            _loc8_.push(_loc12_);
         }
         _loc8_.sort();
         for each(_loc12_ in _loc8_)
         {
            _loc13_ = _loc6_[_loc12_];
            _loc13_.sort();
            _loc14_ = new EventTreeItem();
            _loc14_.isEvent = false;
            _loc14_.label = _loc12_;
            _loc3_.addChild(_loc14_);
            for each(_loc7_ in _loc13_)
            {
               _loc15_ = new EventTreeItem();
               _loc15_.label = _loc7_;
               _loc15_.selected = param2.isEventAllowed(_loc7_);
               _loc14_.addChild(_loc15_);
            }
         }
         _setStates(_loc3_);
         return _loc3_;
      }
      
      private static function _setStates(param1:EventTreeItem) : String
      {
         var _loc4_:EventTreeItem = null;
         var _loc5_:String = null;
         var _loc2_:Boolean = true;
         var _loc3_:Boolean = true;
         if(param1.children == null || param1.children.length == 0)
         {
            if(param1.selected)
            {
               _loc3_ = false;
            }
            else
            {
               _loc2_ = false;
            }
         }
         for each(_loc4_ in param1.children)
         {
            _loc5_ = _setStates(_loc4_);
            if(_loc5_ == CheckTreeRenderer.STATE_CHECKED)
            {
               _loc3_ = false;
            }
            else if(_loc5_ == CheckTreeRenderer.STATE_UNCHECKED)
            {
               _loc2_ = false;
            }
            else if(_loc5_ == CheckTreeRenderer.STATE_SCHRODINGER)
            {
               _loc2_ = false;
               _loc3_ = false;
            }
         }
         if(_loc2_)
         {
            param1.state = CheckTreeRenderer.STATE_CHECKED;
         }
         else if(_loc3_)
         {
            param1.state = CheckTreeRenderer.STATE_UNCHECKED;
         }
         else
         {
            param1.state = CheckTreeRenderer.STATE_SCHRODINGER;
         }
         return param1.state;
      }
      
      private static function buildEvents(param1:EventTreeItem, param2:EventFilters) : void
      {
         var _loc3_:EventTreeItem = null;
         var _loc4_:String = null;
         var _loc5_:Array = null;
         var _loc6_:String = null;
         var _loc7_:EventTreeItem = null;
         for each(_loc3_ in param1._children)
         {
            buildEvents(_loc3_,param2);
         }
         _loc4_ = param1.label;
         _loc5_ = BuitinEvents[_loc4_];
         if(_loc5_)
         {
            for each(_loc6_ in _loc5_)
            {
               _loc7_ = new EventTreeItem();
               _loc7_.label = _loc6_;
               if(param2.isEventAllowed(_loc6_))
               {
                  _loc7_.selected = true;
               }
               else
               {
                  _loc7_.selected = false;
               }
               param1.addChild(_loc7_);
            }
         }
      }
      
      public function addChild(param1:EventTreeItem) : void
      {
         if(!this._children)
         {
            this._children = new ArrayCollection();
         }
         this._children.addItem(param1);
      }
      
      public function get children() : ArrayCollection
      {
         return this._children;
      }
      
      public function get isBranch() : Boolean
      {
         return this._children != null && this._children.length != 0;
      }
      
      public function get selected() : Boolean
      {
         return this.state == "checked";
      }
      
      private function set _1191572123selected(param1:Boolean) : void
      {
         this.state = param1 ? "checked" : "unchecked";
      }
      
      [Bindable(event="propertyChange")]
      public function get descriptor() : ClassDescriptor
      {
         return this._748366993descriptor;
      }
      
      public function set descriptor(param1:ClassDescriptor) : void
      {
         var _loc2_:Object = this._748366993descriptor;
         if(_loc2_ !== param1)
         {
            this._748366993descriptor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"descriptor",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get isEvent() : Boolean
      {
         return this._2058297232isEvent;
      }
      
      public function set isEvent(param1:Boolean) : void
      {
         var _loc2_:Object = this._2058297232isEvent;
         if(_loc2_ !== param1)
         {
            this._2058297232isEvent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"isEvent",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get label() : String
      {
         return this._102727412label;
      }
      
      public function set label(param1:String) : void
      {
         var _loc2_:Object = this._102727412label;
         if(_loc2_ !== param1)
         {
            this._102727412label = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"label",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get state() : String
      {
         return this._109757585state;
      }
      
      public function set state(param1:String) : void
      {
         var _loc2_:Object = this._109757585state;
         if(_loc2_ !== param1)
         {
            this._109757585state = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"state",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set selected(param1:Boolean) : void
      {
         var _loc2_:Object = this.selected;
         if(_loc2_ !== param1)
         {
            this._1191572123selected = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"selected",_loc2_,param1));
            }
         }
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         this._bindingEventDispatcher.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return this._bindingEventDispatcher.dispatchEvent(param1);
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return this._bindingEventDispatcher.hasEventListener(param1);
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         this._bindingEventDispatcher.removeEventListener(param1,param2,param3);
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return this._bindingEventDispatcher.willTrigger(param1);
      }
   }
}

