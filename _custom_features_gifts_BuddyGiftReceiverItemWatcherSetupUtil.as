package
{
   import custom.features.gifts.BuddyGiftReceiverItem;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _custom_features_gifts_BuddyGiftReceiverItemWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _custom_features_gifts_BuddyGiftReceiverItemWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         BuddyGiftReceiverItem.watcherSetupUtil = new _custom_features_gifts_BuddyGiftReceiverItemWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[1] = new PropertyWatcher("userID",{"propertyChange":true},[param4[1]],param2);
         param5[0] = new PropertyWatcher("username",{"propertyChange":true},[param4[0]],param2);
         param5[1].updateParent(param1);
         param5[0].updateParent(param1);
      }
   }
}

