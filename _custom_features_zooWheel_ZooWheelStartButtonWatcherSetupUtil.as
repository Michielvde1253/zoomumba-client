package
{
   import custom.features.zooWheel.ZooWheelStartButton;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _custom_features_zooWheel_ZooWheelStartButtonWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _custom_features_zooWheel_ZooWheelStartButtonWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ZooWheelStartButton.watcherSetupUtil = new _custom_features_zooWheel_ZooWheelStartButtonWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("hit",{"propertyChange":true},[param4[0],param4[5]],param2);
         param5[4] = new PropertyWatcher("bitmapDataStart",{"propertyChange":true},[param4[4]],param2);
         param5[1] = new PropertyWatcher("_customButtonAlpha",{"propertyChange":true},[param4[1]],param2);
         param5[3] = new PropertyWatcher("_customButtonEnabled",{"propertyChange":true},[param4[3]],param2);
         param5[2] = new PropertyWatcher("_customButtonFilters",{"propertyChange":true},[param4[2]],param2);
         param5[0].updateParent(param1);
         param5[4].updateParent(param1);
         param5[1].updateParent(param1);
         param5[3].updateParent(param1);
         param5[2].updateParent(param1);
      }
   }
}

