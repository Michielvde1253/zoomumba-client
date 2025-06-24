package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.events.christmas.reward.ChristmasRewardContent;
   
   public class _windows_custom_events_christmas_reward_ChristmasRewardContentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_events_christmas_reward_ChristmasRewardContentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ChristmasRewardContent.watcherSetupUtil = new _windows_custom_events_christmas_reward_ChristmasRewardContentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

