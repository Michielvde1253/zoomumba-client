package fr.kapit.events
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.EventPhase;
   import flash.events.IEventDispatcher;
   import flash.utils.getTimer;
   import fr.kapit.utils.ClassUtils;
   import mx.events.PropertyChangeEvent;
   
   public class EventWrapper implements IEventDispatcher
   {
      private static var _1134877315totalEvents:int;
      
      private static var _staticBindingEventDispatcher:EventDispatcher = new EventDispatcher();
      
      private var _308408228classLabel:String;
      
      private var _96891546event:Event;
      
      private var _970143489eventPhase:String;
      
      private var _1034364087number:int;
      
      private var _997089386parentLabel:String;
      
      private var _2102693917targetLabel:String;
      
      private var _3560141time:Number;
      
      private var _3575610type:String;
      
      private var _bindingEventDispatcher:EventDispatcher;
      
      public function EventWrapper(param1:Event, param2:int = 0)
      {
         var event:Event = param1;
         var firstTime:int = param2;
         this._bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
         super();
         this.event = event;
         this.time = getTimer() - firstTime;
         ++totalEvents;
         this.number = totalEvents;
         this.type = event.type;
         this.targetLabel = ClassUtils.getInstanceLabel(event.target);
         try
         {
            this.parentLabel = !!event.target.parent ? ClassUtils.getInstanceLabel(event.target.parent) : "";
         }
         catch(e:Error)
         {
            parentLabel = "";
         }
         this.classLabel = ClassUtils.getShortClassName(event);
         if(event.eventPhase == EventPhase.CAPTURING_PHASE)
         {
            this.eventPhase = "capture";
         }
         else if(event.eventPhase == EventPhase.BUBBLING_PHASE)
         {
            this.eventPhase = "bubble";
         }
         else if(event.eventPhase == EventPhase.AT_TARGET)
         {
            this.eventPhase = "target";
         }
      }
      
      [Bindable(event="propertyChange")]
      public static function get totalEvents() : int
      {
         return EventWrapper._1134877315totalEvents;
      }
      
      public static function set totalEvents(param1:int) : void
      {
         var _loc4_:IEventDispatcher = null;
         var _loc3_:Object = EventWrapper._1134877315totalEvents;
         switch(_loc3_)
         {
            default:
               _loc4_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(EventWrapper,"totalEvents",_loc3_,param1));
               break;
            case param1:
            case null:
         }
      }
      
      public static function get staticEventDispatcher() : IEventDispatcher
      {
         return _staticBindingEventDispatcher;
      }
      
      public function get target() : Object
      {
         return this.event.target;
      }
      
      [Bindable(event="propertyChange")]
      public function get classLabel() : String
      {
         return this._308408228classLabel;
      }
      
      public function set classLabel(param1:String) : void
      {
         var _loc3_:Object = this._308408228classLabel;
         if(_loc3_ !== param1)
         {
            this._308408228classLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"classLabel",_loc3_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get event() : Event
      {
         return this._96891546event;
      }
      
      public function set event(param1:Event) : void
      {
         var _loc3_:Object = this._96891546event;
         if(_loc3_ !== param1)
         {
            this._96891546event = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"event",_loc3_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get eventPhase() : String
      {
         return this._970143489eventPhase;
      }
      
      public function set eventPhase(param1:String) : void
      {
         var _loc3_:Object = this._970143489eventPhase;
         if(_loc3_ !== param1)
         {
            this._970143489eventPhase = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"eventPhase",_loc3_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get number() : int
      {
         return this._1034364087number;
      }
      
      public function set number(param1:int) : void
      {
         var _loc3_:Object = this._1034364087number;
         if(_loc3_ !== param1)
         {
            this._1034364087number = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"number",_loc3_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get parentLabel() : String
      {
         return this._997089386parentLabel;
      }
      
      public function set parentLabel(param1:String) : void
      {
         var _loc3_:Object = this._997089386parentLabel;
         if(_loc3_ !== param1)
         {
            this._997089386parentLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"parentLabel",_loc3_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get targetLabel() : String
      {
         return this._2102693917targetLabel;
      }
      
      public function set targetLabel(param1:String) : void
      {
         var _loc3_:Object = this._2102693917targetLabel;
         if(_loc3_ !== param1)
         {
            this._2102693917targetLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"targetLabel",_loc3_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get time() : Number
      {
         return this._3560141time;
      }
      
      public function set time(param1:Number) : void
      {
         var _loc3_:Object = this._3560141time;
         if(_loc3_ !== param1)
         {
            this._3560141time = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"time",_loc3_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get type() : String
      {
         return this._3575610type;
      }
      
      public function set type(param1:String) : void
      {
         var _loc3_:Object = this._3575610type;
         if(_loc3_ !== param1)
         {
            this._3575610type = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"type",_loc3_,param1));
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

