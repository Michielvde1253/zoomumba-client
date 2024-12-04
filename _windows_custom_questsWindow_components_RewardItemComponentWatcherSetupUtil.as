package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import windows.custom.questsWindow.components.RewardItemComponent;
   
   public class _windows_custom_questsWindow_components_RewardItemComponentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_questsWindow_components_RewardItemComponentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         RewardItemComponent.watcherSetupUtil = new _windows_custom_questsWindow_components_RewardItemComponentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("amount",{"propertyChange":true},[param4[0],param4[1]],param2);
         param5[0].updateParent(param1);
      }
   }
}

