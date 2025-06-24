package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.babyCaravan.BabyCaravanWindow;
   
   public class _windows_custom_babyCaravan_BabyCaravanWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_babyCaravan_BabyCaravanWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         BabyCaravanWindow.watcherSetupUtil = new _windows_custom_babyCaravan_BabyCaravanWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

