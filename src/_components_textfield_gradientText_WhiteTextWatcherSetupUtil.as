package
{
   import components.textfield.gradientText.WhiteText;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _components_textfield_gradientText_WhiteTextWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _components_textfield_gradientText_WhiteTextWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         WhiteText.watcherSetupUtil = new _components_textfield_gradientText_WhiteTextWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[8] = new PropertyWatcher("fontWeight",{"propertyChange":true},[param4[8]],param2);
         param5[12] = new PropertyWatcher("debugMode",{"propertyChange":true},[param4[10],param4[11],param4[17]],param2);
         param5[5] = new PropertyWatcher("paddingTop",{"propertyChange":true},[param4[5]],param2);
         param5[6] = new PropertyWatcher("leading",{"propertyChange":true},[param4[6]],param2);
         param5[0] = new PropertyWatcher("color",{"propertyChange":true},[param4[0]],param2);
         param5[10] = new PropertyWatcher("align",{"propertyChange":true},[param4[10],param4[11],param4[12],param4[13],param4[14],param4[15]],param2);
         param5[18] = new PropertyWatcher("internalRotation",{"propertyChange":true},[param4[16]],param2);
         param5[9] = new PropertyWatcher("textAlign",{"propertyChange":true},[param4[9]],param2);
         param5[7] = new PropertyWatcher("fontFamily",{"propertyChange":true},[param4[7]],param2);
         param5[1] = new PropertyWatcher("fontSize",{"propertyChange":true},[param4[1]],param2);
         param5[3] = new PropertyWatcher("paddingLeft",{"propertyChange":true},[param4[3]],param2);
         param5[2] = new PropertyWatcher("paddingBottom",{"propertyChange":true},[param4[2]],param2);
         param5[4] = new PropertyWatcher("paddingRight",{"propertyChange":true},[param4[4]],param2);
         param5[8].updateParent(param1);
         param5[12].updateParent(param1);
         param5[5].updateParent(param1);
         param5[6].updateParent(param1);
         param5[0].updateParent(param1);
         param5[10].updateParent(param1);
         param5[18].updateParent(param1);
         param5[9].updateParent(param1);
         param5[7].updateParent(param1);
         param5[1].updateParent(param1);
         param5[3].updateParent(param1);
         param5[2].updateParent(param1);
         param5[4].updateParent(param1);
      }
   }
}

