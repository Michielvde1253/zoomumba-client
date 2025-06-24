package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.currencies.SpecialsCurrenciesWindow;
   
   public class _windows_custom_currencies_SpecialsCurrenciesWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_currencies_SpecialsCurrenciesWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         SpecialsCurrenciesWindow.watcherSetupUtil = new _windows_custom_currencies_SpecialsCurrenciesWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

