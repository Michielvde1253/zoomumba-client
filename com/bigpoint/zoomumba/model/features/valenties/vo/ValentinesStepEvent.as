package com.bigpoint.zoomumba.model.features.valenties.vo
{
   import flash.events.Event;
   
   public class ValentinesStepEvent extends Event
   {
      public static const VALENTINES_FIELD_CLICK:String = "VALENTINES_FIELD_CLICK";
      
      public static const VALENTINES_REWARD_CLICK:String = "VALENTINES_REWARD_CLICK";
      
      public var fieldId:int;
      
      public var cr:int = 0;
      
      public function ValentinesStepEvent(param1:String, param2:int, param3:int = 0, param4:Boolean = true, param5:Boolean = false)
      {
         this.cr = param3;
         this.fieldId = param2;
         super(param1,param4,param5);
      }
   }
}

