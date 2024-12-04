package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.events.boardgameReward.BoardgameRewardContent;
   
   public class _windows_custom_events_boardgameReward_BoardgameRewardContentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_events_boardgameReward_BoardgameRewardContentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         BoardgameRewardContent.watcherSetupUtil = new _windows_custom_events_boardgameReward_BoardgameRewardContentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

