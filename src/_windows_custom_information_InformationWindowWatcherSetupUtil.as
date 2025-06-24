package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.information.InformationWindow;
   
   public class _windows_custom_information_InformationWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_information_InformationWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         InformationWindow.watcherSetupUtil = new _windows_custom_information_InformationWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

