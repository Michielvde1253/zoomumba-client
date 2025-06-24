package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.inventoryWindow.AnimalToInventoryContent;
   
   public class _windows_custom_inventoryWindow_AnimalToInventoryContentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_inventoryWindow_AnimalToInventoryContentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         AnimalToInventoryContent.watcherSetupUtil = new _windows_custom_inventoryWindow_AnimalToInventoryContentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

