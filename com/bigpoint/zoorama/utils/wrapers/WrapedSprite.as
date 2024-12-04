package com.bigpoint.zoorama.utils.wrapers
{
   import com.bigpoint.utils.DisplayObjectHelper;
   import com.bigpoint.zoomumba.constants.PreloaderTypes;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.greensock.TweenLite;
   import flash.display.Sprite;
   
   public class WrapedSprite extends Sprite
   {
      private var content:Sprite;
      
      private var preloader:Sprite;
      
      private var linkageId:String;
      
      private var assetId:String;
      
      private var fixedWidth:int;
      
      private var fixedHeight:int;
      
      private var scale:Number;
      
      private var debug:Boolean = false;
      
      private var callBack:Function = null;
      
      private var callBackParams:Array = [];
      
      public function WrapedSprite(param1:String, param2:String, param3:int = 0, param4:int = -1, param5:int = -1, param6:Number = 1, param7:Function = null, param8:Array = null, param9:Boolean = false)
      {
         super();
         this.linkageId = param2;
         this.assetId = param1;
         this.fixedWidth = param4;
         this.fixedHeight = param5;
         this.debug = param9;
         this.scale = param6;
         this.callBack = param7;
         this.callBackParams = param8;
         DisplayObjectHelper.removeChildren(this);
         if(this.assetId)
         {
            if(param3 != PreloaderTypes.NONE)
            {
               this.showPreloader(param3);
            }
            AssetLibrary.sendAssetToFunction(this.assetId,this.handleWrappedSprite);
         }
      }
      
      private function handleWrappedSprite(param1:SWFAsset) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         if(this.debug)
         {
            return;
         }
         this.content = param1.getEmbededSprite(this.linkageId);
         if(this.content == null)
         {
         }
         if(this.scale != 1)
         {
            this.content.scaleX = this.content.scaleY = this.scale;
         }
         else if(this.fixedWidth > 0 && this.fixedHeight > 0)
         {
            this.content.scaleX = 1;
            this.content.scaleY = 1;
            if(this.content.width > this.content.height)
            {
               _loc2_ = this.content.height / this.content.width;
               this.content.height = this.fixedWidth * _loc2_;
               this.content.width = this.fixedWidth;
            }
            else
            {
               _loc2_ = this.content.width / this.content.height;
               this.content.width = this.fixedHeight * _loc2_;
               this.content.height = this.fixedHeight;
            }
         }
         else
         {
            _loc3_ = this.content.width / this.content.height;
            if(this.fixedWidth != -1)
            {
               this.content.width = this.fixedWidth;
               this.content.height = this.fixedWidth / _loc3_;
            }
            else if(this.fixedHeight != -1)
            {
               this.content.height = this.fixedHeight;
               this.content.width = this.fixedHeight * _loc3_;
            }
         }
         if(this.preloader)
         {
            DisplayObjectHelper.removeChild(this,this.preloader);
         }
         DisplayObjectHelper.addChild(this,this.content);
         if(this.callBack != null)
         {
            TweenLite.delayedCall(0.001,this.sendCallBack);
         }
      }
      
      private function sendCallBack() : void
      {
         this.callBack.apply(null,this.callBackParams);
      }
      
      private function showPreloader(param1:int) : void
      {
         switch(param1)
         {
            case PreloaderTypes.NORMAL:
               this.preloader = AssetLibrary.getSprite(AssetConfig.ASSET_COMMONS_SYMBOLS,AssetConfig.COMMONS_PRELOAD_ANIM);
               break;
            case PreloaderTypes.MINI:
               this.preloader = AssetLibrary.getSprite(AssetConfig.ASSET_COMMONS_SYMBOLS,AssetConfig.COMMONS_PRELOAD_MINI_ANIM);
         }
         DisplayObjectHelper.addChild(this,this.preloader);
      }
   }
}

