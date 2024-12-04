package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.mail.readMail.MailReadWindow;
   
   public class _windows_custom_mail_readMail_MailReadWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_mail_readMail_MailReadWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         MailReadWindow.watcherSetupUtil = new _windows_custom_mail_readMail_MailReadWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

