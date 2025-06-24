package
{
   import fr.kapit.watch.ChangeWatcherComponent;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   
   public class _fr_kapit_watch_ChangeWatcherComponentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _fr_kapit_watch_ChangeWatcherComponentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ChangeWatcherComponent.watcherSetupUtil = new _fr_kapit_watch_ChangeWatcherComponentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

