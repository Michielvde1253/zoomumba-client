package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.events.ballonEventSell.BallonEventSellWindow;
   
   public class _windows_custom_events_ballonEventSell_BallonEventSellWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_events_ballonEventSell_BallonEventSellWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         BallonEventSellWindow.watcherSetupUtil = new _windows_custom_events_ballonEventSell_BallonEventSellWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

