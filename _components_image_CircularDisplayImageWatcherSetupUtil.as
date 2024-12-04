package
{
   import components.image.CircularDisplayImage;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _components_image_CircularDisplayImageWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _components_image_CircularDisplayImageWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         CircularDisplayImage.watcherSetupUtil = new _components_image_CircularDisplayImageWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("bitmapDisplayScale",{"propertyChange":true},[param4[0]],param2);
         param5[3] = new PropertyWatcher("paddingDisplayX",{"propertyChange":true},[param4[2]],param2);
         param5[1] = new PropertyWatcher("maskScale",{"propertyChange":true},[param4[1],param4[2],param4[3],param4[4],param4[5],param4[6]],param2);
         param5[4] = new PropertyWatcher("maskRectBottom",{"propertyChange":true},[param4[7]],param2);
         param5[2] = new PropertyWatcher("paddingDisplayY",{"propertyChange":true},[param4[1]],param2);
         param5[0].updateParent(param1);
         param5[3].updateParent(param1);
         param5[1].updateParent(param1);
         param5[4].updateParent(param1);
         param5[2].updateParent(param1);
      }
   }
}

