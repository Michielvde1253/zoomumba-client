package com.bigpoint.zoomumba.model.features.gifts
{
   import com.bigpoint.zoomumba.model.app.items.GiftPackVO;
   import com.bigpoint.zoomumba.model.features.gifts.vo.GiftSenderVO;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class GiftsProxy extends Proxy
   {
      public static const NAME:String = "GiftsProxy";
      
      private var _giftList:Vector.<GiftPackVO> = new Vector.<GiftPackVO>();
      
      private var _giftListDP:Vector.<GiftSenderVO> = new Vector.<GiftSenderVO>();
      
      private var _addedAsFriend:Vector.<String> = new Vector.<String>();
      
      public function GiftsProxy()
      {
         super(NAME);
      }
      
      public function addGift(param1:GiftPackVO) : void
      {
         this._giftList.push(param1);
      }
      
      public function get dataCount() : int
      {
         return this.giftList.length;
      }
      
      public function get giftList() : Vector.<GiftPackVO>
      {
         return this._giftList;
      }
      
      public function refreshDatas() : void
      {
         this._giftList = new Vector.<GiftPackVO>();
      }
      
      public function get giftListDP() : Vector.<GiftSenderVO>
      {
         this._giftListDP = new Vector.<GiftSenderVO>();
         return this._giftListDP;
      }
      
      public function addAsFriend(param1:String) : void
      {
         this._addedAsFriend.push(param1);
      }
      
      public function alreadyAdded(param1:String) : Boolean
      {
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         while(_loc3_ < this._addedAsFriend.length)
         {
            if(this._addedAsFriend[_loc3_] == param1)
            {
               _loc2_ = true;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function newFriendAdded() : void
      {
      }
      
      public function getGiftById(param1:int) : GiftPackVO
      {
         var _loc2_:GiftPackVO = null;
         var _loc3_:int = 0;
         while(_loc3_ < this._giftList.length)
         {
            if(this._giftList[_loc3_].packId == param1)
            {
               _loc2_ = this._giftList[_loc3_];
            }
            _loc3_++;
         }
         return _loc2_;
      }
   }
}

