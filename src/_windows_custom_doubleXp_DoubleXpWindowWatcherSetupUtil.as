package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.doubleXp.DoubleXpWindow;
   
   public class _windows_custom_doubleXp_DoubleXpWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_doubleXp_DoubleXpWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         DoubleXpWindow.watcherSetupUtil = new _windows_custom_doubleXp_DoubleXpWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

