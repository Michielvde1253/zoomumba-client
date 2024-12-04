package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.friends.InviteFriendWindow;
   
   public class _windows_custom_friends_InviteFriendWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_friends_InviteFriendWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         InviteFriendWindow.watcherSetupUtil = new _windows_custom_friends_InviteFriendWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

