package
{
   import custom.previews.reward.RewardItemPreview;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _custom_previews_reward_RewardItemPreviewWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _custom_previews_reward_RewardItemPreviewWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         RewardItemPreview.watcherSetupUtil = new _custom_previews_reward_RewardItemPreviewWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("text",{"propertyChange":true},[param4[0]],param2);
         param5[0].updateParent(param1);
      }
   }
}

