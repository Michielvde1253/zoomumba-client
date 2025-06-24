package com.bigpoint.zoomumba.controller.app
{
   import com.bigpoint.zoomumba.model.app.settings.AppConfigProxy;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class ToggleKeysCommand extends SimpleCommand
   {
      public static const ENABLE_ALL_KEYS:String = "ENABLE_ALL_KEYS";
      
      public static const DISABLE_ALL_KEYS:String = "DISABLE_ALL_KEYS";
      
      public static const ENABLE_MOVEMENT_KEYS:String = "ENABLE_MOVEMENT_KEYS";
      
      public static const DISABLE_MOVEMENT_KEYS:String = "DISABLE_MOVEMENT_KEYS";
      
      public static const ENABLE_SHORTCUTS_KEYS:String = "ENABLE_SHORTCUTS_KEYS";
      
      public static const DISABLE_SHORTCUTS_KEYS:String = "DISABLE_SHORTCUTS_KEYS";
      
      public function ToggleKeysCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:AppConfigProxy = facade.retrieveProxy(AppConfigProxy.NAME) as AppConfigProxy;
         switch(param1.getBody() as String)
         {
            case ENABLE_ALL_KEYS:
               _loc2_.disable_all_keys = false;
               _loc2_.disable_shortcut_keys = false;
               _loc2_.disable_movement_keys = false;
               break;
            case DISABLE_ALL_KEYS:
               _loc2_.disable_all_keys = true;
               break;
            case ENABLE_MOVEMENT_KEYS:
               _loc2_.disable_movement_keys = false;
               _loc2_.disable_shortcut_keys = true;
               _loc2_.disable_all_keys = false;
               break;
            case DISABLE_MOVEMENT_KEYS:
               _loc2_.disable_movement_keys = true;
               _loc2_.disable_shortcut_keys = false;
               _loc2_.disable_all_keys = false;
               break;
            case ENABLE_SHORTCUTS_KEYS:
               _loc2_.disable_movement_keys = true;
               _loc2_.disable_shortcut_keys = false;
               _loc2_.disable_all_keys = false;
               break;
            case DISABLE_SHORTCUTS_KEYS:
               _loc2_.disable_movement_keys = false;
               _loc2_.disable_shortcut_keys = true;
               _loc2_.disable_all_keys = false;
         }
      }
   }
}

