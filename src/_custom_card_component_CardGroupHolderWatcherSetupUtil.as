package
{
   import custom.card.component.CardGroupHolder;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _custom_card_component_CardGroupHolderWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _custom_card_component_CardGroupHolderWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         CardGroupHolder.watcherSetupUtil = new _custom_card_component_CardGroupHolderWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[7] = new PropertyWatcher("paginator",{"propertyChange":true},[param4[6]],param2);
         param5[8] = new PropertyWatcher("maxEntries",{"propertyChange":true},[param4[6]],null);
         param5[0] = new PropertyWatcher("_prev",{"propertyChange":true},[param4[0]],param2);
         param5[3] = new PropertyWatcher("_last",{"propertyChange":true},[param4[3]],param2);
         param5[5] = new PropertyWatcher("horizontalTileCenter",{"propertyChange":true},[param4[5]],param2);
         param5[2] = new PropertyWatcher("_first",{"propertyChange":true},[param4[2]],param2);
         param5[4] = new PropertyWatcher("entriesPerPage",{"propertyChange":true},[param4[4]],param2);
         param5[1] = new PropertyWatcher("_next",{"propertyChange":true},[param4[1]],param2);
         param5[7].updateParent(param1);
         param5[7].addChild(param5[8]);
         param5[0].updateParent(param1);
         param5[3].updateParent(param1);
         param5[5].updateParent(param1);
         param5[2].updateParent(param1);
         param5[4].updateParent(param1);
         param5[1].updateParent(param1);
      }
   }
}

