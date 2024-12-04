package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.friends.FriendInfoWindow;
   
   public class _windows_custom_friends_FriendInfoWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_friends_FriendInfoWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         FriendInfoWindow.watcherSetupUtil = new _windows_custom_friends_FriendInfoWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

