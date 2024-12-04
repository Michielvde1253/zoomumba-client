package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.settings.SettingsContent;
   
   public class _windows_custom_settings_SettingsContentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_settings_SettingsContentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         SettingsContent.watcherSetupUtil = new _windows_custom_settings_SettingsContentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

