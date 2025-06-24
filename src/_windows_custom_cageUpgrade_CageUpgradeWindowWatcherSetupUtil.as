package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.cageUpgrade.CageUpgradeWindow;
   
   public class _windows_custom_cageUpgrade_CageUpgradeWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_cageUpgrade_CageUpgradeWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         CageUpgradeWindow.watcherSetupUtil = new _windows_custom_cageUpgrade_CageUpgradeWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

