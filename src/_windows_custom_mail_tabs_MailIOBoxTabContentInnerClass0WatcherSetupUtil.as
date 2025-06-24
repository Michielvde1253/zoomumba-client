package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.binding.StaticPropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import windows.custom.mail.tabs.MailIOBoxTabContent;
   import windows.custom.mail.tabs.MailIOBoxTabContentInnerClass0;
   
   public class _windows_custom_mail_tabs_MailIOBoxTabContentInnerClass0WatcherSetupUtil implements IWatcherSetupUtil2
   {
      public function _windows_custom_mail_tabs_MailIOBoxTabContentInnerClass0WatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         MailIOBoxTabContentInnerClass0.watcherSetupUtil = new _windows_custom_mail_tabs_MailIOBoxTabContentInnerClass0WatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[4] = new StaticPropertyWatcher("repBitmapData",{"propertyChange":true},[param4[3]],null);
         param5[1] = new StaticPropertyWatcher("delToolTip",{"propertyChange":true},[param4[1]],null);
         param5[2] = new PropertyWatcher("data",{"dataChange":true},[param4[2],param4[5],param4[6],param4[7],param4[8],param4[9],param4[10]],param2);
         param5[8] = new PropertyWatcher("rName",null,[param4[6]],null);
         param5[6] = new PropertyWatcher("status",null,[param4[5],param4[7],param4[9]],null);
         param5[10] = new PropertyWatcher("ins",null,[param4[10]],null);
         param5[3] = new PropertyWatcher("inbox",null,[param4[2],param4[6]],null);
         param5[9] = new PropertyWatcher("head",null,[param4[8]],null);
         param5[7] = new PropertyWatcher("sName",null,[param4[6]],null);
         param5[0] = new StaticPropertyWatcher("delBitmapData",{"propertyChange":true},[param4[0]],null);
         param5[5] = new StaticPropertyWatcher("repToolTip",{"propertyChange":true},[param4[4]],null);
         param5[4].updateParent(MailIOBoxTabContent);
         param5[1].updateParent(MailIOBoxTabContent);
         param5[2].updateParent(param1);
         param5[2].addChild(param5[8]);
         param5[2].addChild(param5[6]);
         param5[2].addChild(param5[10]);
         param5[2].addChild(param5[3]);
         param5[2].addChild(param5[9]);
         param5[2].addChild(param5[7]);
         param5[0].updateParent(MailIOBoxTabContent);
         param5[5].updateParent(MailIOBoxTabContent);
      }
   }
}

