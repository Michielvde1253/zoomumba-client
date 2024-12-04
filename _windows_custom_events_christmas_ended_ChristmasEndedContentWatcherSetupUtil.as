package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.events.christmas.ended.ChristmasEndedContent;
   
   public class _windows_custom_events_christmas_ended_ChristmasEndedContentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_events_christmas_ended_ChristmasEndedContentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ChristmasEndedContent.watcherSetupUtil = new _windows_custom_events_christmas_ended_ChristmasEndedContentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

