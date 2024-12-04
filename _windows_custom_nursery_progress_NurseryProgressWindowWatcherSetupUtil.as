package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.nursery.progress.NurseryProgressWindow;
   
   public class _windows_custom_nursery_progress_NurseryProgressWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_nursery_progress_NurseryProgressWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         NurseryProgressWindow.watcherSetupUtil = new _windows_custom_nursery_progress_NurseryProgressWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

