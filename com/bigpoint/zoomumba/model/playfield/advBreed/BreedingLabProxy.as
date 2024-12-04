package com.bigpoint.zoomumba.model.playfield.advBreed
{
   import com.bigpoint.utils.ObjectHelper;
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.utils.timeManager.TimeTrack;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.advBreed.GenusConfigProxy;
   import com.bigpoint.zoomumba.model.advBreed.vo.GenusConfigVO;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.model.gameConfig.vo.AnimalSpeciesVO;
   import com.bigpoint.zoomumba.model.gameConfig.vo.ItemServerVO;
   import com.bigpoint.zoomumba.model.inventory.InventoryProxy;
   import com.bigpoint.zoomumba.model.playfield.vo.BreedingLabVO;
   import com.bigpoint.zoorama.data.settings.CollectableShopData;
   import com.bigpoint.zoorama.data.settings.ResourceShopData;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class BreedingLabProxy extends Proxy
   {
      public static const NAME:String = "BreedingLabProxy";
      
      public static const STATE_READY:int = 1;
      
      public static const STATE_RUNNING:int = 2;
      
      public static const STATE_FINISHED:int = 3;
      
      public static const TIER_1:int = 1;
      
      private static const STATES_TOOLTIPS:Array = [null,"zoo.advancedBreed.tooltip.labEmpty","zoo.advancedBreed.tooltip.labBreeding","zoo.advancedBreed.tooltip.labDone"];
      
      private var proxyData:BreedingLabVO = new BreedingLabVO();
      
      private var _currentState:int = 1;
      
      public var rewardAnimal:ItemServerVO = null;
      
      public var rewardSecondAnimal:ItemServerVO = null;
      
      public var rewardSecond:ItemServerVO = null;
      
      public var breedId:int = -1;
      
      public var selectedGenus:int = -1;
      
      public var selectedGenusPage:int = 0;
      
      public var selectedAnimals:Vector.<int> = new <int>[-1,-1];
      
      public var selectedChanceItems:Vector.<Object> = new <Object>[null,null,null];
      
      private var genusConfigProxy:GenusConfigProxy;
      
      private var inventoryProxy:InventoryProxy;
      
      private var itemConfigProxy:ItemConfigProxy;
      
      private var breedTimeTrack:TimeTrack;
      
      public function BreedingLabProxy(param1:int, param2:int, param3:Object = null)
      {
         this.breedId = param2;
         ObjectHelper.copyData(this.proxyData,param3);
         super(getFullName(param1,param2));
      }
      
      public static function getFullName(param1:int, param2:int) : String
      {
         return NAME + "_" + param1 + "_" + param2;
      }
      
      public function get currentState() : int
      {
         return this._currentState;
      }
      
      public function get currentTooltipId() : String
      {
         return STATES_TOOLTIPS[this._currentState];
      }
      
      public function get breedingPrice() : ItemServerVO
      {
         var _loc4_:AnimalSpeciesVO = null;
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:ItemServerVO = new ItemServerVO();
         var _loc5_:int = 0;
         var _loc6_:int = int(this.selectedAnimals.length);
         while(_loc5_ < _loc6_)
         {
            if(this.selectedAnimals[_loc5_] != -1)
            {
               _loc4_ = this.itemConfigProxy.getShopAnimalSpecieByAnimalId(this.selectedAnimals[_loc5_]);
               _loc3_.type = _loc4_.breedAdvanceCost[0].type;
               _loc3_.id = _loc4_.breedAdvanceCost[0].id;
               _loc3_.cnt += _loc4_.breedAdvanceCost[0].cnt;
               _loc1_++;
            }
            _loc5_++;
         }
         _loc3_.cnt = Math.ceil(_loc3_.cnt / _loc1_);
         return _loc3_;
      }
      
      public function get selectedBreedingTime() : int
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = int(this.selectedAnimals.length);
         while(_loc3_ < _loc4_)
         {
            if(this.selectedAnimals[_loc3_] != -1)
            {
               _loc2_ += this.itemConfigProxy.getShopAnimalSpecieByAnimalId(this.selectedAnimals[_loc3_]).breedAdvanceTime;
               _loc1_++;
            }
            _loc3_++;
         }
         return Math.ceil(_loc2_ / _loc1_);
      }
      
      public function get lab() : BreedingLabVO
      {
         return this.proxyData as BreedingLabVO;
      }
      
      override public function onRegister() : void
      {
         this.genusConfigProxy = facade.retrieveProxy(GenusConfigProxy.NAME) as GenusConfigProxy;
         this.inventoryProxy = facade.retrieveProxy(InventoryProxy.NAME) as InventoryProxy;
         this.itemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         this.breedTimeTrack = TimeManager.creatEmptyTrack(this.breedingEnded);
         this.updateData(this.proxyData);
      }
      
      public function updateData(param1:BreedingLabVO) : void
      {
         this.proxyData = param1;
         this.setBuildingState();
      }
      
      private function breedingEnded() : void
      {
         this._currentState = BreedingLabProxy.STATE_FINISHED;
         sendNotification(Note.REFRESH_ADVANCED_BREEDING_BUILDING);
      }
      
      private function setBuildingState() : void
      {
         if(this.lab.end == 0)
         {
            this._currentState = BreedingLabProxy.STATE_READY;
         }
         else if(this.lab.end > TimeManager.currentTime)
         {
            this._currentState = BreedingLabProxy.STATE_RUNNING;
         }
         else
         {
            this._currentState = BreedingLabProxy.STATE_FINISHED;
         }
         TimeManager.updateTrackTime(this.breedTimeTrack,this.lab.end);
         sendNotification(Note.REFRESH_ADVANCED_BREEDING_BUILDING);
      }
      
      public function getCardsForStep2() : Vector.<Object>
      {
         var _loc4_:String = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:AnimalSpeciesVO = null;
         var _loc1_:Vector.<Object> = new Vector.<Object>();
         var _loc2_:GenusConfigVO = this.genusConfigProxy.getConfigById(this.selectedGenus);
         var _loc3_:Object = _loc2_.speciesId;
         for(_loc4_ in _loc3_)
         {
            _loc5_ = int(_loc4_);
            _loc6_ = int(_loc3_[_loc4_]);
            _loc7_ = this.itemConfigProxy.getShopAnimalSpecie(_loc6_);
            if((this.inInventory(_loc7_.maleId) || _loc5_ == TIER_1) && Boolean(_loc7_.breedableAdvance))
            {
               _loc1_.push(this.itemConfigProxy.getAnimalData(_loc7_.maleId));
            }
            if((this.inInventory(_loc7_.femaleId) || _loc5_ == TIER_1) && Boolean(_loc7_.breedableAdvance))
            {
               _loc1_.push(this.itemConfigProxy.getAnimalData(_loc7_.femaleId));
            }
         }
         return _loc1_;
      }
      
      public function getCardsForStep3() : Vector.<Object>
      {
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:ResourceShopData = null;
         var _loc6_:CollectableShopData = null;
         var _loc1_:Vector.<Object> = new Vector.<Object>();
         var _loc2_:GenusConfigVO = this.genusConfigProxy.getConfigById(this.selectedGenus);
         _loc3_ = _loc2_.breedAdvanceResources;
         _loc4_ = 0;
         while(_loc4_ < _loc3_.length)
         {
            switch(_loc3_[_loc4_]["type"])
            {
               case Categories.RESOURCES:
                  _loc5_ = this.itemConfigProxy.getResourseData(_loc3_[_loc4_]["id"]);
                  _loc5_.resourceCount = _loc3_[_loc4_]["cnt"];
                  _loc5_.breedChance = _loc3_[_loc4_]["chance"];
                  _loc1_.push(_loc5_);
                  break;
               case Categories.COLLECTIBLE:
                  _loc6_ = new CollectableShopData();
                  _loc6_.itemId = _loc3_[_loc4_]["id"];
                  _loc6_.collectablesNeeded = _loc3_[_loc4_]["cnt"];
                  _loc6_.breedChance = _loc3_[_loc4_]["chance"];
                  _loc1_.push(_loc6_);
                  break;
            }
            _loc4_++;
         }
         return _loc1_;
      }
      
      private function inInventory(param1:int) : Boolean
      {
         return this.inventoryProxy.getAnimalCountById(param1) > 0;
      }
      
      public function fakeRunning() : void
      {
         this._currentState = STATE_RUNNING;
      }
      
      public function dispose() : void
      {
         this._currentState = STATE_READY;
         this.rewardAnimal = null;
         this.rewardSecond = null;
         this.selectedGenus = -1;
         this.selectedGenusPage = 0;
         this.selectedAnimals = new <int>[-1,-1];
         this.selectedChanceItems = new <Object>[null,null,null];
      }
   }
}

