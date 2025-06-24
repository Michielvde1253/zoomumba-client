package com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.model.app.items.DropVO;
   
   public class CageData extends FieldItemData
   {
      public var speciesId:int = -1;
      
      public var level:int = -1;
      
      public var maleCount:int = -1;
      
      public var femaleCount:int = -1;
      
      public var childCount:int = -1;
      
      public var waterTimeStamp:int = -1;
      
      public var feedTimeStamp:int = -1;
      
      public var cleanTimeStamp:int = -1;
      
      public var cuddleTimeStamp:int = -1;
      
      public var sickTimeStamp:int = -1;
      
      public var healthTimeStamp:int = -1;
      
      public var eventTimeStamp:int = -1;
      
      public var eventId:int = -1;
      
      public var breedTimeStamp:int = -1;
      
      public var isSuperFeed:int = -1;
      
      public var canBreed:int = -1;
      
      public var breedable:int = 1;
      
      public var feedDrop:DropVO;
      
      public var superFeedDrop:DropVO;
      
      public var powerFeedDrop:DropVO;
      
      public var waterDrop:DropVO;
      
      public var cuddleDrop:DropVO;
      
      public var cleanDrop:DropVO;
      
      public var healDrop:DropVO;
      
      public var superHealDrop:DropVO;
      
      public var breadDrop:DropVO;
      
      public var superBreadDrop:DropVO;
      
      public function CageData()
      {
         super();
         _category = Categories.CAGE;
      }
      
      override public function toString() : String
      {
         return "CageData:{" + " category:" + _category + " uniqueId:" + uniqueId + " itemId:" + itemId + " active:" + active + " posX:" + posX + " posY:" + posY + " buildTimeStamp:" + buildTimeStamp + " rotatePos:" + rotatePos + " del:" + del + " | " + " speciesId:" + this.speciesId + " maleCount:" + this.maleCount + " femaleCount:" + this.femaleCount + " childCount:" + this.childCount + " sickTimeStamp:" + this.sickTimeStamp + " healthTimeStamp:" + this.healthTimeStamp + " cleanTimeStamp:" + this.cleanTimeStamp + " feedTimeStamp:" + this.feedTimeStamp + " isSuperFeed:" + this.isSuperFeed + " waterTimeStamp:" + this.waterTimeStamp + " cuddleTimeStamp:" + this.cuddleTimeStamp + " breedTimeStamp:" + this.breedTimeStamp + " canBreed:" + this.canBreed + "}";
      }
      
      public function set water(param1:int) : void
      {
         this.waterTimeStamp = param1;
      }
      
      public function set clean(param1:int) : void
      {
         this.cleanTimeStamp = param1;
      }
      
      public function set feed(param1:int) : void
      {
         this.feedTimeStamp = param1;
      }
      
      public function set breed(param1:int) : void
      {
         this.breedTimeStamp = param1;
      }
      
      public function set cuddle(param1:int) : void
      {
         this.cuddleTimeStamp = param1;
      }
      
      public function set male(param1:int) : void
      {
         this.maleCount = param1;
      }
      
      public function set female(param1:int) : void
      {
         this.femaleCount = param1;
      }
      
      public function set child(param1:int) : void
      {
         this.childCount = param1;
      }
      
      public function set sick(param1:int) : void
      {
         this.sickTimeStamp = param1;
      }
      
      public function set health(param1:int) : void
      {
         this.healthTimeStamp = param1;
      }
      
      public function set sfeed(param1:int) : void
      {
         this.isSuperFeed = param1;
      }
      
      public function set sId(param1:int) : void
      {
         this.speciesId = param1;
      }
      
      public function set cId(param1:int) : void
      {
         this.itemId = param1;
      }
      
      public function set evEnd(param1:int) : void
      {
         this.eventTimeStamp = param1;
      }
   }
}

