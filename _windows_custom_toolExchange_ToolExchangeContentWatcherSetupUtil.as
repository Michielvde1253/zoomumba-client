package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.toolExchange.ToolExchangeContent;
   
   public class _windows_custom_toolExchange_ToolExchangeContentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_toolExchange_ToolExchangeContentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ToolExchangeContent.watcherSetupUtil = new _windows_custom_toolExchange_ToolExchangeContentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

