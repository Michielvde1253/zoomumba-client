package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.friends.DeleteFriendWindow;
   
   public class _windows_custom_friends_DeleteFriendWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_friends_DeleteFriendWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         DeleteFriendWindow.watcherSetupUtil = new _windows_custom_friends_DeleteFriendWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}
