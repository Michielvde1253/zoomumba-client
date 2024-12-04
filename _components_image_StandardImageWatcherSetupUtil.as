package
{
   import components.image.StandardImage;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _components_image_StandardImageWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _components_image_StandardImageWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         StandardImage.watcherSetupUtil = new _components_image_StandardImageWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("_bitmapRect",{"propertyChange":true},[param4[0],param4[1]],param2);
         param5[1] = new PropertyWatcher("width",{"propertyChange":true},[param4[0],param4[1]],null);
         param5[2] = new PropertyWatcher("displayScale",{"propertyChange":true},[param4[2],param4[3],param4[4],param4[5]],param2);
         param5[0].updateParent(param1);
         param5[0].addChild(param5[1]);
         param5[2].updateParent(param1);
      }
   }
}

