package com.bigpoint.zoorama.view.components.scrollpane
{
   import flash.display.DisplayObject;
   
   public class ScollPaneContent extends ScollPaneBaseAbstract
   {
      public function ScollPaneContent()
      {
         super();
      }
      
      public function addItem(param1:DisplayObject, param2:int, param3:int) : void
      {
         target.addChild(param1);
         param1.x = param2;
         param1.y = param3;
      }
      
      public function clearAll() : void
      {
         while(target.numChildren > 0)
         {
            target.removeChildAt(0);
         }
      }
   }
}

