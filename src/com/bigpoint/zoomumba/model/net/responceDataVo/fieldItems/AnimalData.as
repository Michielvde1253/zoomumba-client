package com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems
{
   import com.bigpoint.zoomumba.constants.Categories;
   
   public class AnimalData extends FieldItemData
   {
      public var animalId:int = -1;
      
      public var specieId:int = -1;
      
      public var cId:int = -1;
      
      public function AnimalData()
      {
         super();
         _category = Categories.ANIMAL;
      }
      
      public function set aId(param1:int) : void
      {
         this.animalId = param1;
      }
      
      public function get aId() : int
      {
         return this.animalId;
      }
      
      public function set sId(param1:int) : void
      {
         this.specieId = param1;
      }
      
      public function get sId() : int
      {
         return this.specieId;
      }
   }
}

