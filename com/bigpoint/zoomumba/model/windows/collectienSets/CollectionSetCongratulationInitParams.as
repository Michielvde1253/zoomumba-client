package com.bigpoint.zoomumba.model.windows.collectienSets
{
   public class CollectionSetCongratulationInitParams
   {
      public var collectionSetCategoryId:int;
      
      public var collectionSetItemId:int;
      
      public var collectionSetId:int;
      
      public var isFirstTime:Boolean;
      
      public function CollectionSetCongratulationInitParams(param1:int, param2:int, param3:int, param4:Boolean)
      {
         super();
         this.collectionSetCategoryId = param1;
         this.collectionSetItemId = param2;
         this.collectionSetId = param3;
         this.isFirstTime = param4;
      }
   }
}

