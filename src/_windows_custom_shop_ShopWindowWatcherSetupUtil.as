package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.shop.ShopWindow;
   
   public class _windows_custom_shop_ShopWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_shop_ShopWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ShopWindow.watcherSetupUtil = new _windows_custom_shop_ShopWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

