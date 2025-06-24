package
{
   import custom.mainMenu.MainMenu;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _custom_mainMenu_MainMenuWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _custom_mainMenu_MainMenuWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         MainMenu.watcherSetupUtil = new _custom_mainMenu_MainMenuWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[4] = new PropertyWatcher("_btr",{"propertyChange":true},[param4[3]],param2);
         param5[5] = new PropertyWatcher("width",{"propertyChange":true},[param4[3]],null);
         param5[2] = new PropertyWatcher("bgGroup",{"propertyChange":true},[param4[1],param4[2]],param2);
         param5[3] = new PropertyWatcher("width",{"widthChanged":true},[param4[1],param4[2]],null);
         param5[0] = new PropertyWatcher("_btl",{"propertyChange":true},[param4[0]],param2);
         param5[1] = new PropertyWatcher("width",{"propertyChange":true},[param4[0]],null);
         param5[4].updateParent(param1);
         param5[4].addChild(param5[5]);
         param5[2].updateParent(param1);
         param5[2].addChild(param5[3]);
         param5[0].updateParent(param1);
         param5[0].addChild(param5[1]);
      }
   }
}

