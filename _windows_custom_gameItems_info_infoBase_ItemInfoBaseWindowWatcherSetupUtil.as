package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.gameItems.info.infoBase.ItemInfoBaseWindow;
   
   public class _windows_custom_gameItems_info_infoBase_ItemInfoBaseWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_gameItems_info_infoBase_ItemInfoBaseWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ItemInfoBaseWindow.watcherSetupUtil = new _windows_custom_gameItems_info_infoBase_ItemInfoBaseWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

