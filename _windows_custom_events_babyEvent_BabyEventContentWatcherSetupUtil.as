package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.events.babyEvent.BabyEventContent;
   
   public class _windows_custom_events_babyEvent_BabyEventContentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_events_babyEvent_BabyEventContentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         BabyEventContent.watcherSetupUtil = new _windows_custom_events_babyEvent_BabyEventContentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

