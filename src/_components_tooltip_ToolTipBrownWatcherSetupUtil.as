package
{
   import components.tooltip.ToolTipBrown;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   
   public class _components_tooltip_ToolTipBrownWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _components_tooltip_ToolTipBrownWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ToolTipBrown.watcherSetupUtil = new _components_tooltip_ToolTipBrownWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

