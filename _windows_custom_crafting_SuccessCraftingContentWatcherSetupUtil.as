package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.crafting.SuccessCraftingContent;
   
   public class _windows_custom_crafting_SuccessCraftingContentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_crafting_SuccessCraftingContentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         SuccessCraftingContent.watcherSetupUtil = new _windows_custom_crafting_SuccessCraftingContentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

