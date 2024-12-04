package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.currencies.SpecialsCurrenciesContent;
   
   public class _windows_custom_currencies_SpecialsCurrenciesContentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_currencies_SpecialsCurrenciesContentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         SpecialsCurrenciesContent.watcherSetupUtil = new _windows_custom_currencies_SpecialsCurrenciesContentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

