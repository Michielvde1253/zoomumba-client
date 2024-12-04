package
{
   import fr.kapit.components.EventLoggerComponent;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _fr_kapit_components_EventLoggerComponentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _fr_kapit_components_EventLoggerComponentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         EventLoggerComponent.watcherSetupUtil = new _fr_kapit_components_EventLoggerComponentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("eventDataGrid",{"propertyChange":true},[param4[0]],param2);
         param5[1] = new PropertyWatcher("totalEvents",{"propertyChange":true},[param4[0]],null);
         param5[0].updateParent(param1);
         param5[0].addChild(param5[1]);
      }
   }
}

