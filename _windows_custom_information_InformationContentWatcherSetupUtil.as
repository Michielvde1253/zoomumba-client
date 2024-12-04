package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.information.InformationContent;
   
   public class _windows_custom_information_InformationContentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_information_InformationContentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         InformationContent.watcherSetupUtil = new _windows_custom_information_InformationContentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

