package com.bigpoint.zoomumba.view.windows.waterStoreHouse
{
   import com.bigpoint.utils.functions.AddAssetItem;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.MANAGMENTCENTER;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.PreloaderTypes;
   import com.bigpoint.zoomumba.constants.WATERSTOREHOUSE;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.managmentCenter.ManagmentCenterProxy;
   import com.bigpoint.zoomumba.model.managmentCenter.vo.ManagmentCenterLevelConfigVo;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.tempModel.TempGetterProxy;
   import com.bigpoint.zoomumba.view.managmentCenter.vo.ManagmenCenterCityViewVo;
   import com.bigpoint.zoomumba.view.managmentCenter.vo.ManagmentCenterBuildingViewVo;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.waterStoreHouse.WaterStoreHouseContent;
   import windows.custom.waterStoreHouse.WaterStoreHouseWindow;
   
   public class WaterStoreHouseWindowMediator extends WindowMediator
   {
      public static const NAME:String = "WaterStoreHouseWindowMediator";
      
      private var _viewMode:String;
      
      private var _buildingData:ManagmentCenterBuildingViewVo;
      
      private var _upgradeView:Sprite;
      
      private var _barView:Sprite;
      
      public function WaterStoreHouseWindowMediator(param1:WaterStoreHouseWindow)
      {
         super(NAME,param1);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Note.MANAGMENTCENTER_UPDATE];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         super.handleNotification(param1);
         switch(param1.getName())
         {
            case Note.MANAGMENTCENTER_UPDATE:
               this.upgradeView();
         }
      }
      
      override public function init(param1:Object) : void
      {
         this.window.preloaderVisibility = true;
         this._viewMode = param1.id;
         var _loc2_:Sprite = new Sprite();
         var _loc3_:Sprite = AddAssetItem.addSpriteToContainer(_loc2_,"InfoSPR",AssetConfig.WINDOW_HEADERS,60,-5);
         _loc3_["$right"].width = 450;
         this.content.infoImage.addChild(_loc3_);
         this.content.introtext.htmlText = TextResourceModule.getText("zoo.window.waterstorehouse.text." + this._viewMode);
         this.content.introtoptext.htmlText = TextResourceModule.getText("zoo.window.waterstorehouse.titel." + this._viewMode);
         this.content.bartitle.htmlText = TextResourceModule.getText("zoo.window.waterstorehouse.bartext." + this._viewMode);
         AssetLibrary.sendAssetToFunction("Waterstorehouse",this.handleAssetLoad);
      }
      
      private function handleAssetLoad(param1:SWFAsset) : void
      {
         this._barView = param1.getEmbededSprite("bar");
         this.content.bar.source = this._barView;
         if(this._viewMode == WATERSTOREHOUSE.STOREHOUSE)
         {
            this._barView["$type"].gotoAndStop(2);
         }
         else
         {
            this._barView["$type"].gotoAndStop(1);
         }
         this._upgradeView = param1.getEmbededSprite("upgradeView");
         this.content.imageBackground.addChild(this._upgradeView);
         this.upgradeView();
         this.window.preloaderVisibility = false;
      }
      
      private function upgradeView() : void
      {
         this.refreshBuldingData();
         var _loc1_:ManagmentCenterLevelConfigVo = this.managementProxy.getLevelConfigByLevelAndBuildingId(this.buildingId,this._buildingData.level + 1);
         var _loc2_:ManagmentCenterLevelConfigVo = this.managementProxy.getLevelConfigByLevelAndBuildingId(this.buildingId,this._buildingData.level);
         if(_loc1_)
         {
            this._upgradeView["levelToImage_mc"].addChild(new WrapedSprite(AssetIds.getPreviewAssetId(Categories.MANAGEMENT_CENTER,this.itemId,_loc1_.viewState),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI));
            this.content.capToGra.htmlText = String(_loc1_.maxCap);
            this.content.levelTo.value = _loc1_.level;
            this.content.buyButton.label = TextResourceModule.getText("zoo.window.upgrade.button");
            this.content.buyButton.addEventListener(MouseEvent.CLICK,this.handleUpgradeButtonClick);
         }
         this._upgradeView["levelFromImage_mc"].addChild(new WrapedSprite(AssetIds.getPreviewAssetId(Categories.MANAGEMENT_CENTER,this.itemId,this._buildingData.viewState),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI));
         this.content.capFromGra.htmlText = String(_loc2_.maxCap);
         this.content.levelFrom.value = _loc2_.level;
         var _loc3_:ManagmentCenterLevelConfigVo = this.managementProxy.getMaxLevelConfigByBuildingId(this.buildingId);
         var _loc4_:String = TextResourceModule.getText("zoo.window.waterstorehouse.leveltext");
         _loc4_ = _loc4_.replace("%have%",this._buildingData.level);
         _loc4_ = _loc4_.replace("%max%",_loc3_.level);
         this.content.levelText.htmlText = _loc4_;
         this.content.haveLimit.htmlText = TextResourceModule.getText("zoo.window.waterstorehouse.textmax." + this._viewMode);
         this.content.haveLimitBar.visible = false;
         if(this._viewMode == WATERSTOREHOUSE.WATERTOWER)
         {
            this.updateBarForId(1);
         }
         else
         {
            this.updateBarForId(2);
         }
         if(this._buildingData.level >= _loc3_.level)
         {
            this.content.updateInfoBar.visible = false;
            this.content.haveLimitBar.visible = true;
         }
         sendNotification(Note.HIDE_LOADER_LAYER);
      }
      
      private function handleUpgradeButtonClick(param1:MouseEvent) : void
      {
         var _loc2_:Object = new Object();
         var _loc3_:ManagmentCenterLevelConfigVo = this.managementProxy.getLevelConfigByLevelAndBuildingId(this.buildingId,this._buildingData.level + 1);
         _loc2_.id = this._viewMode;
         _loc2_.level = _loc3_;
         sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.WATERSTOREHOUSEUPDATE_WINDOW,"",_loc2_));
      }
      
      private function updateBarForId(param1:int) : void
      {
         var _loc2_:ManagmentCenterLevelConfigVo = this.managementProxy.getLevelConfigByLevelAndBuildingId(this.buildingId,this._buildingData.level);
         var _loc3_:Number = _loc2_.maxCap;
         var _loc4_:Number = Math.min(TempGetterProxy.getMaxResourceCount(param1),_loc3_);
         var _loc5_:int = int(_loc4_ / _loc3_ * 100);
         this._barView["$bar"].gotoAndStop(_loc5_ + 10);
         this._barView["$currentContainer"]["$text"]["$textField"]["text"] = _loc4_.toString();
      }
      
      private function get itemId() : int
      {
         if(this._viewMode == WATERSTOREHOUSE.WATERTOWER)
         {
            return 2;
         }
         return 1;
      }
      
      private function refreshBuldingData() : void
      {
         var _loc1_:ManagmentCenterBuildingViewVo = null;
         for each(_loc1_ in this.buildingViewData.buildingViewVo)
         {
            if(_loc1_.id == this.buildingId)
            {
               this._buildingData = _loc1_;
               return;
            }
         }
      }
      
      private function get buildingId() : String
      {
         if(this._viewMode == WATERSTOREHOUSE.WATERTOWER)
         {
            return MANAGMENTCENTER.MC_BUILDING_WATERTOWER;
         }
         return MANAGMENTCENTER.MC_BUILDING_STORAGE;
      }
      
      private function get buildingViewData() : ManagmenCenterCityViewVo
      {
         return this.managementProxy.managmentCenterViewVo;
      }
      
      private function get managementProxy() : ManagmentCenterProxy
      {
         return facade.retrieveProxy(ManagmentCenterProxy.NAME) as ManagmentCenterProxy;
      }
      
      private function get content() : WaterStoreHouseContent
      {
         return this.window.getContent(0) as WaterStoreHouseContent;
      }
      
      private function get window() : WaterStoreHouseWindow
      {
         return this.viewComponent as WaterStoreHouseWindow;
      }
   }
}

