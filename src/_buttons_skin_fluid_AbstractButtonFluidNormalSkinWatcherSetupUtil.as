package
{
   import buttons.skin.fluid.AbstractButtonFluidNormalSkin;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _buttons_skin_fluid_AbstractButtonFluidNormalSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _buttons_skin_fluid_AbstractButtonFluidNormalSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         AbstractButtonFluidNormalSkin.watcherSetupUtil = new _buttons_skin_fluid_AbstractButtonFluidNormalSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[21] = new PropertyWatcher("_blmp",{"propertyChange":true},[param4[17]],param2);
         param5[22] = new PropertyWatcher("width",{"propertyChange":true},[param4[17]],null);
         param5[9] = new PropertyWatcher("_btr",{"propertyChange":true},[param4[7],param4[8],param4[23]],param2);
         param5[25] = new PropertyWatcher("height",{"propertyChange":true},[param4[23]],null);
         param5[10] = new PropertyWatcher("width",{"propertyChange":true},[param4[7],param4[8]],null);
         param5[17] = new PropertyWatcher("_bbr",{"propertyChange":true},[param4[13],param4[14],param4[24]],param2);
         param5[26] = new PropertyWatcher("height",{"propertyChange":true},[param4[24]],null);
         param5[18] = new PropertyWatcher("width",{"propertyChange":true},[param4[13],param4[14]],null);
         param5[13] = new PropertyWatcher("minWidth",{"explicitMinWidthChanged":true},[param4[9],param4[10],param4[15],param4[16]],param2);
         param5[0] = new PropertyWatcher("texture",{"propertyChange":true},[param4[0]],param2);
         param5[8] = new PropertyWatcher("width",{"widthChanged":true},[param4[6],param4[8],param4[12],param4[14],param4[18],param4[21]],param2);
         param5[1] = new PropertyWatcher("_btl",{"propertyChange":true},[param4[1],param4[3],param4[5],param4[6],param4[19]],param2);
         param5[2] = new PropertyWatcher("height",{"propertyChange":true},[param4[1],param4[3],param4[19]],null);
         param5[5] = new PropertyWatcher("width",{"propertyChange":true},[param4[5],param4[6]],null);
         param5[23] = new PropertyWatcher("_brmp",{"propertyChange":true},[param4[22]],param2);
         param5[24] = new PropertyWatcher("width",{"propertyChange":true},[param4[22]],null);
         param5[3] = new PropertyWatcher("_bbl",{"propertyChange":true},[param4[2],param4[4],param4[11],param4[12],param4[20]],param2);
         param5[4] = new PropertyWatcher("height",{"propertyChange":true},[param4[2],param4[4],param4[20]],null);
         param5[14] = new PropertyWatcher("width",{"propertyChange":true},[param4[11],param4[12]],null);
         param5[21].updateParent(param1);
         param5[21].addChild(param5[22]);
         param5[9].updateParent(param1);
         param5[9].addChild(param5[25]);
         param5[9].addChild(param5[10]);
         param5[17].updateParent(param1);
         param5[17].addChild(param5[26]);
         param5[17].addChild(param5[18]);
         param5[13].updateParent(param1);
         param5[0].updateParent(param1);
         param5[8].updateParent(param1);
         param5[1].updateParent(param1);
         param5[1].addChild(param5[2]);
         param5[1].addChild(param5[5]);
         param5[23].updateParent(param1);
         param5[23].addChild(param5[24]);
         param5[3].updateParent(param1);
         param5[3].addChild(param5[4]);
         param5[3].addChild(param5[14]);
      }
   }
}

