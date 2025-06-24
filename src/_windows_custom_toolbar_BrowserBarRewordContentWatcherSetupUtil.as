package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.toolbar.BrowserBarRewordContent;
   
   public class _windows_custom_toolbar_BrowserBarRewordContentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_toolbar_BrowserBarRewordContentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         BrowserBarRewordContent.watcherSetupUtil = new _windows_custom_toolbar_BrowserBarRewordContentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

