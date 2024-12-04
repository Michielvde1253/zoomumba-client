package
{
   import custom.card.component.CardDecoBack;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _custom_card_component_CardDecoBackWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _custom_card_component_CardDecoBackWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         CardDecoBack.watcherSetupUtil = new _custom_card_component_CardDecoBackWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("scale",{"propertyChange":true},[param4[0]],param2);
         param5[0].updateParent(param1);
      }
   }
}

