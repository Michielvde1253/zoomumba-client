package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.zooWheel.buySpin.BuySpinContent;
   
   public class _windows_custom_zooWheel_buySpin_BuySpinContentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_zooWheel_buySpin_BuySpinContentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         BuySpinContent.watcherSetupUtil = new _windows_custom_zooWheel_buySpin_BuySpinContentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

