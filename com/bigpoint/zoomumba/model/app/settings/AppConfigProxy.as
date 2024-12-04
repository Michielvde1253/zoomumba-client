package com.bigpoint.zoomumba.model.app.settings
{
   import com.bigpoint.zoomumba.constants.MainConstants;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.app.settings.vo.AppConfigVO;
   import com.bigpoint.zoomumba.model.app.settings.vo.FlashParamObjectVO;
   import com.bigpoint.zoorama.Settings;
   import com.bigpoint.zoorama.core.feature.tutorials.TutorialReferences;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.system.Security;
   import org.puremvc.as3.interfaces.IProxy;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class AppConfigProxy extends Proxy implements IProxy
   {
      public static const NAME:String = "AppConfigProxy";
      
      private var appConfig:AppConfigVO;
      
      private var settingsXML:XML;
      
      private var loader:URLLoader;
      
      public function AppConfigProxy(param1:AppConfigVO = null)
      {
         super(NAME,param1);
         this.appConfig = new AppConfigVO();
      }
      
      public function initConfig(param1:FlashParamObjectVO) : void
      {
         this.appConfig.language = !!param1.loaderParams.locale ? param1.loaderParams.locale : this.appConfig.language;
         this.appConfig.api_host = !!param1.loaderParams.apiHost ? param1.loaderParams.apiHost : this.appConfig.host;
         this.appConfig.cdn_host = param1.loaderParams.cdnHost;
         this.appConfig.pre_cv = param1.loaderParams.preCv;
         this.appConfig.user_id = param1.loaderParams.uId;
         this.appConfig.aid = param1.loaderParams.aid;
         this.appConfig.aip = param1.loaderParams.aip;
         this.appConfig.width = param1.loaderParams.width;
         this.appConfig.height = param1.loaderParams.height;
         this.appConfig.reactivated = param1.loaderParams.reactivated;
         this.appConfig.isSsoUser = Boolean(int(param1.loaderParams.isSsoUser));
         this.appConfig.dev_mode = Boolean(param1.loaderParams.isDev);
         this.appConfig.isHTTPS = Boolean(int(param1.loaderParams.isHTTPS));
      }
      
      public function loadConfig(param1:FlashParamObjectVO) : void
      {
         var _loc2_:URLRequest = null;
         var _loc3_:String = null;
         if(param1.loaderParams.social != undefined)
         {
            this.appConfig.open_social = Boolean(param1.loaderParams.social);
         }
         else
         {
            this.appConfig.open_social = false;
         }
         if(param1.loaderParams.tutS != undefined)
         {
            this.tutorial_step = int(param1.loaderParams.tutS);
            if(param1.loaderParams.tutT != undefined)
            {
               this.tutorial_task = int(param1.loaderParams.tutT);
            }
         }
         this.setTutorialIDs();
         if(this.tutorial_step == 12)
         {
            this.tutorial_active = false;
            this.disable_all_keys = false;
         }
         else if(this.tutorial_step == 0)
         {
            this.tutorial_active = true;
            this.disable_all_keys = true;
         }
         else if(this.tutorial_step == -1)
         {
            this.tutorial_active = false;
            this.disable_all_keys = false;
         }
         else
         {
            this.tutorial_active = true;
            this.disable_all_keys = true;
         }
         this.appConfig.second_token = param1.loaderParams.secTok;
         this.appConfig.enable_alcon = Boolean(parseInt(param1.loaderParams.dbg));
         this.appConfig.debug_item_mode = Boolean(parseInt(param1.loaderParams.dbg));
         this.appConfig.isFirstLogin = parseInt(param1.loaderParams.logCnt) == 1 ? true : false;
         if(0 > parseInt(this.appConfig.user_id))
         {
            _loc2_ = new URLRequest("/index.php");
            navigateToURL(_loc2_,"_self");
            return;
         }
         if(this.appConfig.cdn_host)
         {
            if(Settings.isHTTPS)
            {
               this.appConfig.cdn_host.substr(0,7);
            }
            else
            {
               this.appConfig.cdn_host.substr(0,6);
            }
            if(_loc3_ != Settings.httpProtocolString)
            {
               Security.allowDomain(this.appConfig.cdn_host);
               this.appConfig.cdn_host = Settings.httpProtocolString + this.appConfig.cdn_host;
            }
            Security.allowDomain(this.appConfig.cdn_host);
            Security.loadPolicyFile(this.appConfig.cdn_host + "/crossdomain.xml?03");
         }
         else
         {
            this.appConfig.cdn_host = "";
         }
         if(this.appConfig.api_host)
         {
            Security.allowDomain(Settings.httpProtocolString + this.appConfig.api_host,this.appConfig.api_host);
         }
         if(param1.loaderUrl.substr(0,7) == "file://")
         {
            this.appConfig.isLocal = true;
            this.loadExternalSettings();
         }
         else
         {
            sendNotification(Note.APP_CONFIG_LOADED);
         }
      }
      
      public function setThemeNames(param1:String, param2:String, param3:String, param4:String) : void
      {
         this.appConfig.playfieldTheme = param2.replace(".swf","").replace("background_","");
         this.appConfig.roadTheme = param4.replace(".swf","").replace("road","").replace("field","").replace("_","");
         this.appConfig.preloaderTheme = param1;
         this.appConfig.musicTheme = param3.replace(".mp3","").replace("_music","");
         if(this.appConfig.playfieldTheme != "" || this.appConfig.roadTheme != "")
         {
            sendNotification(Note.ON_THEME_INIT);
         }
      }
      
      private function setTutorialIDs() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = this.tutorial_step;
         var _loc3_:int = this.tutorial_task;
         if(this.tutorial_step != 12 && this.tutorial_step != -1)
         {
            if(_loc3_ == 0)
            {
               _loc1_ = _loc2_;
            }
            else if(_loc3_ == 1)
            {
               if(TutorialReferences["TUTORIALSTEP_" + _loc2_ + "_TASKS"] == 1)
               {
                  _loc1_ = _loc2_ + 1;
               }
               else if(TutorialReferences["TUTORIALSTEP_" + _loc2_ + "_TASKS"] == 2)
               {
                  _loc1_ = _loc2_;
               }
            }
            else if(_loc3_ == 2)
            {
               _loc1_ = _loc2_ + 1;
            }
            this.tutorial_step = _loc1_;
         }
      }
      
      private function loadExternalSettings() : void
      {
         if(this.loader == null)
         {
            this.createLoader();
         }
         var _loc1_:String = MainConstants.SETTINGS_PATH + MainConstants.SETTINGS_FILENAME;
         var _loc2_:URLRequest = new URLRequest(_loc1_);
         this.loader.load(_loc2_);
      }
      
      private function createLoader() : void
      {
         this.loader = new URLLoader();
         this.loader.addEventListener(Event.COMPLETE,this.handleURLLoaderComplete);
         this.loader.addEventListener(IOErrorEvent.IO_ERROR,this.handleURLLoaderError);
      }
      
      private function handleURLLoaderComplete(param1:Event) : void
      {
         var event:Event = param1;
         var xmlData:String = event.target.data;
         try
         {
            this.settingsXML = new XML(xmlData);
            this.assignSettingsFromXML();
         }
         catch(error:Error)
         {
            sendNotification(Note.ERROR_REPORT,"AppConfigProxy : It wasn´t possible to read Settings from XML File");
         }
         sendNotification(Note.APP_CONFIG_LOADED);
      }
      
      public function assignSettingsFromXML() : void
      {
         var value:String = null;
         var disabledTabs:String = null;
         value = this.settingsXML.setting.(@id == "USER_ID")[0];
         if(value)
         {
            this.appConfig.user_id = value;
         }
         value = this.settingsXML.setting.(@id == "HOST")[0];
         if(value)
         {
            this.appConfig.api_host = value;
         }
         value = this.settingsXML.setting.(@id == "TOKEN")[0];
         if(value)
         {
            this.appConfig.token = value;
         }
         value = this.settingsXML.setting.(@id == "LANGUAGE")[0];
         if(value)
         {
            this.appConfig.language = value;
         }
         value = this.settingsXML.setting.(@id == "REACTIVATED")[0];
         if(value)
         {
            this.appConfig.reactivated = int(value);
         }
         this.appConfig.dev_mode = this.appConfig.debug_mode = this.settingsXML.setting.(@id == "DEBUG_MODE")[0] == "true" ? true : false;
         this.appConfig.debug_item_mode = this.settingsXML.setting.(@id == "DEBUG_ITEM_MODE")[0] == "true" ? true : false;
         this.appConfig.debug_mode_user_module = this.settingsXML.setting.(@id == "DEBUG_MODE_USER_MODULE")[0] == "true" ? true : false;
         this.appConfig.debug_mode_configuration_module = this.settingsXML.setting.(@id == "DEBUG_MODE_CONFIGURATION_MODULE")[0] == "true" ? true : false;
         this.appConfig.debug_mode_shop = this.settingsXML.setting.(@id == "DEBUG_MODE_SHOP")[0] == "true" ? true : false;
         this.appConfig.debug_mode_server_communication = this.settingsXML.setting.(@id == "DEBUG_MODE_SERVER_COMMUNICATION")[0] == "true" ? true : false;
         this.appConfig.enable_alcon = this.settingsXML.setting.(@id == "ENABLE_ALCON")[0] == "true" ? true : false;
         this.appConfig.debug_asset_library = this.settingsXML.setting.(@id == "DEBUG_ASSET_LIBRARY")[0] == "true" ? true : false;
         this.appConfig.enable_benchmark = this.settingsXML.setting.(@id == "ENABLE_BENCHMARK")[0] == "true" ? true : false;
         this.tutorial_step = 0;
         this.tutorial_task = 1;
         this.setTutorialIDs();
         if(this.settingsXML.setting.(@id == "DISABLED_LOGGER_TABS"))
         {
            disabledTabs = this.settingsXML.setting.(@id == "DISABLED_LOGGER_TABS")[0];
            this.appConfig.disabled_tabs = new Array(disabledTabs);
         }
      }
      
      private function handleURLLoaderError(param1:IOErrorEvent) : void
      {
         sendNotification(Note.ERROR_REPORT,"AppConfigProxy : Settings XML file load error");
         sendNotification(Note.APP_CONFIG_LOADED);
      }
      
      public function setTutorialStep(param1:int) : void
      {
         this.appConfig.tutorial_step = param1;
      }
      
      public function get musicTheme() : String
      {
         return this.appConfig.musicTheme;
      }
      
      public function get playfieldTheme() : String
      {
         if(this.appConfig.playfieldTheme != "")
         {
            return "background_" + this.appConfig.playfieldTheme;
         }
         return "";
      }
      
      public function get roadTheme() : String
      {
         return this.appConfig.roadTheme;
      }
      
      public function get preloaderTheme() : String
      {
         return this.appConfig.preloaderTheme;
      }
      
      public function get enable_benchmark() : Boolean
      {
         return this.appConfig.enable_benchmark;
      }
      
      public function get enable_alcon() : Boolean
      {
         return this.appConfig.enable_alcon;
      }
      
      public function get debug_asset_library() : Boolean
      {
         return this.appConfig.debug_asset_library;
      }
      
      public function get debug_mode_server_communication() : Boolean
      {
         return this.appConfig.debug_mode_server_communication;
      }
      
      public function get debug_mode_shop() : Boolean
      {
         return this.appConfig.debug_mode_shop;
      }
      
      public function get debug_mode_configuration_module() : Boolean
      {
         return this.appConfig.debug_mode_configuration_module;
      }
      
      public function get debug_mode_user_module() : Boolean
      {
         return this.appConfig.debug_mode_user_module;
      }
      
      public function get debug_item_mode() : Boolean
      {
         return this.appConfig.debug_item_mode;
      }
      
      public function get debug_mode() : Boolean
      {
         return this.appConfig.debug_mode;
      }
      
      public function get dev_mode() : Boolean
      {
         return this.appConfig.dev_mode;
      }
      
      public function get open_social() : Boolean
      {
         return this.appConfig.open_social;
      }
      
      public function get space_trigger_enabled() : Boolean
      {
         return this.appConfig.space_trigger_enabled;
      }
      
      public function get isLocal() : Boolean
      {
         return this.appConfig.isLocal;
      }
      
      public function get isFirstLogin() : Boolean
      {
         return this.appConfig.isFirstLogin;
      }
      
      public function get reactivated() : int
      {
         return this.appConfig.reactivated;
      }
      
      public function get second_token() : String
      {
         return this.appConfig.second_token;
      }
      
      public function get token() : String
      {
         return this.appConfig.token;
      }
      
      public function get language() : String
      {
         return this.appConfig.language;
      }
      
      public function get host() : String
      {
         return this.appConfig.host;
      }
      
      public function get aip() : String
      {
         return this.appConfig.aip;
      }
      
      public function get aid() : String
      {
         return this.appConfig.aid;
      }
      
      public function get user_id() : String
      {
         return this.appConfig.user_id;
      }
      
      public function get js_object() : String
      {
         return this.appConfig.js_object;
      }
      
      public function get api_host() : String
      {
         return this.appConfig.api_host;
      }
      
      public function get pre_cv() : String
      {
         return this.appConfig.pre_cv;
      }
      
      public function get cdn_host() : String
      {
         return this.appConfig.cdn_host;
      }
      
      public function get width() : int
      {
         return int(this.appConfig.width);
      }
      
      public function get height() : int
      {
         return int(this.appConfig.height);
      }
      
      public function get tutorial_task() : int
      {
         return this.appConfig.tutorial_task;
      }
      
      public function set tutorial_task(param1:int) : void
      {
         this.appConfig.tutorial_task = param1;
      }
      
      public function get tutorial_step() : int
      {
         return this.appConfig.tutorial_step;
      }
      
      public function set tutorial_step(param1:int) : void
      {
         this.appConfig.tutorial_step = param1;
      }
      
      public function get tutorial_active() : Boolean
      {
         return this.appConfig.tutorial_active;
      }
      
      public function set tutorial_active(param1:Boolean) : void
      {
         this.appConfig.tutorial_active = param1;
      }
      
      public function get register_status() : Boolean
      {
         return this.appConfig.register_status;
      }
      
      public function set register_status(param1:Boolean) : void
      {
         this.appConfig.register_status = param1;
      }
      
      public function set disable_all_keys(param1:Boolean) : void
      {
         this.appConfig.disable_all_keys = param1;
      }
      
      public function get disable_all_keys() : Boolean
      {
         return this.appConfig.disable_all_keys;
      }
      
      public function set disable_movement_keys(param1:Boolean) : void
      {
         this.appConfig.disable_movement_keys = param1;
      }
      
      public function get disable_movement_keys() : Boolean
      {
         return this.appConfig.disable_movement_keys;
      }
      
      public function set disable_shortcut_keys(param1:Boolean) : void
      {
         this.appConfig.disable_shortcut_keys = param1;
      }
      
      public function get disable_shortcut_keys() : Boolean
      {
         return this.appConfig.disable_shortcut_keys;
      }
      
      public function get single_sign_on_user() : Boolean
      {
         return this.appConfig.isSsoUser;
      }
      
      public function get disabled_tabs() : Array
      {
         return this.appConfig.disabled_tabs;
      }
      
      public function get isHTTPS() : Boolean
      {
         return this.appConfig.isHTTPS;
      }
   }
}

