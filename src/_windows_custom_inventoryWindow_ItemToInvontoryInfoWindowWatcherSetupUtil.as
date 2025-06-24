package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.inventoryWindow.ItemToInvontoryInfoWindow;
   
   public class _windows_custom_inventoryWindow_ItemToInvontoryInfoWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_inventoryWindow_ItemToInvontoryInfoWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ItemToInvontoryInfoWindow.watcherSetupUtil = new _windows_custom_inventoryWindow_ItemToInvontoryInfoWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

