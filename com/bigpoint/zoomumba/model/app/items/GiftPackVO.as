package com.bigpoint.zoomumba.model.app.items
{
   public class GiftPackVO extends ItemPackVO
   {
      public var recieverId:int;
      
      public var senderId:int;
      
      public var getDate:int;
      
      public function GiftPackVO()
      {
         super();
      }
      
      public function set gId(param1:int) : void
      {
         packId = param1;
      }
      
      public function set itemCount(param1:int) : void
      {
         count = param1;
      }
   }
}

