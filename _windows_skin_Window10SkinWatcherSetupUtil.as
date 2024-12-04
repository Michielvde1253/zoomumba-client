package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import windows.skin.Window10Skin;
   
   public class _windows_skin_Window10SkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_skin_Window10SkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         Window10Skin.watcherSetupUtil = new _windows_skin_Window10SkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[2] = new PropertyWatcher("hostComponent",{"propertyChange":true},[param4[2]],param2);
         param5[3] = new PropertyWatcher("backgroundPattern",{"propertyChange":true},[param4[2]],null);
         param5[4] = new PropertyWatcher("header",{"propertyChange":true},[param4[3]],param2);
         param5[5] = new PropertyWatcher("height",{"heightChanged":true},[param4[3]],null);
         param5[2].updateParent(param1);
         param5[2].addChild(param5[3]);
         param5[4].updateParent(param1);
         param5[4].addChild(param5[5]);
      }
   }
}

