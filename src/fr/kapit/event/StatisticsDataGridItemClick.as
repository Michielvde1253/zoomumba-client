package fr.kapit.event
{
   import flash.events.Event;
   import mx.events.ListEvent;
   
   public class StatisticsDataGridItemClick extends ListEvent
   {
      public static var NAME:String = "StatisticsDataGridItemClick";
      
      public var objType:String;
      
      public function StatisticsDataGridItemClick(param1:String)
      {
         super(NAME);
         this.objType = param1;
      }
      
      override public function clone() : Event
      {
         return new StatisticsDataGridItemClick(this.objType);
      }
   }
}

