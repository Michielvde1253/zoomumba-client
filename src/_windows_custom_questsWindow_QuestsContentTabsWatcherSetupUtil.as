package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.questsWindow.QuestsContentTabs;
   
   public class _windows_custom_questsWindow_QuestsContentTabsWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_questsWindow_QuestsContentTabsWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         QuestsContentTabs.watcherSetupUtil = new _windows_custom_questsWindow_QuestsContentTabsWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

