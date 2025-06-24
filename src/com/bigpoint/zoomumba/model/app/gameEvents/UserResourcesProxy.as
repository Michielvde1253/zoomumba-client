package com.bigpoint.zoomumba.model.app.gameEvents
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.Resources;
   import com.bigpoint.zoomumba.constants.UserResources;
   import com.bigpoint.zoomumba.constants.items.CageSpecieBonus;
   import com.bigpoint.zoomumba.model.app.cageUpgrades.CageUpgradeProxy;
   import com.bigpoint.zoomumba.model.app.cageUpgrades.vo.LevelConfigVO;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.ActionType;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.EventTypes;
   import com.bigpoint.zoomumba.model.features.powerup.PowerupProxy;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.model.gameConfig.MainConfigProxy;
   import com.bigpoint.zoomumba.model.gameConfig.PremiumPackConfigProxy;
   import com.bigpoint.zoomumba.model.user.core.UserProxy;
   import com.bigpoint.zoomumba.model.user.events.UserEventProxy;
   import com.bigpoint.zoorama.view.field.items.Building;
   import com.bigpoint.zoorama.view.field.items.Cage;
   import com.bigpoint.zoorama.view.field.items.TrashBin;
   import com.bigpoint.zoorama.view.field.items.TrashRoad;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class UserResourcesProxy extends Proxy
   {
      public static const NAME:String = "UserResourcesProxy";
      
      private var powerupProxy:PowerupProxy;
      
      private var globalEventProxy:GlobalEventProxy;
      
      private var premiumPackProxy:PremiumPackConfigProxy;
      
      private var userEventProxy:UserEventProxy;
      
      private var mainConfigProxy:MainConfigProxy;
      
      private var cageUpgradeProxy:CageUpgradeProxy;
      
      private var itemConfigProxy:ItemConfigProxy;
      
      private var userProxy:UserProxy;
      
      public function UserResourcesProxy()
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         this.powerupProxy = facade.retrieveProxy(PowerupProxy.NAME) as PowerupProxy;
         this.globalEventProxy = facade.retrieveProxy(GlobalEventProxy.NAME) as GlobalEventProxy;
         this.premiumPackProxy = facade.retrieveProxy(PremiumPackConfigProxy.NAME) as PremiumPackConfigProxy;
         this.userEventProxy = facade.retrieveProxy(UserEventProxy.NAME) as UserEventProxy;
         this.mainConfigProxy = facade.retrieveProxy(MainConfigProxy.NAME) as MainConfigProxy;
         this.itemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         this.cageUpgradeProxy = facade.retrieveProxy(CageUpgradeProxy.NAME) as CageUpgradeProxy;
         this.userProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
      }
      
      public function getResourseUsedAmount(param1:Cage, param2:int) : int
      {
         var _loc3_:int = 0;
         var _loc4_:Number = 0;
         switch(param2)
         {
            case ActionType.FEED:
               _loc4_ = param1.animalCount * param1.foodPerAnimal;
               _loc3_ = this.getResourceProporcionalValue(_loc4_,param1.percentageTimeForFeed,Resources.ALL_FOODS);
               break;
            case ActionType.POWER_FEED:
            case ActionType.SUPER_FEED:
               _loc3_ = _loc4_ = 1;
               break;
            case ActionType.WATER:
               _loc4_ = param1.animalCount * param1.waterPerAnimal;
               _loc3_ = this.getResourceProporcionalValue(_loc4_,param1.percentageTimeForWater,Resources.WATER);
               break;
            case ActionType.HEAL:
               _loc3_ = _loc4_ = param1.animalCount;
         }
         return _loc3_;
      }
      
      public function getItemCalculatedXP(param1:Building, param2:int) : Number
      {
         if(!this.itemConfigProxy)
         {
            this.itemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         }
         var _loc3_:Number = 0;
         switch(param2)
         {
            case ActionType.CLEAN:
            case ActionType.CUDDLE:
            case ActionType.FEED:
            case ActionType.HEAL:
            case ActionType.POWER_FEED:
            case ActionType.SUPER_FEED:
            case ActionType.SUPER_HEAL:
            case ActionType.WATER:
            case ActionType.BREED:
               _loc3_ = this.getCageCalculatedXP(param1 as Cage,param2);
               break;
            case ActionType.TRASH_CLEAN:
               if(param1 is TrashBin)
               {
                  _loc3_ = (param1 as TrashBin).trashAmmount;
               }
               if(param1 is TrashRoad)
               {
                  _loc3_ = (param1 as TrashRoad).trashAmmount;
               }
         }
         return _loc3_;
      }
      
      private function getCageCalculatedXP(param1:Cage, param2:int) : Number
      {
         var _loc3_:Number = 0;
         var _loc4_:Number = 0;
         if(this.mainConfigProxy == null)
         {
            this.mainConfigProxy = facade.retrieveProxy(MainConfigProxy.NAME) as MainConfigProxy;
         }
         if(this.premiumPackProxy == null)
         {
            this.premiumPackProxy = facade.retrieveProxy(PremiumPackConfigProxy.NAME) as PremiumPackConfigProxy;
         }
         var _loc5_:LevelConfigVO = this.cageUpgradeProxy.getLevelUpCageConfig(param1.level);
         var _loc6_:Number = param1.eventId == EventTypes.ANNIVERSARY_WHOLE_EVENT || Boolean(EventTypes.BDAY2014_EVENT) ? 0.25 : _loc5_.experienceBonus;
         var _loc7_:Number = 0;
         var _loc8_:Number = this.itemConfigProxy.getCageSpecieBonus(param1.speciesId,param1.itemId);
         if(_loc8_ == CageSpecieBonus.GOOD)
         {
            _loc7_ = 0.1;
         }
         var _loc9_:Number = this.powerupProxy.getMultiplierByAffectedProperty(Categories.USER,UserResources.EXPERIENCE);
         var _loc10_:Number = Math.min(this.userProxy.userLevel / param1.levelRequired,1);
         switch(param2)
         {
            case ActionType.CLEAN:
               _loc4_ = param1.animalCount * param1.cleanExpReward * _loc10_;
               _loc3_ = this.getExpProporcionalValue(_loc4_,param1.percentageTimeForClean,_loc6_,_loc7_,_loc9_);
               break;
            case ActionType.CUDDLE:
               _loc4_ = param1.cuddleExpReward;
               _loc3_ = this.getExpProporcionalValue(_loc4_,param1.percentageTimeForCuddle,_loc6_,_loc7_,_loc9_);
               break;
            case ActionType.FEED:
               _loc4_ = param1.animalCount * param1.feedExpReward * _loc10_;
               _loc3_ = this.getExpProporcionalValue(_loc4_,param1.percentageTimeForFeed,_loc6_,_loc7_,_loc9_);
               break;
            case ActionType.HEAL:
               break;
            case ActionType.POWER_FEED:
               _loc4_ = param1.animalCount * param1.feedExpReward * _loc10_;
               _loc3_ = this.getExpProporcionalValue(_loc4_,1,_loc6_,_loc7_,_loc9_);
               break;
            case ActionType.SUPER_FEED:
               _loc4_ = param1.animalCount * param1.feedExpReward * 2 * _loc10_;
               _loc3_ = this.getExpProporcionalValue(_loc4_,1,_loc6_,_loc7_,_loc9_);
               break;
            case ActionType.SUPER_HEAL:
               break;
            case ActionType.WATER:
               _loc4_ = param1.animalCount * param1.waterExpReward * _loc10_;
               _loc3_ = this.getExpProporcionalValue(_loc4_,param1.percentageTimeForWater,_loc6_,_loc7_,_loc9_);
               break;
            case ActionType.BREED:
               _loc3_ = this.getExpForBreeding(param1.breadExperience,_loc6_,_loc7_);
         }
         return this.getCalculatedXP(_loc3_);
      }
      
      private function getResourceProporcionalValue(param1:Number, param2:Number, param3:int = -1) : int
      {
         var _loc4_:int = 0;
         switch(param3)
         {
            case Resources.ALL_FOODS:
            case Resources.WATER:
         }
         return int(Math.ceil(param2 * param1));
      }
      
      private function getExpProporcionalValue(param1:Number, param2:Number, ... rest) : Number
      {
         var _loc4_:Number = 0;
         var _loc5_:Number = 1;
         var _loc6_:int = 0;
         while(_loc6_ < rest.length)
         {
            _loc5_ += rest[_loc6_];
            _loc6_++;
         }
         return Math.floor(param1 * param2 * _loc5_);
      }
      
      private function getExpForBreeding(param1:Number, param2:Number, param3:Number) : Number
      {
         var _loc4_:Number = 0;
         return Math.floor(param1 * (1 + param2 + param3));
      }
      
      private function getCalculatedXP(param1:Number) : Number
      {
         if(!this.globalEventProxy)
         {
         }
         var _loc2_:Number = 1;
         if(this.premiumPackProxy)
         {
            _loc2_ = this.premiumPackProxy.fieldActionExpMultiplyer;
         }
         return Math.ceil(param1 * _loc2_);
      }
   }
}

