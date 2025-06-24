package com.bigpoint.zoorama.data.settings
{
   import com.bigpoint.zoomumba.model.app.items.ItemStackVO;
   import com.bigpoint.zoomumba.model.app.items.ItemVO;
   
   public class BlueprintShopData extends ShopItemData
   {
      public var blueprintId:int = 0;
      
      public var alias:String = "";
      
      public var craftDuration:int = 0;
      
      public var craftPaws:int = 0;
      
      public var neededMaterials:Vector.<ItemStackVO> = new Vector.<ItemStackVO>();
      
      public var rewardXP:int;
      
      public var rewardItem:ItemVO;
      
      public var craftInstantReal:int;
      
      public function BlueprintShopData()
      {
         super();
      }
   }
}

