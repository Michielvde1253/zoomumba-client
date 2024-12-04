package com.bigpoint.zoomumba.model.windowSystem.vo
{
   public class WindowVars
   {
      public var windowType:WindowTypeDefitinion;
      
      public var uniqueId:String;
      
      public var initParams:Object;
      
      public var windowParams:WindowParams;
      
      public function WindowVars(param1:WindowTypeDefitinion, param2:String = "", param3:Object = null, param4:WindowParams = null)
      {
         super();
         this.windowType = param1;
         this.uniqueId = param2;
         this.initParams = param3;
         this.windowParams = param4;
      }
   }
}

