package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.inventoryWindow.InventoryContent;
   
   public class _windows_custom_inventoryWindow_InventoryContentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_inventoryWindow_InventoryContentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         InventoryContent.watcherSetupUtil = new _windows_custom_inventoryWindow_InventoryContentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

