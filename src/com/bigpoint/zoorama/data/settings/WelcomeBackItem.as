package com.bigpoint.zoorama.data.settings
{
   public class WelcomeBackItem
   {
      public var amount:int = 0;
      
      public var id:int = 0;
      
      public var type:String = "";
      
      public function WelcomeBackItem(param1:String = "", param2:int = 0, param3:int = 0)
      {
         super();
         this.type = param1;
         this.id = param2;
         this.amount = param3;
      }
   }
}

