package com.bigpoint.zoomumba.model.windows.information
{
   import com.bigpoint.zoomumba.model.app.core.vo.CurrencyVO;
   
   public class RewardInfoInitParams extends InformationInitParams
   {
      public var reward:CurrencyVO;
      
      public var amount:int;
      
      public var message2:String;
      
      public function RewardInfoInitParams(param1:String, param2:String, param3:CurrencyVO, param4:String = "")
      {
         super(param1,param2);
         this.message2 = param4;
         this.amount = this.amount;
         this.reward = param3;
      }
   }
}

