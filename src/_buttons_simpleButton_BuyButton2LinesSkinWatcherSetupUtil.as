package
{
   import buttons.simpleButton.BuyButton2LinesSkin;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _buttons_simpleButton_BuyButton2LinesSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _buttons_simpleButton_BuyButton2LinesSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         BuyButton2LinesSkin.watcherSetupUtil = new _buttons_simpleButton_BuyButton2LinesSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[5] = new PropertyWatcher("height",{"heightChanged":true},[param4[3]],param2);
         param5[4] = new PropertyWatcher("width",{"widthChanged":true},[param4[2]],param2);
         param5[2] = new PropertyWatcher("hostComponent",{"propertyChange":true},[param4[1]],param2);
         param5[3] = new PropertyWatcher("label",{"contentChange":true},[param4[1]],null);
         param5[5].updateParent(param1);
         param5[4].updateParent(param1);
         param5[2].updateParent(param1);
         param5[2].addChild(param5[3]);
      }
   }
}

