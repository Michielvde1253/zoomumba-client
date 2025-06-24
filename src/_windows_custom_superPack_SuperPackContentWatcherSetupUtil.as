package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.superPack.SuperPackContent;
   
   public class _windows_custom_superPack_SuperPackContentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_superPack_SuperPackContentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         SuperPackContent.watcherSetupUtil = new _windows_custom_superPack_SuperPackContentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

