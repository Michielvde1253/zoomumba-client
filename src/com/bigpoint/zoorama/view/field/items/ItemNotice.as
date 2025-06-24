package com.bigpoint.zoorama.view.field.items
{
   import com.bigpoint.utils.notificator.Notice;
   import flash.geom.Point;
   
   public class ItemNotice extends Notice
   {
      public static const DRAG_START:String = "fielditemDragStart";
      
      public static const MOUSE_OVER:String = "fielditemMouseOver";
      
      public static const MOUSE_OUT:String = "fielditemMouseOut";
      
      public static const MOUSE_UP:String = "fielditemMouseUp";
      
      public static const DRAG_DROP_OUTSIDE:String = "fielditemDragDropOutside";
      
      public static const CLICK:String = "fieldItemClick";
      
      public static const POSITION_UPDATE:String = "fielditempositionUpdate";
      
      public static const SEND_POSITION_IN_CELL:String = "sendPositionItemInCell";
      
      public static const COLLECT_STORE_MONEY:String = "collectStoreMoneyFromButton";
      
      public var categoryId:int;
      
      public var itemId:int;
      
      public var level:int;
      
      public var uniqueId:int;
      
      public var groundRequired:int;
      
      public var rotatePos:int;
      
      public var size:Point;
      
      public function ItemNotice(param1:String, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:Point)
      {
         this.categoryId = param2;
         this.itemId = param3;
         this.level = param4;
         this.uniqueId = param5;
         this.groundRequired = param6;
         this.rotatePos = param7;
         this.size = param8;
         super(param1);
      }
      
      public function toString() : String
      {
         return "ItemNotice{" + "type:" + type + ", categoryId:" + this.categoryId + ", itemId:" + this.itemId + ", uniqueId:" + this.uniqueId + ", rotatePos:" + this.rotatePos + ", size:" + this.size + "}";
      }
   }
}

