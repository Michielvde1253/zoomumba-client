package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import windows.custom.questsWindow.components.QuestItemButton;
   
   public class _windows_custom_questsWindow_components_QuestItemButtonWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_questsWindow_components_QuestItemButtonWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         QuestItemButton.watcherSetupUtil = new _windows_custom_questsWindow_components_QuestItemButtonWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("sepia",{"propertyChange":true},[param4[0]],param2);
         param5[3] = new PropertyWatcher("_bitmapContent",{"propertyChange":true},[param4[1]],param2);
         param5[4] = new PropertyWatcher("background",{"propertyChange":true},[param4[2],param4[3]],param2);
         param5[6] = new PropertyWatcher("height",{"heightChanged":true},[param4[3]],null);
         param5[5] = new PropertyWatcher("width",{"widthChanged":true},[param4[2]],null);
         param5[0].updateParent(param1);
         param5[3].updateParent(param1);
         param5[4].updateParent(param1);
         param5[4].addChild(param5[6]);
         param5[4].addChild(param5[5]);
      }
   }
}

