package com.bigpoint.zoomumba.model.features.counter.vo
{
   import com.bigpoint.utils.ObjectHelper;
   
   public class CounterValueVO
   {
      public var userId:int;
      
      public var id:int;
      
      public var count:int;
      
      private var _limits:CounterLimitsVO = new CounterLimitsVO();
      
      public function CounterValueVO(param1:int = 0, param2:int = 0)
      {
         super();
         this.count = param2;
         this.id = param1;
      }
      
      public function set limits(param1:Object) : void
      {
         ObjectHelper.copyData(this._limits,param1);
      }
      
      public function get limits() : Object
      {
         return this._limits;
      }
      
      public function get limit() : CounterLimitsVO
      {
         return this._limits;
      }
   }
}

