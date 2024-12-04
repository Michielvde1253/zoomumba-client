package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.news.events.advBreeding.EventNewsWindow;
   
   public class _windows_custom_news_events_advBreeding_EventNewsWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_news_events_advBreeding_EventNewsWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         EventNewsWindow.watcherSetupUtil = new _windows_custom_news_events_advBreeding_EventNewsWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

