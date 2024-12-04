package
{
   import fr.kapit.components.ClassOutlineComponent;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   
   public class _fr_kapit_components_ClassOutlineComponentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _fr_kapit_components_ClassOutlineComponentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ClassOutlineComponent.watcherSetupUtil = new _fr_kapit_components_ClassOutlineComponentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

