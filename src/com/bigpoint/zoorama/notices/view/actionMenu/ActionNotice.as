package com.bigpoint.zoorama.notices.view.actionMenu
{
   import com.bigpoint.utils.notificator.Notice;
   
   public class ActionNotice extends Notice
   {
      public static const ACTION_MENU_BUTTON_CLICK:String = "actionMenuButtonClick";
      
      public var menuType:int;
      
      public var actionId:int;
      
      public var itemCategory:int;
      
      public var itemUniqueId:int;
      
      public var soundName:String;
      
      public function ActionNotice(param1:String, param2:int, param3:int, param4:int, param5:int, param6:String = null)
      {
         super(param1);
         this.menuType = param2;
         this.actionId = param3;
         this.itemCategory = param4;
         this.itemUniqueId = param5;
         this.soundName = param6;
      }
   }
}

