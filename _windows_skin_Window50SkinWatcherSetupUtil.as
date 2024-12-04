package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import windows.skin.Window50Skin;
   
   public class _windows_skin_Window50SkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_skin_Window50SkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         Window50Skin.watcherSetupUtil = new _windows_skin_Window50SkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[2] = new PropertyWatcher("hostComponent",{"propertyChange":true},[param4[2],param4[3],param4[4],param4[5]],param2);
         param5[5] = new PropertyWatcher("tabDistanceFromLeft",{"propertyChange":true},[param4[5]],null);
         param5[4] = new PropertyWatcher("tabDistanceFromTop",{"propertyChange":true},[param4[3],param4[4]],null);
         param5[3] = new PropertyWatcher("backgroundPattern",{"propertyChange":true},[param4[2]],null);
         param5[6] = new PropertyWatcher("header",{"propertyChange":true},[param4[6]],param2);
         param5[7] = new PropertyWatcher("height",{"heightChanged":true},[param4[6]],null);
         param5[2].updateParent(param1);
         param5[2].addChild(param5[5]);
         param5[2].addChild(param5[4]);
         param5[2].addChild(param5[3]);
         param5[6].updateParent(param1);
         param5[6].addChild(param5[7]);
      }
   }
}

