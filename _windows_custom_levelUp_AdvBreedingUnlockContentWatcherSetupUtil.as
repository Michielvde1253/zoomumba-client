package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.levelUp.AdvBreedingUnlockContent;
   
   public class _windows_custom_levelUp_AdvBreedingUnlockContentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_levelUp_AdvBreedingUnlockContentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         AdvBreedingUnlockContent.watcherSetupUtil = new _windows_custom_levelUp_AdvBreedingUnlockContentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

