package com.bigpoint.zoomumba.model.gameConfig.vo
{
   import com.bigpoint.zoorama.data.settings.CageSpecieShopData;
   import flash.utils.Dictionary;
   
   public class ItemConfigVO
   {
      public var speciesData:Dictionary = new Dictionary();
      
      public var animalsData:Dictionary = new Dictionary();
      
      public var animalsMaleData:Dictionary = new Dictionary();
      
      public var animalsFemaleData:Dictionary = new Dictionary();
      
      public var animalsChildData:Dictionary = new Dictionary();
      
      public var cagesData:Dictionary = new Dictionary();
      
      public var storesData:Dictionary = new Dictionary();
      
      public var decorsData:Dictionary = new Dictionary();
      
      public var resourcesData:Dictionary = new Dictionary();
      
      public var materialData:Dictionary = new Dictionary();
      
      public var roadsData:Dictionary = new Dictionary();
      
      public var powerupData:Dictionary = new Dictionary();
      
      public var trashbinsData:Dictionary = new Dictionary();
      
      public var assistancesData:Dictionary = new Dictionary();
      
      public var premiumsData:Dictionary = new Dictionary();
      
      public var premiumPacksData:Dictionary = new Dictionary();
      
      public var storageData:Dictionary = new Dictionary();
      
      public var expansionData:Dictionary = new Dictionary();
      
      public var nurseryData:Dictionary = new Dictionary();
      
      public var breedingLabData:Dictionary = new Dictionary();
      
      public var eventItemData:Dictionary = new Dictionary();
      
      public var surpriseBoxItemData:Dictionary = new Dictionary();
      
      public var blueprints:Dictionary = new Dictionary();
      
      public var cageSpeciesData:Vector.<Vector.<CageSpecieShopData>> = new Vector.<Vector.<CageSpecieShopData>>();
      
      public var animalSpecieData:Dictionary = new Dictionary();
      
      public var foodSpecieData:Array = [];
      
      public function ItemConfigVO()
      {
         super();
      }
   }
}

