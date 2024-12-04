package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import windows.custom.gameItems.info.GameItemInfoPerspectives;
   
   public class _windows_custom_gameItems_info_GameItemInfoPerspectivesWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_gameItems_info_GameItemInfoPerspectivesWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         GameItemInfoPerspectives.watcherSetupUtil = new _windows_custom_gameItems_info_GameItemInfoPerspectivesWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("sexGroup",{"sexGroupSetted":true},[param4[0],param4[1]],param2);
         param5[0].updateParent(param1);
      }
   }
}

