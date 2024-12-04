package
{
   import custom.features.collectable.book.content.CollBookContPageMain;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   
   public class _custom_features_collectable_book_content_CollBookContPageMainWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _custom_features_collectable_book_content_CollBookContPageMainWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         CollBookContPageMain.watcherSetupUtil = new _custom_features_collectable_book_content_CollBookContPageMainWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

