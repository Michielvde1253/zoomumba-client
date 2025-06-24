package
{
   import custom.features.collectable.button.CollWindowButton;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.binding.StaticPropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _custom_features_collectable_button_CollWindowButtonWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _custom_features_collectable_button_CollWindowButtonWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         CollWindowButton.watcherSetupUtil = new _custom_features_collectable_button_CollWindowButtonWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("isMouseEnable",{"propertyChange":true},[param4[0],param4[1],param4[2]],param2);
         param5[2] = new PropertyWatcher("readyToGo",{"propertyChange":true},[param4[4]],param2);
         param5[6] = new PropertyWatcher("currentSafeSource",{"propertyChange":true},[param4[6]],param2);
         param5[5] = new StaticPropertyWatcher("$buttonAskHelpSource",{"propertyChange":true},[param4[5]],param3);
         param5[7] = new StaticPropertyWatcher("$safeClosedSource",{"propertyChange":true},[param4[6]],param3);
         param5[1] = new PropertyWatcher("hitContainer",{"propertyChange":true},[param4[3]],param2);
         param5[0].updateParent(param1);
         param5[2].updateParent(param1);
         param5[6].updateParent(param1);
         param5[5].updateParent(CollWindowButton);
         param5[7].updateParent(CollWindowButton);
         param5[1].updateParent(param1);
      }
   }
}

