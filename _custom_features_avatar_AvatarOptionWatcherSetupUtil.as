package
{
   import custom.features.avatar.AvatarOption;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _custom_features_avatar_AvatarOptionWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _custom_features_avatar_AvatarOptionWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         AvatarOption.watcherSetupUtil = new _custom_features_avatar_AvatarOptionWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("cardBd",{"propertyChange":true},[param4[0]],param2);
         param5[0].updateParent(param1);
      }
   }
}

