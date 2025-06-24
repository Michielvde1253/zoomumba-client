package com.bigpoint.zoomumba.view.cards.custom
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.DataNote;
   import com.bigpoint.zoomumba.view.cards.BaseCardMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.data.settings.RoadShopData;
   import com.bigpoint.zoorama.utils.configModules.TextIdHelper;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import com.greensock.TweenMax;
   import custom.card.core.AbstractCard;
   import custom.card.custom.ItemCard;
   import org.puremvc.as3.interfaces.INotification;
   
   public class RoadCardMediator extends BaseCardMediator
   {
      public static const NAME:String = "RoadCardMediator_";
      
      public var cardData:RoadShopData;
      
      public function RoadCardMediator(param1:RoadShopData)
      {
         this.cardData = param1;
         super(getNameFromPrefix(NAME,this.cardData.categoryId,this.cardData.itemId),param1,new ItemCard());
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
      
      override protected function setHaveInInventory(param1:int = -1) : void
      {
         super.setHaveInInventory(this.cardData.categoryId);
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         super.handleNotification(param1);
         var _loc2_:* = param1.getName();
         switch(0)
         {
         }
      }
      
      override protected function setTutorialState() : void
      {
         if(this.cardData.itemId != 1)
         {
            card.enabled = false;
            TweenMax.to(card,0,{"colorMatrixFilter":{"saturation":0}});
         }
      }
      
      override protected function setCardName() : void
      {
         var _loc1_:String = TextIdHelper.getCardName(Categories.ROAD,this.cardData.itemId);
         this.cardData.localisedTitle = TextResourceModule.getText(_loc1_);
         super.setCardName();
      }
      
      override protected function setCardInfo() : void
      {
         this.cardData.localisedInfoId = TextIdHelper.getCardInfo(Categories.ROAD,this.cardData.itemId);
      }
      
      override protected function loadImageAsset() : void
      {
         this.cardData.picAssetId = AssetIds.getPreviewAssetId(this.cardData.categoryId,this.cardData.itemId);
         card.addContent(new WrapedSprite(this.cardData.picAssetId,AssetConfig.DEFAULT_OBJECT_SPR));
      }
      
      override public function onRegister() : void
      {
         usePremiumMultiplier = false;
         super.onRegister();
      }
   }
}

