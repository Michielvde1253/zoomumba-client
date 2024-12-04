package com.bigpoint.zoomumba.model.features.fortuneWheel
{
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.items.BlueprintInfoVO;
   import com.bigpoint.zoomumba.model.features.crafting.CraftingProxy;
   import com.bigpoint.zoomumba.model.features.fortuneWheel.vo.FortuneWheelRewardVO;
   import com.bigpoint.zoomumba.model.features.fortuneWheel.vo.FortuneWheelVO;
   import com.bigpoint.zoomumba.model.gameConfig.FeatureConfigProxy;
   import com.bigpoint.zoomumba.model.user.core.UserProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoorama.MainConfig;
   import mx.utils.ObjectUtil;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class FortuneWheelProxy extends Proxy
   {
      public static const NAME:String = "FortuneWheelProxy";
      
      public static const MAX_TICKETS:int = 5;
      
      private var _craftingProxy:CraftingProxy;
      
      private var _wheelVO:FortuneWheelVO;
      
      private var _autoSpin:Boolean = false;
      
      private var _wonItemPosition:int = -1;
      
      private var _buyInProgress:Boolean = false;
      
      private var _ticketBought:Boolean = false;
      
      private var _lastCommandInProgress:Boolean = false;
      
      public var _rewardRequestId:int = -1;
      
      public var raw_log_data:Array = new Array();
      
      public var flash_log_data:Array = new Array();
      
      public var buy_log_data:Array = new Array();
      
      public var spin_log_data:Array = new Array();
      
      public var close_log_data:Array = new Array();
      
      public var request_log_data:Array = new Array();
      
      public function FortuneWheelProxy()
      {
         super(NAME);
      }
      
      public function get lastCommandInProgress() : Boolean
      {
         return this._lastCommandInProgress;
      }
      
      public function set lastCommandInProgress(param1:Boolean) : void
      {
         this._lastCommandInProgress = param1;
      }
      
      public function get ticketBought() : Boolean
      {
         return this._ticketBought;
      }
      
      public function set ticketBought(param1:Boolean) : void
      {
         this._ticketBought = param1;
      }
      
      public function get buyInProgress() : Boolean
      {
         return this._buyInProgress;
      }
      
      public function set buyInProgress(param1:Boolean) : void
      {
         this._buyInProgress = param1;
      }
      
      public function set autoSpin(param1:Boolean) : void
      {
         this._autoSpin = param1;
      }
      
      public function get autoSpin() : Boolean
      {
         return this._autoSpin;
      }
      
      public function get logError() : Boolean
      {
         var _loc1_:FeatureConfigProxy = facade.retrieveProxy(FeatureConfigProxy.NAME) as FeatureConfigProxy;
         return _loc1_.tombolaLogging;
      }
      
      public function getPossibleRewards() : Vector.<FortuneWheelRewardVO>
      {
         return this._wheelVO.possibleRewards;
      }
      
      public function get numberOfTries() : int
      {
         return this._wheelVO.ticketCount;
      }
      
      public function get craftingProxy() : CraftingProxy
      {
         if(this._craftingProxy == null)
         {
            this._craftingProxy = facade.getProxy(CraftingProxy) as CraftingProxy;
         }
         return this._craftingProxy;
      }
      
      public function getWonReward() : FortuneWheelRewardVO
      {
         if(this._wheelVO.wonReward.id != -1)
         {
            return this._wheelVO.wonReward;
         }
         return null;
      }
      
      private function hasFreeSpin() : Boolean
      {
         return this._wheelVO.isFreeTicketBooked;
      }
      
      public function updateData(param1:FortuneWheelVO) : void
      {
         var _loc2_:BlueprintInfoVO = null;
         var _loc4_:FortuneWheelRewardVO = null;
         this._wheelVO = null;
         this._wheelVO = param1;
         var _loc3_:int = 0;
         while(_loc3_ < this._wheelVO.possibleRewards.length)
         {
            _loc4_ = this._wheelVO.possibleRewards[_loc3_];
            if(_loc4_.category == Categories.BLUEPRINT)
            {
               _loc4_.blueprintId = _loc4_.id;
               _loc2_ = this.craftingProxy.getBlueprintInfoByBlueprintId(_loc4_.blueprintId);
               _loc4_.category = _loc2_.category;
               _loc4_.id = _loc2_.itemId;
            }
            _loc3_++;
         }
         if(this._wheelVO.wonReward.category == Categories.BLUEPRINT)
         {
            this._wheelVO.wonReward.blueprintId = this._wheelVO.wonReward.id;
            _loc2_ = this.craftingProxy.getBlueprintInfoByBlueprintId(this._wheelVO.wonReward.blueprintId);
            this._wheelVO.wonReward.category = _loc2_.category;
            this._wheelVO.wonReward.id = _loc2_.itemId;
         }
         this.flash_log_data.push(ObjectUtil.copy(param1));
         this.flash_log_data.push(TimeManager.currentTime);
         this.checkForFreeSpin();
         this._buyInProgress = false;
         sendNotification(Note.UPDATE_REWARD_DATA_SET);
      }
      
      public function logPHP(param1:Object) : void
      {
         this.raw_log_data.push(param1);
         this.raw_log_data.push(TimeManager.currentTime);
      }
      
      private function checkForFreeSpin() : void
      {
         var _loc1_:UserProxy = null;
         if(this._wheelVO.isFreeTicketBooked)
         {
            _loc1_ = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
            if(_loc1_.userLevel >= MainConfig.FORTUNE_WHEEL_ENABLED_LEVEL)
            {
               facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.ZOO_WHEEL_FREE_SPIN));
            }
         }
      }
   }
}

