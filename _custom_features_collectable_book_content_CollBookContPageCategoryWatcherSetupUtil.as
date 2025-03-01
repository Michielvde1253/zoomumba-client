package
{
   import custom.features.collectable.book.content.CollBookContPageCategory;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.binding.StaticPropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _custom_features_collectable_book_content_CollBookContPageCategoryWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _custom_features_collectable_book_content_CollBookContPageCategoryWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         CollBookContPageCategory.watcherSetupUtil = new _custom_features_collectable_book_content_CollBookContPageCategoryWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("title",{"propertyChange":true},[param4[0]],param2);
         param5[1] = new StaticPropertyWatcher("$lineSource",{"propertyChange":true},[param4[1]],param3);
         param5[0].updateParent(param1);
         param5[1].updateParent(CollBookContPageCategory);
      }
   }
}

