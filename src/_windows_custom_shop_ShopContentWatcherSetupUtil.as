package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.shop.ShopContent;
   
   public class _windows_custom_shop_ShopContentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_shop_ShopContentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ShopContent.watcherSetupUtil = new _windows_custom_shop_ShopContentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

