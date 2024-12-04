package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.questsWindow.infoWindows.QuestExampleInfoWindow;
   
   public class _windows_custom_questsWindow_infoWindows_QuestExampleInfoWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_questsWindow_infoWindows_QuestExampleInfoWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         QuestExampleInfoWindow.watcherSetupUtil = new _windows_custom_questsWindow_infoWindows_QuestExampleInfoWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

