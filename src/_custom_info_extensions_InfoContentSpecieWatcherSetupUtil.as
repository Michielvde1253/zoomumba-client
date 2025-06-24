package
{
   import custom.info.extensions.InfoContentSpecie;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _custom_info_extensions_InfoContentSpecieWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _custom_info_extensions_InfoContentSpecieWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         InfoContentSpecie.watcherSetupUtil = new _custom_info_extensions_InfoContentSpecieWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[1] = new PropertyWatcher("sexChangeGroup",{"propertyChange":true},[param4[1],param4[2]],param2);
         param5[2] = new PropertyWatcher("title",{"propertyChange":true},[param4[3]],param2);
         param5[0] = new PropertyWatcher("text",{"propertyChange":true},[param4[0]],param2);
         param5[1].updateParent(param1);
         param5[2].updateParent(param1);
         param5[0].updateParent(param1);
      }
   }
}

