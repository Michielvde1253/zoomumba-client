package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.cacheResources.CacheResourcesWindow;
   
   public class _windows_custom_cacheResources_CacheResourcesWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_cacheResources_CacheResourcesWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         CacheResourcesWindow.watcherSetupUtil = new _windows_custom_cacheResources_CacheResourcesWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}
