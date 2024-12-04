package com.bigpoint.zoomumba.model.events.xmas
{
   import com.bigpoint.zoomumba.model.app.gameEvents.GlobalEventProxy;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.EventTypes;
   import com.bigpoint.zoomumba.model.features.counter.CounterValuesProxy;
   import com.bigpoint.zoomumba.model.features.counter.vo.CounterValueVO;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.model.gameConfig.vo.AnimalSpeciesVO;
   import com.bigpoint.zoomumba.model.inventory.InventoryProxy;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class XmasProxy extends Proxy
   {
      public static const NAME:String = "XmasProxy";
      
      public const TIER_2_SPECIE:int = 80;
      
      public const TIER_3_SPECIE:int = 81;
      
      private const TIER_2_COUNTER:int = 5;
      
      private const TIER_3_COUNTER:int = 6;
      
      private var reindeers:Array = [239,240,242,243];
      
      private var itemConfigProxy:ItemConfigProxy;
      
      private var counterProxy:CounterValuesProxy;
      
      private var eventProxy:GlobalEventProxy;
      
      public function XmasProxy()
      {
         super(NAME,null);
      }
      
      override public function onRegister() : void
      {
         super.onRegister();
         this.itemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         this.counterProxy = facade.retrieveProxy(CounterValuesProxy.NAME) as CounterValuesProxy;
         this.eventProxy = facade.retrieveProxy(GlobalEventProxy.NAME) as GlobalEventProxy;
      }
      
      public function canPlaceInSleigh(param1:int) : Boolean
      {
         if(this.itemConfigProxy == null)
         {
            this.itemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         }
         var _loc2_:AnimalSpeciesVO = this.itemConfigProxy.getShopAnimalSpecieByAnimalId(param1);
         return (_loc2_.speciesId == this.TIER_2_SPECIE || _loc2_.speciesId == this.TIER_3_SPECIE) && _loc2_.childId != param1;
      }
      
      public function sleighLevel() : int
      {
         if(this.tier2Counter.count == 0)
         {
            return 0;
         }
         if(this.tier2Counter.count > 0 && this.tier2Counter.count < this.tier2Counter.limit.max)
         {
            return this.tier2Counter.count;
         }
         if(this.tier2Counter.count == this.tier2Counter.limit.max && this.tier3Counter.count == 0)
         {
            return this.tier2Counter.count;
         }
         return this.tier2Counter.count + this.tier3Counter.count;
      }
      
      public function getCardsForXmas() : Vector.<Object>
      {
         var _loc1_:Vector.<Object> = new Vector.<Object>();
         var _loc2_:InventoryProxy = facade.retrieveProxy(InventoryProxy.NAME) as InventoryProxy;
         var _loc3_:ItemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         var _loc4_:int = 0;
         while(_loc4_ < this.reindeers.length)
         {
            if(_loc2_.getAnimalCountById(int(this.reindeers[_loc4_])) > 0)
            {
               _loc1_.push(_loc3_.getAnimalData(int(this.reindeers[_loc4_])));
            }
            _loc4_++;
         }
         return _loc1_;
      }
      
      public function get canRedeemTree() : Boolean
      {
         return this.counterProxy.getCounterById(7).count == 0 && this.eventProxy.isEventActive(EventTypes.TREE_REDEEM_EVENT);
      }
      
      public function get showEventGui() : Boolean
      {
         return this.counterProxy.getCounterById(6).count == 0;
      }
      
      public function get canPlaceTier3() : Boolean
      {
         return this.tier2Counter.count == this.tier2Counter.limit.max && this.tier3Counter.count < this.tier3Counter.limit.max;
      }
      
      public function get canPlaceTier2() : Boolean
      {
         return this.tier2Counter.count < this.tier2Counter.limit.max;
      }
      
      public function get tier2Counter() : CounterValueVO
      {
         return this.counterProxy.getCounterById(this.TIER_2_COUNTER);
      }
      
      public function get tier3Counter() : CounterValueVO
      {
         return this.counterProxy.getCounterById(this.TIER_3_COUNTER);
      }
      
      public function get parkingLotTreeId() : int
      {
         return [93,94,94,95,95,96,96,97,97][8];
      }
   }
}

