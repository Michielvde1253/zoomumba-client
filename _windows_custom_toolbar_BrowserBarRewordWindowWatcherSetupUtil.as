package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.toolbar.BrowserBarRewordWindow;
   
   public class _windows_custom_toolbar_BrowserBarRewordWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_toolbar_BrowserBarRewordWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         BrowserBarRewordWindow.watcherSetupUtil = new _windows_custom_toolbar_BrowserBarRewordWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

