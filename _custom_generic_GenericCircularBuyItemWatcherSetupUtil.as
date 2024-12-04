package
{
   import custom.generic.GenericCircularBuyItem;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _custom_generic_GenericCircularBuyItemWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _custom_generic_GenericCircularBuyItemWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         GenericCircularBuyItem.watcherSetupUtil = new _custom_generic_GenericCircularBuyItemWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("shader",{"propertyChange":true},[param4[0]],param2);
         param5[1] = new PropertyWatcher("radioButtonSexGroup",{"propertyChange":true},[param4[1],param4[2]],param2);
         param5[0].updateParent(param1);
         param5[1].updateParent(param1);
      }
   }
}

