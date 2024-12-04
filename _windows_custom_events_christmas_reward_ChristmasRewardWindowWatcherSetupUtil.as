package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.events.christmas.reward.ChristmasRewardWindow;
   
   public class _windows_custom_events_christmas_reward_ChristmasRewardWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_events_christmas_reward_ChristmasRewardWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ChristmasRewardWindow.watcherSetupUtil = new _windows_custom_events_christmas_reward_ChristmasRewardWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

