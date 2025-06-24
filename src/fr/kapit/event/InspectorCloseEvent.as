package fr.kapit.event
{
   import flash.events.Event;
   
   public class InspectorCloseEvent extends Event
   {
      public static const NAME:String = "inspectorClose";
      
      public var componentName:String;
      
      public function InspectorCloseEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(NAME,param2,param3);
         this.componentName = param1;
      }
   }
}

