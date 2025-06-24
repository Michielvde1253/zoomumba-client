package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.adam.AdamContent;
   
   public class _windows_custom_adam_AdamContentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_adam_AdamContentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         AdamContent.watcherSetupUtil = new _windows_custom_adam_AdamContentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

