package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.questsWindow.infoWindows.QuestExampleInfoContent;
   
   public class _windows_custom_questsWindow_infoWindows_QuestExampleInfoContentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_questsWindow_infoWindows_QuestExampleInfoContentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         QuestExampleInfoContent.watcherSetupUtil = new _windows_custom_questsWindow_infoWindows_QuestExampleInfoContentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

