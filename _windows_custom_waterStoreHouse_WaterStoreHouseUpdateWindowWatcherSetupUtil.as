package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.waterStoreHouse.WaterStoreHouseUpdateWindow;
   
   public class _windows_custom_waterStoreHouse_WaterStoreHouseUpdateWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_waterStoreHouse_WaterStoreHouseUpdateWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         WaterStoreHouseUpdateWindow.watcherSetupUtil = new _windows_custom_waterStoreHouse_WaterStoreHouseUpdateWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

