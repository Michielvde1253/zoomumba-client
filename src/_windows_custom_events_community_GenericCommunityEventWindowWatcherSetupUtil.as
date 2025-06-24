package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.events.community.GenericCommunityEventWindow;
   
   public class _windows_custom_events_community_GenericCommunityEventWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_events_community_GenericCommunityEventWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         GenericCommunityEventWindow.watcherSetupUtil = new _windows_custom_events_community_GenericCommunityEventWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

