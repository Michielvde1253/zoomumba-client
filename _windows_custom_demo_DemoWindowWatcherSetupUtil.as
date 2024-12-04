package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.demo.DemoWindow;
   
   public class _windows_custom_demo_DemoWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_demo_DemoWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         DemoWindow.watcherSetupUtil = new _windows_custom_demo_DemoWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

