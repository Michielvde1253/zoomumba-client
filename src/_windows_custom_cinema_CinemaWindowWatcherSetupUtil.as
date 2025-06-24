package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.cinema.CinemaWindow;
   
   public class _windows_custom_cinema_CinemaWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_cinema_CinemaWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         CinemaWindow.watcherSetupUtil = new _windows_custom_cinema_CinemaWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

