package
{
   import custom.info.component.InfoDisplayAttraction;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _custom_info_component_InfoDisplayAttractionWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _custom_info_component_InfoDisplayAttractionWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         InfoDisplayAttraction.watcherSetupUtil = new _custom_info_component_InfoDisplayAttractionWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("value",{"propertyChange":true},[param4[0]],param2);
         param5[0].updateParent(param1);
      }
   }
}

