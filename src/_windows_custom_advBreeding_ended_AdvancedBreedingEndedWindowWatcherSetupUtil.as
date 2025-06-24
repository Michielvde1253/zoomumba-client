package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.advBreeding.ended.AdvancedBreedingEndedWindow;
   
   public class _windows_custom_advBreeding_ended_AdvancedBreedingEndedWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_advBreeding_ended_AdvancedBreedingEndedWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         AdvancedBreedingEndedWindow.watcherSetupUtil = new _windows_custom_advBreeding_ended_AdvancedBreedingEndedWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

