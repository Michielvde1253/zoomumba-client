package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.avatar.AvatarWindow;
   
   public class _windows_custom_avatar_AvatarWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_avatar_AvatarWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         AvatarWindow.watcherSetupUtil = new _windows_custom_avatar_AvatarWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

