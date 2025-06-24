package com.bigpoint.zoomumba.view.cards.custom.xmas
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.events.xmas.XMas2012Proxy;
   import com.bigpoint.zoomumba.model.inventory.InventoryProxy;
   import com.bigpoint.zoorama.data.settings.AnimalShopData;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import custom.card.core.AbstractCard;
   import custom.card.events.CardEvent;
   
   public class Xmas2012AnimalCardMediator extends AbstractXMas2012CardMediator
   {
      public static const NAME:String = "Xmas2012AnimalCardMediator_";
      
      private var currentPrice:int;
      
      public function Xmas2012AnimalCardMediator(param1:Array)
      {
         super(Xmas2012AnimalCardMediator.NAME,param1,AbstractXMas2012CardMediator.ANIMAL_SINGLEPLAYER);
      }
      
      override protected function config(param1:AbstractCard) : void
      {
         var _loc2_:XMas2012Proxy = null;
         super.config(param1);
         _loc2_ = super.facade.retrieveProxy(XMas2012Proxy.NAME) as XMas2012Proxy;
         if(_loc2_.proxyData.xmasField.getDisplayWeight(this.cardData.animalId) > 1)
         {
            this._card.nail.currentState = "stars";
            this._card.background.currentState = "gold";
         }
         card.topGroup.currentState = "boardGame";
         card.topGroup.startAmountValue = String(_loc2_.proxyData.xmasField.getDisplayWeight(this.cardData.animalId));
      }
      
      override protected function setCardInfo() : void
      {
         super.setCardInfo();
         card.topGroup.star.toolTip = TextResourceModule.getText("zoo.tooltip.events.xmas2012");
      }
      
      override protected function setPrice() : void
      {
         var _loc1_:XMas2012Proxy = super.facade.retrieveProxy(XMas2012Proxy.NAME) as XMas2012Proxy;
         var _loc2_:InventoryProxy = facade.retrieveProxy(InventoryProxy.NAME) as InventoryProxy;
         var _loc3_:XMas2012Proxy = facade.retrieveProxy(XMas2012Proxy.NAME) as XMas2012Proxy;
         var _loc4_:int = this.cardData.animalId;
         var _loc5_:int = _loc1_.proxyData.xmasField.neededAmount;
         var _loc6_:int = int(_loc1_.proxyData.xmasField.displayIdWeight[_loc4_]);
         this.currentPrice = _loc6_ > _loc5_ ? 1 : int(Math.ceil(_loc5_ / _loc6_));
         var _loc7_:int = _loc2_.getAnimalCountById(_loc4_);
         showBuyButton(this.currentPrice,"normal",_loc7_ >= this.currentPrice,true,Categories.ANIMAL,_loc4_);
      }
      
      override protected function handleBuyClicked(param1:CardEvent) : void
      {
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         while(_loc3_ < this.currentPrice)
         {
            _loc2_.push((cards[_loc3_ + 1] as AnimalShopData).uniqueId);
            _loc3_++;
         }
         facade.sendNotification(Note.INVENTORY_PAYIN,[Categories.ANIMAL,_loc2_]);
         card.buyGroup.enabled = false;
      }
      
      override protected function getIds() : Array
      {
         var _loc3_:uint = 0;
         var _loc1_:Array = new Array();
         var _loc2_:XMas2012Proxy = super.facade.retrieveProxy(XMas2012Proxy.NAME) as XMas2012Proxy;
         var _loc4_:int = 0;
         while(_loc4_ < cards.length)
         {
            if(_loc4_ != 0)
            {
               if(_loc3_ >= _loc2_.proxyData.xmasField.neededAmount)
               {
                  break;
               }
               _loc3_ += _loc2_.proxyData.xmasField.getDisplayWeight(this.cardData.animalId);
               _loc1_.push(AnimalShopData(cards[_loc4_]).uniqueId);
            }
            _loc4_++;
         }
         return _loc1_;
      }
   }
}

