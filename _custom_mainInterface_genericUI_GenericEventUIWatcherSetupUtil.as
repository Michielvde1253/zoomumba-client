package
{
   import custom.mainInterface.genericUI.GenericEventUI;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _custom_mainInterface_genericUI_GenericEventUIWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _custom_mainInterface_genericUI_GenericEventUIWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         GenericEventUI.watcherSetupUtil = new _custom_mainInterface_genericUI_GenericEventUIWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[2] = new PropertyWatcher("minimizedYPos",{"propertyChange":true},[param4[3],param4[7],param4[15]],param2);
         param5[6] = new PropertyWatcher("imgBackground",{"propertyChange":true},[param4[10],param4[11]],param2);
         param5[8] = new PropertyWatcher("height",{"heightChanged":true},[param4[11]],null);
         param5[7] = new PropertyWatcher("width",{"widthChanged":true},[param4[10]],null);
         param5[0] = new PropertyWatcher("imgScale",{"propertyChange":true},[param4[0],param4[1],param4[12],param4[13]],param2);
         param5[3] = new PropertyWatcher("bitmapDisplayPosX",{"propertyChange":true},[param4[4]],param2);
         param5[5] = new PropertyWatcher("mainButtonEnabled",{"propertyChange":true},[param4[8],param4[9]],param2);
         param5[1] = new PropertyWatcher("minimizedXPos",{"propertyChange":true},[param4[2],param4[6],param4[14]],param2);
         param5[4] = new PropertyWatcher("bitmapDisplayPosY",{"propertyChange":true},[param4[5]],param2);
         param5[2].updateParent(param1);
         param5[6].updateParent(param1);
         param5[6].addChild(param5[8]);
         param5[6].addChild(param5[7]);
         param5[0].updateParent(param1);
         param5[3].updateParent(param1);
         param5[5].updateParent(param1);
         param5[1].updateParent(param1);
         param5[4].updateParent(param1);
      }
   }
}

