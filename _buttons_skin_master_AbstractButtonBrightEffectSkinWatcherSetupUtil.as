package
{
   import buttons.skin.master.AbstractButtonBrightEffectSkin;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   
   public class _buttons_skin_master_AbstractButtonBrightEffectSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _buttons_skin_master_AbstractButtonBrightEffectSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         AbstractButtonBrightEffectSkin.watcherSetupUtil = new _buttons_skin_master_AbstractButtonBrightEffectSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

