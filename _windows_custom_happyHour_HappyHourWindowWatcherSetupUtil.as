package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.happyHour.HappyHourWindow;
   
   public class _windows_custom_happyHour_HappyHourWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_happyHour_HappyHourWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         HappyHourWindow.watcherSetupUtil = new _windows_custom_happyHour_HappyHourWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

