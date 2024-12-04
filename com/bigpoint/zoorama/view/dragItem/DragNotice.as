package com.bigpoint.zoorama.view.dragItem
{
   import com.bigpoint.zoorama.view.field.items.ItemNotice;
   import flash.geom.Point;
   
   public class DragNotice extends ItemNotice
   {
      public static const DROP_ITEM:String = "dropItem";
      
      public static const PRESS_ITEM:String = "pressItem";
      
      public static const DRAG:String = "dragItem";
      
      public var dragPoint:Point;
      
      public var realMoney:Boolean;
      
      public var useInventory:Boolean;
      
      public var isMoveRoad:Boolean;
      
      public var cageLevel:int = 0;
      
      public function DragNotice(param1:String, param2:Point, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:Point, param10:Boolean, param11:Boolean, param12:int = 0, param13:Boolean = false)
      {
         super(param1,param3,param4,param5,param6,param7,param8,param9);
         this.dragPoint = param2;
         this.realMoney = param10;
         this.useInventory = param11;
         this.cageLevel = param12;
         this.isMoveRoad = param13;
      }
      
      override public function toString() : String
      {
         return "ItemNotice{" + "categoryId:" + categoryId + ", itemId:" + itemId + ", uniqueId:" + uniqueId + ", rotatePos:" + rotatePos + ", size:" + size + ", useInventory:" + this.useInventory + "|" + ", dragPoint:" + this.dragPoint + ", realMoney:" + this.realMoney + "}";
      }
   }
}

