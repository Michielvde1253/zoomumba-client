package com.bigpoint.zoorama.view.fortuneWheel
{
   import com.bigpoint.utils.StringHelper;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fortuneWheel.RewardData;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.data.LocalizationPath;
   import com.bigpoint.zoorama.data.settings.AnimalShopData;
   import com.bigpoint.zoorama.data.settings.ShopItemData;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.view.gui.tooltip.TooltipNewManager;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   
   public class FortuneWheelRewardItem extends Sprite
   {
      public var rewardData:RewardData;
      
      public var localizedItemName:String = "";
      
      private var _specialInfo:String;
      
      private var shopItemData:ShopItemData;
      
      private var sexSPR:Sprite;
      
      public function FortuneWheelRewardItem(param1:RewardData)
      {
         super();
         this.rewardData = param1;
         this.loadWinnableItem();
      }
      
      public function set showSex(param1:Boolean) : void
      {
         if(this.sexSPR)
         {
            this.sexSPR.visible = param1;
         }
      }
      
      private function loadWinnableItem() : void
      {
         this.shopItemData = AssetIds.getShopItemData(this.rewardData.type,this.rewardData.itemId,this.rewardData.count);
         this._specialInfo = this.shopItemData.countType;
         this.localizedItemName = this.shopItemData.localizedName;
         if(this.shopItemData.categoryId == Categories.CATEGORY_UNDEFINED)
         {
            this.itemAssetLoaded(AssetLibrary.getSprite(AssetConfig.ASSET_COMMONS_SYMBOLS,this.shopItemData.linkageId));
         }
         else if(this.shopItemData.categoryId == Categories.POWERUP)
         {
            this.itemAssetLoaded(AssetLibrary.getSprite(AssetConfig.ASSET_FILE_POWERUP_ICONS,this.shopItemData.linkageId));
         }
         else
         {
            AssetLibrary.sendAssetToFunction(AssetIds.getPreviewAssetId(this.shopItemData.categoryId,this.shopItemData.itemId,this.shopItemData.level),this.handleGeneralAsset);
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
         var _loc4_:Boolean = false;
         var _loc2_:Sprite = new Sprite();
         _loc2_.addChild(param1);
         var _loc3_:Rectangle = param1.getBounds(_loc2_);
         _loc2_.x = -_loc3_.x;
         _loc2_.y = -_loc3_.y;
         _loc2_.x -= _loc3_.width / 2;
         _loc2_.y -= _loc3_.height / 2;
         if(this.shopItemData.categoryId == Categories.ANIMAL)
         {
            _loc4_ = Boolean((this.shopItemData as AnimalShopData).male);
            this.sexSPR = AssetLibrary.getSprite(AssetConfig.ASSET_COMMONS_SYMBOLS,_loc4_ ? "MaleIconSPR" : "FemaleIconSPR");
            this.sexSPR.visible = false;
            this.sexSPR.x = _loc3_.width / 2;
            this.sexSPR.y = _loc3_.height / 2;
            _loc2_.addChild(this.sexSPR);
         }
         addChild(_loc2_);
      }
      
      private function handleItemRollOver(param1:MouseEvent) : void
      {
         TooltipNewManager.setToolTip(param1.target as DisplayObject,this.tooltipText,true);
      }
      
      public function get tooltipText() : String
      {
         var _loc1_:String = null;
         if(this._specialInfo == null)
         {
            _loc1_ = this.localizedItemName;
         }
         else if(this.shopItemData.categoryId == Categories.ASSISTANCE)
         {
            _loc1_ = TextResourceModule.getText("zoo.wheel.assistant." + this.shopItemData.itemId + ".hour." + this.shopItemData.count);
         }
         else
         {
            _loc1_ = StringHelper.numberFormater(this.rewardData.count,TextResourceModule.getText(LocalizationPath.NUMBER_THOUSAND_SEPARATOR),int(TextResourceModule.getText(LocalizationPath.NUMBER_DIGITS_SEPARATOR)));
            _loc1_ += this._specialInfo + (this.localizedItemName != "" ? " " + this.localizedItemName : "");
         }
         return _loc1_;
      }
      
      private function handleItemRollOut(param1:MouseEvent) : void
      {
         TooltipNewManager.removeToolTip();
      }
      
      public function get specialInfo() : String
      {
         return this._specialInfo;
      }
   }
}

