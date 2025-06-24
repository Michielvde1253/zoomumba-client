package
{
   import components.textfield.labelDisplay.skin.LabelDisplayGoldSkin;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _components_textfield_labelDisplay_skin_LabelDisplayGoldSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _components_textfield_labelDisplay_skin_LabelDisplayGoldSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         LabelDisplayGoldSkin.watcherSetupUtil = new _components_textfield_labelDisplay_skin_LabelDisplayGoldSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("hostComponent",{"propertyChange":true},[param4[0],param4[1],param4[2],param4[3],param4[4],param4[5],param4[6]],param2);
         param5[3] = new PropertyWatcher("text",{"propertyChange":true},[param4[2]],null);
         param5[6] = new PropertyWatcher("value",{"propertyChange":true},[param4[2]],null);
         param5[9] = new PropertyWatcher("_scale",{"propertyChange":true},[param4[5],param4[6]],null);
         param5[1] = new PropertyWatcher("fontSize",{"propertyChange":true},[param4[0]],null);
         param5[8] = new PropertyWatcher("_imgHeight",{"propertyChange":true},[param4[4]],null);
         param5[2] = new PropertyWatcher("canAfford",{"propertyChange":true},[param4[1]],null);
         param5[7] = new PropertyWatcher("_imgWidth",{"propertyChange":true},[param4[3]],null);
         param5[0].updateParent(param1);
         param5[0].addChild(param5[3]);
         param5[0].addChild(param5[6]);
         param5[0].addChild(param5[9]);
         param5[0].addChild(param5[1]);
         param5[0].addChild(param5[8]);
         param5[0].addChild(param5[2]);
         param5[0].addChild(param5[7]);
      }
   }
}

