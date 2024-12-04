package com.bigpoint.zoomumba.model.features.avatar.vo
{
   import com.bigpoint.utils.ObjectHelper;
   import com.bigpoint.zoomumba.model.app.core.vo.CurrencyVO;
   
   public class AvatarPartConfigVO
   {
      public var id:int;
      
      public var buyable:int;
      
      public var free:int;
      
      public var levelRequired:int;
      
      public var gender:int;
      
      public var alias:String;
      
      public var partType:String;
      
      private var _currency:CurrencyVO = new CurrencyVO();
      
      public function AvatarPartConfigVO()
      {
         super();
      }
      
      public function set currency(param1:Object) : void
      {
         ObjectHelper.copyData(this._currency,param1);
      }
      
      public function get price() : CurrencyVO
      {
         return this._currency;
      }
   }
}

