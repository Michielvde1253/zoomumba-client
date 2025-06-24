package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.recycling.RecyclingWindow;
   
   public class _windows_custom_recycling_RecyclingWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_recycling_RecyclingWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         RecyclingWindow.watcherSetupUtil = new _windows_custom_recycling_RecyclingWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

