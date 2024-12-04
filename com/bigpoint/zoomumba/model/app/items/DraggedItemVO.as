package com.bigpoint.zoomumba.model.app.items
{
   public class DraggedItemVO
   {
      public var dragged:ItemVO;
      
      public var target:ItemVO;
      
      public function DraggedItemVO(param1:ItemVO, param2:ItemVO)
      {
         super();
         this.dragged = param1;
         this.target = param2;
      }
   }
}

