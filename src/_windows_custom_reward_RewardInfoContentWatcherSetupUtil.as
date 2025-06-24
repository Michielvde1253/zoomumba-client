package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.reward.RewardInfoContent;
   
   public class _windows_custom_reward_RewardInfoContentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_reward_RewardInfoContentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         RewardInfoContent.watcherSetupUtil = new _windows_custom_reward_RewardInfoContentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

