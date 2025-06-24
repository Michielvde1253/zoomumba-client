package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.safari.SafariItemContent;
   
   public class _windows_custom_safari_SafariItemContentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_safari_SafariItemContentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         SafariItemContent.watcherSetupUtil = new _windows_custom_safari_SafariItemContentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

