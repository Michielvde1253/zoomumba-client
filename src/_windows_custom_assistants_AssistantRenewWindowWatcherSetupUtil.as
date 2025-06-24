package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.assistants.AssistantRenewWindow;
   
   public class _windows_custom_assistants_AssistantRenewWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_assistants_AssistantRenewWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         AssistantRenewWindow.watcherSetupUtil = new _windows_custom_assistants_AssistantRenewWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

