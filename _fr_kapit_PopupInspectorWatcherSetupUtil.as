package
{
   import fr.kapit.PopupInspector;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _fr_kapit_PopupInspectorWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _fr_kapit_PopupInspectorWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         PopupInspector.watcherSetupUtil = new _fr_kapit_PopupInspectorWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[2] = new PropertyWatcher("_root",{"propertyChange":true},[param4[2]],param2);
         param5[3] = new PropertyWatcher("mainHBox",{"propertyChange":true},[param4[3]],param2);
         param5[0] = new PropertyWatcher("initialWidth",{"propertyChange":true},[param4[0]],param2);
         param5[1] = new PropertyWatcher("initialHeight",{"propertyChange":true},[param4[1]],param2);
         param5[2].updateParent(param1);
         param5[3].updateParent(param1);
         param5[0].updateParent(param1);
         param5[1].updateParent(param1);
      }
   }
}

