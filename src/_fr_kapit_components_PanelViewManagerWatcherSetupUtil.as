package
{
   import fr.kapit.assets.EmbeddedAssets;
   import fr.kapit.components.PanelViewManager;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.StaticPropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _fr_kapit_components_PanelViewManagerWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _fr_kapit_components_PanelViewManagerWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         PanelViewManager.watcherSetupUtil = new _fr_kapit_components_PanelViewManagerWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[4] = new StaticPropertyWatcher("iconWindowTwoOn",{"propertyChange":true},[param4[4]],null);
         param5[0] = new StaticPropertyWatcher("iconWindowBothOn",{"propertyChange":true},[param4[0]],null);
         param5[3] = new StaticPropertyWatcher("iconWindowOneOff",{"propertyChange":true},[param4[3]],null);
         param5[1] = new StaticPropertyWatcher("iconWindowBothOff",{"propertyChange":true},[param4[1]],null);
         param5[2] = new StaticPropertyWatcher("iconWindowOneOn",{"propertyChange":true},[param4[2]],null);
         param5[5] = new StaticPropertyWatcher("iconWindowTwoOff",{"propertyChange":true},[param4[5]],null);
         param5[4].updateParent(EmbeddedAssets);
         param5[0].updateParent(EmbeddedAssets);
         param5[3].updateParent(EmbeddedAssets);
         param5[1].updateParent(EmbeddedAssets);
         param5[2].updateParent(EmbeddedAssets);
         param5[5].updateParent(EmbeddedAssets);
      }
   }
}

