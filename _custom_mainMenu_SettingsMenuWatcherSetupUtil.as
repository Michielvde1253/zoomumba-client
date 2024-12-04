package
{
   import custom.mainMenu.SettingsMenu;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   
   public class _custom_mainMenu_SettingsMenuWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _custom_mainMenu_SettingsMenuWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         SettingsMenu.watcherSetupUtil = new _custom_mainMenu_SettingsMenuWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

