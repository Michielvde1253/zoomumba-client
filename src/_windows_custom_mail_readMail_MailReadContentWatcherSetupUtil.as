package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.StaticPropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import windows.custom.mail.readMail.MailReadContent;
   
   public class _windows_custom_mail_readMail_MailReadContentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_mail_readMail_MailReadContentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         MailReadContent.watcherSetupUtil = new _windows_custom_mail_readMail_MailReadContentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new StaticPropertyWatcher("repBitmapData",{"propertyChange":true},[param4[0]],param3);
         param5[1] = new StaticPropertyWatcher("repToolTip",{"propertyChange":true},[param4[1]],param3);
         param5[0].updateParent(MailReadContent);
         param5[1].updateParent(MailReadContent);
      }
   }
}

