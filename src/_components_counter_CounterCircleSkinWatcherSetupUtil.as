package
{
   import components.counter.CounterCircleSkin;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _components_counter_CounterCircleSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _components_counter_CounterCircleSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         CounterCircleSkin.watcherSetupUtil = new _components_counter_CounterCircleSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("hostComponent",{"propertyChange":true},[param4[0],param4[1],param4[2],param4[3],param4[4],param4[5],param4[6],param4[7]],param2);
         param5[1] = new PropertyWatcher("backgroundScale",{"propertyChange":true},[param4[0],param4[1],param4[2],param4[3],param4[4],param4[6],param4[7]],null);
         param5[2] = new PropertyWatcher("fontSize",{"propertyChange":true},[param4[5]],null);
         param5[0].updateParent(param1);
         param5[0].addChild(param5[1]);
         param5[0].addChild(param5[2]);
      }
   }
}

