package
{
   import fr.kapit.components.StatisticsComponent;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _fr_kapit_components_StatisticsComponentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _fr_kapit_components_StatisticsComponentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         StatisticsComponent.watcherSetupUtil = new _fr_kapit_components_StatisticsComponentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("dataProvider",{"propertyChange":true},[param4[0]],param2);
         param5[0].updateParent(param1);
      }
   }
}

