package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import windows.custom.generic.comic.GenericComicContent;
   
   public class _windows_custom_generic_comic_GenericComicContentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_generic_comic_GenericComicContentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         GenericComicContent.watcherSetupUtil = new _windows_custom_generic_comic_GenericComicContentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("_prevButton",{"propertyChange":true},[param4[0]],param2);
         param5[1] = new PropertyWatcher("_nextButton",{"propertyChange":true},[param4[1]],param2);
         param5[0].updateParent(param1);
         param5[1].updateParent(param1);
      }
   }
}

