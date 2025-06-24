package
{
   import buttons.extended.ButtonBuy;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _buttons_extended_ButtonBuyWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _buttons_extended_ButtonBuyWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ButtonBuy.watcherSetupUtil = new _buttons_extended_ButtonBuyWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[1] = new PropertyWatcher("height",{"heightChanged":true},[param4[1]],param2);
         param5[0] = new PropertyWatcher("width",{"widthChanged":true},[param4[0]],param2);
         param5[1].updateParent(param1);
         param5[0].updateParent(param1);
      }
   }
}

