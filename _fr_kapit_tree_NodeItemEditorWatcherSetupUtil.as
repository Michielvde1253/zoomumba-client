package
{
   import fr.kapit.tree.NodeItemEditor;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   
   public class _fr_kapit_tree_NodeItemEditorWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _fr_kapit_tree_NodeItemEditorWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         NodeItemEditor.watcherSetupUtil = new _fr_kapit_tree_NodeItemEditorWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

