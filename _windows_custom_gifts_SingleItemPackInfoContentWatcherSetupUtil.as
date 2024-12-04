package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.gifts.SingleItemPackInfoContent;
   
   public class _windows_custom_gifts_SingleItemPackInfoContentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_gifts_SingleItemPackInfoContentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         SingleItemPackInfoContent.watcherSetupUtil = new _windows_custom_gifts_SingleItemPackInfoContentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

