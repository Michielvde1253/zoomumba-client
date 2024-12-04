package com.bigpoint.zoorama.view.gui
{
   import com.bigpoint.utils.notificator.Notice;
   
   public class GuiNotice extends Notice
   {
      public static const CLOSE_MAIN_WINDOW:String = "CloseMainwindow";
      
      public static const OPEN_MAIN_WINDOW:String = "OpenMainwindow";
      
      public static const OPEN_MAIN_TOOL_MENU:String = "OpenMainToolMenu";
      
      public static const CLOSE_INFO_WINDOW:String = "OpenMainToolMenu";
      
      public static const MENU_ITEM_CLICK:String = "MenuItemClick";
      
      public static const ZOOM_IN_CLICK:String = "ZoomInClick";
      
      public static const ZOOM_OUT_CLICK:String = "ZoomOutClick";
      
      public static const LOG_OUT:String = "LogOut";
      
      public static const VOLUME_SWITCH_CLICK:String = "VolumeSwitchClick";
      
      public var windowId:int;
      
      public var categoryId:int;
      
      public function GuiNotice(param1:String, param2:int = -1, param3:int = -1)
      {
         this.windowId = param2;
         this.categoryId = param3;
         super(param1);
      }
   }
}

