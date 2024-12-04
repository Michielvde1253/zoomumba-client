package
{
   import components.textfield.StandardText;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   
   public class _components_textfield_StandardTextWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _components_textfield_StandardTextWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         StandardText.watcherSetupUtil = new _components_textfield_StandardTextWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

