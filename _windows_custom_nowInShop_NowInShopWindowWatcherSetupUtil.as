package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.nowInShop.NowInShopWindow;
   
   public class _windows_custom_nowInShop_NowInShopWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_nowInShop_NowInShopWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         NowInShopWindow.watcherSetupUtil = new _windows_custom_nowInShop_NowInShopWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

