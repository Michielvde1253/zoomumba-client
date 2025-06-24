package
{
   import custom.features.collectable.book.component.CollBookPageMain;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.binding.StaticPropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _custom_features_collectable_book_component_CollBookPageMainWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _custom_features_collectable_book_component_CollBookPageMainWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         CollBookPageMain.watcherSetupUtil = new _custom_features_collectable_book_component_CollBookPageMainWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[2] = new PropertyWatcher("text",{"propertyChange":true},[param4[2]],param2);
         param5[0] = new PropertyWatcher("title",{"propertyChange":true},[param4[0]],param2);
         param5[3] = new PropertyWatcher("more",{"propertyChange":true},[param4[3]],param2);
         param5[5] = new StaticPropertyWatcher("$lineHMainSource",{"propertyChange":true},[param4[6],param4[7]],param3);
         param5[4] = new StaticPropertyWatcher("$lineVMainSource",{"propertyChange":true},[param4[4],param4[5]],param3);
         param5[2].updateParent(param1);
         param5[0].updateParent(param1);
         param5[3].updateParent(param1);
         param5[5].updateParent(CollBookPageMain);
         param5[4].updateParent(CollBookPageMain);
      }
   }
}

