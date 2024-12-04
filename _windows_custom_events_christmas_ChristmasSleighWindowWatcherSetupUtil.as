package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.events.christmas.ChristmasSleighWindow;
   
   public class _windows_custom_events_christmas_ChristmasSleighWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_events_christmas_ChristmasSleighWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ChristmasSleighWindow.watcherSetupUtil = new _windows_custom_events_christmas_ChristmasSleighWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

