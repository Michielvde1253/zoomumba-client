package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import windows.custom.advBreeding.steps.AdvancedBreedingStep1;
   
   public class _windows_custom_advBreeding_steps_AdvancedBreedingStep1WatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_advBreeding_steps_AdvancedBreedingStep1WatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         AdvancedBreedingStep1.watcherSetupUtil = new _windows_custom_advBreeding_steps_AdvancedBreedingStep1WatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[1] = new PropertyWatcher("_prevBtn",{"propertyChange":true},[param4[1]],param2);
         param5[0] = new PropertyWatcher("_nextBtn",{"propertyChange":true},[param4[0]],param2);
         param5[1].updateParent(param1);
         param5[0].updateParent(param1);
      }
   }
}

