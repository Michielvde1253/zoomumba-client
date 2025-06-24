package
{
   import components.dropDown.DropDownWoodSkin;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   
   public class _components_dropDown_DropDownWoodSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _components_dropDown_DropDownWoodSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         DropDownWoodSkin.watcherSetupUtil = new _components_dropDown_DropDownWoodSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

