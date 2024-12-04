package
{
   import buttons.skin.circularZoomable.ButtonCustomCircularSkin;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _buttons_skin_circularZoomable_ButtonCustomCircularSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _buttons_skin_circularZoomable_ButtonCustomCircularSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ButtonCustomCircularSkin.watcherSetupUtil = new _buttons_skin_circularZoomable_ButtonCustomCircularSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[5] = new PropertyWatcher("imgBackground",{"propertyChange":true},[param4[5],param4[6]],param2);
         param5[7] = new PropertyWatcher("height",{"heightChanged":true},[param4[6]],null);
         param5[6] = new PropertyWatcher("width",{"widthChanged":true},[param4[5]],null);
         param5[0] = new PropertyWatcher("hostComponent",{"propertyChange":true},[param4[0],param4[1],param4[2],param4[3],param4[4],param4[7],param4[8]],param2);
         param5[3] = new PropertyWatcher("circularState",{"propertyChange":true},[param4[2]],null);
         param5[1] = new PropertyWatcher("backgroundState",{"propertyChange":true},[param4[0]],null);
         param5[4] = new PropertyWatcher("iconClass",{"propertyChange":true},[param4[4]],null);
         param5[2] = new PropertyWatcher("bgScale",{"propertyChange":true},[param4[1],param4[3],param4[7],param4[8]],null);
         param5[5].updateParent(param1);
         param5[5].addChild(param5[7]);
         param5[5].addChild(param5[6]);
         param5[0].updateParent(param1);
         param5[0].addChild(param5[3]);
         param5[0].addChild(param5[1]);
         param5[0].addChild(param5[4]);
         param5[0].addChild(param5[2]);
      }
   }
}

