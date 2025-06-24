package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import windows.custom.mail.MailContent;
   
   public class _windows_custom_mail_MailContentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_mail_MailContentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         MailContent.watcherSetupUtil = new _windows_custom_mail_MailContentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

