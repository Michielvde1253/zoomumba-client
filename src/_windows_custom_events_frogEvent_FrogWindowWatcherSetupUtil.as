package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.events.frogEvent.FrogWindow;
   
   public class _windows_custom_events_frogEvent_FrogWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_events_frogEvent_FrogWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         FrogWindow.watcherSetupUtil = new _windows_custom_events_frogEvent_FrogWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

