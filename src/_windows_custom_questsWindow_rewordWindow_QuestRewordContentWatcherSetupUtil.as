package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.questsWindow.rewordWindow.QuestRewordContent;
   
   public class _windows_custom_questsWindow_rewordWindow_QuestRewordContentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_questsWindow_rewordWindow_QuestRewordContentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         QuestRewordContent.watcherSetupUtil = new _windows_custom_questsWindow_rewordWindow_QuestRewordContentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

