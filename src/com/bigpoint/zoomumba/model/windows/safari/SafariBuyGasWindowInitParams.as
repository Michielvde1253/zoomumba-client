package com.bigpoint.zoomumba.model.windows.safari
{
   public class SafariBuyGasWindowInitParams
   {
      public var infoText:String = "";
      
      public var currentAmount:int = 1;
      
      public var minFuel:int = 1;
      
      public var maxFuel:int = 1;
      
      public var cost:int = 1;
      
      public function SafariBuyGasWindowInitParams(param1:String, param2:int = 0, param3:int = 0, param4:int = 0, param5:int = 0)
      {
         super();
         this.infoText = param1;
         this.currentAmount = param2;
         this.minFuel = param3;
         this.maxFuel = param4;
         this.cost = param5;
      }
   }
}

