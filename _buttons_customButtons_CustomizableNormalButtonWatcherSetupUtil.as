package
{
   import buttons.customButtons.CustomizableNormalButton;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _buttons_customButtons_CustomizableNormalButtonWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _buttons_customButtons_CustomizableNormalButtonWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         CustomizableNormalButton.watcherSetupUtil = new _buttons_customButtons_CustomizableNormalButtonWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("_bitmapContent",{"propertyChange":true},[param4[0]],param2);
         param5[0].updateParent(param1);
      }
   }
}

