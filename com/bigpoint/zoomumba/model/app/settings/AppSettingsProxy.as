package com.bigpoint.zoomumba.model.app.settings
{
   import com.bigpoint.zoomumba.model.app.settings.vo.AppSettingsVO;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class AppSettingsProxy extends Proxy
   {
      public static const NAME:String = "AppSettingsProxy";
      
      private var _appSettings:AppSettingsVO = new AppSettingsVO();
      
      public function AppSettingsProxy()
      {
         super(NAME);
      }
      
      public function get appSettings() : AppSettingsVO
      {
         return this._appSettings;
      }
      
      public function storeData(param1:AppSettingsVO) : void
      {
         this._appSettings = param1;
         this.data = param1;
      }
      
      public function updateAppSettingsData(param1:AppSettingsVO) : void
      {
         this._appSettings = param1;
      }
      
      public function get quality() : String
      {
         return this._appSettings.quality;
      }
      
      public function get hasTooltips() : int
      {
         return this._appSettings.hasTooltips;
      }
      
      public function get hasBackgroundSounds() : int
      {
         return this._appSettings.hasBackgoundSound;
      }
      
      public function get hasSoundEffects() : int
      {
         return this._appSettings.hasSoundEffects;
      }
      
      public function get hasVisitors() : int
      {
         return this._appSettings.hasVisitors;
      }
      
      public function get hasVisitorWishes() : int
      {
         return this._appSettings.hasWishes;
      }
      
      public function get animationLevel() : int
      {
         return this._appSettings.animationLevel;
      }
   }
}

