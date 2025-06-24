package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.toolExchange.ToolExchangeWindow;
   
   public class _windows_custom_toolExchange_ToolExchangeWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_toolExchange_ToolExchangeWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ToolExchangeWindow.watcherSetupUtil = new _windows_custom_toolExchange_ToolExchangeWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

