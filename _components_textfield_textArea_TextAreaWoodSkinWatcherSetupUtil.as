package
{
   import components.textfield.textArea.TextAreaWoodSkin;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _components_textfield_textArea_TextAreaWoodSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _components_textfield_textArea_TextAreaWoodSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         TextAreaWoodSkin.watcherSetupUtil = new _components_textfield_textArea_TextAreaWoodSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[1] = new PropertyWatcher("hostComponent",{"propertyChange":true},[param4[1]],param2);
         param5[2] = new PropertyWatcher("promptColor",{"propertyChange":true},[param4[1]],null);
         param5[1].updateParent(param1);
         param5[1].addChild(param5[2]);
      }
   }
}

