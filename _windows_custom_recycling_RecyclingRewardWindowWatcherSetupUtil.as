package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.recycling.RecyclingRewardWindow;
   
   public class _windows_custom_recycling_RecyclingRewardWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_recycling_RecyclingRewardWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         RecyclingRewardWindow.watcherSetupUtil = new _windows_custom_recycling_RecyclingRewardWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

