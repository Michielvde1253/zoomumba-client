package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.events.circus.reward.CircusRewardContent;
   
   public class _windows_custom_events_circus_reward_CircusRewardContentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_events_circus_reward_CircusRewardContentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         CircusRewardContent.watcherSetupUtil = new _windows_custom_events_circus_reward_CircusRewardContentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

