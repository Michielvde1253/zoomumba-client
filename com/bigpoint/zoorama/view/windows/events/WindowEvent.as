package com.bigpoint.zoorama.view.windows.events
{
   import com.bigpoint.zoorama.view.windows.WindowAbstract;
   import flash.events.Event;
   
   public class WindowEvent extends Event
   {
      public static const INIT:String = "windowInit";
      
      public static const OPEN:String = "windowOpen";
      
      public static const CLOSE:String = "windowClose";
      
      public static const DISPOSE:String = "windowDispose";
      
      public var window:WindowAbstract;
      
      public function WindowEvent(param1:String, param2:WindowAbstract, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param3,param4);
         this.window = param2;
      }
   }
}

