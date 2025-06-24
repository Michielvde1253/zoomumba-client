package com.bigpoint.zoorama.core.feature.safari.notices
{
   import com.bigpoint.utils.notificator.Notice;
   
   public class SafariOpenBuyGasNotice extends Notice
   {
      public static const OPEN_BUY_GAS_WINDOW:String = "safariOpenBuyGasWindow";
      
      public static const OPEN_SKIP_TIMER_WINDOW:String = "safariOpenSkipTimerWindow";
      
      public var infoTextId:String;
      
      public var fuelAmmount:int;
      
      public function SafariOpenBuyGasNotice(param1:String, param2:int = -1, param3:String = "")
      {
         super(param1);
         this.infoTextId = param3;
         this.fuelAmmount = param2;
      }
   }
}

