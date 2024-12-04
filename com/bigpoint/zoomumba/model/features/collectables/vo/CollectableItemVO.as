package com.bigpoint.zoomumba.model.features.collectables.vo
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.model.app.items.ItemVO;
   
   public class CollectableItemVO extends ItemVO
   {
      public var amount:int;
      
      public var isCollected:Boolean = false;
      
      public function CollectableItemVO()
      {
         super();
         category = Categories.COLLECTIBLE;
      }
   }
}

