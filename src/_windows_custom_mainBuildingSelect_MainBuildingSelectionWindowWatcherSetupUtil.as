package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.mainBuildingSelect.MainBuildingSelectionWindow;
   
   public class _windows_custom_mainBuildingSelect_MainBuildingSelectionWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_mainBuildingSelect_MainBuildingSelectionWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         MainBuildingSelectionWindow.watcherSetupUtil = new _windows_custom_mainBuildingSelect_MainBuildingSelectionWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

