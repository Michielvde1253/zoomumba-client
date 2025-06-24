package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.events.advBreeding.AdvBreedingEventWindow;
   
   public class _windows_custom_events_advBreeding_AdvBreedingEventWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_events_advBreeding_AdvBreedingEventWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         AdvBreedingEventWindow.watcherSetupUtil = new _windows_custom_events_advBreeding_AdvBreedingEventWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

