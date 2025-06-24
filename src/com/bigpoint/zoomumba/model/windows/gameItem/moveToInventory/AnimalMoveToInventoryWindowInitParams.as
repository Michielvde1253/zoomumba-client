package com.bigpoint.zoomumba.model.windows.gameItem.moveToInventory
{
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.AnimalData;
   import com.bigpoint.zoorama.view.field.items.Cage;
   
   public class AnimalMoveToInventoryWindowInitParams
   {
      public var cage:Cage;
      
      public var babyId:int = -1;
      
      public var animals:Vector.<AnimalData>;
      
      public function AnimalMoveToInventoryWindowInitParams(param1:Cage, param2:int, param3:Vector.<AnimalData>)
      {
         super();
         this.cage = param1;
         this.babyId = param2;
         this.animals = param3;
      }
   }
}

