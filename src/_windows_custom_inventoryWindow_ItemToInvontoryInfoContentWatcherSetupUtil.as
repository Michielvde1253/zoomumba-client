package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.inventoryWindow.ItemToInvontoryInfoContent;
   
   public class _windows_custom_inventoryWindow_ItemToInvontoryInfoContentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_inventoryWindow_ItemToInvontoryInfoContentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ItemToInvontoryInfoContent.watcherSetupUtil = new _windows_custom_inventoryWindow_ItemToInvontoryInfoContentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

