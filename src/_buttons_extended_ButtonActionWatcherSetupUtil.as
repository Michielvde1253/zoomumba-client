package
{
   import buttons.extended.ButtonAction;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _buttons_extended_ButtonActionWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _buttons_extended_ButtonActionWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ButtonAction.watcherSetupUtil = new _buttons_extended_ButtonActionWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[1] = new PropertyWatcher("height",{"heightChanged":true},[param4[1]],param2);
         param5[0] = new PropertyWatcher("width",{"widthChanged":true},[param4[0]],param2);
         param5[1].updateParent(param1);
         param5[0].updateParent(param1);
      }
   }
}

