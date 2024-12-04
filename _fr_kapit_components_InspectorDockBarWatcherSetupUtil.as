package
{
   import fr.kapit.assets.EmbeddedAssets;
   import fr.kapit.components.InspectorDockBar;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.binding.StaticPropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _fr_kapit_components_InspectorDockBarWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _fr_kapit_components_InspectorDockBarWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         InspectorDockBar.watcherSetupUtil = new _fr_kapit_components_InspectorDockBarWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[13] = new StaticPropertyWatcher("iconRefreshPopUp_over",{"propertyChange":true},[param4[14]],null);
         param5[15] = new StaticPropertyWatcher("iconUnselect_off",{"propertyChange":true},[param4[16]],null);
         param5[0] = new StaticPropertyWatcher("iconShowMenu",{"propertyChange":true},[param4[0]],null);
         param5[16] = new StaticPropertyWatcher("iconUnselect_over",{"propertyChange":true},[param4[17]],null);
         param5[12] = new StaticPropertyWatcher("iconRefreshPopUp_off",{"propertyChange":true},[param4[13]],null);
         param5[1] = new PropertyWatcher("width",{"widthChanged":true},[param4[1]],param2);
         param5[2] = new PropertyWatcher("dockbar",{"propertyChange":true},[param4[2]],param2);
         param5[3] = new PropertyWatcher("minSize",{"propertyChange":true},[param4[2]],null);
         param5[11] = new StaticPropertyWatcher("iconRefreshPopUp_on",{"propertyChange":true},[param4[12]],null);
         param5[5] = new StaticPropertyWatcher("iconCapture_on",{"propertyChange":true},[param4[6]],null);
         param5[9] = new StaticPropertyWatcher("iconRefresh_off",{"propertyChange":true},[param4[10]],null);
         param5[10] = new StaticPropertyWatcher("iconRefresh_over",{"propertyChange":true},[param4[11]],null);
         param5[8] = new StaticPropertyWatcher("iconRefresh_on",{"propertyChange":true},[param4[9]],null);
         param5[14] = new StaticPropertyWatcher("iconUnselect_on",{"propertyChange":true},[param4[15]],null);
         param5[6] = new StaticPropertyWatcher("iconCapture_off",{"propertyChange":true},[param4[7]],null);
         param5[4] = new StaticPropertyWatcher("iconSeparator",{"propertyChange":true},[param4[3],param4[4],param4[5]],null);
         param5[7] = new StaticPropertyWatcher("iconCapture_over",{"propertyChange":true},[param4[8]],null);
         param5[13].updateParent(EmbeddedAssets);
         param5[15].updateParent(EmbeddedAssets);
         param5[0].updateParent(EmbeddedAssets);
         param5[16].updateParent(EmbeddedAssets);
         param5[12].updateParent(EmbeddedAssets);
         param5[1].updateParent(param1);
         param5[2].updateParent(param1);
         param5[2].addChild(param5[3]);
         param5[11].updateParent(EmbeddedAssets);
         param5[5].updateParent(EmbeddedAssets);
         param5[9].updateParent(EmbeddedAssets);
         param5[10].updateParent(EmbeddedAssets);
         param5[8].updateParent(EmbeddedAssets);
         param5[14].updateParent(EmbeddedAssets);
         param5[6].updateParent(EmbeddedAssets);
         param5[4].updateParent(EmbeddedAssets);
         param5[7].updateParent(EmbeddedAssets);
      }
   }
}

