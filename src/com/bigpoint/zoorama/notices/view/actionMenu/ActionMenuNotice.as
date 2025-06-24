package com.bigpoint.zoorama.notices.view.actionMenu
{
   import com.bigpoint.utils.notificator.Notice;
   import com.bigpoint.zoorama.view.field.items.ItemAbstract;
   import flash.geom.Point;
   
   public class ActionMenuNotice extends Notice
   {
      public static const OPEN_ACTION_MENU:String = "openActionMenu";
      
      public static const CLOSE_ACTION_MENU:String = "closeActionMenu";
      
      public static const TOGGLE_ACTION_MENU:String = "toggleActionMenu";
      
      public static const EXECUTE_ALL_ACTIONS:String = "executeAllMenuActions";
      
      public var actionMenuId:int = -1;
      
      public var targetItem:ItemAbstract;
      
      public var menuPosition:Point;
      
      public var replace:Boolean;
      
      public function ActionMenuNotice(param1:String, param2:int = -1, param3:ItemAbstract = null, param4:Point = null, param5:Boolean = true)
      {
         super(param1);
         this.actionMenuId = param2;
         this.targetItem = param3;
         this.menuPosition = param4;
         this.replace = param5;
      }
   }
}

