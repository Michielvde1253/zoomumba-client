package com.bigpoint.zoomumba.view.windows.waterStoreHouse
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.MANAGMENTCENTER;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.PreloaderTypes;
   import com.bigpoint.zoomumba.constants.UserResources;
   import com.bigpoint.zoomumba.constants.WATERSTOREHOUSE;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.managmentCenter.ManagmentCenterProxy;
   import com.bigpoint.zoomumba.model.managmentCenter.vo.ManagmentCenterLevelConfigVo;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import com.bigpoint.zoomumba.model.user.currency.CurrencyProxy;
   import com.bigpoint.zoomumba.view.managmentCenter.vo.ManagmenCenterCityViewVo;
   import com.bigpoint.zoomumba.view.managmentCenter.vo.ManagmentCenterBuildingViewVo;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import windows.custom.waterStoreHouse.WaterStoreHouseUpdateContent;
   import windows.custom.waterStoreHouse.WaterStoreHouseUpdateWindow;
   
   public class WaterStoreHouseUpdateWindowMediator extends WindowMediator
   {
      public static const NAME:String = "WaterStoreHouseUpdateWindowMediator";
      
      private var _viewMode:String;
      
      private var _levelVo:ManagmentCenterLevelConfigVo;
      
      private var _buildingData:ManagmentCenterBuildingViewVo;
      
      private var _networkProxy:NetProxy;
      
      private var _asset:Sprite;
      
      public function WaterStoreHouseUpdateWindowMediator(param1:WaterStoreHouseUpdateWindow)
      {
         super(NAME,param1);
      }
      
      override public function init(param1:Object) : void
      {
         this.window.preloaderVisibility = true;
         this._viewMode = param1.id;
         this._levelVo = param1.level;
         this._networkProxy = facade.retrieveProxy(NetProxy.NAME) as NetProxy;
         AssetLibrary.sendAssetToFunction("waterstorehouseupdate",this.handleAssetLoad);
      }
      
      private function update() : void
      {
      }
      
      private function handleAssetLoad(param1:SWFAsset) : void
      {
         var _loc2_:Sprite = param1.getEmbededSprite("MiddleLine");
         var _loc3_:Sprite = param1.getEmbededSprite("MiddleLine");
         var _loc4_:MovieClip = param1.getEmbededMovieClip("OuterCircleItem");
         _loc2_.width = 330;
         _loc2_.height = 12;
         _loc3_.width = 500;
         _loc3_.height = 12;
         this.content.titleLine.addChild(_loc2_);
         this.content.middleLine.addChild(_loc3_);
         switch(this._viewMode)
         {
            case WATERSTOREHOUSE.WATERTOWER:
               _loc4_.gotoAndStop(1);
               break;
            case WATERSTOREHOUSE.STOREHOUSE:
               _loc4_.gotoAndStop(2);
               break;
            case WATERSTOREHOUSE.TRASH:
               _loc4_.gotoAndStop(3);
         }
         this.content.infoImage.addChild(_loc4_ as Sprite);
         this.content.introtoptext.htmlText = TextResourceModule.getText("zoo.window.waterstorehouse.buy.titel");
         this.content.introtext.htmlText = TextResourceModule.getText("zoo.window.waterstorehouse.buy.text");
         if(this._levelVo.buyVirtual > 0)
         {
            this.content.petpennyUpdate.htmlText = TextResourceModule.getText("zoo.window.waterstorehouse.buy.upgradevc");
            this.content.newCapPetPennyPanel.htmlText = TextResourceModule.getText("zoo.window.waterstorehouse.buy.nextcap");
            this.content.capCountPetPennyPanel.htmlText = String(this._levelVo.maxCap);
            this.content.buyPetPenny.label.value = this._levelVo.buyVirtual;
            this.content.buyPetPenny.addEventListener(MouseEvent.CLICK,this.handleUpgradePetPennyButtonClick);
         }
         else
         {
            this.content.middleLine.visible = false;
            this.content.petpennypanel.visible = false;
            this.content.petPenny.visible = false;
            this.content.zooDollar.y = 260;
         }
         this.content.zooDollarUpdate.htmlText = TextResourceModule.getText("zoo.window.waterstorehouse.buy.upgraderc");
         this.content.newCapZooDollarPanel.htmlText = TextResourceModule.getText("zoo.window.waterstorehouse.buy.nextcap");
         this.content.capCountZooDollarPanel.htmlText = String(this._levelVo.maxCap);
         this.content.buyZooDollar.label.value = this._levelVo.buyReal;
         this.content.buyZooDollar.addEventListener(MouseEvent.CLICK,this.handleUpgradeZooDollarButtonClick);
         var _loc5_:CurrencyProxy = facade.getProxy(CurrencyProxy) as CurrencyProxy;
         if(_loc5_.getCurrency(UserResources.VIRTUAL_MONEY) < this._levelVo.buyVirtual)
         {
            this.content.buyPetPenny.enabled = false;
         }
         if(_loc5_.getCurrency(UserResources.REAL_MONEY) < this._levelVo.buyReal)
         {
            this.content.buyZooDollar.enabled = false;
         }
         this.content.buyZooDollar.label.setDisplaySource(new WrapedSprite(AssetIds.getPreviewAssetId(Categories.USER,UserResources.REAL_MONEY),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI,-1,20));
         this.content.buyPetPenny.label.setDisplaySource(new WrapedSprite(AssetIds.getPreviewAssetId(Categories.USER,UserResources.VIRTUAL_MONEY),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI,-1,20));
         this.window.preloaderVisibility = false;
      }
      
      private function handleUpgradeZooDollarButtonClick(param1:MouseEvent) : void
      {
         facade.sendNotification(Note.SHOW_LOADER_LAYER);
         this._networkProxy.callServer(NET.MANAGMENTCENTER_UPGRADE,[this.netCallId,true]).addCallbackIfTrue(Note.MANAGMENTCENTER_REFRESH).sendNow();
         handleWindowCloseClick();
      }
      
      private function handleUpgradePetPennyButtonClick(param1:MouseEvent) : void
      {
         facade.sendNotification(Note.SHOW_LOADER_LAYER);
         this._networkProxy.callServer(NET.MANAGMENTCENTER_UPGRADE,[this.netCallId,false]).addCallbackIfTrue(Note.MANAGMENTCENTER_REFRESH).sendNow();
         handleWindowCloseClick();
      }
      
      private function get netCallId() : String
      {
         switch(this._viewMode)
         {
            case WATERSTOREHOUSE.STOREHOUSE:
               return MANAGMENTCENTER.MC_BUILDING_STORAGE;
            case WATERSTOREHOUSE.WATERTOWER:
               return MANAGMENTCENTER.MC_BUILDING_WATERTOWER;
            case WATERSTOREHOUSE.TRASH:
               return MANAGMENTCENTER.MC_BUILDING_RECYCLING;
            default:
               return "";
         }
      }
      
      private function get buildingId() : String
      {
         switch(this._viewMode)
         {
            case WATERSTOREHOUSE.WATERTOWER:
               return MANAGMENTCENTER.MC_BUILDING_WATERTOWER;
            case WATERSTOREHOUSE.STOREHOUSE:
               return MANAGMENTCENTER.MC_BUILDING_STORAGE;
            case WATERSTOREHOUSE.TRASH:
               return MANAGMENTCENTER.MC_BUILDING_RECYCLING;
            default:
               return "";
         }
      }
      
      private function get buildingViewData() : ManagmenCenterCityViewVo
      {
         return this.managementProxy.managmentCenterViewVo;
      }
      
      private function get managementProxy() : ManagmentCenterProxy
      {
         return facade.retrieveProxy(ManagmentCenterProxy.NAME) as ManagmentCenterProxy;
      }
      
      private function get content() : WaterStoreHouseUpdateContent
      {
         return this.window.getContent(0) as WaterStoreHouseUpdateContent;
      }
      
      private function get window() : WaterStoreHouseUpdateWindow
      {
         return this.viewComponent as WaterStoreHouseUpdateWindow;
      }
   }
}

