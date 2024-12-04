package
{
   import fr.kapit.assets.EmbeddedAssets;
   import fr.kapit.components.AboutKapInspect;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.StaticPropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _fr_kapit_components_AboutKapInspectWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _fr_kapit_components_AboutKapInspectWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         AboutKapInspect.watcherSetupUtil = new _fr_kapit_components_AboutKapInspectWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new StaticPropertyWatcher("miniLogo",{"propertyChange":true},[param4[1]],null);
         param5[0].updateParent(EmbeddedAssets);
      }
   }
}

