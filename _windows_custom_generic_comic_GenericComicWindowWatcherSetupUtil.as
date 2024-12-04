package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.generic.comic.GenericComicWindow;
   
   public class _windows_custom_generic_comic_GenericComicWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_generic_comic_GenericComicWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         GenericComicWindow.watcherSetupUtil = new _windows_custom_generic_comic_GenericComicWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

