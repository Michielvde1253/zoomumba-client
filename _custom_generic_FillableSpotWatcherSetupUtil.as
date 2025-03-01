package
{
   import custom.generic.FillableSpot;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _custom_generic_FillableSpotWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _custom_generic_FillableSpotWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         FillableSpot.watcherSetupUtil = new _custom_generic_FillableSpotWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[2] = new PropertyWatcher("spriteClassDisplay",{"propertyChange":true},[param4[1]],param2);
         param5[2].updateParent(param1);
      }
   }
}

