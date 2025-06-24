package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.gameItems.info.infoMaterial.ItemInfoMaterialWindow;
   
   public class _windows_custom_gameItems_info_infoMaterial_ItemInfoMaterialWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_gameItems_info_infoMaterial_ItemInfoMaterialWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ItemInfoMaterialWindow.watcherSetupUtil = new _windows_custom_gameItems_info_infoMaterial_ItemInfoMaterialWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

