package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.nursery.success.NurserySuccessWindow;
   
   public class _windows_custom_nursery_success_NurserySuccessWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_nursery_success_NurserySuccessWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         NurserySuccessWindow.watcherSetupUtil = new _windows_custom_nursery_success_NurserySuccessWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

