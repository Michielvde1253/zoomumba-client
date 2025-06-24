package com.bigpoint.zoomumba.view.app
{
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.app.settings.AppConfigProxy;
   import com.bigpoint.zoorama.Settings;
   import com.greensock.TweenLite;
   import com.greensock.easing.Back;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLRequest;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.mediator.Mediator;
   
   public class PreloaderMediator extends Mediator
   {
      public static const NAME:String = "PreloaderMediator";
      
      private var preloaderBar:MovieClip;
      
      private var loaderScreen:Loader;
      
      private var isPreloaderVisible:Boolean = true;
      
      private var screenHeight:int;
      
      private var screenWith:int;
      
      private var background:Sprite = new Sprite();
      
      private var preloadLayer:Sprite = new Sprite();
      
      private var isDataLoaded:Boolean = false;
      
      private var isInit:Boolean = false;
      
      public function PreloaderMediator(param1:Sprite)
      {
         super(NAME,param1);
         var _loc2_:ApplicationMediator = facade.retrieveMediator(ApplicationMediator.NAME) as ApplicationMediator;
         _loc2_.application.stage.addChild(param1);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Note.INIT_PRELOADER,Note.UPDATE_PRELOADER_STATE,Note.REMOVE_PRELOADER];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case Note.INIT_PRELOADER:
               this.addPreloaderBar();
               break;
            case Note.UPDATE_PRELOADER_STATE:
               this.updatePreloaderValue(int(param1.getBody()));
               break;
            case Note.LAUNCH_GAME:
               break;
            case Note.REMOVE_PRELOADER:
               if(this.isPreloaderVisible)
               {
                  TweenLite.to(this.preloadLayer,1,{
                     "alpha":0.5,
                     "y":this.screenHeight,
                     "delay":5,
                     "ease":Back.easeIn,
                     "onComplete":this.removePreloader
                  });
                  TweenLite.to(this.background,1,{
                     "alpha":0,
                     "delay":3.5
                  });
               }
         }
      }
      
      private function removePreloader() : void
      {
         var _loc1_:ApplicationMediator = facade.retrieveMediator(ApplicationMediator.NAME) as ApplicationMediator;
         if(this.preloader)
         {
            if(_loc1_.application.stage.contains(this.preloader))
            {
               _loc1_.application.stage.removeChild(this.preloader);
            }
         }
         this.preloaderBar = null;
         this.loaderScreen = null;
         facade.removeMediator(PreloaderMediator.NAME);
         this.preloader.removeChild(this.background);
         this.isPreloaderVisible = false;
         sendNotification(Note.APP_RESIZED,_loc1_.application);
      }
      
      private function addPreloaderBar() : void
      {
         var _loc1_:ApplicationMediator = facade.retrieveMediator(ApplicationMediator.NAME) as ApplicationMediator;
         this.preloaderBar = new PreloaderBar();
         this.preloader.addChild(this.preloaderBar);
         this.preloaderBar.x = _loc1_.application.stage.stageWidth / 2;
         this.preloaderBar.y = _loc1_.application.stage.stageHeight / 2;
         this.addPreloaderAnimations();
         this.initScreen();
      }
      
      private function addPreloaderAnimations() : void
      {
         var _loc1_:AppConfigProxy = facade.retrieveProxy(AppConfigProxy.NAME) as AppConfigProxy;
         this.loaderScreen = new Loader();
         this.loaderScreen.contentLoaderInfo.addEventListener(Event.COMPLETE,this.handleLoaderLoadComplete);
         this.loaderScreen.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.handleLoaderLoadIOError);
         this.loaderScreen.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.handleLoaderLoadSecurityError);
         var _loc2_:* = "";
         if(Boolean(_loc1_.pre_cv) && _loc1_.cdn_host.length > 1)
         {
            _loc2_ = Settings.httpProtocolString + _loc1_.cdn_host + "/swf/assets/preloader/Preloader.swf";
            _loc2_ += "?__cv=" + _loc1_.pre_cv;
         }
         else
         {
            _loc2_ = "assets/preloader/Preloader.swf";
         }
         this.loaderScreen.load(new URLRequest(_loc2_));
      }
      
      private function handleLoaderLoadComplete(param1:Event) : void
      {
         this.isDataLoaded = true;
         this.initScreen();
      }
      
      private function initScreen() : void
      {
         var _loc1_:ApplicationMediator = null;
         var _loc2_:Class = null;
         var _loc3_:BitmapData = null;
         var _loc4_:Bitmap = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Boolean = false;
         var _loc8_:Sprite = null;
         if(this.preloaderBar && this.isDataLoaded && this.isInit == false)
         {
            _loc1_ = facade.retrieveMediator(ApplicationMediator.NAME) as ApplicationMediator;
            _loc2_ = this.loaderScreen.contentLoaderInfo.applicationDomain.getDefinition("wood") as Class;
            _loc3_ = new _loc2_() as BitmapData;
            _loc5_ = 0;
            _loc6_ = 0;
            _loc7_ = false;
            this.screenWith = _loc1_.application.stage.stageWidth;
            this.screenHeight = _loc1_.application.stage.stageHeight;
            this.preloader.addChild(this.background);
            this.preloader.addChild(this.preloadLayer);
            while(!_loc7_)
            {
               _loc4_ = new Bitmap(_loc3_);
               _loc4_.x = _loc5_;
               _loc4_.y = _loc6_;
               this.background.addChild(_loc4_);
               _loc5_ += _loc4_.width;
               if(_loc5_ >= this.screenWith)
               {
                  _loc6_ += _loc4_.height;
                  if(_loc6_ >= this.screenHeight)
                  {
                     _loc7_ = true;
                  }
                  _loc5_ = 0;
               }
            }
            _loc2_ = this.loaderScreen.contentLoaderInfo.applicationDomain.getDefinition("BackgroundRect") as Class;
            _loc8_ = new _loc2_() as Sprite;
            this.background.addChild(_loc8_);
            _loc8_.x = 0;
            _loc8_.y = 0;
            _loc8_.width = this.preloader.stage.stageWidth;
            _loc8_.height = this.preloader.stage.stageHeight;
            this.preloadLayer.addChild(this.loaderScreen);
            if(this.preloader.contains(this.preloaderBar))
            {
               this.preloader.removeChild(this.preloaderBar);
               this.preloadLayer.addChild(this.preloaderBar);
               this.preloaderBar.x = _loc1_.application.stage.stageWidth / 2;
               this.preloaderBar.y = _loc1_.application.stage.stageHeight / 2;
            }
            this.loaderScreen.x = this.screenWith / 2 - 986 / 2;
            this.loaderScreen.y = this.screenHeight / 2 - 565 / 2;
            this.isInit = true;
         }
      }
      
      private function handleLoaderLoadIOError(param1:IOErrorEvent) : void
      {
         sendNotification(Note.ERROR_REPORT,"PreloaderMediator : Preloader Animation canot be loaded");
      }
      
      private function handleLoaderLoadSecurityError(param1:IOErrorEvent) : void
      {
         sendNotification(Note.ERROR_REPORT,"PreloaderMediator : Preloader Animation canot be loaded, Security error");
      }
      
      private function updatePreloaderValue(param1:int) : void
      {
         if(this.preloaderBar)
         {
            this.preloaderBar.gotoAndStop(param1 * 2);
         }
      }
      
      protected function get preloader() : Sprite
      {
         return viewComponent as Sprite;
      }
   }
}

