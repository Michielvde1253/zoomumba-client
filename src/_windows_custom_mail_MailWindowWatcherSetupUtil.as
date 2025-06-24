package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.mail.MailWindow;
   
   public class _windows_custom_mail_MailWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_mail_MailWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         MailWindow.watcherSetupUtil = new _windows_custom_mail_MailWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

