package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.assistants.AssistantRenewContent;
   
   public class _windows_custom_assistants_AssistantRenewContentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_assistants_AssistantRenewContentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         AssistantRenewContent.watcherSetupUtil = new _windows_custom_assistants_AssistantRenewContentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

