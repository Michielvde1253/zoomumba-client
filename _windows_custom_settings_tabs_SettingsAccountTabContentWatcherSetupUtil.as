package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.settings.tabs.SettingsAccountTabContent;
   
   public class _windows_custom_settings_tabs_SettingsAccountTabContentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_settings_tabs_SettingsAccountTabContentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         SettingsAccountTabContent.watcherSetupUtil = new _windows_custom_settings_tabs_SettingsAccountTabContentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

