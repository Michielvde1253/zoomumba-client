package com.bigpoint.zoomumba.view.windows.cageUpgrade
{
   import buttons.simpleButton.BuyButtonGoldSkin;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.PlayFieldsTypes;
   import com.bigpoint.zoomumba.constants.PreloaderTypes;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.cageUpgrades.vo.GraphicVO;
   import com.bigpoint.zoomumba.model.app.items.ItemPackVO;
   import com.bigpoint.zoomumba.model.features.collectables.CollectablesProxy;
   import com.bigpoint.zoomumba.model.net.NetHelperProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayfieldSettingsProxy;
   import com.bigpoint.zoomumba.model.user.currency.CurrencyProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.cageUpgrade.CageUpgradeInitParams;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import com.bigpoint.zoorama.view.field.items.Cage;
   import components.textfield.labelDisplay.LabelDisplay;
   import flash.events.MouseEvent;
   import mx.events.FlexEvent;
   import org.puremvc.as3.interfaces.INotification;
   import spark.core.SpriteVisualElement;
   import windows.custom.cageUpgrade.CageUpgradeContent;
   import windows.custom.cageUpgrade.CageUpgradeWindow;
   
   public class CageUpgradeWindowMediator extends WindowMediator
   {
      public static const NAME:String = "CageUpgradeWindowMediator";
      
      private const WIN_HEADER:String = "header_upgrade_new";
      
      private var windowInitParams:CageUpgradeInitParams;
      
      public function CageUpgradeWindowMediator(param1:CageUpgradeWindow)
      {
         super(NAME,param1);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:* = param1.getName();
         switch(0)
         {
         }
      }
      
      override public function onRegister() : void
      {
         super.onRegister();
      }
      
      override public function init(param1:Object) : void
      {
         this.windowInitParams = param1 as CageUpgradeInitParams;
         var _loc2_:PlayfieldSettingsProxy = facade.getProxy(PlayfieldSettingsProxy);
         var _loc3_:int = _loc2_.activePlayfieldType;
         if(_loc3_ == PlayFieldsTypes.FIELD_TYPE_OCEANWORLD_ZOO)
         {
            this.cageUpgrade.imageContainer.addChild(new WrapedSprite(AssetConfig.CAGE_UPGRADE_WINDOW_ASSET_FILE,AssetConfig.CAGE_UPGRADE_OCEAN_WINDOW_BACKGROUND));
         }
         else
         {
            this.cageUpgrade.imageContainer.addChild(new WrapedSprite(AssetConfig.CAGE_UPGRADE_WINDOW_ASSET_FILE,AssetConfig.CAGE_UPGRADE_WINDOW_BACKGROUND));
         }
         this.cageUpgrade.arrowContainer.addChild(new WrapedSprite(AssetConfig.CAGE_UPGRADE_WINDOW_ASSET_FILE,AssetConfig.CAGE_UPGRADE_WINDOW_ARROW));
         this.cageUpgrade.buyButton.label = TextResourceModule.getText("zoo.window.upgrade.button");
         this.cageUpgrade.buyButton.addEventListener(MouseEvent.CLICK,this.handleUpgradeButtonClick);
         this.cageUpgrade.resourceNeeded.setDisplaySize(80,80);
         var _loc4_:String = AssetIds.getPreviewAssetId(this.windowInitParams.upgadeResource.category,this.windowInitParams.upgadeResource.itemId);
         var _loc5_:WrapedSprite = new WrapedSprite(_loc4_,AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI,-1,65);
         this.cageUpgrade.resourceNeeded.setDisplaySource(_loc5_);
         this.cageUpgrade.resourceNeeded.value = this.windowInitParams.upgadeResource.count;
         this.cageUpgrade.upgradeInfoText.text = TextResourceModule.getText(this.windowInitParams.upgradeInfo);
         if(this.windowInitParams.eventId > -1)
         {
            this.cageUpgrade.buyButton.enabled = this.cageUpgrade.resourceNeeded.value > 0;
            if(!this.windowInitParams.canBuy)
            {
               this.cageUpgrade.buyButton.setStyle("skinClass",BuyButtonGoldSkin);
            }
            this.drawEventCages(this.windowInitParams.cageItem);
         }
         else
         {
            this.cageUpgrade.buyButton.enabled = this.windowInitParams.canBuy;
            this.drawCages(this.windowInitParams.cageItem);
         }
         this.drawLevels(this.windowInitParams.cageItem);
         this.drawCosts(this.windowInitParams.priceResources,this.windowInitParams.upgadeResource.itemId);
         this.drawBonus(this.windowInitParams.bonusResource);
         this.drawExtraGraphics(this.windowInitParams.extraGraphics);
         var _loc6_:NetHelperProxy = facade.retrieveProxy(NetHelperProxy.NAME) as NetHelperProxy;
         this.window.header.filePath = _loc6_.getHeaderPath(this.WIN_HEADER);
         this.window.header.addEventListener(FlexEvent.PRELOADER_DONE,this.handleHeaderIcon);
      }
      
      private function drawExtraGraphics(param1:Vector.<GraphicVO>) : void
      {
         var _loc3_:WrapedSprite = null;
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = new WrapedSprite(param1[_loc2_].assetId,param1[_loc2_].linkageId,PreloaderTypes.MINI);
            this.cageUpgrade.extraGraphics.addChild(_loc3_);
            _loc3_.x = param1[_loc2_].posX;
            _loc3_.y = param1[_loc2_].posY;
            _loc3_.scaleX = param1[_loc2_].scaleX;
            _loc3_.scaleY = param1[_loc2_].scaleY;
            _loc2_++;
         }
      }
      
      private function handleHeaderIcon(param1:FlexEvent) : void
      {
         var _loc2_:SpriteVisualElement = null;
         if(this.windowInitParams.headerIcon.category > -1 && this.windowInitParams.headerIcon.itemId > -1)
         {
            _loc2_ = new SpriteVisualElement();
            _loc2_.x = 37;
            _loc2_.y = 60;
            this.window.header.addElement(_loc2_);
            _loc2_.addChild(new WrapedSprite(AssetIds.getPreviewAssetId(this.windowInitParams.headerIcon.category,this.windowInitParams.headerIcon.itemId),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI,-1,50));
         }
      }
      
      private function handleUpgradeButtonClick(param1:MouseEvent) : void
      {
         sendNotification(this.windowInitParams.buyNote,this.windowInitParams);
         sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(WindowTypes.CAGE_UPGRADE_WINDOW));
      }
      
      private function drawCages(param1:Cage) : void
      {
         this.cageUpgrade.cageLevelPicFrom.addChild(new WrapedSprite(AssetIds.getPreviewAssetId(Categories.CAGE,param1.itemId,param1.level),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI));
         this.cageUpgrade.cageLevelPicTo.addChild(new WrapedSprite(AssetIds.getPreviewAssetId(Categories.CAGE,param1.itemId,param1.level + 1),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI));
      }
      
      private function drawEventCages(param1:Cage) : void
      {
         this.cageUpgrade.cageLevelPicFrom.addChild(new WrapedSprite(AssetIds.getPreviewAssetId(Categories.CAGE,param1.itemId,param1.level),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI));
         this.cageUpgrade.cageLevelPicTo.addChild(new WrapedSprite(AssetIds.getPreviewAssetId(Categories.CAGE,param1.itemId,5,this.windowInitParams.eventId),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI));
      }
      
      private function drawCosts(param1:Vector.<ItemPackVO>, param2:int) : void
      {
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            LabelDisplay(this.cageUpgrade["upgradeCurrency" + (_loc3_ + 1)]).visible = true;
            LabelDisplay(this.cageUpgrade["upgradeCurrency" + (_loc3_ + 1)]).setDisplaySize(30,30);
            LabelDisplay(this.cageUpgrade["upgradeCurrency" + (_loc3_ + 1)]).setDisplaySource(new WrapedSprite(AssetIds.getPreviewAssetId(param1[_loc3_].category,param1[_loc3_].itemId),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI,-1,30));
            LabelDisplay(this.cageUpgrade["upgradeCurrency" + (_loc3_ + 1)]).value = param1[_loc3_].count;
            LabelDisplay(this.cageUpgrade["upgradeCurrency" + (_loc3_ + 1)]).canAfford = this.canAfford(param1[_loc3_].itemId,param1[_loc3_].count);
            _loc3_++;
         }
      }
      
      private function drawLevels(param1:Cage) : void
      {
         this.cageUpgrade.cageLevelFrom.value = param1.level;
         this.cageUpgrade.cageLevelTo.value = param1.level + 1;
         if(this.windowInitParams.eventId != -1)
         {
            this.cageUpgrade.cageLevelTo.visible = false;
         }
      }
      
      private function drawBonus(param1:ItemPackVO) : void
      {
         this.cageUpgrade.bonusPic.addChild(new WrapedSprite(AssetIds.getPreviewAssetId(param1.category,param1.itemId),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI));
         this.cageUpgrade.bonusFrom.text = this.windowInitParams.bonusFrom + "%";
         this.cageUpgrade.bonusTo.text = this.windowInitParams.bonusTo + "%";
      }
      
      override public function dispose() : void
      {
      }
      
      private function canAfford(param1:int, param2:int) : Boolean
      {
         var _loc4_:CurrencyProxy = null;
         var _loc5_:CollectablesProxy = null;
         var _loc3_:* = true;
         if(this.windowInitParams.eventId == -1)
         {
            _loc4_ = facade.retrieveProxy(CurrencyProxy.NAME) as CurrencyProxy;
            _loc3_ = _loc4_.getCurrency(param1) >= param2;
         }
         else
         {
            _loc5_ = facade.retrieveProxy(CollectablesProxy.NAME) as CollectablesProxy;
            _loc3_ = _loc5_.getCollectableAmmount(param1) >= param2;
         }
         return _loc3_;
      }
      
      private function get cageUpgrade() : CageUpgradeContent
      {
         return this.window.getContent(0) as CageUpgradeContent;
      }
      
      private function get window() : CageUpgradeWindow
      {
         return this.viewComponent as CageUpgradeWindow;
      }
   }
}

