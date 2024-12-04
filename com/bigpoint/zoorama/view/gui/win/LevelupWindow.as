package com.bigpoint.zoorama.view.gui.win
{
   import com.bigpoint.utils.StringHelper;
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.user.core.UserProxy;
   import com.bigpoint.zoorama.MainConfig;
   import com.bigpoint.zoorama.Settings;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.data.LocalizationPath;
   import com.bigpoint.zoorama.data.OldWindowTypes;
   import com.bigpoint.zoorama.data.SoundEffectNames;
   import com.bigpoint.zoorama.data.settings.CageShopData;
   import com.bigpoint.zoorama.data.settings.ShopItemData;
   import com.bigpoint.zoorama.sound.SoundManager;
   import com.bigpoint.zoorama.utils.configModules.ConfigurationModule;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.styleModule.StyleModule;
   import com.bigpoint.zoorama.view.gui.core.Coreponent;
   import com.bigpoint.zoorama.view.gui.tooltip.TooltipManager;
   import com.bigpoint.zoorama.view.gui.win.generals.SizedMediumWindow;
   import com.bigpoint.zoorama.view.gui.win.generals.WindowButtonParams;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   import org.puremvc.as3.patterns.facade.Facade;
   
   public class LevelupWindow extends SizedMediumWindow
   {
      private static const LEVEL_REAL_MONEY_TRESHHOLD:int = 10;
      
      private static const ITEM_WIDTH:int = 100;
      
      private static const WINDOW_WIDTH:int = 750;
      
      public var levelID:int = 9;
      
      public var nextLevelID:int = 10;
      
      public var items:Vector.<String>;
      
      private var currentLevelContentContainer:Sprite;
      
      private var tfCurrentLevelDonation:TextField;
      
      private var tfCurrentLevelInfo:TextField;
      
      private var tfNewQuestsInfo:TextField;
      
      private var currentLevelDonationVirtual:int = -1;
      
      private var currentLevelDonationReal:int = -1;
      
      private var mcCurrentLevelMoneyGold:MovieClip;
      
      private var mcCurrentLevelMoneySilver:MovieClip;
      
      private var currentLevelItemCount:int;
      
      private var nextLevelContainerContent:Sprite;
      
      private var tfNextLevelInfo:TextField;
      
      private var tfNextLevelDonation:TextField;
      
      private var nextLevelDonationVirtual:int = -1;
      
      private var nextLevelDonationReal:int = -1;
      
      private var mcNextLevelMoneyGold:MovieClip;
      
      private var mcNextLevelMoneySilver:MovieClip;
      
      private var nextLevelItemCount:int;
      
      private var shopDataTooltipCategRef:Dictionary;
      
      private var shopDataTooltipFileIdRef:Dictionary;
      
      private var loadedItem:int;
      
      private var loadedNextLevelItem:int;
      
      public function LevelupWindow(param1:Notifier, param2:WindowButtonParams = null)
      {
         var _loc3_:String = null;
         _loc3_ = "LevelupVersion2";
         name = OldWindowTypes.LEVELUP.toString();
         modal = true;
         super(param1,_loc3_,param2);
         this.initializeShopDataClazzNamesToFilenamePrefixMap();
      }
      
      private function initializeShopDataClazzNamesToFilenamePrefixMap() : void
      {
         this.shopDataTooltipCategRef = new Dictionary();
         this.shopDataTooltipCategRef["AnimalShopData"] = "animal";
         this.shopDataTooltipCategRef["CageShopData"] = "cage";
         this.shopDataTooltipCategRef["DecorShopData"] = "deco";
         this.shopDataTooltipCategRef["ResourceShopData"] = "resource";
         this.shopDataTooltipCategRef["RoadShopData"] = "road";
         this.shopDataTooltipCategRef["StoreShopData"] = "store";
         this.shopDataTooltipFileIdRef = new Dictionary();
      }
      
      override protected function assignLoadedContentGUI() : void
      {
         super.assignLoadedContentGUI();
         this.nextLevelID = this.levelID + 1;
         this.prepareCurrentLevelComponents();
         this.prepareNextLevelComponents();
         this.startLoadLevelItems();
         this.handleExpansionSymbol();
      }
      
      private function handleExpansionSymbol() : void
      {
         if(this.levelID % 10 == 0 && this.levelID > 0)
         {
         }
      }
      
      override public function draw() : void
      {
         if(Settings.SCALE_TEST)
         {
            halign = Coreponent.ALIGN_H_LEFT;
            valign = Coreponent.ALIGN_V_TOP;
            this.x = 190;
            this.y = 30;
         }
         super.draw();
      }
      
      private function startLoadLevelItems() : void
      {
         var _loc1_:Vector.<ShopItemData> = ConfigurationModule.getInstance().getAllItemsForLevel(this.levelID);
         if(_loc1_)
         {
            this.loadLevelupActivatedBonus(_loc1_);
         }
         var _loc2_:Vector.<ShopItemData> = ConfigurationModule.getInstance().getAllItemsForLevel(this.nextLevelID);
         if(_loc2_)
         {
            this.loadNextLevelupActivatedBonus(_loc2_);
         }
      }
      
      private function prepareCurrentLevelComponents() : void
      {
         this.currentLevelDonationVirtual = -1;
         this.currentLevelDonationReal = -1;
         if(this.levelID <= LEVEL_REAL_MONEY_TRESHHOLD)
         {
            this.currentLevelDonationVirtual = this.calculateVirtualDonation(this.levelID);
         }
         else
         {
            this.currentLevelDonationReal = this.calculateRealDonation(this.levelID);
         }
         this.tfCurrentLevelDonation = this.loadedContent.getChildByName("TF_DONATION") as TextField;
         StyleModule.setTextFieldStyle(this.tfCurrentLevelDonation,StyleModule.HEADER_BOLD_12_RIGHT);
         this.mcCurrentLevelMoneyGold = this.loadedContent.getChildByName("SYMBOL_GOLD") as MovieClip;
         this.mcCurrentLevelMoneySilver = this.loadedContent.getChildByName("SYMBOL_SILVER") as MovieClip;
         this.mcCurrentLevelMoneyGold.visible = false;
         this.mcCurrentLevelMoneySilver.visible = false;
         if(this.currentLevelDonationReal > 0)
         {
            this.tfCurrentLevelDonation.text = StringHelper.numberFormater(this.currentLevelDonationReal,TextResourceModule.getText(LocalizationPath.NUMBER_THOUSAND_SEPARATOR),int(TextResourceModule.getText(LocalizationPath.NUMBER_DIGITS_SEPARATOR)));
            this.mcCurrentLevelMoneyGold.visible = true;
         }
         else if(this.currentLevelDonationVirtual > 0)
         {
            this.tfCurrentLevelDonation.text = StringHelper.numberFormater(this.currentLevelDonationVirtual,TextResourceModule.getText(LocalizationPath.NUMBER_THOUSAND_SEPARATOR),int(TextResourceModule.getText(LocalizationPath.NUMBER_DIGITS_SEPARATOR)));
            this.mcCurrentLevelMoneySilver.visible = true;
         }
         this.currentLevelContentContainer = this.loadedContent.getChildByName("CURRENT_LEVEL_CONTAINER") as Sprite;
         this.currentLevelContentContainer.y += 60;
         this.tfCurrentLevelInfo = this.loadedContent.getChildByName("TF_INFO_CURRENT_LEVEL") as TextField;
         var _loc1_:String = this.tfCurrentLevelInfo.text;
         _loc1_ = _loc1_.split("%level%").join(this.levelID);
         StyleModule.setTextFieldStyle(this.tfCurrentLevelInfo,StyleModule.HEADER_12_CENTER);
         StyleModule.setTextFieldCSS(this.tfCurrentLevelInfo);
         if(this.tfCurrentLevelInfo)
         {
            this.tfCurrentLevelInfo.text = "<span class=\'size12\'>" + _loc1_ + "</span>";
         }
      }
      
      private function prepareNextLevelComponents() : void
      {
         this.nextLevelDonationVirtual = -1;
         this.nextLevelDonationReal = -1;
         if(this.nextLevelID <= LEVEL_REAL_MONEY_TRESHHOLD)
         {
            this.nextLevelDonationVirtual = this.calculateVirtualDonation(this.nextLevelID);
         }
         else
         {
            this.nextLevelDonationReal = this.calculateRealDonation(this.nextLevelID);
         }
         this.tfNextLevelDonation = this.loadedContent.getChildByName("TF_NEXTLEVEL_DONATION") as TextField;
         StyleModule.setTextFieldStyle(this.tfNextLevelDonation,StyleModule.HEADER_BOLD_12_RIGHT);
         this.mcNextLevelMoneyGold = this.loadedContent.getChildByName("SYMBOL_NEXTLEVEL_GOLD") as MovieClip;
         this.mcNextLevelMoneySilver = this.loadedContent.getChildByName("SYMBOL_NEXTLEVEL_SILVER") as MovieClip;
         this.mcNextLevelMoneyGold.visible = false;
         this.mcNextLevelMoneySilver.visible = false;
         if(this.nextLevelDonationReal > 0)
         {
            this.tfNextLevelDonation.text = StringHelper.numberFormater(this.nextLevelDonationReal,TextResourceModule.getText(LocalizationPath.NUMBER_THOUSAND_SEPARATOR),int(TextResourceModule.getText(LocalizationPath.NUMBER_DIGITS_SEPARATOR)));
            this.mcNextLevelMoneyGold.visible = true;
         }
         else if(this.currentLevelDonationVirtual > 0)
         {
            this.tfNextLevelDonation.text = StringHelper.numberFormater(this.nextLevelDonationVirtual,TextResourceModule.getText(LocalizationPath.NUMBER_THOUSAND_SEPARATOR),int(TextResourceModule.getText(LocalizationPath.NUMBER_DIGITS_SEPARATOR)));
            this.mcNextLevelMoneySilver.visible = true;
         }
         this.nextLevelContainerContent = this.loadedContent.getChildByName("NEXT_LEVEL_CONTAINER") as Sprite;
         this.nextLevelContainerContent.y += 80;
         this.tfNextLevelInfo = this.loadedContent.getChildByName("TF_INFO_NEXT_LEVEL") as TextField;
         var _loc1_:String = this.tfNextLevelInfo.text;
         _loc1_ = _loc1_.split("%level%").join(this.nextLevelID);
         StyleModule.setTextFieldStyle(this.tfNextLevelInfo,StyleModule.HEADER_12_CENTER);
         StyleModule.setTextFieldCSS(this.tfNextLevelInfo);
         this.tfNewQuestsInfo = this.loadedContent.getChildByName("TF_INFO_NEW_QUESTS") as TextField;
         StyleModule.setTextFieldStyle(this.tfNewQuestsInfo,StyleModule.HEADER_12_CENTER);
         this.tfNewQuestsInfo.text = TextResourceModule.getText("zoo.window.levelup.quests.renew");
         if(this.tfNextLevelInfo)
         {
            this.tfNextLevelInfo.text = "<span class=\'size12\'>" + _loc1_ + "</span>";
         }
      }
      
      private function calculateVirtualDonation(param1:int) : int
      {
         return 250 + param1 * 250;
      }
      
      private function calculateRealDonation(param1:int) : int
      {
         return 3;
      }
      
      private function checkLevelExpansionActivasion(param1:int) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:UserProxy = Facade.getInstance().getProxy(UserProxy);
         if(param1 % 10 == 0 && param1 > 0)
         {
            _loc3_ = param1 / 10;
            _loc4_ = _loc2_.fieldSize - 10;
            if(_loc3_ != _loc4_ && _loc4_ != MainConfig.MAX_FIELD_SIZE - 10)
            {
               return true;
            }
            return false;
         }
         return false;
      }
      
      private function getAssetNameFromClass(param1:String, param2:ShopItemData) : String
      {
         var _loc3_:String = null;
         switch(param1)
         {
            case "AnimalShopData":
               _loc3_ = AssetIds.getPreviewAssetId(Categories.ANIMAL,ConfigurationModule.getInstance().getMaleAnimalData(param2.itemId).itemId);
               break;
            case "CageShopData":
               _loc3_ = AssetIds.getPreviewAssetId(Categories.CAGE,param2.itemId,(param2 as CageShopData).baseLevel);
               break;
            case "DecorShopData":
               _loc3_ = AssetIds.getPreviewAssetId(Categories.DECOR,param2.itemId);
               break;
            case "ResourceShopData":
               _loc3_ = AssetIds.getPreviewAssetId(Categories.RESOURCES,param2.itemId);
               break;
            case "RoadShopData":
               _loc3_ = AssetIds.getPreviewAssetId(Categories.ROAD,param2.itemId);
               break;
            case "StoreShopData":
               _loc3_ = AssetIds.getPreviewAssetId(Categories.STORE,param2.itemId);
         }
         return _loc3_;
      }
      
      private function loadLevelupActivatedBonus(param1:Vector.<ShopItemData>) : void
      {
         var _loc3_:ShopItemData = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         this.loadedItem = 0;
         this.currentLevelItemCount = param1.length;
         var _loc2_:int = 0;
         while(_loc2_ < this.currentLevelItemCount)
         {
            _loc3_ = param1[_loc2_];
            if(_loc3_.getBuyable() != 0)
            {
               _loc4_ = getQualifiedClassName(_loc3_).split("::")[1];
               _loc5_ = this.getAssetNameFromClass(_loc4_,_loc3_);
               _loc6_ = "zoo.shop." + this.shopDataTooltipCategRef[_loc4_] + "." + _loc3_.itemId;
               this.shopDataTooltipFileIdRef[_loc5_] = _loc6_;
               AssetLibrary.sendAssetToFunction(_loc5_,this.handleCurrentLevelLoadedAsset);
            }
            _loc2_++;
         }
         if(this.checkLevelExpansionActivasion(this.levelID))
         {
            this.shopDataTooltipFileIdRef[AssetConfig.LEVELUP_WINDOW_EXPANSION_ICON] = "zoo.premium.title.11";
            AssetLibrary.sendAssetToFunction(AssetIds.getPreviewAssetId(Categories.PREMIUM,11),this.handleCurrentLevelLoadedAsset);
            ++this.currentLevelItemCount;
         }
      }
      
      private function handleCurrentLevelLoadedAsset(param1:SWFAsset) : void
      {
         var _loc2_:Sprite = param1.getEmbededSprite(AssetConfig.DEFAULT_OBJECT_SPR);
         if(_loc2_)
         {
            _loc2_.x = this.loadedItem * ITEM_WIDTH;
            this.currentLevelContentContainer.addChild(_loc2_);
            this.currentLevelContentContainer.x = WINDOW_WIDTH - this.currentLevelContentContainer.width >> 1;
         }
         ++this.loadedItem;
         if(this.loadedItem == this.currentLevelItemCount)
         {
            SoundManager.getInstance().playSoundEffect(SoundEffectNames.SND_SHOW_LEVEL_UP);
         }
      }
      
      private function hideTooltip(param1:MouseEvent) : void
      {
         TooltipManager.getInstance().removeTooltip();
      }
      
      private function loadNextLevelupActivatedBonus(param1:Vector.<ShopItemData>) : void
      {
         var _loc3_:ShopItemData = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         this.loadedNextLevelItem = 0;
         this.nextLevelItemCount = param1.length;
         var _loc2_:int = 0;
         while(_loc2_ < this.nextLevelItemCount)
         {
            _loc3_ = param1[_loc2_];
            if(_loc3_.getBuyable() != 0)
            {
               _loc4_ = getQualifiedClassName(_loc3_).split("::")[1];
               _loc5_ = this.getAssetNameFromClass(_loc4_,_loc3_);
               _loc6_ = "zoo.shop." + this.shopDataTooltipCategRef[_loc4_] + "." + _loc3_.itemId;
               this.shopDataTooltipFileIdRef[_loc5_] = _loc6_;
               AssetLibrary.sendAssetToFunction(_loc5_,this.handleNextLevelLoadedAsset);
            }
            _loc2_++;
         }
         if(this.checkLevelExpansionActivasion(this.nextLevelID))
         {
            this.shopDataTooltipFileIdRef[AssetConfig.LEVELUP_WINDOW_EXPANSION_ICON] = "zoo.premium.title.11";
            AssetLibrary.sendAssetToFunction(AssetIds.getPreviewAssetId(Categories.PREMIUM,11),this.handleNextLevelLoadedAsset);
            ++this.nextLevelItemCount;
         }
      }
      
      private function handleNextLevelLoadedAsset(param1:SWFAsset) : void
      {
         var _loc2_:Sprite = param1.getEmbededSprite(AssetConfig.DEFAULT_OBJECT_SPR);
         if(_loc2_)
         {
            _loc2_.x = this.loadedNextLevelItem * ITEM_WIDTH;
            this.nextLevelContainerContent.addChild(_loc2_);
            this.nextLevelContainerContent.x = WINDOW_WIDTH - this.nextLevelContainerContent.width >> 1;
         }
         ++this.loadedNextLevelItem;
      }
   }
}

