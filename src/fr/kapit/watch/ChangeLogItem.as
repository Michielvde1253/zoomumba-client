package fr.kapit.watch
{
   import flash.events.Event;
   import flash.utils.getTimer;
   import fr.kapit.utils.stack.CallStack;
   
   public class ChangeLogItem
   {
      public static var counter:int = 0;
      
      public static const KIND_PROPERTY_CHANGE:String = "Change";
      
      public static const KIND_COLLECTION_ADD:String = "Add";
      
      public static const KIND_COLLECTION_REMOVE:String = "Remove";
      
      public static const KIND_COLLECTION_REPLACE:String = "Replace";
      
      public var kind:String;
      
      public var propertyName:String;
      
      public var propertyChain:String;
      
      public var value:Object;
      
      public var callStack:CallStack;
      
      public var time:Number;
      
      public var event:Event;
      
      public var number:int;
      
      public function ChangeLogItem(param1:String, param2:Object)
      {
         super();
         this.time = getTimer();
         this.kind = param1;
         this.value = param2;
         this.number = ++counter;
         this.callStack = new CallStack();
      }
      
      public function get eventType() : String
      {
         return !!this.event ? this.event.type : "";
      }
      
      public function getApplicationStartPoint(param1:String) : String
      {
         var _loc2_:Array = param1.split("\n");
         var _loc3_:String = "";
         var _loc4_:String = "";
         var _loc5_:int = -1;
         var _loc6_:int = 0;
         while(_loc6_ < _loc2_.length)
         {
            _loc3_ = _loc2_[_loc6_];
            if(!(_loc3_.indexOf("cairngorm") != -1 || _loc3_.indexOf("builtin::apply") != -1 || _loc3_.indexOf("Error") == 0 || _loc3_.indexOf("\tat flash") == 0 || _loc3_.indexOf("\tat mx") == 0 || _loc3_.indexOf("fr.kapit.watch::PropertyChangeWatcher") != -1 || _loc3_.indexOf("fr.kapit.watch::ChangeLogItem") != -1))
            {
               if(_loc5_ < 0)
               {
                  _loc5_ = _loc6_;
               }
               _loc4_ += _loc3_.substr(4) + "\n";
            }
            _loc6_++;
         }
         return _loc4_;
      }
   }
}

