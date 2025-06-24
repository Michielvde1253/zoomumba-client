package
{
   import fr.kapit.introspection.components.DisplayListComponent;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _fr_kapit_introspection_components_DisplayListComponentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _fr_kapit_introspection_components_DisplayListComponentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         DisplayListComponent.watcherSetupUtil = new _fr_kapit_introspection_components_DisplayListComponentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[1] = new PropertyWatcher("_rootObject",{"propertyChange":true},[param4[1]],param2);
         param5[0] = new PropertyWatcher("_enableMove",{"propertyChange":true},[param4[0]],param2);
         param5[1].updateParent(param1);
         param5[0].updateParent(param1);
      }
   }
}

