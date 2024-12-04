package com.bigpoint.zoomumba.model.windows
{
   public class NurseryWindowInitParams
   {
      public var uniqueId:int = 0;
      
      public var categoryId:int = 0;
      
      public var currentStep:int = 0;
      
      public function NurseryWindowInitParams(param1:int, param2:int, param3:int = 0)
      {
         super();
         this.uniqueId = param2;
         this.categoryId = param1;
         this.currentStep = param3;
      }
   }
}

