package
{
   import custom.features.zooWheel.ZooWheelTriesPanel;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _custom_features_zooWheel_ZooWheelTriesPanelWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _custom_features_zooWheel_ZooWheelTriesPanelWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ZooWheelTriesPanel.watcherSetupUtil = new _custom_features_zooWheel_ZooWheelTriesPanelWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[1] = new PropertyWatcher("_buttonEnabled",{"propertyChange":true},[param4[5]],param2);
         param5[0] = new PropertyWatcher("sourceTryBird",{"propertyChange":true},[param4[0],param4[1],param4[2],param4[3],param4[4]],param2);
         param5[1].updateParent(param1);
         param5[0].updateParent(param1);
      }
   }
}

