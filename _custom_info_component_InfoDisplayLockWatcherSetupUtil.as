package
{
   import custom.info.component.InfoDisplayLock;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _custom_info_component_InfoDisplayLockWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _custom_info_component_InfoDisplayLockWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         InfoDisplayLock.watcherSetupUtil = new _custom_info_component_InfoDisplayLockWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("level",{"propertyChange":true},[param4[0]],param2);
         param5[0].updateParent(param1);
      }
   }
}

