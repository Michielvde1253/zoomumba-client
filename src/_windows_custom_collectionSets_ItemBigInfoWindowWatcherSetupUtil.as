package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.collectionSets.ItemBigInfoWindow;
   
   public class _windows_custom_collectionSets_ItemBigInfoWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_collectionSets_ItemBigInfoWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ItemBigInfoWindow.watcherSetupUtil = new _windows_custom_collectionSets_ItemBigInfoWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

