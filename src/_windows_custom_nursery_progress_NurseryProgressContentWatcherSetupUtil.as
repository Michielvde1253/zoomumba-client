package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.nursery.progress.NurseryProgressContent;
   
   public class _windows_custom_nursery_progress_NurseryProgressContentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_nursery_progress_NurseryProgressContentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         NurseryProgressContent.watcherSetupUtil = new _windows_custom_nursery_progress_NurseryProgressContentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

