package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.gameItems.sell.GameItemSellWindow;
   
   public class _windows_custom_gameItems_sell_GameItemSellWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_gameItems_sell_GameItemSellWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         GameItemSellWindow.watcherSetupUtil = new _windows_custom_gameItems_sell_GameItemSellWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

