package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.valentines.ValentineRewardWindow;
   
   public class _windows_custom_valentines_ValentineRewardWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_valentines_ValentineRewardWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ValentineRewardWindow.watcherSetupUtil = new _windows_custom_valentines_ValentineRewardWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

