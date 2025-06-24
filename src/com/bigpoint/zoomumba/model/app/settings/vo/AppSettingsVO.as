package com.bigpoint.zoomumba.model.app.settings.vo
{
   public class AppSettingsVO
   {
      public var quality:String = "h";
      
      public var hasTooltips:int = 1;
      
      public var hasBackgoundSound:int = 1;
      
      public var hasSoundEffects:int = 1;
      
      public var hasVisitors:int = 1;
      
      public var hasWishes:int = 1;
      
      public var animationLevel:int = 20;
      
      public function AppSettingsVO()
      {
         super();
      }
      
      public function set q(param1:String) : void
      {
         this.quality = param1;
      }
      
      public function set se(param1:int) : void
      {
         this.hasSoundEffects = param1;
      }
      
      public function set a(param1:int) : void
      {
         this.animationLevel = param1;
      }
      
      public function set sb(param1:int) : void
      {
         this.hasBackgoundSound = param1;
      }
      
      public function set t(param1:int) : void
      {
         this.hasTooltips = param1;
      }
      
      public function set v(param1:int) : void
      {
         this.hasVisitors = param1;
      }
      
      public function set w(param1:int) : void
      {
         this.hasWishes = param1;
      }
   }
}

