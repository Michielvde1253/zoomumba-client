package
{
   import custom.features.collectable.book.component.RibbonBar;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _custom_features_collectable_book_component_RibbonBarWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _custom_features_collectable_book_component_RibbonBarWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         RibbonBar.watcherSetupUtil = new _custom_features_collectable_book_component_RibbonBarWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[2] = new PropertyWatcher("$ribbonAssistantsSource",{"propertyChange":true},[param4[2]],param2);
         param5[3] = new PropertyWatcher("$ribbonSpecialsSource",{"propertyChange":true},[param4[3]],param2);
         param5[1] = new PropertyWatcher("$ribbonHabitatsSource",{"propertyChange":true},[param4[1]],param2);
         param5[0] = new PropertyWatcher("$ribbonAnimalsSource",{"propertyChange":true},[param4[0]],param2);
         param5[2].updateParent(param1);
         param5[3].updateParent(param1);
         param5[1].updateParent(param1);
         param5[0].updateParent(param1);
      }
   }
}

