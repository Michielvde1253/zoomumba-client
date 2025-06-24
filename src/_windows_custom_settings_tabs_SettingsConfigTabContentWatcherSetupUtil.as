package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import windows.custom.settings.tabs.SettingsConfigTabContent;
   
   public class _windows_custom_settings_tabs_SettingsConfigTabContentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_settings_tabs_SettingsConfigTabContentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         SettingsConfigTabContent.watcherSetupUtil = new _windows_custom_settings_tabs_SettingsConfigTabContentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[3] = new PropertyWatcher("qualityRadioGroup",{"propertyChange":true},[param4[4],param4[5],param4[6]],param2);
         param5[6] = new PropertyWatcher("wishesRadioGroup",{"propertyChange":true},[param4[17],param4[18]],param2);
         param5[9] = new PropertyWatcher("musicRadioGroup",{"propertyChange":true},[param4[34],param4[35]],param2);
         param5[7] = new PropertyWatcher("localStorageRadioGroup",{"propertyChange":true},[param4[21],param4[22]],param2);
         param5[8] = new PropertyWatcher("soundEffectRadioGroup",{"propertyChange":true},[param4[30],param4[31]],param2);
         param5[4] = new PropertyWatcher("tooltipRadioGroup",{"propertyChange":true},[param4[9],param4[10]],param2);
         param5[5] = new PropertyWatcher("visitorsRadioGroup",{"propertyChange":true},[param4[13],param4[14]],param2);
         param5[3].updateParent(param1);
         param5[6].updateParent(param1);
         param5[9].updateParent(param1);
         param5[7].updateParent(param1);
         param5[8].updateParent(param1);
         param5[4].updateParent(param1);
         param5[5].updateParent(param1);
      }
   }
}

