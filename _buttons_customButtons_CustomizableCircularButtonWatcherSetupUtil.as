package
{
   import buttons.customButtons.CustomizableCircularButton;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _buttons_customButtons_CustomizableCircularButtonWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _buttons_customButtons_CustomizableCircularButtonWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         CustomizableCircularButton.watcherSetupUtil = new _buttons_customButtons_CustomizableCircularButtonWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[1] = new PropertyWatcher("imgBackground",{"propertyChange":true},[param4[5],param4[6],param4[11],param4[12]],param2);
         param5[3] = new PropertyWatcher("height",{"heightChanged":true},[param4[6],param4[12]],null);
         param5[2] = new PropertyWatcher("width",{"widthChanged":true},[param4[5],param4[11]],null);
         param5[5] = new PropertyWatcher("bitmapDisplayPosX",{"propertyChange":true},[param4[9]],param2);
         param5[0] = new PropertyWatcher("backgroundScale",{"propertyChange":true},[param4[0],param4[1],param4[2],param4[3],param4[4],param4[5],param4[6],param4[8],param4[13],param4[14]],param2);
         param5[4] = new PropertyWatcher("bitmapContent",{"propertyChange":true},[param4[7]],param2);
         param5[6] = new PropertyWatcher("bitmapDisplayPosY",{"propertyChange":true},[param4[10]],param2);
         param5[1].updateParent(param1);
         param5[1].addChild(param5[3]);
         param5[1].addChild(param5[2]);
         param5[5].updateParent(param1);
         param5[0].updateParent(param1);
         param5[4].updateParent(param1);
         param5[6].updateParent(param1);
      }
   }
}

