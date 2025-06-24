package com.bigpoint.zoomumba.view.windows.gameItem.info
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.PlayFieldsTypes;
   import com.bigpoint.zoomumba.constants.PreloaderTypes;
   import com.bigpoint.zoomumba.constants.Resources;
   import com.bigpoint.zoomumba.constants.items.ItemInternalTypes;
   import com.bigpoint.zoomumba.model.app.cageUpgrades.CageUpgradeProxy;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayfieldSettingsProxy;
   import com.bigpoint.zoomumba.model.user.core.UserProxy;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.data.settings.AssistanceShopData;
   import com.bigpoint.zoorama.data.settings.ShopItemData;
   import com.bigpoint.zoorama.utils.configModules.TextReplace;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import custom.info.extensions.InfoContentBase;
   import general.paginator.PaginatorEvent;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.gameItems.info.infoBase.ItemInfoBaseWindow;
   
   public class ItemInfoBaseWindowMediator extends WindowMediator
   {
      public static const NAME:String = "ItemInfoBaseWindowMediator";
      
      private var cardData:ShopItemData;
      
      private var userProxy:UserProxy;
      
      private var cageUpgradeProxy:CageUpgradeProxy;
      
      private var itemConfigProxy:ItemConfigProxy;
      
      private var speciesFood:Array;
      
      private var _playfieldSettingsProxy:PlayfieldSettingsProxy;
      
      public function ItemInfoBaseWindowMediator(param1:ItemInfoBaseWindow)
      {
         super(NAME,param1);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
      }
      
      override public function onRegister() : void
      {
         this.itemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         this.userProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
         this.cageUpgradeProxy = facade.retrieveProxy(CageUpgradeProxy.NAME) as CageUpgradeProxy;
         this._playfieldSettingsProxy = facade.retrieveProxy(PlayfieldSettingsProxy.NAME) as PlayfieldSettingsProxy;
      }
      
      override public function init(param1:Object) : void
      {
         this.cardData = param1 as ShopItemData;
         this.setText();
         this.setVisualInfo();
         this.setPic();
      }
      
      private function setText() : void
      {
         var _loc1_:Vector.<TextReplace> = null;
         var _loc2_:Array = null;
         this.content.title = this.cardData.localisedTitle;
         if(this.cardData.localisedInfoReplacers)
         {
            _loc1_ = new Vector.<TextReplace>();
            for each(_loc2_ in this.cardData.localisedInfoReplacers)
            {
               _loc1_.push(new TextReplace(_loc2_[0],_loc2_[1]));
            }
            this.content.text = TextResourceModule.getTextReplaced(this.cardData.localisedInfoId,_loc1_);
         }
         else
         {
            this.content.text = TextResourceModule.getText(this.cardData.localisedInfoId);
         }
      }
      
      private function setVisualInfo() : void
      {
         var _loc1_:int = 0;
         switch(this.cardData.internalType)
         {
            case ItemInternalTypes.CAGE:
               _loc1_ = this.cardData.level == 0 ? this.cardData.baseLevel : this.cardData.level;
               this.content.groupPreview.currentState = "cage";
               this.content.groupPreview.infoLevel.level = _loc1_;
               this.content.groupPreview.infoLevel.xpPercentage = 100 + this.cageUpgradeProxy.getLevelUpCageConfigBonus(_loc1_).count * 100;
               break;
            case ItemInternalTypes.STORE:
               this.content.groupPreview.currentState = "store";
               break;
            case ItemInternalTypes.MATERIAL:
               this.content.groupPreview.currentState = "material";
               break;
            case ItemInternalTypes.DECORATION:
               this.content.groupPreview.currentState = "decoration";
               break;
            case ItemInternalTypes.RESOURCE:
               switch(this.cardData.itemId)
               {
                  case Resources.POWERFOOD:
                  case Resources.SUPERFOOD:
                  case Resources.SUPERMEDICINE:
                  case Resources.MEDICINE:
                  case Resources.WATER:
                  case Resources.ELIXIR:
                  case Resources.POTION:
                  case Resources.RECYCLING_BOOSTER:
                  case Resources.CRAFTING_BOOSTER:
                  case Resources.ALGE:
                  case Resources.PLANKTON:
                  case Resources.SHRIMP:
                  case Resources.CLAMS:
                  case Resources.POWER_FISH_FOOD:
                  case Resources.SUPER_FISH_FOOD:
                  case Resources.SUPER_FISH_FOOD:
                  case Resources.FILTER:
                     break;
                  default:
                     this.speciesFood = this.itemConfigProxy.getSpeciesOfFood(this.cardData.itemId);
                     this.content.groupPreview.currentState = "resource";
                     this.content.groupRight.currentState = "resource";
                     this.content.groupRight.infoCageSpecies.paginator.addEventListener(PaginatorEvent.CHANGE_PAGE,this.changeSpeciesHandler);
                     if(this.speciesFood != null)
                     {
                        this.content.groupRight.infoCageSpecies.paginator.maxEntries = this.speciesFood.length;
                     }
                     else
                     {
                        this.content.groupRight.infoCageSpecies.paginator.maxEntries = 0;
                     }
                     this.content.groupRight.infoCageSpecies.paginator.currentPage = 0;
               }
               break;
            case ItemInternalTypes.ASSISTANT:
               this.content.groupPreview.currentState = "assistant";
               if((this.cardData as AssistanceShopData).experienceMod)
               {
                  if((this.cardData as AssistanceShopData).assistId == 6)
                  {
                     this.content.groupRight.currentState = "assistant";
                     this.content.groupRight.xp.type = "petPenny";
                  }
                  this.content.groupRight.currentState = "assistant";
                  this.content.groupRight.xp.text = "+" + (this.cardData as AssistanceShopData).experienceMod * 100 + "%";
               }
               break;
            case ItemInternalTypes.ROAD:
               this.content.groupPreview.currentState = "road";
         }
         if(this.cardData.internalType == ItemInternalTypes.CAGE || this.cardData.internalType == ItemInternalTypes.STORE || this.cardData.internalType == ItemInternalTypes.DECORATION || this.cardData.internalType == ItemInternalTypes.ROAD)
         {
            this.content.groupPreview.infoLock.level = this.cardData.getUserLevelRequired();
            this.content.groupPreview.infoLock.locked = this.userProxy.userLevel < this.cardData.getUserLevelRequired();
            if(this._playfieldSettingsProxy.activePlayfieldType == PlayFieldsTypes.FIELD_TYPE_OCEANWORLD_ZOO)
            {
               this.content.groupPreview.infoLevel.currentState = "pearls";
            }
            else
            {
               this.content.groupPreview.infoLevel.currentState = "petPaw";
            }
         }
         if(this.cardData.internalType == ItemInternalTypes.CAGE || this.cardData.internalType == ItemInternalTypes.DECORATION || this.cardData.internalType == ItemInternalTypes.ROAD)
         {
            this.content.groupPreview.infoAttraction.value = this.cardData.getAttraction();
         }
      }
      
      private function changeSpeciesHandler(param1:PaginatorEvent) : void
      {
         var _loc2_:int = this.itemConfigProxy.getMaleAnimalData(this.speciesFood[param1.page]).itemId;
         this.content.groupRight.infoCageSpecies.addContent(new WrapedSprite(AssetIds.getPreviewAssetId(Categories.ANIMAL,_loc2_),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI,-1,50));
      }
      
      private function setPic() : void
      {
         this.content.addContent(new WrapedSprite(this.cardData.picAssetId,AssetConfig.DEFAULT_INFO_SPR));
      }
      
      private function get content() : InfoContentBase
      {
         return this.window.getContent(0) as InfoContentBase;
      }
      
      private function get window() : ItemInfoBaseWindow
      {
         return this.viewComponent as ItemInfoBaseWindow;
      }
      
      override public function dispose() : void
      {
         this.speciesFood = null;
         if(this.content.groupRight.infoCageSpecies.paginator.hasEventListener(PaginatorEvent.CHANGE_PAGE))
         {
            this.content.groupRight.infoCageSpecies.paginator.removeEventListener(PaginatorEvent.CHANGE_PAGE,this.changeSpeciesHandler);
         }
      }
   }
}

