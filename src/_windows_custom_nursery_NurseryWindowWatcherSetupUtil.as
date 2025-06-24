package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.nursery.NurseryWindow;
   
   public class _windows_custom_nursery_NurseryWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_nursery_NurseryWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         NurseryWindow.watcherSetupUtil = new _windows_custom_nursery_NurseryWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

