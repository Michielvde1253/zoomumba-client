package com.bigpoint.zoorama.view.gui.win
{
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.ImageAsset;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.greensock.TweenLite;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   
   public class MiniTutorialPage extends Sprite
   {
      protected static const PAGE_FILENAME:String = "step_";
      
      protected static const PAGE_FILENAME_FILEXTENSION:String = "png";
      
      protected static const PAGE_WIDTH:int = 512;
      
      protected static const PAGE_HEIGHT:int = 238;
      
      protected static const LEFT_CIRCLE_X:int = 7;
      
      protected static const LEFT_CIRCLE_Y:int = 11;
      
      protected static const RIGHT_CIRCLE_X:int = 221;
      
      protected static const RIGHT_CIRCLE_Y:int = 11;
      
      protected static const GREEN_ARROW_Y:int = 0;
      
      public var pageID:String;
      
      protected var fullFilenameLeftCircle:String;
      
      protected var fullFilenameRightCircle:String;
      
      private var loadedAssets:int = 0;
      
      private var preloaderSymbol:Sprite;
      
      public var greenArrow:Bitmap;
      
      public function MiniTutorialPage(param1:String, param2:Boolean)
      {
         super();
         this.pageID = param1;
         this.fullFilenameLeftCircle = "kreis_li_" + param1;
         this.fullFilenameRightCircle = "kreis_re_" + param1;
         if(!param2)
         {
            this.initializeAssetLibrary();
         }
         this.initializePreloader();
      }
      
      private function initializeAssetLibrary() : void
      {
      }
      
      public function load() : void
      {
         this.loadedAssets = 0;
         this.showPreloader();
         AssetLibrary.sendAssetToFunction(this.fullFilenameLeftCircle,this.handleLoadedCircleLeft);
         AssetLibrary.sendAssetToFunction(this.fullFilenameRightCircle,this.handleLoadedCircleRight);
      }
      
      private function handleLoadedCircleLeft(param1:ImageAsset) : void
      {
         ++this.loadedAssets;
         var _loc2_:DisplayObject = param1.getAsDisplayObject();
         _loc2_.x = LEFT_CIRCLE_X;
         _loc2_.y = LEFT_CIRCLE_Y;
         this.addChild(_loc2_);
         this.checkPreloaderVisibility();
      }
      
      private function handleLoadedCircleRight(param1:ImageAsset) : void
      {
         ++this.loadedAssets;
         var _loc2_:DisplayObject = param1.getAsDisplayObject();
         _loc2_.x = RIGHT_CIRCLE_X;
         _loc2_.y = RIGHT_CIRCLE_Y;
         this.addChild(_loc2_);
         this.checkPreloaderVisibility();
      }
      
      protected function initializePreloader() : void
      {
         this.preloaderSymbol = AssetLibrary.getSprite(AssetConfig.ASSET_GAME_GUI,AssetConfig.GUI_PRELOADER);
         this.preloaderSymbol.cacheAsBitmap = true;
         if(this.preloaderSymbol)
         {
            this.preloaderSymbol.x = PAGE_WIDTH - this.preloaderSymbol.width >> 1;
            this.preloaderSymbol.y = PAGE_HEIGHT - this.preloaderSymbol.height >> 1;
            addChild(this.preloaderSymbol);
         }
      }
      
      protected function checkPreloaderVisibility() : void
      {
         if(this.loadedAssets >= 2)
         {
            this.hidePreloader();
            this.createGreenArrow();
         }
      }
      
      private function createGreenArrow() : void
      {
         this.greenArrow.x = -60 + (PAGE_WIDTH - this.greenArrow.width) >> 1;
         this.greenArrow.y = GREEN_ARROW_Y;
         this.addChild(this.greenArrow);
      }
      
      protected function showPreloader() : void
      {
         if(this.preloaderSymbol)
         {
            this.preloaderSymbol.visible = true;
         }
      }
      
      protected function hidePreloader() : void
      {
         if(this.preloaderSymbol)
         {
            TweenLite.to(this.preloaderSymbol,0.4,{
               "alpha":0,
               "onComplete":this.handlePreloaderFadeoutFinished
            });
         }
      }
      
      private function handlePreloaderFadeoutFinished() : void
      {
         if(this.preloaderSymbol)
         {
            this.removeChild(this.preloaderSymbol);
         }
      }
   }
}

