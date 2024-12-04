package com.bigpoint.zoomumba.model.gameConfig.vo
{
   public class PremiumPackConfigVO
   {
      public var fieldActionExpMultiplyer:Number = 1;
      
      public var fieldActionPetPawsMultiplyer:Number = 1;
      
      public var fieldActionPearlsMultiplyer:Number = 1;
      
      public var animalBreadingCostMultiplyer:Number = 1;
      
      public var allNormalBuildingsCostMultiplyer:Number = 1;
      
      public var animalHealtTimeMultiplyer:Number = 1;
      
      public var entranceFeeMaxAmmountMultiplyer:Number = 1;
      
      public function PremiumPackConfigVO()
      {
         super();
      }
      
      public function set breed(param1:Number) : void
      {
         this.animalBreadingCostMultiplyer = param1;
      }
      
      public function set cageExp(param1:Number) : void
      {
         this.fieldActionExpMultiplyer = param1;
      }
      
      public function set efCap(param1:Number) : void
      {
         this.entranceFeeMaxAmmountMultiplyer = param1;
      }
      
      public function set health(param1:Number) : void
      {
         this.animalHealtTimeMultiplyer = param1;
      }
      
      public function set shop(param1:Number) : void
      {
         this.allNormalBuildingsCostMultiplyer = param1;
      }
      
      public function set petPaw(param1:Number) : void
      {
         this.fieldActionPetPawsMultiplyer = param1;
      }
      
      public function set pearlMultiplier(param1:Number) : void
      {
         this.fieldActionPearlsMultiplyer = param1;
      }
   }
}

