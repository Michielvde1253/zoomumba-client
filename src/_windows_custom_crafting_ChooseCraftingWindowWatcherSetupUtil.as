package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.crafting.ChooseCraftingWindow;
   
   public class _windows_custom_crafting_ChooseCraftingWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_crafting_ChooseCraftingWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ChooseCraftingWindow.watcherSetupUtil = new _windows_custom_crafting_ChooseCraftingWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

