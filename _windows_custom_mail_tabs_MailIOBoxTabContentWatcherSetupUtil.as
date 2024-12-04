package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import windows.custom.mail.tabs.MailIOBoxTabContent;
   
   public class _windows_custom_mail_tabs_MailIOBoxTabContentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_mail_tabs_MailIOBoxTabContentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         MailIOBoxTabContent.watcherSetupUtil = new _windows_custom_mail_tabs_MailIOBoxTabContentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[2] = new PropertyWatcher("btnBack",{"propertyChange":true},[param4[2]],param2);
         param5[0] = new PropertyWatcher("btnFirst",{"propertyChange":true},[param4[0]],param2);
         param5[3] = new PropertyWatcher("btnLast",{"propertyChange":true},[param4[3]],param2);
         param5[4] = new PropertyWatcher("bg",{"propertyChange":true},[param4[4],param4[5],param4[6],param4[7]],param2);
         param5[1] = new PropertyWatcher("btnNext",{"propertyChange":true},[param4[1]],param2);
         param5[2].updateParent(param1);
         param5[0].updateParent(param1);
         param5[3].updateParent(param1);
         param5[4].updateParent(param1);
         param5[1].updateParent(param1);
      }
   }
}

