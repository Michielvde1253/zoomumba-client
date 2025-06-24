package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.collectionSets.CollectionSetRewordWindow;
   
   public class _windows_custom_collectionSets_CollectionSetRewordWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_collectionSets_CollectionSetRewordWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         CollectionSetRewordWindow.watcherSetupUtil = new _windows_custom_collectionSets_CollectionSetRewordWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

