package com.bigpoint.zoorama.view.gui.mainmenu
{
   import com.bigpoint.utils.notificator.Notice;
   import com.bigpoint.zoorama.utils.mouseModule.MouseState;
   
   public class MouseToolNotice extends Notice
   {
      public static const INIT_MOVE_TOOL:String = MouseState.MOVE_ITEM;
      
      public static const INIT_FLIP_TOOL:String = MouseState.FLIP_ITEM;
      
      public static const INIT_SELL_TOOL:String = MouseState.SELL_ITEM;
      
      public static const INIT_STORE_TOOL:String = MouseState.STORE_ITEM;
      
      public static const INIT_HALT_ACTIONS:String = MouseState.HALT_ACTIONS;
      
      public static const DEFAULT:String = MouseState.DEFAULT;
      
      public function MouseToolNotice(param1:String)
      {
         super(param1);
      }
   }
}

