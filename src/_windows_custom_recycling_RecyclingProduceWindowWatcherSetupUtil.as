package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.recycling.RecyclingProduceWindow;
   
   public class _windows_custom_recycling_RecyclingProduceWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_recycling_RecyclingProduceWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         RecyclingProduceWindow.watcherSetupUtil = new _windows_custom_recycling_RecyclingProduceWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

