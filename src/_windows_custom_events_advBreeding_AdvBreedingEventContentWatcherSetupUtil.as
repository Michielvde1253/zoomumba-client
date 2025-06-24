package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import windows.custom.events.advBreeding.AdvBreedingEventContent;
   
   public class _windows_custom_events_advBreeding_AdvBreedingEventContentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_events_advBreeding_AdvBreedingEventContentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         AdvBreedingEventContent.watcherSetupUtil = new _windows_custom_events_advBreeding_AdvBreedingEventContentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("groupSex",{"propertyChange":true},[param4[0],param4[1]],param2);
         param5[0].updateParent(param1);
      }
   }
}

