package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.dailyLogin.DailyLoginWindow;
   
   public class _windows_custom_dailyLogin_DailyLoginWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_dailyLogin_DailyLoginWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         DailyLoginWindow.watcherSetupUtil = new _windows_custom_dailyLogin_DailyLoginWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

