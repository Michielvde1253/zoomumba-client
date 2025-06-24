package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.friends.DeleteFriendContent;
   
   public class _windows_custom_friends_DeleteFriendContentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_friends_DeleteFriendContentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         DeleteFriendContent.watcherSetupUtil = new _windows_custom_friends_DeleteFriendContentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

