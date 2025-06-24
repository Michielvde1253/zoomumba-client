package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.valentines.ValentinesEndContent;
   
   public class _windows_custom_valentines_ValentinesEndContentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_valentines_ValentinesEndContentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ValentinesEndContent.watcherSetupUtil = new _windows_custom_valentines_ValentinesEndContentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

