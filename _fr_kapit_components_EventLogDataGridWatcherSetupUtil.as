package
{
   import fr.kapit.components.EventLogDataGrid;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _fr_kapit_components_EventLogDataGridWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _fr_kapit_components_EventLogDataGridWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         EventLogDataGrid.watcherSetupUtil = new _fr_kapit_components_EventLogDataGridWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("currentTrapper",{"propertyChange":true},[param4[0]],param2);
         param5[1] = new PropertyWatcher("events",{"propertyChange":true},[param4[0]],null);
         param5[0].updateParent(param1);
         param5[0].addChild(param5[1]);
      }
   }
}

