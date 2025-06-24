package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.events.circus.CircusWindow;
   
   public class _windows_custom_events_circus_CircusWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_events_circus_CircusWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         CircusWindow.watcherSetupUtil = new _windows_custom_events_circus_CircusWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

