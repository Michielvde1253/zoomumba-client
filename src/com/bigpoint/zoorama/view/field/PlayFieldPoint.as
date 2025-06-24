package com.bigpoint.zoorama.view.field
{
   import flash.geom.Point;
   
   public class PlayFieldPoint extends Point
   {
      public function PlayFieldPoint(param1:int = 0, param2:int = 0)
      {
         super(param1,param2);
      }
      
      public function moveLeft(param1:int) : void
      {
         x -= param1;
         y += param1;
      }
      
      public function moveRight(param1:int) : void
      {
         x += param1;
         y -= param1;
      }
      
      public function moveUp(param1:int) : void
      {
         x -= param1;
         y -= param1;
      }
      
      public function moveDown(param1:int) : void
      {
         x += param1;
         y += param1;
      }
   }
}

