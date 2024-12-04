package
{
   import custom.features.settings.RadioButtonMainBuilding;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _custom_features_settings_RadioButtonMainBuildingWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _custom_features_settings_RadioButtonMainBuildingWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         RadioButtonMainBuilding.watcherSetupUtil = new _custom_features_settings_RadioButtonMainBuildingWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("spriteImage",{"propertyChange":true},[param4[0]],param2);
         param5[5] = new PropertyWatcher("value",{"propertyChange":true},[param4[4]],param2);
         param5[6] = new PropertyWatcher("radioGroup",{"propertyChange":true},[param4[5]],param2);
         param5[3] = new PropertyWatcher("preloaderVisibility",{"propertyChange":true},[param4[2],param4[6]],param2);
         param5[0].updateParent(param1);
         param5[5].updateParent(param1);
         param5[6].updateParent(param1);
         param5[3].updateParent(param1);
      }
   }
}

