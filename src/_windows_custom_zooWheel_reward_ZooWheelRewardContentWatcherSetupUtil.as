package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.zooWheel.reward.ZooWheelRewardContent;
   
   public class _windows_custom_zooWheel_reward_ZooWheelRewardContentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_zooWheel_reward_ZooWheelRewardContentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ZooWheelRewardContent.watcherSetupUtil = new _windows_custom_zooWheel_reward_ZooWheelRewardContentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

