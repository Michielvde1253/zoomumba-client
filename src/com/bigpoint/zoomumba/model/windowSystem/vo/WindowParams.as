package com.bigpoint.zoomumba.model.windowSystem.vo
{
   public class WindowParams
   {
      public var openNotification:String;
      
      public var openBodyObject:Object;
      
      public var closeNotification:String;
      
      public var closeBodyObject:Object;
      
      public var confirmNotification:String;
      
      public var confirmBodyObject:Object;
      
      public var cancelNotification:String;
      
      public var cancelBodyObject:Object;
      
      public function WindowParams(param1:String = "", param2:Object = null, param3:String = "", param4:Object = null, param5:String = "", param6:Object = null, param7:String = "", param8:Object = null)
      {
         super();
         this.cancelBodyObject = param8;
         this.cancelNotification = param7;
         this.confirmBodyObject = param6;
         this.confirmNotification = param5;
         this.closeBodyObject = param4;
         this.closeNotification = param3;
         this.openBodyObject = param2;
         this.openNotification = param1;
      }
   }
}

