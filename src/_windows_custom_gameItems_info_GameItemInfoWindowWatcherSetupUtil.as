package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.gameItems.info.GameItemInfoWindow;
   
   public class _windows_custom_gameItems_info_GameItemInfoWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_gameItems_info_GameItemInfoWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         GameItemInfoWindow.watcherSetupUtil = new _windows_custom_gameItems_info_GameItemInfoWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

