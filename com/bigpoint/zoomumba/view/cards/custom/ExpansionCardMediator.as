package com.bigpoint.zoomumba.view.cards.custom
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.DataNote;
   import com.bigpoint.zoomumba.constants.GUINote;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.playfield.PlayFieldProxy;
   import com.bigpoint.zoomumba.model.user.core.UserProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.view.cards.BaseCardMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.data.settings.ExpansionShopData;
   import com.bigpoint.zoorama.utils.configModules.TextIdHelper;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import custom.card.core.AbstractCard;
   import custom.card.custom.ItemCard;
   import custom.card.events.CardEvent;
   import org.puremvc.as3.interfaces.IFacade;
   import org.puremvc.as3.interfaces.INotification;
   
   public class ExpansionCardMediator extends BaseCardMediator
   {
      public static const NAME:String = "ExpansionCardMediator_";
      
      public var cardData:ExpansionShopData;
      
      private var playFieldProxy:PlayFieldProxy;
      
      public function ExpansionCardMediator(param1:ExpansionShopData, param2:IFacade)
      {
         this.cardData = param1;
         userProxy = param2.retrieveProxy(UserProxy.NAME) as UserProxy;
         this.cardData.userLevel = userProxy.userLevel;
         this.cardData.userFieldSize = userProxy.fieldSize;
         this.cardData.flushCachedPrice();
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
      
      override public function handleNotification(param1:INotification) : void
      {
         super.handleNotification(param1);
      }
      
      override public function onRegister() : void
      {
         super.onRegister();
      }
      
      override protected function handleBuyClicked(param1:CardEvent) : void
      {
         if(!this.cardData.price.userCanBuy)
         {
            sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(WindowTypes.SHOP_WINDOW));
            sendNotification(GUINote.BANK_MENU_BUTTON_CLICKED);
         }
         else
         {
            sendNotification(Note.BUY_EXPANSION,this.cardData);
         }
      }
      
      override protected function setCardName() : void
      {
         var _loc1_:String = TextIdHelper.getCardName(Categories.EXPANSION,this.cardData.itemId);
         this.cardData.localisedTitle = TextResourceModule.getText(_loc1_);
         super.setCardName();
      }
      
      override protected function setCardInfo() : void
      {
         this.cardData.localisedInfoId = TextIdHelper.getCardInfo(Categories.EXPANSION,this.cardData.itemId);
         this.cardData.localisedInfoReplacers = [["%nextExpandLevel%",this.cardData.lvlNextAutomaticExp.toString()]];
      }
      
      override protected function loadImageAsset() : void
      {
         this.cardData.picAssetId = AssetIds.getPreviewAssetId(this.cardData.categoryId,this.cardData.itemId);
         card.addContent(new WrapedSprite(this.cardData.picAssetId,AssetConfig.DEFAULT_OBJECT_SPR));
      }
   }
}

