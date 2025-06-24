package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.adam.AdamWindow;
   
   public class _windows_custom_adam_AdamWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_adam_AdamWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         AdamWindow.watcherSetupUtil = new _windows_custom_adam_AdamWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

