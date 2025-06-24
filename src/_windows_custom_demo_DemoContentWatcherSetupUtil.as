package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import windows.custom.demo.DemoContent;
   
   public class _windows_custom_demo_DemoContentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_demo_DemoContentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         DemoContent.watcherSetupUtil = new _windows_custom_demo_DemoContentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("currencyAmount",{"propertyChange":true},[param4[0]],param2);
         param5[0].updateParent(param1);
      }
   }
}

