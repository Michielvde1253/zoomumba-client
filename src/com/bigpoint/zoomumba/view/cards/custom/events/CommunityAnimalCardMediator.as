package com.bigpoint.zoomumba.view.cards.custom.events
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.UserResources;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.advBreed.GenusConfigProxy;
   import com.bigpoint.zoomumba.model.app.items.ItemPackVO;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.gameItem.sell.GameItemSellWindowInitParams;
   import com.bigpoint.zoomumba.view.cards.BaseCardMediator;
   import com.bigpoint.zoorama.Settings;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.data.settings.AnimalShopData;
   import com.bigpoint.zoorama.utils.configModules.TextIdHelper;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import custom.card.core.AbstractCard;
   import custom.card.custom.ItemCard;
   import custom.card.events.CardEvent;
   
   public class CommunityAnimalCardMediator extends BaseCardMediator
   {
      public static const NAME:String = "CommunityAnimalCardMediator_";
      
      private var _netProxy:NetProxy;
      
      protected var cardData:AnimalShopData;
      
      protected var cards:Array;
      
      protected var cardAmount:int;
      
      public var showPrice:Boolean = false;
      
      public function CommunityAnimalCardMediator(param1:Array)
      {
         this.cardAmount = param1[0] as int;
         this.cardData = param1[1];
         this.cards = param1;
         super(getNameFromPrefix(NAME,Categories.ANIMAL,this.cardData.itemId),this.cardData,new ItemCard());
         this.showPrice = true;
      }
      
      override public function onRegister() : void
      {
         super.onRegister();
         this._netProxy = super.facade.retrieveProxy(NetProxy.NAME) as NetProxy;
      }
      
      override protected function config(param1:AbstractCard) : void
      {
         super.config(param1);
         if(this.cardAmount <= 0)
         {
            this.cardData.visible = false;
         }
         card.topGroup.currentState = "counter";
         card.buyGroup.currentState = "buttonLabel";
         card.buyGroup.buttonLabel.label = TextResourceModule.getText("zoo.inventory.inventory.item.button.action");
         card.rightGroup.currentState = this.getSex();
         var _loc2_:GenusConfigProxy = facade.getProxy(GenusConfigProxy) as GenusConfigProxy;
         if(_loc2_.getSpecieByTier(this.cardData.genusId) != this.cardData.speciesId)
         {
            param1.nail.currentState = "stars";
            param1.background.currentState = "gold";
         }
      }
      
      override protected function setTopCounter() : void
      {
         card.topGroup.counter.value = this.cardAmount;
         if(this.cardData.sellable == 0)
         {
            card.bottomGroup.button2.visible = false;
         }
      }
      
      override protected function setCardName() : void
      {
         var _loc1_:String = TextIdHelper.getCardName(Categories.SPECIES,this.cardData.speciesId);
         this.cardData.localisedTitle = TextResourceModule.getText(_loc1_);
         if(Settings.DEBUG_MODE)
         {
            this.cardData.localisedTitle = TextResourceModule.getText(_loc1_) + "\n" + this.cardData.uniqueId;
         }
         super.setCardName();
      }
      
      override protected function showBuyButton(param1:int, param2:String = "normal", param3:Boolean = true, param4:Boolean = true, param5:int = -1, param6:int = -1) : void
      {
         super.showBuyButton(param1,param2,param3,param4,param5,param6);
         if(this.cardAmount > 0)
         {
            card.buyGroup.buttonLabel.enabled = true;
         }
         else
         {
            card.buyGroup.buttonLabel.enabled = false;
         }
      }
      
      override protected function setCardInfo() : void
      {
         this.cardData.localisedInfoId = TextIdHelper.getCardInfo(Categories.SPECIES,this.cardData.speciesId,this.cardData.genusId);
      }
      
      override protected function loadImageAsset() : void
      {
         this.cardData.picAssetId = AssetIds.getPreviewAssetId(this.cardData.categoryId,this.cardData.itemId);
         card.addContent(new WrapedSprite(this.cardData.picAssetId,AssetConfig.DEFAULT_OBJECT_SPR));
      }
      
      override protected function handleBuyClicked(param1:CardEvent) : void
      {
         var _loc2_:ItemPackVO = null;
         if(this.cardAmount <= 0)
         {
            return;
         }
         if(this.showPrice)
         {
            _loc2_ = new ItemPackVO();
            _loc2_.count = this.cardData.getSellVirtual();
            _loc2_.category = Categories.USER;
            _loc2_.itemId = UserResources.VIRTUAL_MONEY;
         }
         var _loc3_:Array = this.getIds();
         var _loc4_:ItemPackVO = new ItemPackVO();
         _loc4_.category = this.cardData.categoryId;
         _loc4_.itemId = this.cardData.itemId;
         _loc4_.count = _loc3_.length;
         sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.GAME_ITEM_PAYIN_WINDOW,"",new GameItemSellWindowInitParams(TextResourceModule.getText("zoo.inventory.move.title"),TextResourceModule.getText("zoo.inventory.move.info"),_loc3_.length,_loc2_,_loc4_,_loc3_)));
      }
      
      override protected function setPrice() : void
      {
      }
      
      protected function getIds() : Array
      {
         var _loc1_:Array = new Array();
         var _loc2_:int = 0;
         while(_loc2_ < this.cards.length)
         {
            if(_loc2_ != 0)
            {
               _loc1_.push(AnimalShopData(this.cards[_loc2_]).uniqueId);
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      private function getSex() : String
      {
         if(this.cardData.male == 1)
         {
            return "inventoryMale";
         }
         if(this.cardData.child == 1)
         {
            return "inventoryBaby";
         }
         return "inventoryFemale";
      }
   }
}

