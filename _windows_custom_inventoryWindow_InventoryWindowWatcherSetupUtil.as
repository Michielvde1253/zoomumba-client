package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.inventoryWindow.InventoryWindow;
   
   public class _windows_custom_inventoryWindow_InventoryWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_inventoryWindow_InventoryWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         InventoryWindow.watcherSetupUtil = new _windows_custom_inventoryWindow_InventoryWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

