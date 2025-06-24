package
{
   import custom.card.component.CardRight;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _custom_card_component_CardRightWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _custom_card_component_CardRightWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         CardRight.watcherSetupUtil = new _custom_card_component_CardRightWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("radioButtonSexGroup",{"propertyChange":true},[param4[0],param4[1]],param2);
         param5[0].updateParent(param1);
      }
   }
}

