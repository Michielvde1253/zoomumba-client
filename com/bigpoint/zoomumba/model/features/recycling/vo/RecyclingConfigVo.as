package com.bigpoint.zoomumba.model.features.recycling.vo
{
   public class RecyclingConfigVo
   {
      public var freeSlots:int = 0;
      
      public var maxStack:int = 0;
      
      public var maxSlots:int = 0;
      
      public var rareDropChanceBooster:int = 0;
      
      public var slotRentList:Vector.<RecyclingSlotRentVo> = new Vector.<RecyclingSlotRentVo>();
      
      public var rareDropChance:Vector.<int> = new Vector.<int>();
      
      public function RecyclingConfigVo()
      {
         super();
      }
   }
}

