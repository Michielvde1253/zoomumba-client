package com.bigpoint.zoomumba.model.gameConfig.vo
{
   import com.bigpoint.utils.ObjectHelper;
   import com.bigpoint.zoomumba.constants.items.ItemInternalTypes;
   import com.bigpoint.zoorama.data.settings.InheritedShopData;
   
   public class AnimalSpeciesVO extends InheritedShopData
   {
      public var alias:String;
      
      public var speciesId:int;
      
      public var rating:int;
      
      public var animalSize:int;
      
      public var animalIds:Array;
      
      public var isMaleSelected:Boolean = true;
      
      public var selectedId:int = -1;
      
      public var inQuest:Array;
      
      public var inSafari:Array;
      
      public var inTombola:Array;
      
      public var isEvent:Array;
      
      public var cages:Object;
      
      public var breedable:int;
      
      public var breedChance:int;
      
      public var breedTime:int;
      
      public var breedMale:int;
      
      public var breedCostVirtual:int;
      
      public var breedCostReal:int;
      
      public var directBreedReal:int;
      
      public var breedExp:int;
      
      public var tier:int;
      
      public var genusId:int;
      
      public var breedableAdvance:int;
      
      public var breedAdvanceTime:int;
      
      public var breedAdvanceCost:Array;
      
      public var breedAdvanceReward:Array;
      
      public var raisable:int;
      
      public var raisingTime:int;
      
      public var raisingCost:Array;
      
      public var raisingDirectCost:Array;
      
      public var muserLevelRequired:Array;
      
      public var mbuyable:Array;
      
      public var msellable:Array;
      
      public var mbuyVirtual:Array;
      
      public var mbuyReal:Array;
      
      public var msellVirtual:Array;
      
      public var msellReal:Array;
      
      public var foodId:int;
      
      public var foodPerAnimal:int;
      
      public var feedTime:int;
      
      public var feedExpReward:int;
      
      public var powerFeedTime:int;
      
      public var powerFeedExpReward:int;
      
      public var superFeedTime:int;
      
      public var superFeedExpReward:int;
      
      public var cleanTime:int;
      
      public var cleanExpReward:int;
      
      public var cuddleTime:int;
      
      public var cuddleExpReward:int;
      
      public var waterTime:int;
      
      public var waterPerAnimal:int;
      
      public var waterExpReward:int;
      
      public var sickTime:int;
      
      public var healthTime:int;
      
      public var startDate:int;
      
      public var order:int;
      
      public var playfields:Array;
      
      public function AnimalSpeciesVO()
      {
         super();
         internalType = ItemInternalTypes.SPECIE;
      }
      
      override public function get itemId() : int
      {
         return this.speciesId;
      }
      
      override public function set itemId(param1:int) : void
      {
         this.speciesId = param1;
      }
      
      override public function getAttraction() : int
      {
         return _attraction[this.animalIds.indexOf(this.selectedId)];
      }
      
      override public function getUserLevelRequired() : int
      {
         return this.muserLevelRequired[this.animalIds.indexOf(this.selectedId)];
      }
      
      override public function getBuyable() : int
      {
         return this.mbuyable[this.animalIds.indexOf(this.selectedId)];
      }
      
      override public function getSellable() : int
      {
         return this.msellable[this.animalIds.indexOf(this.selectedId)];
      }
      
      override public function getBuyVirtual() : int
      {
         return this.mbuyVirtual[this.animalIds.indexOf(this.selectedId)];
      }
      
      override public function getBuyReal() : int
      {
         return this.mbuyReal[this.animalIds.indexOf(this.selectedId)];
      }
      
      override public function getSellVirtual() : int
      {
         return this.msellVirtual[this.animalIds.indexOf(this.selectedId)];
      }
      
      override public function getSellReal() : int
      {
         return this.msellReal[this.animalIds.indexOf(this.selectedId)];
      }
      
      public function get maleId() : int
      {
         return this.animalIds[0];
      }
      
      public function get femaleId() : int
      {
         return this.animalIds[1];
      }
      
      public function get childId() : int
      {
         return this.animalIds[2];
      }
      
      public function clone() : AnimalSpeciesVO
      {
         var _loc1_:AnimalSpeciesVO = ObjectHelper.clone(this) as AnimalSpeciesVO;
         return _loc1_ as AnimalSpeciesVO;
      }
   }
}

