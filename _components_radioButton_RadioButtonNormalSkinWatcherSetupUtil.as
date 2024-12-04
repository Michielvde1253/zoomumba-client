package
{
   import components.radioButton.RadioButtonNormalSkin;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _components_radioButton_RadioButtonNormalSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _components_radioButton_RadioButtonNormalSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         RadioButtonNormalSkin.watcherSetupUtil = new _components_radioButton_RadioButtonNormalSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("hostComponent",{"propertyChange":true},[param4[0]],param2);
         param5[1] = new PropertyWatcher("label",{"contentChange":true},[param4[0]],null);
         param5[0].updateParent(param1);
         param5[0].addChild(param5[1]);
      }
   }
}

