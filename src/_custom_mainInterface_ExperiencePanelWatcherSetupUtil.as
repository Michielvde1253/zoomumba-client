package
{
   import custom.mainInterface.ExperiencePanel;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _custom_mainInterface_ExperiencePanelWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _custom_mainInterface_ExperiencePanelWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ExperiencePanel.watcherSetupUtil = new _custom_mainInterface_ExperiencePanelWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[2] = new PropertyWatcher("level",{"propertyChange":true},[param4[2]],param2);
         param5[0] = new PropertyWatcher("percent",{"propertyChange":true},[param4[0]],param2);
         param5[1] = new PropertyWatcher("xp",{"propertyChange":true},[param4[1]],param2);
         param5[2].updateParent(param1);
         param5[0].updateParent(param1);
         param5[1].updateParent(param1);
      }
   }
}

