package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.events.valentines2013.Valentines2013PayPackageWindow;
   
   public class _windows_custom_events_valentines2013_Valentines2013PayPackageWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_events_valentines2013_Valentines2013PayPackageWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         Valentines2013PayPackageWindow.watcherSetupUtil = new _windows_custom_events_valentines2013_Valentines2013PayPackageWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

