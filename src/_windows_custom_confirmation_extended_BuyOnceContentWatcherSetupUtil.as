package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.confirmation.extended.BuyOnceContent;
   
   public class _windows_custom_confirmation_extended_BuyOnceContentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_confirmation_extended_BuyOnceContentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         BuyOnceContent.watcherSetupUtil = new _windows_custom_confirmation_extended_BuyOnceContentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

