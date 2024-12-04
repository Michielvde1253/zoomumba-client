package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.confirmation.ConfirmationWindow;
   
   public class _windows_custom_confirmation_ConfirmationWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_confirmation_ConfirmationWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ConfirmationWindow.watcherSetupUtil = new _windows_custom_confirmation_ConfirmationWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

