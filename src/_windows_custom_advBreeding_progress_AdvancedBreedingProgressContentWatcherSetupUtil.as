package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.advBreeding.progress.AdvancedBreedingProgressContent;
   
   public class _windows_custom_advBreeding_progress_AdvancedBreedingProgressContentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_advBreeding_progress_AdvancedBreedingProgressContentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         AdvancedBreedingProgressContent.watcherSetupUtil = new _windows_custom_advBreeding_progress_AdvancedBreedingProgressContentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

