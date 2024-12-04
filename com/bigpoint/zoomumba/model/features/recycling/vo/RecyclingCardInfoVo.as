package com.bigpoint.zoomumba.model.features.recycling.vo
{
   import com.bigpoint.zoorama.data.settings.InheritedShopData;
   import com.bigpoint.zoorama.data.settings.MaterialShopData;
   
   public class RecyclingCardInfoVo extends InheritedShopData
   {
      public var slotDataVo:RecyclingSlotDataVo;
      
      public var materialShopData:MaterialShopData;
      
      public var state:int;
      
      public function RecyclingCardInfoVo()
      {
         super();
      }
   }
}

