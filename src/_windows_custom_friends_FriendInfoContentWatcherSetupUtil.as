package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import windows.custom.friends.FriendInfoContent;
   
   public class _windows_custom_friends_FriendInfoContentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_friends_FriendInfoContentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         FriendInfoContent.watcherSetupUtil = new _windows_custom_friends_FriendInfoContentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("line",{"propertyChange":true},[param4[0],param4[1]],param2);
         param5[0].updateParent(param1);
      }
   }
}

