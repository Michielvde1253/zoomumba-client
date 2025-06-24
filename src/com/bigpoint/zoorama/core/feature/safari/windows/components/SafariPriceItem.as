package com.bigpoint.zoorama.core.feature.safari.windows.components
{
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.data.settings.AnimalShopData;
   import com.bigpoint.zoorama.data.settings.ShopItemData;
   import com.bigpoint.zoorama.utils.configModules.ConfigurationModule;
   import com.bigpoint.zoorama.utils.configModules.TextIdHelper;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.view.gui.tooltip.TooltipNewManager;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   
   public class SafariPriceItem extends Sprite
   {
      private var rewardType:String;
      
      private var rewardId:int;
      
      public var rewardCount:int;
      
      public var localizedItemName:String = "";
      
      public var isCountable:Boolean = false;
      
      public function SafariPriceItem(param1:String, param2:int, param3:int)
      {
         super();
         this.rewardType = param1;
         this.rewardId = param2;
         this.rewardCount = param3;
         this.loadWinnableItem();
      }
      
      private function loadWinnableItem() : void
      {
         var _loc1_:ShopItemData = null;
         var _loc3_:Sprite = null;
         var _loc4_:AnimalShopData = null;
         this.isCountable = false;
         var _loc2_:int = 0;
         if(this.rewardType == "user")
         {
            if(this.rewardId == 0)
            {
               _loc3_ = AssetLibrary.getSprite(AssetConfig.ASSET_COMMONS_SYMBOLS,AssetConfig.COMMONS_VIRTUAL_MONEY_ICON);
               this.localizedItemName = "PP";
            }
            else if(this.rewardId == 1)
            {
               _loc3_ = AssetLibrary.getSprite(AssetConfig.ASSET_COMMONS_SYMBOLS,AssetConfig.COMMONS_REAL_MONEY_ICON);
               this.localizedItemName = "ZD";
            }
            else if(this.rewardId == 2)
            {
               _loc3_ = AssetLibrary.getSprite(AssetConfig.ASSET_COMMONS_SYMBOLS,AssetConfig.COMMONS_EXPERIERENCE_REWARD_ICON);
               this.localizedItemName = TextResourceModule.getText("zoo.window.general.xp_plural");
            }
            this.isCountable = true;
            this.itemAssetLoaded(_loc3_);
         }
         else if(this.rewardType == "collectionItems")
         {
            if(this.rewardId == 1)
            {
               _loc3_ = AssetLibrary.getSprite(AssetConfig.ASSET_COMMONS_SYMBOLS,AssetConfig.COMMONS_FZOO_COIN_ICON);
               this.localizedItemName = TextResourceModule.getText("zoo.collectableItems.forgottenZoo.title");
               this.itemAssetLoaded(_loc3_);
            }
         }
         else if(this.rewardType == "gas")
         {
            _loc3_ = AssetLibrary.getSprite(AssetConfig.ASSET_COMMONS_SYMBOLS,"GasSPR");
            this.localizedItemName = TextResourceModule.getText("zoo.safari.fuel_singular");
            this.isCountable = true;
            this.itemAssetLoaded(_loc3_);
         }
         else
         {
            switch(this.rewardType)
            {
               case "assist":
                  _loc1_ = ConfigurationModule.getInstance().getAssistanceData(this.rewardId);
                  break;
               case "cages":
               case "cage":
                  _loc1_ = ConfigurationModule.getInstance().getCageData(this.rewardId);
                  _loc2_ = ConfigurationModule.getInstance().getCageData(this.rewardId).baseLevel;
                  break;
               case "decos":
               case "deco":
                  _loc1_ = ConfigurationModule.getInstance().getDecorationData(this.rewardId);
                  break;
               case "road":
                  _loc1_ = ConfigurationModule.getInstance().getRoadData(this.rewardId);
                  break;
               case "stores":
               case "store":
               case "shops":
               case "shop":
                  _loc1_ = ConfigurationModule.getInstance().getStoreData(this.rewardId);
                  break;
               case "trashbins":
               case "trashbin":
                  _loc1_ = ConfigurationModule.getInstance().getTrashBinData(this.rewardId);
                  break;
               case "animals":
               case "animal":
                  _loc4_ = ConfigurationModule.getInstance().getAnimalData(this.rewardId);
                  this.localizedItemName = TextIdHelper.getCardName(_loc4_.categoryId,_loc4_.speciesId);
                  _loc1_ = ConfigurationModule.getInstance().getAnimalData(this.rewardId);
                  break;
               case "resources":
               case "resource":
               case "ressource":
                  _loc1_ = ConfigurationModule.getInstance().getResourseData(this.rewardId);
                  this.isCountable = true;
                  break;
               case "resources":
            }
            if(Boolean(_loc1_) && this.localizedItemName == "")
            {
               this.localizedItemName = TextIdHelper.getCardName(_loc1_.categoryId,this.rewardId);
            }
            if(_loc1_)
            {
               AssetLibrary.sendAssetToFunction(AssetIds.getPreviewAssetId(_loc1_.categoryId,this.rewardId,_loc2_),this.handleGeneralAsset);
            }
         }
         this.addEventListener(MouseEvent.MOUSE_OVER,this.handleItemRollOver);
         this.addEventListener(MouseEvent.MOUSE_OUT,this.handleItemRollOut);
      }
      
      private function handleGeneralAsset(param1:SWFAsset) : void
      {
         var _loc2_:Sprite = param1.getEmbededSprite(AssetConfig.DEFAULT_OBJECT_SPR);
         this.itemAssetLoaded(_loc2_);
      }
      
      private function itemAssetLoaded(param1:DisplayObject) : void
      {
         var _loc2_:Sprite = null;
         var _loc3_:Rectangle = null;
         if(param1)
         {
            _loc2_ = new Sprite();
            _loc2_.addChild(param1);
            _loc3_ = param1.getBounds(_loc2_);
            _loc2_.x = -_loc3_.x;
            _loc2_.y = -_loc3_.y;
            _loc2_.x -= _loc3_.width / 2;
            _loc2_.y -= _loc3_.height / 2;
            addChild(_loc2_);
         }
      }
      
      private function handleItemRollOver(param1:MouseEvent) : void
      {
         var _loc2_:* = null;
         if(!this.isCountable)
         {
            _loc2_ = this.localizedItemName;
         }
         else
         {
            _loc2_ = this.rewardCount + "x";
         }
         TooltipNewManager.setToolTip(param1.target as DisplayObject,_loc2_,true);
      }
      
      private function handleItemRollOut(param1:MouseEvent) : void
      {
         TooltipNewManager.removeToolTip();
      }
   }
}

