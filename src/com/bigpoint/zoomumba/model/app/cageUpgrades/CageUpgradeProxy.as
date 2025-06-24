package com.bigpoint.zoomumba.model.app.cageUpgrades
{
   import com.bigpoint.utils.ObjectHelper;
   import com.bigpoint.zoomumba.constants.AppMode;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.UserResources;
   import com.bigpoint.zoomumba.model.app.cageUpgrades.vo.EventLevelConfigVO;
   import com.bigpoint.zoomumba.model.app.cageUpgrades.vo.LevelConfigVO;
   import com.bigpoint.zoomumba.model.app.core.AppProxy;
   import com.bigpoint.zoomumba.model.app.items.ItemPackVO;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class CageUpgradeProxy extends Proxy
   {
      public static const NAME:String = "CageUpgradeProxy";
      
      private var _cageUpgrades:Vector.<LevelConfigVO>;
      
      private var _cageEventUpgrades:Vector.<EventLevelConfigVO>;
      
      public function CageUpgradeProxy()
      {
         super(NAME);
      }
      
      public function storeCageConfig(param1:Vector.<LevelConfigVO>) : void
      {
         this._cageUpgrades = param1;
      }
      
      public function storeEventCageConfig(param1:Vector.<EventLevelConfigVO>) : void
      {
         this._cageEventUpgrades = param1;
      }
      
      public function getLevelUpCageConfig(param1:int) : LevelConfigVO
      {
         var _loc3_:LevelConfigVO = null;
         var _loc2_:AppProxy = facade.retrieveProxy(AppProxy.NAME) as AppProxy;
         if(_loc2_.currentAppMode == AppMode.TUTORIAL)
         {
            _loc3_ = new LevelConfigVO();
            _loc3_.experienceBonus = 0;
            return _loc3_;
         }
         return ObjectHelper.clone(this._cageUpgrades[param1]) as LevelConfigVO;
      }
      
      public function getOceanWorldLevelUpCageConfigAsItemPackVO(param1:int, param2:int = -1) : Vector.<ItemPackVO>
      {
         var _loc3_:Vector.<ItemPackVO> = null;
         var _loc4_:LevelConfigVO = null;
         var _loc5_:ItemPackVO = null;
         var _loc6_:ItemPackVO = null;
         var _loc7_:EventLevelConfigVO = null;
         var _loc8_:ItemPackVO = null;
         _loc3_ = new Vector.<ItemPackVO>();
         if(param2 == -1)
         {
            _loc4_ = this.getLevelUpCageConfig(param1);
            _loc5_ = new ItemPackVO();
            _loc6_ = new ItemPackVO();
            _loc5_.category = Categories.USER;
            _loc5_.itemId = UserResources.OCEAN_VIRTUAL_MONEY;
            _loc5_.count = _loc4_.oceanWorldVirtualMoneyCost;
            _loc6_.category = Categories.USER;
            _loc6_.itemId = UserResources.PEARLS;
            _loc6_.count = _loc4_.pearlsCost;
            _loc3_.push(_loc6_);
            _loc3_.push(_loc5_);
         }
         else
         {
            _loc7_ = this.getEventData(param2);
            _loc8_ = new ItemPackVO();
            _loc8_.category = Categories.COLLECTIBLE;
            _loc8_.itemId = _loc7_.collItemId;
            _loc8_.count = _loc7_.amount;
            _loc3_.push(_loc8_);
         }
         return _loc3_;
      }
      
      public function getLevelUpCageConfigAsItemPackVO(param1:int, param2:int = -1) : Vector.<ItemPackVO>
      {
         var _loc4_:LevelConfigVO = null;
         var _loc5_:ItemPackVO = null;
         var _loc6_:ItemPackVO = null;
         var _loc7_:EventLevelConfigVO = null;
         var _loc8_:ItemPackVO = null;
         var _loc3_:Vector.<ItemPackVO> = new Vector.<ItemPackVO>();
         if(param2 == -1)
         {
            _loc4_ = this.getLevelUpCageConfig(param1);
            _loc5_ = new ItemPackVO();
            _loc6_ = new ItemPackVO();
            _loc5_.category = Categories.USER;
            _loc5_.itemId = UserResources.PET_POWNS;
            _loc5_.count = _loc4_.petPowsCost;
            _loc6_.category = Categories.USER;
            _loc6_.itemId = UserResources.VIRTUAL_MONEY;
            _loc6_.count = _loc4_.virtualMoneyCost;
            _loc3_.push(_loc6_);
            _loc3_.push(_loc5_);
         }
         else
         {
            _loc7_ = this.getEventData(param2);
            _loc8_ = new ItemPackVO();
            _loc8_.category = Categories.COLLECTIBLE;
            _loc8_.itemId = _loc7_.collItemId;
            _loc8_.count = _loc7_.amount;
            _loc3_.push(_loc8_);
         }
         return _loc3_;
      }
      
      private function getEventData(param1:int) : EventLevelConfigVO
      {
         var _loc2_:EventLevelConfigVO = null;
         var _loc3_:int = 0;
         while(_loc3_ < this._cageEventUpgrades.length)
         {
            if(this._cageEventUpgrades[_loc3_].eventId == param1)
            {
               _loc2_ = this._cageEventUpgrades[_loc3_];
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function getLevelUpCageConfigBonus(param1:int) : ItemPackVO
      {
         var _loc2_:LevelConfigVO = this.getLevelUpCageConfig(param1);
         var _loc3_:ItemPackVO = new ItemPackVO();
         _loc3_.category = Categories.USER;
         _loc3_.itemId = UserResources.EXPERIENCE;
         _loc3_.count = _loc2_.experienceBonus;
         return _loc3_;
      }
   }
}

