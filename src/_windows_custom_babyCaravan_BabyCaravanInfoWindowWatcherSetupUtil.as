package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.babyCaravan.BabyCaravanInfoWindow;
   
   public class _windows_custom_babyCaravan_BabyCaravanInfoWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_babyCaravan_BabyCaravanInfoWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         BabyCaravanInfoWindow.watcherSetupUtil = new _windows_custom_babyCaravan_BabyCaravanInfoWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

