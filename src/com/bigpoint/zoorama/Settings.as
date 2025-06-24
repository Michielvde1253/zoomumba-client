package com.bigpoint.zoorama
{
   import com.bigpoint.zoomumba.model.app.settings.AppConfigProxy;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class Settings extends Proxy
   {
      private static var appConfig:AppConfigProxy;
      
      public static const NAME:String = "Settings";
      
      public function Settings()
      {
         super(NAME);
      }
      
      public static function get ENABLE_BENCHMARK() : Boolean
      {
         return appConfig.enable_benchmark;
      }
      
      public static function get ENABLE_ALCON() : Boolean
      {
         return appConfig.enable_alcon;
      }
      
      public static function get DEBUG_ASSET_LIBRARY() : Boolean
      {
         return appConfig.debug_asset_library;
      }
      
      public static function get DEBUG_MODE_SERVER_COMMUNICATION() : Boolean
      {
         return appConfig.debug_mode_server_communication;
      }
      
      public static function get DEBUG_MODE_SHOP() : Boolean
      {
         return appConfig.debug_mode_shop;
      }
      
      public static function get DEBUG_MODE_CONFIGURATION_MODULE() : Boolean
      {
         return appConfig.debug_mode_configuration_module;
      }
      
      public static function get DEBUG_MODE_USER_MODULE() : Boolean
      {
         return appConfig.debug_mode_user_module;
      }
      
      public static function get DEBUG_ITEM_MODE() : Boolean
      {
         return appConfig.debug_item_mode;
      }
      
      public static function get DEBUG_MODE() : Boolean
      {
         return appConfig.debug_mode;
      }
      
      public static function get DEV_MODE() : Boolean
      {
         return appConfig.dev_mode;
      }
      
      public static function get SCALE_TEST() : Boolean
      {
         return appConfig.open_social;
      }
      
      public static function get SPACE_TRIGGER_ENABLED() : Boolean
      {
         return appConfig.space_trigger_enabled;
      }
      
      public static function get isLocal() : Boolean
      {
         return appConfig.isLocal;
      }
      
      public static function get isFirstLogin() : Boolean
      {
         return appConfig.isFirstLogin;
      }
      
      public static function get REACTIVATED() : int
      {
         return appConfig.reactivated;
      }
      
      public static function get SECOND_TOKEN() : String
      {
         return appConfig.second_token;
      }
      
      public static function get TOKEN() : String
      {
         return appConfig.token;
      }
      
      public static function get LANGUAGE() : String
      {
         return appConfig.language;
      }
      
      public static function get HOST() : String
      {
         return appConfig.host;
      }
      
      public static function get AIP() : String
      {
         return appConfig.aip;
      }
      
      public static function get AID() : String
      {
         return appConfig.aid;
      }
      
      public static function get USER_ID() : String
      {
         return appConfig.user_id;
      }
      
      public static function get JS_OBJECT() : String
      {
         return appConfig.js_object;
      }
      
      public static function get API_HOST() : String
      {
         return appConfig.api_host;
      }
      
      public static function get PRE_CV() : String
      {
         return appConfig.pre_cv;
      }
      
      public static function get CDN_HOST() : String
      {
         return appConfig.cdn_host;
      }
      
      public static function get TUTORIAL_TASK() : int
      {
         return appConfig.tutorial_task;
      }
      
      public static function set TUTORIAL_TASK(param1:int) : void
      {
         appConfig.tutorial_task = param1;
      }
      
      public static function get TUTORIAL_STEP() : int
      {
         return appConfig.tutorial_step;
      }
      
      public static function set TUTORIAL_STEP(param1:int) : void
      {
         appConfig.tutorial_step = param1;
      }
      
      public static function get TUTORIAL_ACTIVE() : Boolean
      {
         return appConfig.tutorial_active;
      }
      
      public static function set TUTORIAL_ACTIVE(param1:Boolean) : void
      {
         appConfig.tutorial_active = param1;
      }
      
      public static function get REGISTER_STATUS() : Boolean
      {
         return appConfig.register_status;
      }
      
      public static function set REGISTER_STATUS(param1:Boolean) : void
      {
         appConfig.register_status = param1;
      }
      
      public static function get DISABLE_ALL_KEYS() : Boolean
      {
         return appConfig.disable_all_keys;
      }
      
      public static function set DISABLE_ALL_KEYS(param1:Boolean) : void
      {
         appConfig.disable_all_keys = param1;
      }
      
      public static function get DISABLE_MOVEMENT_KEYS() : Boolean
      {
         return appConfig.disable_movement_keys;
      }
      
      public static function set DISABLE_MOVEMENT_KEYS(param1:Boolean) : void
      {
         appConfig.disable_movement_keys = param1;
      }
      
      public static function get DISABLE_SHORTCUT_KEYS() : Boolean
      {
         return appConfig.disable_shortcut_keys;
      }
      
      public static function set DISABLE_SHORTCUT_KEYS(param1:Boolean) : void
      {
         appConfig.disable_shortcut_keys = param1;
      }
      
      public static function get isHTTPS() : Boolean
      {
         return appConfig.isHTTPS;
      }
      
      public static function get httpProtocolString() : String
      {
         if(appConfig.isHTTPS && !isLocal)
         {
            return "https://";
         }
         return "http://";
      }
      
      override public function onRegister() : void
      {
         appConfig = facade.retrieveProxy(AppConfigProxy.NAME) as AppConfigProxy;
      }
   }
}

