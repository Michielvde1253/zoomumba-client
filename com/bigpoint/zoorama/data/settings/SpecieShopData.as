package com.bigpoint.zoorama.data.settings
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.items.ItemInternalTypes;
   
   public class SpecieShopData extends ShopItemData
   {
      public var speciesId:int;
      
      public var rating:int;
      
      public var feedTime:int;
      
      public var feedExpReward:int;
      
      public var waterTime:int;
      
      public var waterExpReward:int;
      
      public var cleanTime:int;
      
      public var cleanExpReward:int;
      
      public var cuddleTime:int;
      
      public var cuddleExpReward:int;
      
      public var breedTime:int;
      
      public var breedCostReal:int;
      
      public var breedCostVirtual:int;
      
      public var breedExp:int;
      
      public var superFeedTime:int;
      
      public var directBreedReal:int;
      
      public var superFeedExpReward:int;
      
      public var foodId:int;
      
      public var foodPerAnimal:int;
      
      public var waterPerAnimal:int;
      
      public var alias:String;
      
      public var breedSexRate:int;
      
      public var breedChance:int;
      
      public var sickTime:int;
      
      public var healthTime:int;
      
      public var breedMale:int;
      
      public var powerFeedTime:int;
      
      public var powerFeedExpReward:int;
      
      private var itemStartDate:int;
      
      public var minFeedPawsReward:int;
      
      public var maxFeedPawsReward:int;
      
      public var cageTypesPlaceable:Array;
      
      public var playfields:Array;
      
      public function SpecieShopData()
      {
         super();
         internalType = ItemInternalTypes.SPECIE;
         categoryId = Categories.SPECIES;
      }
      
      override public function get itemId() : int
      {
         return this.speciesId;
      }
      
      override public function set itemId(param1:int) : void
      {
         this.speciesId = param1;
      }
      
      public function set startDate(param1:int) : void
      {
         this.itemStartDate = param1;
      }
   }
}

