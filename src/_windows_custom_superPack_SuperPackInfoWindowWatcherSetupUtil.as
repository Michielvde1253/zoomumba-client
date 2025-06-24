package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.superPack.SuperPackInfoWindow;
   
   public class _windows_custom_superPack_SuperPackInfoWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_superPack_SuperPackInfoWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         SuperPackInfoWindow.watcherSetupUtil = new _windows_custom_superPack_SuperPackInfoWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

