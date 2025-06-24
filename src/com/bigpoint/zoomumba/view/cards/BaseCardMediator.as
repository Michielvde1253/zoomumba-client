package com.bigpoint.zoomumba.view.cards
{
   import buttons.extended.ButtonAction;
   import com.bigpoint.zoomumba.constants.CARDS;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.DataNote;
   import com.bigpoint.zoomumba.constants.GUINote;
   import com.bigpoint.zoomumba.constants.PreloaderTypes;
   import com.bigpoint.zoomumba.constants.UserResources;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.constants.items.ItemInternalTypes;
   import com.bigpoint.zoomumba.model.app.gameEvents.GlobalEventProxy;
   import com.bigpoint.zoomumba.model.app.items.ItemStackVO;
   import com.bigpoint.zoomumba.model.app.settings.AppConfigProxy;
   import com.bigpoint.zoomumba.model.features.collectables.CollectablesProxy;
   import com.bigpoint.zoomumba.model.gameConfig.PremiumPackConfigProxy;
   import com.bigpoint.zoomumba.model.gameConfig.vo.AnimalSpeciesVO;
   import com.bigpoint.zoomumba.model.inventory.vo.InventoryTabs;
   import com.bigpoint.zoomumba.model.playfield.PlayFieldProxy;
   import com.bigpoint.zoomumba.model.user.core.UserProxy;
   import com.bigpoint.zoomumba.model.user.currency.CurrencyProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowParams;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.confirmation.extended.BuyConfirmationInitParams;
   import com.bigpoint.zoomumba.model.windows.confirmation.extended.BuyOnceConfirmationInitParams;
   import com.bigpoint.zoomumba.view.cards.discountInfo.DiscountInfoCalculator;
   import com.bigpoint.zoorama.Settings;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.core.feature.tutorials.notices.TutorialNotices;
   import com.bigpoint.zoorama.data.settings.InheritedShopData;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import custom.card.core.AbstractCard;
   import custom.card.events.CardEvent;
   import custom.card.events.CardSexChangeEvent;
   import custom.card.skin.ItemCardShopSkin;
   import flash.events.MouseEvent;
   import org.puremvc.as3.interfaces.IFacade;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.mediator.Mediator;
   
   public class BaseCardMediator extends Mediator
   {
      public static const NAME:String = "BaseCardMediator_";
      
      protected const BUY_EXTERNAL_DECO_SIZE:int = 20;
      
      protected var SHOPCARD_INFO_CLICKED:String = "SHOPCARD_INFO_CLICKED";
      
      protected var SHOPCARD_BUY_CLICKED:String = "SHOPCARD_BUY_CLICKED";
      
      protected var SHOPCARD_IN_INVENTORY_CLICKED:String = "SHOPCARD_IN_INVENTORY_CLICKED";
      
      protected var _card:AbstractCard;
      
      protected var _inventoryMode:Boolean = false;
      
      protected var usePremiumMultiplier:Boolean = true;
      
      private var _mediatorName:String;
      
      private var cardData:InheritedShopData;
      
      private var collectableProxy:CollectablesProxy;
      
      protected var _currencyProxy:CurrencyProxy;
      
      protected var userProxy:UserProxy;
      
      private var premiumProxy:PremiumPackConfigProxy;
      
      private var _discountInfoCalculator:DiscountInfoCalculator;
      
      public function BaseCardMediator(param1:String, param2:InheritedShopData, param3:AbstractCard, param4:Class = null, param5:IFacade = null)
      {
         this.cardData = param2;
         this.cardData.visible = true;
         this._mediatorName = param1;
         this._card = param3;
         this._card.config = this.config;
         this._card.setStyle("skinClass",Class(param4 || ItemCardShopSkin));
         super(param1,param3);
         if(param5)
         {
            this.filter(param5);
         }
      }
      
      public function get data() : InheritedShopData
      {
         return this.cardData;
      }
      
      final protected function getNameFromPrefix(param1:String, param2:int, param3:int) : String
      {
         var _loc4_:* = param1;
         _loc4_ = _loc4_ + param2;
         _loc4_ = _loc4_ + "_";
         _loc4_ = _loc4_ + param3;
         _loc4_ = _loc4_ + "_";
         return _loc4_ + Math.random() * 16777215;
      }
      
      protected function filter(param1:IFacade) : void
      {
      }
      
      protected function config(param1:AbstractCard) : void
      {
         param1.nail.currentState = this.cardData.isEventItem == 1 ? "stars" : "nail";
         this.setCardBackground(this.cardData.bg);
      }
      
      protected function setCardBackground(param1:int) : void
      {
         switch(param1)
         {
            case CARDS.CARD_BACKGROUND_STYLE_BLUEPRINT:
               this._card.background.currentState = "blueprint";
               break;
            case CARDS.CARD_BACKGROUND_STYLE_RECYCLE:
               this._card.background.currentState = "recycling";
               break;
            case CARDS.CARD_BACKGROUND_STYLE_GOLD:
               this._card.background.currentState = "gold";
               break;
            case CARDS.CARD_BACKGROUND_STYLE_GREEN:
               this._card.background.currentState = "green";
               break;
            case CARDS.CARD_BACKGROUND_STYLE_OCEAN_BLUE_NORMAL:
               this._card.background.currentState = "oceanBlueNormal";
               break;
            case CARDS.CARD_BACKGROUND_STYLE_OCEAN_BLUE_SMALL:
               this._card.background.currentState = "oceanBlueSmall";
               break;
            case CARDS.CARD_BACKGROUND_STYLE_OCEAN_BLUE_MEDIUM:
               this._card.background.currentState = "oceanBlueMedium";
               break;
            case CARDS.CARD_BACKGROUND_STYLE_OCEAN_BLUE_LARGE:
               this._card.background.currentState = "oceanBlueLarge";
               break;
            case CARDS.CARD_BACKGROUND_STYLE_OCEAN_GOLD_NORMAL:
               this._card.background.currentState = "oceanGoldNormal";
               break;
            case CARDS.CARD_BACKGROUND_STYLE_OCEAN_GOLD_SMALL:
               this._card.background.currentState = "oceanGoldSmall";
               break;
            case CARDS.CARD_BACKGROUND_STYLE_OCEAN_GOLD_MEDIUM:
               this._card.background.currentState = "oceanGoldMedium";
               break;
            case CARDS.CARD_BACKGROUND_STYLE_OCEAN_GOLD_LARGE:
               this._card.background.currentState = "oceanGoldLarge";
               break;
            default:
               this._card.background.currentState = "normal";
         }
      }
      
      override public function listNotificationInterests() : Array
      {
         return [DataNote.COLLECTABLE_UPDATED];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case DataNote.COLLECTABLE_UPDATED:
               this.setPrice();
               this.setCanBuyState();
         }
      }
      
      override public function onRegister() : void
      {
         super.onRegister();
         this.rebindNotifications();
         this.collectableProxy = facade.retrieveProxy(CollectablesProxy.NAME) as CollectablesProxy;
         this._currencyProxy = facade.retrieveProxy(CurrencyProxy.NAME) as CurrencyProxy;
         this.premiumProxy = facade.retrieveProxy(PremiumPackConfigProxy.NAME) as PremiumPackConfigProxy;
         this.userProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
         this.card.addEventListener(CardEvent.BUY_BUTTON_CLICKED,this.handleBuyClicked);
         this.card.addEventListener(CardEvent.IN_INVENTORY_BUTTON_CLICKED,this.handleInInventoryClicked);
         this.card.addEventListener(CardEvent.INFO_BUTTON_CLICKED,this.handleInfoButtonClicked);
         this.card.addEventListener(CardSexChangeEvent.CHANGED,this.handleSexChangedClicked);
         this._discountInfoCalculator = new DiscountInfoCalculator(this.cardData.itemId);
         if(this._inventoryMode)
         {
            this.card.bottomGroup.button1.addEventListener(MouseEvent.CLICK,this.handleUseItem);
            this.card.bottomGroup.button2.addEventListener(MouseEvent.CLICK,this.handleSellItem);
         }
         else
         {
            this.setPrice();
         }
         this.loadImageAsset();
         this.setActionButtonLabel();
         this.setCardName();
         this.setCardInfo();
         this.setCanBuyState();
         this.setTopCounter();
         this.setSafariState();
         if(!this._inventoryMode)
         {
            this.setHaveInInventory();
            this.updateAssistantState();
            this.setResourceAmount();
         }
         if(Settings.TUTORIAL_ACTIVE)
         {
            this.setTutorialState();
         }
         this.setLastSexSelected();
         this.postRegisterConfig();
      }
      
      protected function postRegisterConfig() : void
      {
      }
      
      protected function setSafariState() : void
      {
      }
      
      protected function updateAssistantState() : void
      {
      }
      
      protected function setTutorialState() : void
      {
      }
      
      protected function setResourceAmount() : void
      {
      }
      
      protected function setHaveInInventory(param1:int = -1) : void
      {
         if(param1 == -1)
         {
            return;
         }
         var _loc2_:PlayFieldProxy = facade.retrieveProxy(PlayFieldProxy.NAME) as PlayFieldProxy;
         if(param1 == Categories.ANIMAL)
         {
            if(_loc2_.haveSpecieInInventory(param1,AnimalSpeciesVO(this.cardData).speciesId))
            {
               this.card.topGroup.currentState = "inInventory";
               return;
            }
         }
         if(_loc2_.haveInInventory(param1,this.cardData.itemId))
         {
            this.card.topGroup.currentState = "inInventory";
         }
      }
      
      protected function handleUseItem(param1:MouseEvent) : void
      {
      }
      
      protected function handleSellItem(param1:MouseEvent) : void
      {
      }
      
      protected function loadImageAsset() : void
      {
         if(!this.card)
         {
            return;
         }
         this.card.cleanContent();
      }
      
      protected function setLastSexSelected() : void
      {
      }
      
      protected function setCanBuyState() : void
      {
      }
      
      protected function setCardInfo() : void
      {
      }
      
      protected function setActionButtonLabel() : void
      {
      }
      
      protected function setTopCounter() : void
      {
      }
      
      protected function handleSexChangedClicked(param1:CardSexChangeEvent) : void
      {
      }
      
      protected function onPressActionButton(param1:ButtonAction) : void
      {
      }
      
      protected function handleBuyClicked(param1:CardEvent) : void
      {
         if(!this.card)
         {
            return;
         }
         if(!this.cardData.price.userCanBuy)
         {
            sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(WindowTypes.SHOP_WINDOW));
            sendNotification(GUINote.BANK_MENU_BUTTON_CLICKED);
         }
         else if(this.userProxy.userLevel < this.cardData.getUserLevelRequired())
         {
            sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.SHOP_BUY_ONCE_WINDOW,"",new BuyOnceConfirmationInitParams(this.cardData)));
         }
         else if(this.cardData.price.userCanBuy && this.cardData.price.userResource == UserResources.REAL_MONEY)
         {
            sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.BUY_CONFIRMATION,"",new BuyConfirmationInitParams(TextResourceModule.getText("zoo.window.confirmation.shop.buyitemreal.title"),TextResourceModule.getText("zoo.window.confirmation.shop.buyitemreal.info"),this.cardData.getBuyReal() * this.cardData.itemsSelectedForBuy),new WindowParams("",null,"",null,this.SHOPCARD_BUY_CLICKED,this.cardData)));
         }
         else
         {
            sendNotification(this.SHOPCARD_BUY_CLICKED,this.cardData);
            if((facade.getProxy(AppConfigProxy) as AppConfigProxy).tutorial_active)
            {
               sendNotification(TutorialNotices.SHOP_ITEM_SELECTED);
            }
         }
      }
      
      protected function handleInInventoryClicked(param1:CardEvent) : void
      {
         var _loc2_:int = -1;
         switch(this.cardData.internalType)
         {
            case ItemInternalTypes.DECORATION:
               _loc2_ = InventoryTabs.DECORATIONS;
               break;
            case ItemInternalTypes.STORE:
               _loc2_ = InventoryTabs.SHOPS;
               break;
            case ItemInternalTypes.CAGE:
               _loc2_ = InventoryTabs.CAGES;
               break;
            case ItemInternalTypes.SPECIE:
            case ItemInternalTypes.ANIMAL:
               _loc2_ = InventoryTabs.ANIMALS;
               break;
            case ItemInternalTypes.ROAD:
            case ItemInternalTypes.TRASHBIN:
               _loc2_ = InventoryTabs.ROADS;
               break;
            case ItemInternalTypes.ROAD:
            case ItemInternalTypes.TRASHBIN:
               _loc2_ = InventoryTabs.ROADS;
               break;
            case ItemInternalTypes.SPECIAL:
               _loc2_ = InventoryTabs.SPECIALS;
               break;
            case ItemInternalTypes.MATERIAL:
               _loc2_ = InventoryTabs.MATERIALS;
               break;
            default:
               _loc2_ = InventoryTabs.SPECIALS;
         }
         sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(WindowTypes.SHOP_WINDOW));
         sendNotification(this.SHOPCARD_IN_INVENTORY_CLICKED,_loc2_);
      }
      
      protected function handleInfoButtonClicked(param1:CardEvent) : void
      {
         sendNotification(this.SHOPCARD_INFO_CLICKED,this.cardData);
      }
      
      protected function setCardName() : void
      {
         if(!this.card)
         {
            return;
         }
         this.card.title = this.cardData.localisedTitle;
      }
      
      protected function setPrice() : void
      {
         var _loc1_:* = false;
         if(!this.card)
         {
            return;
         }
         this.card.container.alpha = 1;
         var _loc2_:Number = this.usePremiumMultiplier ? Math.floor(this.cardData.getBuyVirtual() * this.premiumProxy.allNormalBuildingsCostMultiplyer) : this.cardData.getBuyVirtual();
         if(this.cardData.collectableType != -1 && this.cardData.getBuyCollectable() > 0)
         {
            _loc1_ = this.collectableProxy.getCollectableAmmount(this.cardData.collectableType) >= this.cardData.getBuyCollectable();
            this.showBuyButton(this.cardData.getBuyCollectable(),"normal",_loc1_,true,Categories.COLLECTIBLE,this.cardData.collectableType);
            this.cardData.price.collectable = this.cardData.collectableType;
            this.cardData.price.amount = this.cardData.getBuyCollectable();
            this.cardData.price.userCanBuy = _loc1_;
         }
         else if(this.cardData.getBuyReal() > 0 && _loc2_ > 0)
         {
            if(this.userProxy.userLevel >= this.cardData.getUserLevelRequired())
            {
               _loc1_ = this.currencyProxy.getCurrency(UserResources.VIRTUAL_MONEY) >= _loc2_;
               this.showBuyButton(_loc2_,_loc1_ ? "normal" : "pale",true,true,Categories.USER,UserResources.VIRTUAL_MONEY);
               this.cardData.price.amount = _loc2_;
               this.cardData.price.userResource = UserResources.VIRTUAL_MONEY;
               this.cardData.price.userCanBuy = _loc1_;
               this.checkItemForDiscount(UserResources.VIRTUAL_MONEY_NAME);
            }
            else
            {
               _loc1_ = this.currencyProxy.getCurrency(UserResources.VIRTUAL_MONEY) >= _loc2_;
               this.showBuyButton(_loc2_,"gold",true,true,Categories.USER,UserResources.VIRTUAL_MONEY);
               this.cardData.price.userResource = UserResources.REAL_MONEY;
               this.cardData.price.amount = this.cardData.getBuyReal();
               this.cardData.price.userCanBuy = this.currencyProxy.getCurrency(UserResources.REAL_MONEY) >= this.cardData.getBuyReal();
               this.card.lock.currentState = "locked";
               this.card.container.alpha = 0.7;
               this.checkItemForDiscount(UserResources.REAL_MONEY_NAME);
            }
         }
         else if(_loc2_ > 0 && this.userProxy.userLevel < this.cardData.getUserLevelRequired())
         {
            _loc1_ = this.currencyProxy.getCurrency(UserResources.VIRTUAL_MONEY) >= _loc2_;
            this.showBuyButton(_loc2_,"pale",false,true,Categories.USER,UserResources.VIRTUAL_MONEY);
            this.cardData.price.userResource = UserResources.VIRTUAL_MONEY;
            this.cardData.price.amount = _loc2_;
            this.cardData.price.userCanBuy = _loc1_;
            this.card.lock.currentState = "locked";
            this.card.container.alpha = 0.7;
            this.checkItemForDiscount(UserResources.VIRTUAL_MONEY_NAME);
         }
         else if(_loc2_ > 0)
         {
            _loc1_ = this.currencyProxy.getCurrency(UserResources.VIRTUAL_MONEY) >= _loc2_;
            this.showBuyButton(_loc2_,_loc1_ ? "normal" : "pale",true,true,Categories.USER,UserResources.VIRTUAL_MONEY);
            this.cardData.price.userResource = UserResources.VIRTUAL_MONEY;
            this.cardData.price.amount = _loc2_;
            this.cardData.price.userCanBuy = _loc1_;
            this.checkItemForDiscount(UserResources.VIRTUAL_MONEY_NAME);
         }
         else if(this.cardData.getBuyReal() > 0)
         {
            _loc1_ = this.currencyProxy.getCurrency(UserResources.REAL_MONEY) >= this.cardData.getBuyReal();
            this.showBuyButton(this.cardData.getBuyReal(),_loc1_ ? "normal" : "pale",true,true,Categories.USER,UserResources.REAL_MONEY);
            this.cardData.price.userResource = UserResources.REAL_MONEY;
            this.cardData.price.amount = this.cardData.getBuyReal();
            this.cardData.price.userCanBuy = _loc1_;
            this.checkItemForDiscount(UserResources.REAL_MONEY_NAME);
         }
         else
         {
            _loc1_ = this.currencyProxy.getCurrency(UserResources.VIRTUAL_MONEY) >= _loc2_;
            this.showBuyButton(_loc2_,"pale",false,false,Categories.USER,UserResources.VIRTUAL_MONEY);
            this.cardData.price.amount = _loc2_;
            this.cardData.price.userResource = UserResources.VIRTUAL_MONEY;
            this.cardData.price.userCanBuy = _loc1_;
            this.checkItemForDiscount(UserResources.VIRTUAL_MONEY_NAME);
         }
      }
      
      private function checkItemForDiscount(param1:String) : void
      {
         var _loc2_:GlobalEventProxy = facade.retrieveProxy(GlobalEventProxy.NAME) as GlobalEventProxy;
         if(!_loc2_.hasEventActive())
         {
            return;
         }
         var _loc3_:int = this._discountInfoCalculator.returnDiscountForItem(this.cardData,param1);
         if(_loc3_ > 0)
         {
            this.card.nail.discountValue = "-" + _loc3_.toString() + "%";
            this.card.nail.currentState = "discount";
         }
         else
         {
            this.card.nail.currentState = this.cardData.isEventItem == 1 ? "stars" : "nail";
         }
      }
      
      private function rebindNotifications() : void
      {
      }
      
      protected function showBuyButton(param1:int, param2:String = "normal", param3:Boolean = true, param4:Boolean = true, param5:int = -1, param6:int = -1) : void
      {
         if(this._inventoryMode || this.card == null)
         {
            return;
         }
         this.card.buyGroup.currentState = param4 ? "button" : "none";
         this.card.buyGroup.button.enabled = param3;
         this.card.buyGroup.button.currentState = param3 ? param2 : "normal";
         this.card.buyGroup.button.label.value = param1;
         if(param4)
         {
            this.card.buyGroup.button.label.setDisplaySource(new WrapedSprite(AssetIds.getPreviewAssetId(param5,param6),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI,-1,this.BUY_EXTERNAL_DECO_SIZE));
         }
      }
      
      public function showActionButton(param1:Boolean, param2:String = "") : void
      {
         if(param1 == true)
         {
            this.showBuyButton(0,"normal",false,false);
            this.card.actionGroup.button.callbackClickFunction = this.onPressActionButton;
            this.card.actionGroup.button.enabled = true;
            this.card.actionGroup.button.label.text = param2;
            this.card.actionGroup.currentState = param1 ? "button" : "none";
         }
      }
      
      private function canAfford(param1:ItemStackVO) : Boolean
      {
         if(param1.category == Categories.COLLECTIBLE)
         {
            return this.collectableProxy.getCollectableAmmount(param1.itemId) >= param1.ammount;
         }
         return this.currencyProxy.getCurrency(param1.itemId) >= param1.ammount;
      }
      
      override public function onRemove() : void
      {
         this.card.removeEventListener(CardEvent.BUY_BUTTON_CLICKED,this.handleBuyClicked);
         this.card.removeEventListener(CardEvent.IN_INVENTORY_BUTTON_CLICKED,this.handleInInventoryClicked);
         this.card.removeEventListener(CardEvent.INFO_BUTTON_CLICKED,this.handleInfoButtonClicked);
         this.card.removeEventListener(CardSexChangeEvent.CHANGED,this.handleSexChangedClicked);
         this.card.destroy();
         this.viewComponent = null;
         this._discountInfoCalculator = null;
      }
      
      public function get internalMediatorName() : String
      {
         return this._mediatorName;
      }
      
      public function get card() : AbstractCard
      {
         return this.viewComponent as AbstractCard;
      }
      
      public function get currencyProxy() : CurrencyProxy
      {
         if(this._currencyProxy == null)
         {
            this._currencyProxy = facade.retrieveProxy(CurrencyProxy.NAME) as CurrencyProxy;
         }
         return this._currencyProxy;
      }
   }
}

