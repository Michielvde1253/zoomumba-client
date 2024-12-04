package com.bigpoint.zoomumba.view.windows.ocean.helpComic
{
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.net.NetHelperProxy;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import general.paginator.PaginatorEvent;
   import windows.custom.generic.comic.GenericComicContent;
   import windows.custom.generic.comic.GenericComicWindow;
   
   public class OceanWorldComicWindowMediator extends WindowMediator
   {
      public static const NAME:String = "OceanWorldComicWindowMediator";
      
      private var _netHelperProxy:NetHelperProxy;
      
      private var _comicName:String = "";
      
      private var _maxPages:int = 1;
      
      private var _asset:Sprite;
      
      private var _currentStep:int = 1;
      
      private var _isInit:Boolean = false;
      
      public function OceanWorldComicWindowMediator(param1:GenericComicWindow)
      {
         super(NAME,param1);
      }
      
      override public function onRegister() : void
      {
         this._netHelperProxy = facade.retrieveProxy(NetHelperProxy.NAME) as NetHelperProxy;
      }
      
      override public function init(param1:Object) : void
      {
         this._isInit = false;
         this._comicName = "ocean";
         this._maxPages = 5;
         this.loadAsset();
      }
      
      private function loadAsset() : void
      {
         this.window.preloaderVisibility = true;
         AssetLibrary.sendAssetToFunction(this._comicName + "ComicStep" + String(this._currentStep),this.assetsLoaded);
      }
      
      private function assetsLoaded(param1:SWFAsset) : void
      {
         var _loc2_:BitmapData = null;
         this._asset = param1.getEmbededSprite("asset");
         this.content.textGradient.htmlText = "";
         this.content.textNormal.htmlText = "";
         this.content.imageBack.visible = false;
         this.content.imageFront.visible = false;
         this.content.imageFront2.visible = false;
         this.content.textGradient.visible = false;
         this.content.textNormal.visible = false;
         this.content.textNormal.width = 340;
         this.content.textNormal.height = 200;
         this.content.textNormal.top = 65;
         this.content.textNormal.left = 260;
         this.content.textGradient.dispose();
         this.content.textGradient.width = 400;
         this.content.textGradient.height = 100;
         this.content.textGradient.horizontalCenter = 0;
         this.content.textGradient.verticalCenter = 145;
         this.content.backgroundImage.visible = false;
         this.content.imageBack.horizontalCenter = 0;
         _loc2_ = this.getAssetObjectAsBitmapData("background_mc");
         if(_loc2_)
         {
            this.content.imageBack.source = _loc2_;
            this.content.imageBack.x = this._asset.getChildByName("background_mc").x;
            this.content.imageBack.y = this._asset.getChildByName("background_mc").y;
            this.content.imageBack.visible = true;
         }
         _loc2_ = this.getAssetObjectAsBitmapData("foreground1_mc");
         if(_loc2_)
         {
            this.content.imageFront.source = _loc2_;
            this.content.imageFront.x = this._asset.getChildByName("foreground1_mc").x;
            this.content.imageFront.y = this._asset.getChildByName("foreground1_mc").y;
            this.content.imageFront.visible = true;
         }
         _loc2_ = this.getAssetObjectAsBitmapData("foreground2_mc");
         if(_loc2_)
         {
            this.content.imageFront2.source = _loc2_;
            this.content.imageFront2.x = this._asset.getChildByName("foreground2_mc").x;
            this.content.imageFront2.y = this._asset.getChildByName("foreground2_mc").y;
            this.content.imageFront2.visible = true;
         }
         _loc2_ = this.getAssetObjectAsBitmapData("foreground3_mc");
         if(_loc2_)
         {
            this.content.imageFront3.source = _loc2_;
            this.content.imageFront3.x = this._asset.getChildByName("foreground3_mc").x;
            this.content.imageFront3.y = this._asset.getChildByName("foreground3_mc").y;
            this.content.imageFront3.visible = true;
         }
         var _loc3_:String = "";
         if(this._asset.getChildByName("textGradientLayer"))
         {
            this.content.textGradient.visible = true;
            this.content.textGradient.htmlText = TextResourceModule.getText("zoo.window.infoLayers." + this._comicName + "Comic.layer" + String(this._currentStep) + ".content");
            if(this.content.textGradient.htmlText == "zoo.window.infoLayers." + this._comicName + "Comic.layer" + String(this._currentStep) + ".content")
            {
               _loc3_ = this._comicName.charAt(0).toUpperCase() + this._comicName.slice(1,this._comicName.length);
               this.content.textGradient.htmlText = TextResourceModule.getText("zoo.window.infoLayers." + _loc3_ + "Comic.layer" + String(this._currentStep) + ".content");
            }
         }
         if(this._asset.getChildByName("textNormalLayer"))
         {
            this.content.textNormal.visible = true;
            this.content.textNormal.htmlText = TextResourceModule.getText("zoo.window.infoLayers." + this._comicName + "Comic.layer" + String(this._currentStep) + ".bubble");
            if(this.content.textNormal.htmlText == "zoo.window.infoLayers." + this._comicName + "Comic.layer" + String(this._currentStep) + ".bubble")
            {
               _loc3_ = this._comicName.charAt(0).toUpperCase() + this._comicName.slice(1,this._comicName.length);
               this.content.textNormal.htmlText = TextResourceModule.getText("zoo.window.infoLayers." + _loc3_ + "Comic.layer" + String(this._currentStep) + ".bubble");
            }
         }
         if(this._isInit == false)
         {
            this.initPaginator();
         }
         this.window.preloaderVisibility = false;
         this.content.preloader.visible = false;
      }
      
      private function getAssetObjectAsBitmapData(param1:String) : BitmapData
      {
         var _loc2_:Sprite = this._asset.getChildByName(param1) as Sprite;
         var _loc3_:BitmapData = null;
         if(_loc2_)
         {
            _loc2_.mouseChildren = false;
            _loc2_.mouseEnabled = false;
            _loc3_ = new BitmapData(_loc2_.width,_loc2_.height,true,0);
            _loc3_.draw(_loc2_);
         }
         return _loc3_;
      }
      
      private function initPaginator() : void
      {
         this.content.paginator.currentPage = 0;
         this.content.paginator.maxEntries = this._maxPages;
         this.content.paginator.addEventListener(PaginatorEvent.CHANGE_PAGE,this.changePage);
         this._isInit = true;
      }
      
      private function changePage(param1:PaginatorEvent) : void
      {
         this.content.imageLoader.clean();
         this._currentStep = int(param1.page + 1);
         this.loadAsset();
      }
      
      override public function dispose() : void
      {
         this.content.paginator.removeEventListener(PaginatorEvent.CHANGE_PAGE,this.changePage);
      }
      
      private function get content() : GenericComicContent
      {
         return this.window.getContent(0) as GenericComicContent;
      }
      
      private function get window() : GenericComicWindow
      {
         return this.viewComponent as GenericComicWindow;
      }
   }
}

