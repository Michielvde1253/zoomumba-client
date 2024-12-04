package com.bigpoint.zoomumba.model.gameConfig.vo
{
   import com.bigpoint.zoomumba.model.app.items.ItemPackVO;
   import com.bigpoint.zoomumba.model.app.items.ItemVO;
   
   public class CollectionSetConfigVO
   {
      public var setCategory:int = -1;
      
      public var setItemId:int = -1;
      
      public var collectionId:int = -1;
      
      public var collectables:Vector.<ItemVO> = null;
      
      public var rewards:Vector.<ItemPackVO> = null;
      
      public function CollectionSetConfigVO()
      {
         super();
      }
   }
}

