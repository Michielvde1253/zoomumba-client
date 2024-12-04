package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.specialOffer.SpecialOfferContent;
   
   public class _windows_custom_specialOffer_SpecialOfferContentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_specialOffer_SpecialOfferContentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         SpecialOfferContent.watcherSetupUtil = new _windows_custom_specialOffer_SpecialOfferContentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

