package com.bigpoint.zoomumba.model.events.community
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.app.core.vo.CurrencyVO;
   import com.bigpoint.zoomumba.model.events.community.vo.CommunityEventVO;
   import com.bigpoint.zoomumba.view.windows.events.halloween2012.components.Halloween2012LockableItem;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class CommunityEventProxy extends Proxy
   {
      public static const NAME:String = "CommunityEventProxy";
      
      public function CommunityEventProxy()
      {
         super(NAME,new CommunityEventVO());
      }
      
      override public function onRegister() : void
      {
         sendNotification(Note.ON_REGISTER_COMMUNITY_PAYIN_EVENT);
      }
      
      public function update(param1:Object) : void
      {
         var _loc2_:CurrencyVO = null;
         var _loc3_:Vector.<Vector.<CurrencyVO>> = null;
         var _loc4_:int = 0;
         var _loc6_:int = 0;
         _loc3_ = new Vector.<Vector.<CurrencyVO>>(param1.rewards.length,true);
         _loc4_ = 0;
         while(_loc4_ < param1.rewards.length)
         {
            _loc3_[_loc4_] = new Vector.<CurrencyVO>();
            _loc6_ = 0;
            while(_loc6_ < param1.rewards[_loc4_].length)
            {
               _loc2_ = new CurrencyVO();
               _loc2_.amount = param1.rewards[_loc4_][_loc6_].amount;
               _loc2_.id = int(param1.rewards[_loc4_][_loc6_].displayId) || int(param1.rewards[_loc4_][_loc6_].id);
               _loc2_.type = Categories.getCategoryIdFromName(param1.rewards[_loc4_][_loc6_].type);
               _loc3_[_loc4_].push(_loc2_);
               _loc6_++;
            }
            _loc4_++;
         }
         var _loc5_:CommunityEventVO = new CommunityEventVO();
         _loc5_.progress = param1.progress;
         _loc5_.step = param1.step;
         _loc5_.hasRewards = param1.hasRewards;
         _loc5_.rewards = _loc3_;
         _loc5_.eventId = param1.eventId;
         this.data = _loc5_;
         sendNotification(Note.COMMUNITY_EVENT_UPDATED,this.data as CommunityEventVO);
      }
      
      public function canRedeem(param1:uint) : Boolean
      {
         if(this.proxyData.hasRewards.length == 0)
         {
            return false;
         }
         return this.proxyData.hasRewards[param1] == 0;
      }
      
      public function rewardStatus(param1:uint) : uint
      {
         var _loc2_:uint = Halloween2012LockableItem.STATE_LOCKED;
         if(param1 < this.proxyData.step)
         {
            _loc2_ = !!this.proxyData.hasRewards[param1] ? Halloween2012LockableItem.STATE_USED : Halloween2012LockableItem.STATE_UNLOCKED;
         }
         return _loc2_;
      }
      
      public function get proxyData() : CommunityEventVO
      {
         return data as CommunityEventVO;
      }
   }
}

