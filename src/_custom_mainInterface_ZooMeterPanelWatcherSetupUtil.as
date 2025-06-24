package
{
   import custom.mainInterface.ZooMeterPanel;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _custom_mainInterface_ZooMeterPanelWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _custom_mainInterface_ZooMeterPanelWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ZooMeterPanel.watcherSetupUtil = new _custom_mainInterface_ZooMeterPanelWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("progress",{"propertyChange":true},[param4[0],param4[1]],param2);
         param5[1] = new PropertyWatcher("firstValue",{"propertyChange":true},[param4[2]],param2);
         param5[2] = new PropertyWatcher("secondValue",{"propertyChange":true},[param4[3]],param2);
         param5[0].updateParent(param1);
         param5[1].updateParent(param1);
         param5[2].updateParent(param1);
      }
   }
}

