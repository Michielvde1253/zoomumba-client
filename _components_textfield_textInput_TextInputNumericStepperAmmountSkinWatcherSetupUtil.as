package
{
   import components.textfield.textInput.TextInputNumericStepperAmmountSkin;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   
   public class _components_textfield_textInput_TextInputNumericStepperAmmountSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _components_textfield_textInput_TextInputNumericStepperAmmountSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         TextInputNumericStepperAmmountSkin.watcherSetupUtil = new _components_textfield_textInput_TextInputNumericStepperAmmountSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

