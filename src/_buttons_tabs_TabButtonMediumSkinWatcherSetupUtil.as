package
{
   import buttons.tabs.TabButtonMediumSkin;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _buttons_tabs_TabButtonMediumSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _buttons_tabs_TabButtonMediumSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         TabButtonMediumSkin.watcherSetupUtil = new _buttons_tabs_TabButtonMediumSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("width",{"widthChanged":true},[param4[0],param4[3]],param2);
         param5[2] = new PropertyWatcher("hostComponent",{"propertyChange":true},[param4[2],param4[4]],param2);
         param5[3] = new PropertyWatcher("label",{"propertyChange":true},[param4[2],param4[4]],null);
         param5[0].updateParent(param1);
         param5[2].updateParent(param1);
         param5[2].addChild(param5[3]);
      }
   }
}

