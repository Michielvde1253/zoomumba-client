package
{
   import custom.features.collectable.book.component.CollBookCategoryIcon;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _custom_features_collectable_book_component_CollBookCategoryIconWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _custom_features_collectable_book_component_CollBookCategoryIconWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         CollBookCategoryIcon.watcherSetupUtil = new _custom_features_collectable_book_component_CollBookCategoryIconWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[2] = new PropertyWatcher("progress",{"valueChanged":true},[param4[1]],param2);
         param5[2].updateParent(param1);
      }
   }
}

