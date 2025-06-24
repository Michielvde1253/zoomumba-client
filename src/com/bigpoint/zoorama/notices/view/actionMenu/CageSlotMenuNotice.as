package com.bigpoint.zoorama.notices.view.actionMenu
{
   import com.bigpoint.zoorama.view.dragItem.DragItem;
   import com.bigpoint.zoorama.view.field.items.ItemAbstract;
   import flash.geom.Point;
   
   public class CageSlotMenuNotice extends ActionMenuNotice
   {
      public var dragItem:DragItem;
      
      public function CageSlotMenuNotice(param1:String, param2:int = -1, param3:ItemAbstract = null, param4:DragItem = null, param5:Point = null, param6:Boolean = true)
      {
         this.dragItem = param4;
         super(param1,param2,param3,param5,param6);
      }
   }
}

