package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.confirmation.extended.BuyOnceWindow;
   
   public class _windows_custom_confirmation_extended_BuyOnceWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_confirmation_extended_BuyOnceWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         BuyOnceWindow.watcherSetupUtil = new _windows_custom_confirmation_extended_BuyOnceWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

