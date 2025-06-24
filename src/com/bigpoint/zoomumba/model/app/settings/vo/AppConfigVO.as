package com.bigpoint.zoomumba.model.app.settings.vo
{
   public class AppConfigVO
   {
      public var cdn_host:String = "";
      
      public var width:String;
      
      public var height:String;
      
      public var pre_cv:String;
      
      public var api_host:String = "localhost";
      
      public var js_object:String;
      
      public var user_id:String;
      
      public var aid:String;
      
      public var aip:String;
      
      public var host:String = "";
      
      public var language:String = "de";
      
      public var token:String;
      
      public var second_token:String;
      
      public var reactivated:int;
      
      public var isFirstLogin:Boolean = false;
      
      public var isLocal:Boolean = false;
      
      public var space_trigger_enabled:Boolean = true;
      
      public var open_social:Boolean = true;
      
      public var dev_mode:Boolean = false;
      
      public var debug_mode:Boolean = false;
      
      public var debug_item_mode:Boolean = false;
      
      public var debug_mode_user_module:Boolean = false;
      
      public var debug_mode_configuration_module:Boolean = false;
      
      public var debug_mode_shop:Boolean = false;
      
      public var debug_mode_server_communication:Boolean = false;
      
      public var debug_asset_library:Boolean = false;
      
      public var enable_alcon:Boolean = false;
      
      public var enable_benchmark:Boolean = false;
      
      public var tutorial_task:int = -1;
      
      public var tutorial_step:int = -1;
      
      public var tutorial_active:Boolean = false;
      
      public var register_status:Boolean = false;
      
      public var preloaderTheme:String = "";
      
      public var playfieldTheme:String = "";
      
      public var roadTheme:String = "";
      
      public var musicTheme:String = "";
      
      public var isHTTPS:Boolean = false;
      
      public var disable_all_keys:Boolean = false;
      
      public var disable_movement_keys:Boolean = false;
      
      public var disable_shortcut_keys:Boolean = false;
      
      public var isSsoUser:Boolean = false;
      
      public var disabled_tabs:Array = [];
      
      public function AppConfigVO()
      {
         super();
      }
   }
}

