package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.levelUp.RecylingCraftingUnlockWindow;
   
   public class _windows_custom_levelUp_RecylingCraftingUnlockWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_levelUp_RecylingCraftingUnlockWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         RecylingCraftingUnlockWindow.watcherSetupUtil = new _windows_custom_levelUp_RecylingCraftingUnlockWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

