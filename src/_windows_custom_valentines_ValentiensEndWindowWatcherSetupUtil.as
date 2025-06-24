package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.valentines.ValentiensEndWindow;
   
   public class _windows_custom_valentines_ValentiensEndWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_valentines_ValentiensEndWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ValentiensEndWindow.watcherSetupUtil = new _windows_custom_valentines_ValentiensEndWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

