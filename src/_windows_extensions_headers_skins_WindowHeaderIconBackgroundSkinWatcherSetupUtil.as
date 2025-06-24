package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import windows.extensions.headers.skins.WindowHeaderIconBackgroundSkin;
   
   public class _windows_extensions_headers_skins_WindowHeaderIconBackgroundSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_extensions_headers_skins_WindowHeaderIconBackgroundSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         WindowHeaderIconBackgroundSkin.watcherSetupUtil = new _windows_extensions_headers_skins_WindowHeaderIconBackgroundSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[3] = new PropertyWatcher("hostComponent",{"propertyChange":true},[param4[1],param4[2],param4[4],param4[5],param4[6],param4[7],param4[9]],param2);
         param5[9] = new PropertyWatcher("bgTop",{"propertyChange":true},[param4[6]],null);
         param5[5] = new PropertyWatcher("text",{"propertyChange":true},[param4[2]],null);
         param5[4] = new PropertyWatcher("skinSize",{"skinSizeChanged":true},[param4[1],param4[7],param4[9]],null);
         param5[10] = new PropertyWatcher("bgScale",{"propertyChange":true},[param4[7]],null);
         param5[7] = new PropertyWatcher("fontSize",{"propertyChange":true},[param4[4]],null);
         param5[8] = new PropertyWatcher("bgLeft",{"propertyChange":true},[param4[5]],null);
         param5[3].updateParent(param1);
         param5[3].addChild(param5[9]);
         param5[3].addChild(param5[5]);
         param5[3].addChild(param5[4]);
         param5[3].addChild(param5[10]);
         param5[3].addChild(param5[7]);
         param5[3].addChild(param5[8]);
      }
   }
}

