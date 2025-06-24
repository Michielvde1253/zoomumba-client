package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.questsWindow.rewordWindow.QuestRewordWindow;
   
   public class _windows_custom_questsWindow_rewordWindow_QuestRewordWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_questsWindow_rewordWindow_QuestRewordWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         QuestRewordWindow.watcherSetupUtil = new _windows_custom_questsWindow_rewordWindow_QuestRewordWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

