package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.events.advBreeding.AdvBreedingEventEndWindow;
   
   public class _windows_custom_events_advBreeding_AdvBreedingEventEndWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_events_advBreeding_AdvBreedingEventEndWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         AdvBreedingEventEndWindow.watcherSetupUtil = new _windows_custom_events_advBreeding_AdvBreedingEventEndWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

