package
{
   import fr.kapit.tree.IntrospectionTree;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _fr_kapit_tree_IntrospectionTreeWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _fr_kapit_tree_IntrospectionTreeWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         IntrospectionTree.watcherSetupUtil = new _fr_kapit_tree_IntrospectionTreeWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("dragActive",{"propertyChange":true},[param4[1]],param2);
         param5[1] = new PropertyWatcher("roots",{"propertyChange":true},[param4[3]],param2);
         param5[0].updateParent(param1);
         param5[1].updateParent(param1);
      }
   }
}

