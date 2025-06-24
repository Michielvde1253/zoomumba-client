package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.reward.RewardInfoWindow;
   
   public class _windows_custom_reward_RewardInfoWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_reward_RewardInfoWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         RewardInfoWindow.watcherSetupUtil = new _windows_custom_reward_RewardInfoWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

