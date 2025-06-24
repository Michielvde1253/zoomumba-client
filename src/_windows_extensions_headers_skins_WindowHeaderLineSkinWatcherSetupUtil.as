package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import windows.extensions.headers.skins.WindowHeaderLineSkin;
   
   public class _windows_extensions_headers_skins_WindowHeaderLineSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_extensions_headers_skins_WindowHeaderLineSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         WindowHeaderLineSkin.watcherSetupUtil = new _windows_extensions_headers_skins_WindowHeaderLineSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("hostComponent",{"propertyChange":true},[param4[0],param4[2]],param2);
         param5[1] = new PropertyWatcher("text",{"propertyChange":true},[param4[0]],null);
         param5[3] = new PropertyWatcher("fontSize",{"propertyChange":true},[param4[2]],null);
         param5[4] = new PropertyWatcher("groupText",{"propertyChange":true},[param4[3]],param2);
         param5[5] = new PropertyWatcher("height",{"heightChanged":true},[param4[3]],null);
         param5[6] = new PropertyWatcher("y",{"yChanged":true},[param4[3]],null);
         param5[0].updateParent(param1);
         param5[0].addChild(param5[1]);
         param5[0].addChild(param5[3]);
         param5[4].updateParent(param1);
         param5[4].addChild(param5[5]);
         param5[4].addChild(param5[6]);
      }
   }
}

