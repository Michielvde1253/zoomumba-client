package
{
   import custom.info.component.InfoDisplayCagesSpeciesMatch;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _custom_info_component_InfoDisplayCagesSpeciesMatchWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _custom_info_component_InfoDisplayCagesSpeciesMatchWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         InfoDisplayCagesSpeciesMatch.watcherSetupUtil = new _custom_info_component_InfoDisplayCagesSpeciesMatchWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("percentage",{"propertyChange":true},[param4[0]],param2);
         param5[0].updateParent(param1);
      }
   }
}

