package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.gameItems.sell.GameItemSellContent;
   
   public class _windows_custom_gameItems_sell_GameItemSellContentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_gameItems_sell_GameItemSellContentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         GameItemSellContent.watcherSetupUtil = new _windows_custom_gameItems_sell_GameItemSellContentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

