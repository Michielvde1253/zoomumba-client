package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.settings.SettingsWindow;
   
   public class _windows_custom_settings_SettingsWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_settings_SettingsWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         SettingsWindow.watcherSetupUtil = new _windows_custom_settings_SettingsWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

