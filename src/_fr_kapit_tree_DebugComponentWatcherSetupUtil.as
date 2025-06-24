package
{
   import fr.kapit.tree.DebugComponent;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _fr_kapit_tree_DebugComponentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _fr_kapit_tree_DebugComponentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         DebugComponent.watcherSetupUtil = new _fr_kapit_tree_DebugComponentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[3] = new PropertyWatcher("dragActive",{"propertyChange":true},[param4[3]],param2);
         param5[4] = new PropertyWatcher("showRoot",{"propertyChange":true},[param4[4]],param2);
         param5[1] = new PropertyWatcher("_comboClasses",{"propertyChange":true},[param4[1]],param2);
         param5[0] = new PropertyWatcher("rowCount",{"propertyChange":true},[param4[0]],param2);
         param5[2] = new PropertyWatcher("isWatchTarget",{"propertyChange":true},[param4[2]],param2);
         param5[3].updateParent(param1);
         param5[4].updateParent(param1);
         param5[1].updateParent(param1);
         param5[0].updateParent(param1);
         param5[2].updateParent(param1);
      }
   }
}

