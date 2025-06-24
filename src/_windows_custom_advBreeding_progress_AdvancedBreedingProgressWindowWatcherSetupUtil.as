package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.advBreeding.progress.AdvancedBreedingProgressWindow;
   
   public class _windows_custom_advBreeding_progress_AdvancedBreedingProgressWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_advBreeding_progress_AdvancedBreedingProgressWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         AdvancedBreedingProgressWindow.watcherSetupUtil = new _windows_custom_advBreeding_progress_AdvancedBreedingProgressWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

