package
{
   import custom.info.component.InfoDisplaySwitcher;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _custom_info_component_InfoDisplaySwitcherWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _custom_info_component_InfoDisplaySwitcherWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         InfoDisplaySwitcher.watcherSetupUtil = new _custom_info_component_InfoDisplaySwitcherWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("_prev",{"propertyChange":true},[param4[0]],param2);
         param5[1] = new PropertyWatcher("_next",{"propertyChange":true},[param4[1]],param2);
         param5[0].updateParent(param1);
         param5[1].updateParent(param1);
      }
   }
}

