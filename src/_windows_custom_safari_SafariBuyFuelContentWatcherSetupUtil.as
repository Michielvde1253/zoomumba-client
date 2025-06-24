package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.safari.SafariBuyFuelContent;
   
   public class _windows_custom_safari_SafariBuyFuelContentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_safari_SafariBuyFuelContentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         SafariBuyFuelContent.watcherSetupUtil = new _windows_custom_safari_SafariBuyFuelContentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

