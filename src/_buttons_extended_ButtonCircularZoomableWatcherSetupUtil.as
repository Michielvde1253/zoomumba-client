package
{
   import buttons.extended.ButtonCircularZoomable;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   
   public class _buttons_extended_ButtonCircularZoomableWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _buttons_extended_ButtonCircularZoomableWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ButtonCircularZoomable.watcherSetupUtil = new _buttons_extended_ButtonCircularZoomableWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

