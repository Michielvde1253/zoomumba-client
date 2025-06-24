package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.confirmation.extended.BuyTwoCurrencyConfirmationWindow;
   
   public class _windows_custom_confirmation_extended_BuyTwoCurrencyConfirmationWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_confirmation_extended_BuyTwoCurrencyConfirmationWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         BuyTwoCurrencyConfirmationWindow.watcherSetupUtil = new _windows_custom_confirmation_extended_BuyTwoCurrencyConfirmationWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

