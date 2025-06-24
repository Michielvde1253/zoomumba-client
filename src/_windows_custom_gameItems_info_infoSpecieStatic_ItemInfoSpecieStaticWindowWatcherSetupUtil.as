package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.gameItems.info.infoSpecieStatic.ItemInfoSpecieStaticWindow;
   
   public class _windows_custom_gameItems_info_infoSpecieStatic_ItemInfoSpecieStaticWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_gameItems_info_infoSpecieStatic_ItemInfoSpecieStaticWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ItemInfoSpecieStaticWindow.watcherSetupUtil = new _windows_custom_gameItems_info_infoSpecieStatic_ItemInfoSpecieStaticWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

