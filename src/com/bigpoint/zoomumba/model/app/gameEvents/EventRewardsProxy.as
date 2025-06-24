package com.bigpoint.zoomumba.model.app.gameEvents
{
   import com.bigpoint.utils.ItemTypeHelper;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.EventRewardVO;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.EventTypes;
   import com.bigpoint.zoomumba.model.features.babyCaravan.BabyCaravanProxy;
   import com.greensock.TweenLite;
   import flash.utils.Dictionary;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class EventRewardsProxy extends Proxy
   {
      public static const NAME:String = "EventRewardsProxy";
      
      private var rewardDict:Dictionary = new Dictionary();
      
      public function EventRewardsProxy(param1:Object)
      {
         super(NAME,null);
         this.parseConfigData(param1);
      }
      
      private function parseConfigData(param1:Object) : void
      {
         var _loc2_:String = null;
         var _loc3_:Vector.<EventRewardVO> = null;
         var _loc4_:Object = null;
         var _loc5_:String = null;
         for(_loc2_ in param1)
         {
            _loc3_ = new Vector.<EventRewardVO>();
            _loc4_ = param1[_loc2_]["rewards"];
            for(_loc5_ in _loc4_)
            {
               _loc3_.push(this.parseItem(_loc4_[_loc5_]));
            }
            this.setRewardsForEvent(int(_loc2_),_loc3_);
         }
      }
      
      private function parseItem(param1:Object) : EventRewardVO
      {
         var data:Object = param1;
         var item:EventRewardVO = new EventRewardVO();
         item.categoryId = ItemTypeHelper.typeToCategory(data["type"]);
         item.amount = data["amount"];
         item.itemId = data["id"];
         item.itemIds = data["ids"];
         if(data["currency"])
         {
            item.currency.category = ItemTypeHelper.typeToCategory(data["currency"]["type"]);
            item.currency.itemId = data["currency"]["id"];
            item.currency.count = data["currency"]["amount"];
         }
         try
         {
            item.limit = data["limit"];
         }
         catch(e:Error)
         {
         }
         if(data["unlocked"])
         {
            item.unlockMin = data["unlocked"]["min"];
            item.unlockMax = data["unlocked"]["max"];
            item.counterId = data["unlocked"]["id"];
         }
         return item;
      }
      
      private function objToArray(param1:Object) : Array
      {
         var _loc3_:String = null;
         var _loc2_:Array = new Array();
         for(_loc3_ in param1)
         {
            _loc2_.push(param1[_loc3_]);
         }
         return _loc2_;
      }
      
      private function setRewardsForEvent(param1:int, param2:Vector.<EventRewardVO>) : void
      {
         this.rewardDict[param1] = param2;
         if(param1 == EventTypes.BABY_CARAVAN_EVENT)
         {
            TweenLite.delayedCall(2,this.updateBabyCaravan);
         }
      }
      
      private function updateBabyCaravan() : void
      {
         var _loc1_:BabyCaravanProxy = facade.retrieveProxy(BabyCaravanProxy.NAME) as BabyCaravanProxy;
         if(_loc1_.specieId == -1)
         {
            _loc1_.setRewards(this.rewardDict[EventTypes.BABY_CARAVAN_EVENT] as Vector.<EventRewardVO>);
         }
      }
      
      public function getRewardsForEvent(param1:int) : Vector.<EventRewardVO>
      {
         return this.rewardDict[param1];
      }
      
      public function getRewardByIdForEvent(param1:int, param2:int) : EventRewardVO
      {
         return this.rewardDict[param2][param1 - 1];
      }
   }
}

