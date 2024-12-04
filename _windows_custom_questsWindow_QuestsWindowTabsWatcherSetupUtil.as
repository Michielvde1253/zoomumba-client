package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.questsWindow.QuestsWindowTabs;
   
   public class _windows_custom_questsWindow_QuestsWindowTabsWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_questsWindow_QuestsWindowTabsWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         QuestsWindowTabs.watcherSetupUtil = new _windows_custom_questsWindow_QuestsWindowTabsWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

