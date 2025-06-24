package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.crafting.ProgressCraftingContent;
   
   public class _windows_custom_crafting_ProgressCraftingContentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_crafting_ProgressCraftingContentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ProgressCraftingContent.watcherSetupUtil = new _windows_custom_crafting_ProgressCraftingContentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

