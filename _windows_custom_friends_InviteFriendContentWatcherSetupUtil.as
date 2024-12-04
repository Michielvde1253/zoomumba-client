package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.friends.InviteFriendContent;
   
   public class _windows_custom_friends_InviteFriendContentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_friends_InviteFriendContentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         InviteFriendContent.watcherSetupUtil = new _windows_custom_friends_InviteFriendContentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

