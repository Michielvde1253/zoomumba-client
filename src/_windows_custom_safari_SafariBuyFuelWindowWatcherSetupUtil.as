package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.safari.SafariBuyFuelWindow;
   
   public class _windows_custom_safari_SafariBuyFuelWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_safari_SafariBuyFuelWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         SafariBuyFuelWindow.watcherSetupUtil = new _windows_custom_safari_SafariBuyFuelWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

