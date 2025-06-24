package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import windows.extensions.headers.skins.WindowHeaderQuestionMarkSkin;
   
   public class _windows_extensions_headers_skins_WindowHeaderQuestionMarkSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_extensions_headers_skins_WindowHeaderQuestionMarkSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         WindowHeaderQuestionMarkSkin.watcherSetupUtil = new _windows_extensions_headers_skins_WindowHeaderQuestionMarkSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[3] = new PropertyWatcher("hostComponent",{"propertyChange":true},[param4[2],param4[4]],param2);
         param5[4] = new PropertyWatcher("text",{"propertyChange":true},[param4[2]],null);
         param5[6] = new PropertyWatcher("fontSize",{"propertyChange":true},[param4[4]],null);
         param5[3].updateParent(param1);
         param5[3].addChild(param5[4]);
         param5[3].addChild(param5[6]);
      }
   }
}

