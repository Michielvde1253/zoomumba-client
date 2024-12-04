package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import windows.custom.gameItems.info.GameItemInfoContent;
   
   public class _windows_custom_gameItems_info_GameItemInfoContentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_gameItems_info_GameItemInfoContentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         GameItemInfoContent.watcherSetupUtil = new _windows_custom_gameItems_info_GameItemInfoContentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("_perspective",{"propertyChange":true},[param4[0]],param2);
         param5[0].updateParent(param1);
      }
   }
}

