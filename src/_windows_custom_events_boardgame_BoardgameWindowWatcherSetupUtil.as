package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.events.boardgame.BoardgameWindow;
   
   public class _windows_custom_events_boardgame_BoardgameWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_events_boardgame_BoardgameWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         BoardgameWindow.watcherSetupUtil = new _windows_custom_events_boardgame_BoardgameWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

