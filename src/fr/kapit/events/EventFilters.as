package fr.kapit.events
{
   public class EventFilters
   {
      private var filters:Object = {};
      
      private var positiveFilters:Object = null;
      
      public function EventFilters()
      {
         super();
      }
      
      public function addClassFilter(param1:Class) : void
      {
         var _loc3_:String = null;
         var _loc2_:Array = BuiltinEventNames.getEventNames(param1);
         for each(_loc3_ in _loc2_)
         {
            this.filters[_loc3_] = true;
         }
      }
      
      public function addFilter(param1:String) : void
      {
         var _loc3_:String = null;
         var _loc2_:Array = param1.split(",");
         for each(_loc3_ in _loc2_)
         {
            this.filters[_loc3_] = true;
         }
      }
      
      public function addPositiveFilter(param1:String) : void
      {
         var _loc3_:String = null;
         this.positiveFilters = {};
         var _loc2_:Array = param1.split(",");
         for each(_loc3_ in _loc2_)
         {
            this.positiveFilters[_loc3_] = true;
         }
      }
      
      public function isEventAllowed(param1:String) : Boolean
      {
         if(!this.positiveFilters)
         {
            return this.filters[param1] == null || this.filters[param1] == undefined;
         }
         return this.positiveFilters[param1] == true;
      }
      
      public function removeClassFilter(param1:Class) : void
      {
         var _loc3_:String = null;
         var _loc2_:Array = BuiltinEventNames.getEventNames(param1);
         for each(_loc3_ in _loc2_)
         {
            delete this.filters[_loc3_];
         }
      }
      
      public function removeFilter(param1:String) : void
      {
         delete this.filters[param1];
      }
   }
}

