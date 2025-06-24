package fr.kapit.events
{
   import flash.events.IEventDispatcher;
   import flash.utils.Dictionary;
   import fr.kapit.introspection.ClassDescriptor;
   import fr.kapit.introspection.ClassProxy;
   import fr.kapit.utils.ClassUtils;
   
   public class EventsManager
   {
      private static var _instance:EventsManager;
      
      private static var _registeredEventsByTarget:Dictionary = new Dictionary();
      
      public var events:Dictionary = new Dictionary();
      
      public function EventsManager()
      {
         super();
         if(!_instance)
         {
            _instance = this;
         }
      }
      
      public static function getInstance() : EventsManager
      {
         if(!_instance)
         {
            new EventsManager();
         }
         return _instance;
      }
      
      public function addListener(param1:Object, param2:String, param3:Function, param4:EventFilters) : void
      {
         var _loc5_:IEventDispatcher = null;
         if(param1 is IEventDispatcher)
         {
            _loc5_ = IEventDispatcher(param1);
         }
         if(_loc5_)
         {
            this._doAddEventListener(_loc5_,param2,param3);
            param4.removeFilter(param2);
         }
      }
      
      public function addListenerForAllEvents(param1:Object, param2:Function, param3:EventFilters = null, param4:ClassDescriptor = null, param5:Boolean = false) : void
      {
         var _loc9_:String = null;
         if(!param1 || !(param1 is IEventDispatcher))
         {
            return;
         }
         if(!param4)
         {
            param4 = ClassProxy.getInstance().getDescriptor(param1);
         }
         if(!param4)
         {
            return;
         }
         var _loc6_:String = param4.label;
         var _loc7_:Array = BuitinEvents[_loc6_];
         if(_loc7_)
         {
            for each(_loc9_ in _loc7_)
            {
               if(!param3 || param3.isEventAllowed(_loc9_))
               {
                  if(param5)
                  {
                     this.removeListener(IEventDispatcher(param1),_loc9_,param2,param3);
                  }
                  else
                  {
                     this._doAddEventListener(IEventDispatcher(param1),_loc9_,param2);
                  }
               }
               else
               {
                  IEventDispatcher(param1).removeEventListener(_loc9_,param2);
               }
            }
         }
         var _loc8_:ClassDescriptor = param4.parent;
         if(_loc8_ != null)
         {
            this.addListenerForAllEvents(param1,param2,param3,_loc8_,param5);
         }
      }
      
      public function getAllEvents(param1:Object, param2:Array = null) : Array
      {
         var _loc6_:String = null;
         var _loc7_:ClassDescriptor = null;
         if(!param2)
         {
            param2 = new Array();
            _loc7_ = ClassProxy.getInstance().getDescriptor(param1);
         }
         else
         {
            _loc7_ = ClassDescriptor(param1);
         }
         var _loc3_:ClassDescriptor = _loc7_.parent;
         var _loc4_:String = _loc7_.label;
         var _loc5_:Array = BuitinEvents[_loc4_];
         for each(_loc6_ in _loc5_)
         {
            param2.push(_loc6_);
         }
         while(_loc3_)
         {
            this.getAllEvents(_loc3_,param2);
         }
         return param2;
      }
      
      public function getEventsFilter(param1:Object) : Object
      {
         var _loc4_:String = null;
         var _loc5_:Boolean = false;
         var _loc2_:Object = {};
         var _loc3_:Array = this.getAllEvents(param1);
         for each(_loc4_ in _loc3_)
         {
            _loc5_ = true;
            if(_loc4_ == "enterFrame" || _loc4_ == "render")
            {
            }
         }
         return _loc2_;
      }
      
      public function removeAllListeners(param1:Object, param2:Function) : void
      {
         var _loc4_:String = null;
         var _loc3_:Array = _registeredEventsByTarget[param1] as Array;
         if(_loc3_)
         {
            for each(_loc4_ in _loc3_)
            {
               this._doRemoveEventListener(IEventDispatcher(param1),_loc4_,param2);
            }
            delete _registeredEventsByTarget[param1];
         }
      }
      
      public function removeListener(param1:Object, param2:String, param3:Function, param4:EventFilters) : void
      {
         var _loc5_:IEventDispatcher = null;
         if(param1 is IEventDispatcher)
         {
            _loc5_ = IEventDispatcher(param1);
         }
         if(_loc5_)
         {
            this._doRemoveEventListener(_loc5_,param2,param3);
            param4.addFilter(param2);
         }
      }
      
      private function _doAddEventListener(param1:IEventDispatcher, param2:String, param3:Function) : void
      {
         param1.addEventListener(param2,param3,false,Number.MAX_VALUE,true);
         param1.addEventListener(param2,param3,true,Number.MAX_VALUE,true);
         var _loc4_:Array = _registeredEventsByTarget[param1] as Array;
         if(!_loc4_)
         {
            _loc4_ = new Array();
            _registeredEventsByTarget[param1] = _loc4_;
         }
         if(_loc4_.indexOf(param2) < 0)
         {
            _loc4_.push(param2);
         }
      }
      
      private function _doRemoveEventListener(param1:IEventDispatcher, param2:String, param3:Function) : void
      {
         param1.removeEventListener(param2,param3,true);
         param1.removeEventListener(param2,param3,false);
      }
      
      private function registerClassEvents(param1:String) : void
      {
         var _loc3_:String = null;
         var _loc4_:Class = null;
         var _loc5_:Array = null;
         var _loc2_:Array = BuitinEvents[param1];
         if(_loc2_)
         {
            for each(_loc3_ in _loc2_)
            {
               _loc4_ = ClassUtils.getClassByName(param1);
               _loc5_ = _loc2_[_loc4_];
               if(!_loc5_)
               {
                  _loc5_ = new Array();
                  _loc2_[_loc4_] = _loc5_;
               }
               _loc5_.push(_loc3_);
            }
         }
      }
   }
}

