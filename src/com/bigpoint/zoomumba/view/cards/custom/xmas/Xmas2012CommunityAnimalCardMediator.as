package com.bigpoint.zoomumba.view.cards.custom.xmas
{
   import com.bigpoint.zoomumba.model.events.xmas.XMas2012Proxy;
   import com.bigpoint.zoorama.data.settings.AnimalShopData;
   import custom.card.core.AbstractCard;
   
   public class Xmas2012CommunityAnimalCardMediator extends AbstractXMas2012CardMediator
   {
      public static const NAME:String = "Xmas2012CommunityAnimalCardMediator_";
      
      public function Xmas2012CommunityAnimalCardMediator(param1:Array)
      {
         super(Xmas2012CommunityAnimalCardMediator.NAME,param1,AbstractXMas2012CardMediator.ANIMAL_MULTIPLAYER);
         this.showPrice = true;
      }
      
      override protected function config(param1:AbstractCard) : void
      {
         super.config(param1);
         var _loc2_:XMas2012Proxy = super.facade.retrieveProxy(XMas2012Proxy.NAME) as XMas2012Proxy;
         if(_loc2_.proxyData.xmasCommunity.getDisplayWeight(this.cardData.animalId) > 1)
         {
            this._card.nail.currentState = "stars";
            this._card.background.currentState = "gold";
         }
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
               if(_loc3_ >= _loc2_.proxyData.xmasCommunity.neededAmount)
               {
                  break;
               }
               _loc3_ += _loc2_.proxyData.xmasCommunity.getDisplayWeight(this.cardData.animalId);
               _loc1_.push(AnimalShopData(cards[_loc4_]).uniqueId);
            }
            _loc4_++;
         }
         return _loc1_;
      }
   }
}

