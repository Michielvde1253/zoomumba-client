package
{
   import com.flexspy.imp.StyleDataGridValueRenderer;
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _com_flexspy_imp_StyleDataGridValueRendererWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
      public function _com_flexspy_imp_StyleDataGridValueRendererWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         StyleDataGridValueRenderer.watcherSetupUtil = new _com_flexspy_imp_StyleDataGridValueRendererWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[0] = new PropertyWatcher("data",{"dataChange":true},[param3[0],param3[1]],param2);
         param4[1] = new PropertyWatcher("displayValue",null,[param3[0]],null);
         param4[2] = new PropertyWatcher("editable",null,[param3[1]],null);
         param4[0].updateParent(param1);
         param4[0].addChild(param4[1]);
         param4[0].addChild(param4[2]);
      }
   }
}

