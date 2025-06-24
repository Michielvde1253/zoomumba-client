package com.bigpoint.zoomumba.view.cards.custom
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.DataNote;
   import com.bigpoint.zoomumba.constants.GUINote;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.PlayFieldsTypes;
   import com.bigpoint.zoomumba.constants.UserResources;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.model.gameConfig.MainConfigProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayFieldProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayfieldSettingsProxy;
   import com.bigpoint.zoomumba.model.user.core.UserProxy;
   import com.bigpoint.zoomumba.model.user.resources.ResourcesProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowParams;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.confirmation.extended.BuyConfirmationInitParams;
   import com.bigpoint.zoomumba.view.cards.BaseCardMediator;
   import com.bigpoint.zoorama.MainConfig;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.data.settings.StorageShopData;
   import com.bigpoint.zoorama.utils.configModules.TextIdHelper;
   import com.bigpoint.zoorama.utils.configModules.TextReplace;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import custom.card.core.AbstractCard;
   import custom.card.custom.ItemCard;
   import custom.card.events.CardEvent;
   import org.puremvc.as3.interfaces.IFacade;
   import org.puremvc.as3.interfaces.INotification;
   
   public class StorageCardMediator extends BaseCardMediator
   {
      public static const NAME:String = "StorageCardMediator_";
      
      public var cardData:StorageShopData;
      
      private var instancesInGame:int;
      
      private var resourceProxy:ResourcesProxy;
      
      private var mainConfigProxy:MainConfigProxy;
      
      private var itemConfigProxy:ItemConfigProxy;
      
      private var playFieldProxy:PlayFieldProxy;
      
      public function StorageCardMediator(param1:StorageShopData, param2:IFacade)
      {
         this.cardData = param1;
         userProxy = param2.retrieveProxy(UserProxy.NAME) as UserProxy;
         this.playFieldProxy = param2.retrieveProxy(PlayFieldProxy.NAME) as PlayFieldProxy;
         this.cardData.instancesInGame = this.playFieldProxy.getItemCount(Categories.STORAGE,-1,true,this.cardData.itemId);
         this.cardData.userFieldSize = userProxy.fieldSize;
         super(getNameFromPrefix(NAME,this.cardData.categoryId,this.cardData.itemId),param1,new ItemCard(),null,param2);
      }
      
      override protected function config(param1:AbstractCard) : void
      {
         super.config(param1);
         card.buyGroup.currentState = "button";
      }
      
      override public function listNotificationInterests() : Array
      {
         return [DataNote.COLLECTABLE_UPDATED];
      }
      
      override protected function filter(param1:IFacade) : void
      {
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         super.handleNotification(param1);
      }
      
      override public function onRegister() : void
      {
         this.itemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         this.mainConfigProxy = facade.retrieveProxy(MainConfigProxy.NAME) as MainConfigProxy;
         this.resourceProxy = facade.retrieveProxy(ResourcesProxy.NAME) as ResourcesProxy;
         super.onRegister();
      }
      
      override protected function setHaveInInventory(param1:int = -1) : void
      {
         super.setHaveInInventory(this.cardData.categoryId);
      }
      
      override protected function setPrice() : void
      {
         super.setPrice();
         if(this.cardData.price.userResource != UserResources.REAL_MONEY && !this.cardData.availableDueExpansion)
         {
            card.container.alpha = 0.7;
            card.lock.currentState = "expansion";
         }
         var _loc1_:PlayfieldSettingsProxy = facade.getProxy(PlayfieldSettingsProxy);
         if(_loc1_.activePlayfieldType == PlayFieldsTypes.FIELD_TYPE_FORGOTTEN_ZOO || _loc1_.activePlayfieldType == PlayFieldsTypes.FIELD_TYPE_NEW_ZOO || _loc1_.activePlayfieldType == PlayFieldsTypes.FIELD_TYPE_RIVER_ZOO || _loc1_.activePlayfieldType == PlayFieldsTypes.FIELD_TYPE_COAST_ZOO)
         {
            card.lock.currentState = "locked";
            card.buyGroup.button.enabled = false;
         }
         else if(this.cardData.cappedAmount == 1 && this.cardData.instancesInGame >= MainConfig.MAX_FIELD_SIZE - 10 || !this.cardData.checkAvailabirityInZooId(_loc1_.activePlayfieldType) || this.cardData.userFieldSize < this.cardData.campSizeRequired)
         {
            card.lock.currentState = "locked";
            card.buyGroup.button.enabled = false;
         }
         card.toolTip = card.lock.currentState == "locked" || card.lock.currentState == "expansion" ? TextResourceModule.getText("zoo.tooltip.storageLocked") : null;
      }
      
      override protected function handleBuyClicked(param1:CardEvent) : void
      {
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc2_:int = this.resourceProxy.getMaxResourse(this.cardData.isWater ? 1 : 2);
         var _loc3_:int = this.mainConfigProxy.resourcesCap;
         var _loc4_:* = _loc2_ < _loc3_;
         var _loc5_:* = _loc2_ + this.cardData.capacity > _loc3_;
         if(card.lock.currentState == "expansion")
         {
            sendNotification(Note.BUY_EXPANSION);
         }
         else if(_loc4_ && _loc5_)
         {
            _loc6_ = "below" + (this.cardData.isWater ? "Water" : "Food");
            sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.BUY_CONFIRMATION,"",new BuyConfirmationInitParams(TextResourceModule.getText("zoo.window.confirmation.shop.buyitemreal.title"),TextResourceModule.getTextReplaced("zoo.storage.buy." + _loc6_,Vector.<TextReplace>([new TextReplace("%capacity%",_loc3_.toString())])),this.cardData.getBuyReal()),new WindowParams("",null,"",null,SHOPCARD_BUY_CLICKED,this.cardData)));
         }
         else if(!_loc4_)
         {
            _loc7_ = "max" + (this.cardData.isWater ? "Water" : "Food");
            sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.BUY_CONFIRMATION,"",new BuyConfirmationInitParams(TextResourceModule.getText("zoo.window.confirmation.shop.buyitemreal.title"),TextResourceModule.getTextReplaced("zoo.storage.buy." + _loc7_,Vector.<TextReplace>([new TextReplace("%capacity%",_loc3_.toString())])),this.cardData.getBuyReal()),new WindowParams("",null,"",null,SHOPCARD_BUY_CLICKED,this.cardData)));
         }
         else if(!this.cardData.price.userCanBuy)
         {
            sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(WindowTypes.SHOP_WINDOW));
            sendNotification(GUINote.BANK_MENU_BUTTON_CLICKED);
         }
         else
         {
            sendNotification(SHOPCARD_BUY_CLICKED,this.cardData);
         }
      }
      
      override protected function setCardName() : void
      {
         var _loc1_:String = TextIdHelper.getCardName(Categories.STORAGE,this.cardData.itemId);
         this.cardData.localisedTitle = TextResourceModule.getText(_loc1_);
         super.setCardName();
      }
      
      override protected function setCardInfo() : void
      {
         this.cardData.localisedInfoId = TextIdHelper.getCardInfo(Categories.STORAGE,this.cardData.itemId);
      }
      
      override protected function loadImageAsset() : void
      {
         this.cardData.picAssetId = AssetIds.getPreviewAssetId(this.cardData.categoryId,this.cardData.itemId);
         card.addContent(new WrapedSprite(this.cardData.picAssetId,AssetConfig.DEFAULT_OBJECT_SPR));
      }
   }
}

