package
{
   import custom.features.cinema.RewardOption;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _custom_features_cinema_RewardOptionWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _custom_features_cinema_RewardOptionWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         RewardOption.watcherSetupUtil = new _custom_features_cinema_RewardOptionWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("amount",{"propertyChange":true},[param4[0]],param2);
         param5[0].updateParent(param1);
      }
   }
}

