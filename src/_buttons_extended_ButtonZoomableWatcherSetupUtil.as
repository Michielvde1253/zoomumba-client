package
{
   import buttons.extended.ButtonZoomable;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _buttons_extended_ButtonZoomableWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _buttons_extended_ButtonZoomableWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ButtonZoomable.watcherSetupUtil = new _buttons_extended_ButtonZoomableWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[3] = new PropertyWatcher("imgBackground",{"propertyChange":true},[param4[2],param4[3],param4[5],param4[6]],param2);
         param5[5] = new PropertyWatcher("height",{"heightChanged":true},[param4[3],param4[6]],null);
         param5[4] = new PropertyWatcher("width",{"widthChanged":true},[param4[2],param4[5]],null);
         param5[2] = new PropertyWatcher("bgScale",{"propertyChange":true},[param4[1],param4[2],param4[3],param4[4],param4[7],param4[8]],param2);
         param5[3].updateParent(param1);
         param5[3].addChild(param5[5]);
         param5[3].addChild(param5[4]);
         param5[2].updateParent(param1);
      }
   }
}

