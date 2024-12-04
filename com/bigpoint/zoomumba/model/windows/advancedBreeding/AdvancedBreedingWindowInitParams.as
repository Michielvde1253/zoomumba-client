package com.bigpoint.zoomumba.model.windows.advancedBreeding
{
   public class AdvancedBreedingWindowInitParams
   {
      public var uniqueId:int = 0;
      
      public var categoryId:int = 0;
      
      public var currentStep:int = 0;
      
      public function AdvancedBreedingWindowInitParams(param1:int, param2:int, param3:int = 0)
      {
         super();
         this.uniqueId = param2;
         this.categoryId = param1;
         this.currentStep = param3;
      }
   }
}

