package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.valentines.ValentinesWindow;
   
   public class _windows_custom_valentines_ValentinesWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_valentines_ValentinesWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ValentinesWindow.watcherSetupUtil = new _windows_custom_valentines_ValentinesWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

