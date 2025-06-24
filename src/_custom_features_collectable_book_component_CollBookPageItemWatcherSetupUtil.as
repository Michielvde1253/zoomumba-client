package
{
   import custom.features.collectable.book.component.CollBookPageItem;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.binding.StaticPropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _custom_features_collectable_book_component_CollBookPageItemWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _custom_features_collectable_book_component_CollBookPageItemWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         CollBookPageItem.watcherSetupUtil = new _custom_features_collectable_book_component_CollBookPageItemWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[10] = new PropertyWatcher("showBottomRow",{"propertyChange":true},[param4[10]],param2);
         param5[6] = new PropertyWatcher("text",{"propertyChange":true},[param4[6]],param2);
         param5[7] = new PropertyWatcher("more",{"propertyChange":true},[param4[7]],param2);
         param5[2] = new PropertyWatcher("source",{"propertyChange":true},[param4[2],param4[13]],param2);
         param5[0] = new PropertyWatcher("count",{"valueChanged":true},[param4[0],param4[11]],param2);
         param5[1] = new PropertyWatcher("collected",{"propertyChange":true},[param4[1],param4[12]],param2);
         param5[4] = new PropertyWatcher("type",{"propertyChange":true},[param4[4],param4[15]],param2);
         param5[3] = new PropertyWatcher("surprise",{"propertyChange":true},[param4[3],param4[14]],param2);
         param5[9] = new StaticPropertyWatcher("$lineSource",{"propertyChange":true},[param4[9]],param3);
         param5[8] = new PropertyWatcher("moreEnabled",{"propertyChange":true},[param4[8]],param2);
         param5[10].updateParent(param1);
         param5[6].updateParent(param1);
         param5[7].updateParent(param1);
         param5[2].updateParent(param1);
         param5[0].updateParent(param1);
         param5[1].updateParent(param1);
         param5[4].updateParent(param1);
         param5[3].updateParent(param1);
         param5[9].updateParent(CollBookPageItem);
         param5[8].updateParent(param1);
      }
   }
}

