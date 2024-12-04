package
{
   import buttons.extended.IconLabelButton;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _buttons_extended_IconLabelButtonWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _buttons_extended_IconLabelButtonWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         IconLabelButton.watcherSetupUtil = new _buttons_extended_IconLabelButtonWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[1] = new PropertyWatcher("height",{"heightChanged":true},[param4[1]],param2);
         param5[0] = new PropertyWatcher("width",{"widthChanged":true},[param4[0]],param2);
         param5[3] = new PropertyWatcher("label",{"propertyChange":true},[param4[3]],param2);
         param5[2] = new PropertyWatcher("iconClass",{"propertyChange":true},[param4[2]],param2);
         param5[1].updateParent(param1);
         param5[0].updateParent(param1);
         param5[3].updateParent(param1);
         param5[2].updateParent(param1);
      }
   }
}

