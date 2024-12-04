package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.events.easter.EasterWindow;
   
   public class _windows_custom_events_easter_EasterWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_events_easter_EasterWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         EasterWindow.watcherSetupUtil = new _windows_custom_events_easter_EasterWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

