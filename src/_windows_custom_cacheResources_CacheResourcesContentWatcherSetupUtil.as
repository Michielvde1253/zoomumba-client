package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.cacheResources.CacheResourcesContent;
   
   public class _windows_custom_cacheResources_CacheResourcesContentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_cacheResources_CacheResourcesContentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         CacheResourcesContent.watcherSetupUtil = new _windows_custom_cacheResources_CacheResourcesContentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

