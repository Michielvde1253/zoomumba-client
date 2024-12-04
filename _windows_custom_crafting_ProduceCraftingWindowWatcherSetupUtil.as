package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.crafting.ProduceCraftingWindow;
   
   public class _windows_custom_crafting_ProduceCraftingWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_crafting_ProduceCraftingWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ProduceCraftingWindow.watcherSetupUtil = new _windows_custom_crafting_ProduceCraftingWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

