package
{
   import components.textfield.labelDisplay.skin.LabelDisplaySkin;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _components_textfield_labelDisplay_skin_LabelDisplaySkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _components_textfield_labelDisplay_skin_LabelDisplaySkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         LabelDisplaySkin.watcherSetupUtil = new _components_textfield_labelDisplay_skin_LabelDisplaySkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("hostComponent",{"propertyChange":true},[param4[0],param4[1],param4[4],param4[5],param4[6],param4[7],param4[8]],param2);
         param5[5] = new PropertyWatcher("text",{"propertyChange":true},[param4[4]],null);
         param5[8] = new PropertyWatcher("value",{"propertyChange":true},[param4[4]],null);
         param5[11] = new PropertyWatcher("_scale",{"propertyChange":true},[param4[7],param4[8]],null);
         param5[1] = new PropertyWatcher("fontSize",{"propertyChange":true},[param4[0]],null);
         param5[10] = new PropertyWatcher("_imgHeight",{"propertyChange":true},[param4[6]],null);
         param5[2] = new PropertyWatcher("canAfford",{"propertyChange":true},[param4[1]],null);
         param5[9] = new PropertyWatcher("_imgWidth",{"propertyChange":true},[param4[5]],null);
         param5[0].updateParent(param1);
         param5[0].addChild(param5[5]);
         param5[0].addChild(param5[8]);
         param5[0].addChild(param5[11]);
         param5[0].addChild(param5[1]);
         param5[0].addChild(param5[10]);
         param5[0].addChild(param5[2]);
         param5[0].addChild(param5[9]);
      }
   }
}

