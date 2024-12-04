package com.bigpoint.zoomumba.model.playfield.vo
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.FieldItemData;
   
   public class BreedingLabVO extends FieldItemData
   {
      public var end:uint;
      
      public var usedItemType1:int;
      
      public var usedItemId1:int;
      
      public var usedItemType2:int;
      
      public var usedItemId2:int;
      
      public var usedItemType3:int;
      
      public var usedItemId3:int;
      
      public var usedItemType4:int;
      
      public var usedItemId4:int;
      
      public var usedItemType5:int;
      
      public var usedItemId5:int;
      
      public function BreedingLabVO()
      {
         super();
         _category = Categories.BREEDING_LAB;
      }
   }
}

