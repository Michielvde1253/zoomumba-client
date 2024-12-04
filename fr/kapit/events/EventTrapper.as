package fr.kapit.events
{
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.FocusEvent;
   import flash.events.IEventDispatcher;
   import flash.events.MouseEvent;
   import flash.system.System;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   import mx.collections.ArrayCollection;
   import mx.events.ChildExistenceChangedEvent;
   import mx.events.PropertyChangeEvent;
   
   public class EventTrapper implements IEventDispatcher
   {
      private static var dum1:FocusEvent;
      
      private static var dum2:MouseEvent;
      
      public static const DEFAULT_MAX_EVENTS:int = 500;
      
      public static var trappers:Dictionary = new Dictionary();
      
      public var active:Boolean = true;
      
      public var callback:Function;
      
      public var chainEvents:Boolean;
      
      private var _1291329255events:ArrayCollection;
      
      public var target:Object;
      
      private var _excludedTarget:Object;
      
      private var _filteredClass:Array;
      
      private var _filteredEvents:Array;
      
      private var _filters:EventFilters;
      
      private var _firstTime:int;
      
      private var _maxEvents:Number = 500;
      
      private var _targets:Array;
      
      private var registeredEvents:Array;
      
      private var _bindingEventDispatcher:EventDispatcher;
      
      public function EventTrapper(param1:Object, param2:Function = null, param3:EventFilters = null, param4:Boolean = false, param5:Number = 500)
      {
         var _loc6_:String = null;
         var _loc7_:Class = null;
         this._1291329255events = new ArrayCollection();
         this._filteredClass = [MouseEvent,FocusEvent];
         this._filteredEvents = ["render","enterFrame","added","removed","mouseMove"];
         this._targets = [];
         this.registeredEvents = [];
         this._bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
         super();
         this._firstTime = getTimer();
         this.target = param1;
         this.callback = param2;
         this.chainEvents = param4;
         this._maxEvents = param5;
         if(param4)
         {
            this._maxEvents = Number.MAX_VALUE;
         }
         if(!param3)
         {
            this._filters = new EventFilters();
         }
         else
         {
            this._filters = param3;
         }
         if(param4)
         {
            this._filters.addFilter("render,enterFrame");
            this._filters.addClassFilter(MouseEvent);
         }
         else
         {
            for each(_loc6_ in this._filteredEvents)
            {
               this._filters.addFilter(_loc6_);
            }
            for each(_loc7_ in this._filteredClass)
            {
               this._filters.addClassFilter(_loc7_);
            }
         }
         this.addTarget(param1);
      }
      
      public static function addTrapper(param1:Object, param2:EventTrapper) : void
      {
         if(param1)
         {
            trappers[param1] = param2;
         }
      }
      
      public static function createTrapper(param1:Object, param2:EventFilters = null, param3:Boolean = false, param4:int = 500) : void
      {
         trappers[param1] = new EventTrapper(param1,null,param2,param3,param4);
      }
      
      public static function deleteTrapper(param1:Object) : void
      {
         var _loc2_:EventTrapper = getTrapper(param1);
         delete trappers[param1];
         _loc2_.clear();
      }
      
      public static function getTrapper(param1:Object) : EventTrapper
      {
         return trappers[param1] as EventTrapper;
      }
      
      public function addListener(param1:String) : void
      {
         EventsManager.getInstance().addListener(this.target,param1,this.onEvent,this._filters);
      }
      
      public function addTarget(param1:Object) : void
      {
         if(this._targets.indexOf(param1) == -1)
         {
            this._targets.push(param1);
            this.addListeners(param1);
         }
      }
      
      public function clear() : void
      {
         this.events.removeAll();
      }
      
      public function dispose() : void
      {
         deleteTrapper(this.target);
         this.removeAllListeners();
         this.target = null;
         this._targets.splice(0,this._targets.length);
         this.callback = null;
         this.events.removeAll();
         this.events = null;
         this.active = false;
         System.gc();
      }
      
      public function excludeTarget(param1:Object) : void
      {
         this._excludedTarget = param1;
      }
      
      public function get filters() : EventFilters
      {
         return this._filters;
      }
      
      public function get label() : String
      {
         var _loc1_:String = this.target.toString();
         var _loc2_:int = int(_loc1_.lastIndexOf("."));
         if(_loc2_ >= 0)
         {
            _loc1_ = _loc1_.substring(_loc2_ + 1);
         }
         return _loc1_;
      }
      
      public function get maxEvents() : int
      {
         return this._maxEvents;
      }
      
      public function set maxEvents(param1:int) : void
      {
         this._maxEvents = param1;
      }
      
      public function onEvent(param1:Event) : void
      {
         var _loc2_:DisplayObject = null;
         if(this._filters.isEventAllowed(param1.type) && this.active && this._excludedTarget != param1.target && this.events.length < this._maxEvents)
         {
            if(this.chainEvents && param1.type == ChildExistenceChangedEvent.CHILD_ADD)
            {
               _loc2_ = ChildExistenceChangedEvent(param1).relatedObject;
               this.addTarget(_loc2_);
            }
            this.events.addItem(new EventWrapper(param1,this._firstTime));
            if(this.callback != null)
            {
               this.callback(param1);
            }
         }
      }
      
      public function refreshFilters() : void
      {
         this.addListeners(this.target);
      }
      
      public function removeAllListeners() : void
      {
         EventsManager.getInstance().removeAllListeners(this.target,this.onEvent);
      }
      
      public function removeListener(param1:String) : void
      {
         EventsManager.getInstance().removeListener(this.target,param1,this.onEvent,this._filters);
      }
      
      private function addListeners(param1:Object) : void
      {
         EventsManager.getInstance().addListenerForAllEvents(param1,this.onEvent,this._filters);
      }
      
      [Bindable(event="propertyChange")]
      public function get events() : ArrayCollection
      {
         return this._1291329255events;
      }
      
      public function set events(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._1291329255events;
         if(_loc2_ !== param1)
         {
            this._1291329255events = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"events",_loc2_,param1));
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

