package
{
   import components.counter.CounterRectSmallSkin;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _components_counter_CounterRectSmallSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _components_counter_CounterRectSmallSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         CounterRectSmallSkin.watcherSetupUtil = new _components_counter_CounterRectSmallSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("hostComponent",{"propertyChange":true},[param4[0]],param2);
         param5[1] = new PropertyWatcher("value",{"propertyChange":true},[param4[0]],null);
         param5[0].updateParent(param1);
         param5[0].addChild(param5[1]);
      }
   }
}

