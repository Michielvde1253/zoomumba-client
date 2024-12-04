package fr.kapit.event
{
   import flash.events.Event;
   
   public class SelectedTargetChangeEvent extends Event
   {
      public static const NAME:String = "SelectedTargetChangeEvent";
      
      public var targetObject:Object;
      
      public function SelectedTargetChangeEvent(param1:Object, param2:Boolean = false, param3:Boolean = false)
      {
         super(NAME,param2,param3);
         this.targetObject = param1;
      }
   }
}

