package com.bigpoint.zoorama.data.settings
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.items.ItemInternalTypes;
   
   public class AnimalShopData extends ShopItemData
   {
      public var animalId:int;
      
      public var alias:String;
      
      public var speciesId:int;
      
      public var foodId:int;
      
      public var raisable:int;
      
      public var genusId:int;
      
      public var gender:int = -1;
      
      public var raisingTime:int;
      
      public var raisingCost:Array;
      
      public var raisingDirectCost:Array;
      
      public var breedableAdvance:int;
      
      public var breedAdvanceTime:int;
      
      public var breedAdvanceCost:Array;
      
      public var breedAdvanceReward:Array;
      
      public var useRealCurrency:int = 0;
      
      public var playfields:Array = [];
      
      public var cageTypesPlaceable:Array = [];
      
      public function AnimalShopData()
      {
         super();
         categoryId = Categories.ANIMAL;
         internalType = ItemInternalTypes.ANIMAL;
      }
      
      override public function get itemId() : int
      {
         return this.animalId;
      }
      
      override public function set itemId(param1:int) : void
      {
         this.animalId = param1;
      }
      
      public function set inTombola(param1:int) : void
      {
      }
      
      public function set isInWheel(param1:int) : void
      {
      }
      
      public function set child(param1:int) : void
      {
         if(param1)
         {
            this.gender = 2;
         }
      }
      
      public function get child() : int
      {
         if(this.gender == 2)
         {
            return 1;
         }
         return 0;
      }
      
      public function set male(param1:int) : void
      {
         if(param1)
         {
            this.gender = 0;
         }
      }
      
      public function get male() : int
      {
         if(this.gender == 0)
         {
            return 1;
         }
         return 0;
      }
      
      public function set female(param1:int) : void
      {
         if(param1)
         {
            this.gender = 1;
         }
      }
      
      public function get female() : int
      {
         if(this.gender == 1)
         {
            return 1;
         }
         return 0;
      }
   }
}

