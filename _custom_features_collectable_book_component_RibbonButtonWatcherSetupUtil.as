package
{
   import custom.features.collectable.book.component.RibbonButton;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   
   public class _custom_features_collectable_book_component_RibbonButtonWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _custom_features_collectable_book_component_RibbonButtonWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         RibbonButton.watcherSetupUtil = new _custom_features_collectable_book_component_RibbonButtonWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

