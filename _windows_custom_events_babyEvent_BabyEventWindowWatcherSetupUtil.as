package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.events.babyEvent.BabyEventWindow;
   
   public class _windows_custom_events_babyEvent_BabyEventWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_events_babyEvent_BabyEventWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         BabyEventWindow.watcherSetupUtil = new _windows_custom_events_babyEvent_BabyEventWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

