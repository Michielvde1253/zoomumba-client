package
{
   import buttons.skin.fluid.ButtonFluidGradientNormalSkin;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _buttons_skin_fluid_ButtonFluidGradientNormalSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _buttons_skin_fluid_ButtonFluidGradientNormalSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ButtonFluidGradientNormalSkin.watcherSetupUtil = new _buttons_skin_fluid_ButtonFluidGradientNormalSkinWatcherSetupUtil();
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

