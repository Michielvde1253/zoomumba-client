package
{
   import custom.features.collectable.book.component.CollBookPageIcon;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.binding.StaticPropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _custom_features_collectable_book_component_CollBookPageIconWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _custom_features_collectable_book_component_CollBookPageIconWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         CollBookPageIcon.watcherSetupUtil = new _custom_features_collectable_book_component_CollBookPageIconWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[3] = new StaticPropertyWatcher("$tape1Source",{"propertyChange":true},[param4[3]],param3);
         param5[12] = new PropertyWatcher("count",{"valueChanged":true},[param4[12]],param2);
         param5[7] = new PropertyWatcher("collected",{"propertyChange":true},[param4[7],param4[8]],param2);
         param5[4] = new StaticPropertyWatcher("$tape2Source",{"propertyChange":true},[param4[4]],param3);
         param5[6] = new PropertyWatcher("source",{"propertyChange":true},[param4[6]],param2);
         param5[11] = new StaticPropertyWatcher("$questionMarkSource",{"propertyChange":true},[param4[10]],param3);
         param5[0] = new StaticPropertyWatcher("$paper15Source",{"propertyChange":true},[param4[0]],param3);
         param5[5] = new StaticPropertyWatcher("$tape3Source",{"propertyChange":true},[param4[5]],param3);
         param5[2] = new StaticPropertyWatcher("$paper3Source",{"propertyChange":true},[param4[2]],param3);
         param5[1] = new StaticPropertyWatcher("$paper24Source",{"propertyChange":true},[param4[1]],param3);
         param5[10] = new PropertyWatcher("surprise",{"propertyChange":true},[param4[9],param4[11]],param2);
         param5[3].updateParent(CollBookPageIcon);
         param5[12].updateParent(param1);
         param5[7].updateParent(param1);
         param5[4].updateParent(CollBookPageIcon);
         param5[6].updateParent(param1);
         param5[11].updateParent(CollBookPageIcon);
         param5[0].updateParent(CollBookPageIcon);
         param5[5].updateParent(CollBookPageIcon);
         param5[2].updateParent(CollBookPageIcon);
         param5[1].updateParent(CollBookPageIcon);
         param5[10].updateParent(param1);
      }
   }
}

