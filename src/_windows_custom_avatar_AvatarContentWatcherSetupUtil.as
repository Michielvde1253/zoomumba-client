package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import windows.custom.avatar.AvatarContent;
   
   public class _windows_custom_avatar_AvatarContentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_avatar_AvatarContentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         AvatarContent.watcherSetupUtil = new _windows_custom_avatar_AvatarContentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[3] = new PropertyWatcher("groupSex",{"propertyChange":true},[param4[8],param4[9]],param2);
         param5[0] = new PropertyWatcher("btnLeft",{"propertyChange":true},[param4[0]],param2);
         param5[2] = new PropertyWatcher("groupCat",{"propertyChange":true},[param4[2],param4[3],param4[4],param4[5],param4[6],param4[7]],param2);
         param5[1] = new PropertyWatcher("btnRight",{"propertyChange":true},[param4[1]],param2);
         param5[3].updateParent(param1);
         param5[0].updateParent(param1);
         param5[2].updateParent(param1);
         param5[1].updateParent(param1);
      }
   }
}

