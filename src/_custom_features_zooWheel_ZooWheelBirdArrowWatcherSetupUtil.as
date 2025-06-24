package
{
   import custom.features.zooWheel.ZooWheelBirdArrow;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _custom_features_zooWheel_ZooWheelBirdArrowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _custom_features_zooWheel_ZooWheelBirdArrowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ZooWheelBirdArrow.watcherSetupUtil = new _custom_features_zooWheel_ZooWheelBirdArrowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[1] = new PropertyWatcher("bitmapImageSpinStart",{"propertyChange":true},[param4[0]],param2);
         param5[3] = new PropertyWatcher("bitmapImagePointing",{"propertyChange":true},[param4[0]],param2);
         param5[6] = new PropertyWatcher("sourceSpinFull",{"propertyChange":true},[param4[3]],param2);
         param5[8] = new PropertyWatcher("sourceNail",{"propertyChange":true},[param4[5]],param2);
         param5[5] = new PropertyWatcher("sourceSpinStart",{"propertyChange":true},[param4[2]],param2);
         param5[0] = new PropertyWatcher("bitmapImageIdle",{"propertyChange":true},[param4[0]],param2);
         param5[4] = new PropertyWatcher("sourceIdle",{"propertyChange":true},[param4[1]],param2);
         param5[7] = new PropertyWatcher("sourcePointing",{"propertyChange":true},[param4[4]],param2);
         param5[2] = new PropertyWatcher("bitmapImageSpinFull",{"propertyChange":true},[param4[0]],param2);
         param5[1].updateParent(param1);
         param5[3].updateParent(param1);
         param5[6].updateParent(param1);
         param5[8].updateParent(param1);
         param5[5].updateParent(param1);
         param5[0].updateParent(param1);
         param5[4].updateParent(param1);
         param5[7].updateParent(param1);
         param5[2].updateParent(param1);
      }
   }
}

