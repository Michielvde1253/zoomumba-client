package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import windows.custom.friends.SelectFriendInvitationContent;
   
   public class _windows_custom_friends_SelectFriendInvitationContentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_friends_SelectFriendInvitationContentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         SelectFriendInvitationContent.watcherSetupUtil = new _windows_custom_friends_SelectFriendInvitationContentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("separatorGraphic",{"propertyChange":true},[param4[0]],param2);
         param5[0].updateParent(param1);
      }
   }
}

