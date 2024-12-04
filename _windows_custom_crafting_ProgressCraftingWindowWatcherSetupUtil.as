package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.crafting.ProgressCraftingWindow;
   
   public class _windows_custom_crafting_ProgressCraftingWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_crafting_ProgressCraftingWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ProgressCraftingWindow.watcherSetupUtil = new _windows_custom_crafting_ProgressCraftingWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

