package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.testGUI.TestGUIWindow;
   
   public class _windows_custom_testGUI_TestGUIWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_testGUI_TestGUIWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         TestGUIWindow.watcherSetupUtil = new _windows_custom_testGUI_TestGUIWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

