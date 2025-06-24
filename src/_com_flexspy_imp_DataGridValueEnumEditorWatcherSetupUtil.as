package
{
   import com.flexspy.imp.DataGridValueEnumEditor;
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _com_flexspy_imp_DataGridValueEnumEditorWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
      public function _com_flexspy_imp_DataGridValueEnumEditorWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         DataGridValueEnumEditor.watcherSetupUtil = new _com_flexspy_imp_DataGridValueEnumEditorWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[0] = new PropertyWatcher("possibleValues",{"propertyChange":true},[param3[0]],param2);
         param4[0].updateParent(param1);
      }
   }
}

