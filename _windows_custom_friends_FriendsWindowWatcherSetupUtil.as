package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.friends.FriendsWindow;
   
   public class _windows_custom_friends_FriendsWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_friends_FriendsWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         FriendsWindow.watcherSetupUtil = new _windows_custom_friends_FriendsWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

