package
{
   import custom.card.component.CardBottom;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   
   public class _custom_card_component_CardBottomWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _custom_card_component_CardBottomWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         CardBottom.watcherSetupUtil = new _custom_card_component_CardBottomWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

