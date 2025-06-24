package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.events.circus.reward.CircusRewardWindow;
   
   public class _windows_custom_events_circus_reward_CircusRewardWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_events_circus_reward_CircusRewardWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         CircusRewardWindow.watcherSetupUtil = new _windows_custom_events_circus_reward_CircusRewardWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

