package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.safari.SafariItemWindow;
   
   public class _windows_custom_safari_SafariItemWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_safari_SafariItemWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         SafariItemWindow.watcherSetupUtil = new _windows_custom_safari_SafariItemWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

