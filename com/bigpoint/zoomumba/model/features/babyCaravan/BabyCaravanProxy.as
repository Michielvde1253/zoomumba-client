package com.bigpoint.zoomumba.model.features.babyCaravan
{
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.utils.timeManager.TimeTrack;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.Gender;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.gameEvents.EventRewardsProxy;
   import com.bigpoint.zoomumba.model.app.gameEvents.GlobalEventProxy;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.EventRewardVO;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.EventTypes;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.GlobalEventVO;
   import com.bigpoint.zoomumba.model.events.babyEvent.vo.LoanedItemVO;
   import com.bigpoint.zoomumba.model.features.counter.CounterValuesProxy;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.model.gameConfig.vo.AnimalSpeciesVO;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.AnimalData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.CageData;
   import com.bigpoint.zoomumba.model.playfield.PlayFieldProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoorama.data.settings.AnimalShopData;
   import com.bigpoint.zoorama.data.settings.InheritedShopData;
   import com.bigpoint.zoorama.data.settings.SpecieShopData;
   import com.bigpoint.zoorama.utils.configModules.TextIdHelper;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class BabyCaravanProxy extends Proxy
   {
      public static const NAME:String = "BabyCaravanProxy";
      
      public var caravanId:int = 1;
      
      private var _childId:int = -1;
      
      private var _specieId:int = -1;
      
      private var _borrowed:Boolean = false;
      
      private var _borrowedItems:Vector.<LoanedItemVO> = new Vector.<LoanedItemVO>();
      
      private var eventEndTimeTrack:TimeTrack;
      
      private var _maxCurrencyNeeded:int = -1;
      
      private var _itemConfigProxy:ItemConfigProxy;
      
      public var lastBabyCount:int = -1;
      
      public function BabyCaravanProxy()
      {
         super(NAME,null);
      }
      
      public function get rewardsData() : Vector.<Object>
      {
         var _loc4_:EventRewardVO = null;
         var _loc5_:InheritedShopData = null;
         var _loc6_:SpecieShopData = null;
         var _loc1_:ItemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         var _loc2_:EventRewardsProxy = facade.retrieveProxy(EventRewardsProxy.NAME) as EventRewardsProxy;
         this._maxCurrencyNeeded = 0;
         var _loc3_:Vector.<Object> = new Vector.<Object>();
         for each(_loc4_ in _loc2_.getRewardsForEvent(EventTypes.BABY_CARAVAN_EVENT))
         {
            _loc5_ = _loc1_.getShopDataByCategory(_loc4_.itemId,_loc4_.categoryId);
            _loc6_ = _loc1_.getSpecieData(AnimalShopData(_loc5_).speciesId);
            _loc5_.price.amount = _loc4_.currency.count;
            _loc5_.attraction = _loc6_.attraction;
            this._maxCurrencyNeeded += _loc5_.price.amount;
            _loc3_.push(_loc5_);
         }
         return _loc3_;
      }
      
      public function getRewardPrice() : int
      {
         var _loc1_:EventRewardsProxy = facade.retrieveProxy(EventRewardsProxy.NAME) as EventRewardsProxy;
         var _loc2_:Vector.<EventRewardVO> = _loc1_.getRewardsForEvent(EventTypes.BABY_CARAVAN_EVENT);
         return _loc2_[0].currency.count;
      }
      
      public function eventFinished() : void
      {
         this._borrowed = false;
         this._borrowedItems = null;
      }
      
      public function finishEvent() : void
      {
         var _loc3_:CageData = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Object = null;
         facade.sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(WindowTypes.BABY_CARAVAN_WINDOW));
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         while(_loc2_ < this._borrowedItems.length)
         {
            _loc3_ = this.getCageForAnimal(this._borrowedItems[_loc2_].iId);
            _loc4_ = 0;
            _loc5_ = 0;
            if(_loc3_)
            {
               _loc4_ = _loc3_.uniqueId;
               _loc5_ = _loc3_.playFieldId;
            }
            _loc6_ = {
               "id":this._borrowedItems[_loc2_].iId,
               "fId":_loc5_,
               "cId":_loc4_,
               "iId":this._borrowedItems[_loc2_].cId,
               "lId":this._borrowedItems[_loc2_].id
            };
            _loc1_.push(_loc6_);
            _loc2_++;
         }
         if(_loc1_.length > 0)
         {
            sendNotification(NET.BABY_CARAVAN_FINISH,[_loc1_]);
         }
      }
      
      private function getCageForAnimal(param1:int) : CageData
      {
         var _loc2_:PlayFieldProxy = facade.retrieveProxy(PlayFieldProxy.NAME) as PlayFieldProxy;
         return _loc2_.getCageForAnimal(param1);
      }
      
      public function get borrowed() : Boolean
      {
         return this._borrowed;
      }
      
      public function addLoanedItems(param1:Vector.<LoanedItemVO>) : void
      {
         this._borrowedItems = param1;
         this._borrowed = true;
         this.startTimeTrack();
      }
      
      private function startTimeTrack() : void
      {
         if(!this.eventEndTimeTrack)
         {
            this.eventEndTimeTrack = TimeManager.creatEmptyTrack(this.finishEvent);
         }
         TimeManager.updateTrackTime(this.eventEndTimeTrack,this.getRemainingTime());
      }
      
      private function getRemainingTime() : uint
      {
         var _loc1_:GlobalEventProxy = null;
         var _loc2_:GlobalEventVO = null;
         if(this.borrowed)
         {
            return this._borrowedItems[0].end;
         }
         _loc1_ = facade.retrieveProxy(GlobalEventProxy.NAME) as GlobalEventProxy;
         _loc2_ = _loc1_.getGlobalEvent(EventTypes.BABY_CARAVAN_EVENT);
         return _loc2_.endDate;
      }
      
      public function isBorrowedByUniqueId(param1:int) : Boolean
      {
         var _loc2_:int = 0;
         while(_loc2_ < this._borrowedItems.length)
         {
            if(this._borrowedItems[_loc2_].iId == param1)
            {
               return true;
            }
            _loc2_++;
         }
         return false;
      }
      
      public function get isEventActive() : Boolean
      {
         var _loc1_:GlobalEventProxy = null;
         if(this.borrowed)
         {
            return TimeManager.currentTime < this._borrowedItems[0].end;
         }
         _loc1_ = facade.retrieveProxy(GlobalEventProxy.NAME) as GlobalEventProxy;
         return _loc1_.isEventActive(EventTypes.BABY_CARAVAN_EVENT);
      }
      
      public function getRewardId(param1:int) : int
      {
         var _loc2_:EventRewardsProxy = facade.retrieveProxy(EventRewardsProxy.NAME) as EventRewardsProxy;
         var _loc3_:Vector.<EventRewardVO> = _loc2_.getRewardsForEvent(EventTypes.BABY_CARAVAN_EVENT);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            if(_loc3_[_loc4_].itemId == param1)
            {
               return _loc4_ + 1;
            }
            _loc4_++;
         }
         return 1;
      }
      
      public function cageHasLoanedAnimals(param1:int) : Boolean
      {
         var _loc4_:LoanedItemVO = null;
         var _loc5_:int = 0;
         var _loc2_:PlayFieldProxy = facade.retrieveProxy(PlayFieldProxy.NAME) as PlayFieldProxy;
         var _loc3_:Vector.<AnimalData> = _loc2_.getAnimalsFromCage(param1);
         for each(_loc4_ in this._borrowedItems)
         {
            _loc5_ = 0;
            while(_loc5_ < _loc3_.length)
            {
               if(_loc3_[_loc5_].uniqueId == _loc4_.iId)
               {
                  return true;
               }
               _loc5_++;
            }
         }
         return false;
      }
      
      public function get eventEnd() : uint
      {
         return this._borrowedItems[0].end;
      }
      
      public function isBorrowedById(param1:int) : Boolean
      {
         var _loc2_:int = 0;
         if(this._borrowedItems)
         {
            _loc2_ = 0;
            while(_loc2_ < this._borrowedItems.length)
            {
               if(this.sidByAid(this._borrowedItems[_loc2_].cId) == param1)
               {
                  return true;
               }
               _loc2_++;
            }
         }
         return false;
      }
      
      private function sidByAid(param1:int) : int
      {
         var _loc2_:ItemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         return AnimalShopData(_loc2_.getShopDataByCategory(param1,Categories.ANIMAL)).speciesId;
      }
      
      public function get eventCageMenuTooltip() : String
      {
         var _loc1_:String = null;
         _loc1_ = _loc1_;
         return TextResourceModule.getText("zoo.event.caravan.tooltip.inventorizeBabies").replace("%species%",_loc1_);
      }
      
      public function get hasLoanedItems() : Boolean
      {
         if(this._borrowedItems)
         {
            if(this._borrowedItems.length > 0)
            {
               return true;
            }
         }
         return false;
      }
      
      public function get maxCurrencyNeeded() : int
      {
         return this._maxCurrencyNeeded;
      }
      
      public function get canRedeemMore() : Boolean
      {
         var _loc1_:EventRewardsProxy = facade.retrieveProxy(EventRewardsProxy.NAME) as EventRewardsProxy;
         var _loc2_:CounterValuesProxy = facade.retrieveProxy(CounterValuesProxy.NAME) as CounterValuesProxy;
         var _loc3_:int = 0;
         var _loc4_:Vector.<EventRewardVO> = _loc1_.getRewardsForEvent(EventTypes.BABY_CARAVAN_EVENT);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.length)
         {
            if(_loc2_.getCounterById(_loc4_[_loc5_].counterId).count >= _loc4_[_loc5_].limit)
            {
               _loc3_++;
            }
            _loc5_++;
         }
         if(_loc3_ >= _loc4_.length)
         {
            return false;
         }
         return true;
      }
      
      public function setSpecieIds(param1:Object) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Object = null;
         if(Boolean(param1) && Boolean(param1.babyCaravan))
         {
            _loc2_ = param1.babyCaravan;
            if(_loc2_.babyAnimalId)
            {
               this._childId = _loc2_.babyAnimalId;
            }
            if(_loc2_.loan)
            {
               for each(_loc3_ in _loc2_.loan)
               {
                  switch(_loc3_.gender)
                  {
                     case Gender.MALE:
                        this._specieId = _loc3_.id;
                        break;
                     case Gender.FEMALE:
                        break;
                     case Gender.CHILD:
                        break;
                  }
               }
            }
         }
      }
      
      public function setRewards(param1:Vector.<EventRewardVO>) : void
      {
         var _loc2_:EventRewardVO = null;
         var _loc3_:AnimalShopData = null;
         var _loc4_:AnimalShopData = null;
         if(this.itemConfigProxy == null)
         {
            return;
         }
         for each(_loc2_ in param1)
         {
            _loc3_ = this.itemConfigProxy.getAnimalData(_loc2_.itemId);
            if(!_loc3_)
            {
               continue;
            }
            _loc4_ = this.itemConfigProxy.getChildAnimalData(_loc3_.speciesId);
            if(_loc4_)
            {
               this._childId = _loc4_.itemId;
            }
            switch(_loc3_.gender)
            {
               case Gender.MALE:
                  this._specieId = _loc2_.itemId;
                  break;
               case Gender.CHILD:
                  this._childId = _loc2_.itemId;
                  break;
            }
         }
      }
      
      public function get animalName() : String
      {
         var _loc1_:AnimalSpeciesVO = null;
         var _loc2_:String = "";
         if(this.specieId != -1)
         {
            _loc1_ = this.itemConfigProxy.getShopAnimalSpecieByAnimalId(this.specieId);
            if(_loc1_)
            {
               _loc2_ = TextIdHelper.getCardName(Categories.ANIMAL,_loc1_.speciesId,Gender.MALE);
            }
         }
         return _loc2_;
      }
      
      private function get itemConfigProxy() : ItemConfigProxy
      {
         if(this._itemConfigProxy == null)
         {
            this._itemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         }
         return this._itemConfigProxy;
      }
      
      public function get specieId() : int
      {
         return this._specieId;
      }
      
      public function get childId() : int
      {
         return this._childId;
      }
   }
}

