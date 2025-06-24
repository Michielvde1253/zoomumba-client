package com.bigpoint.zoomumba.model.events.advBreeding
{
   import com.bigpoint.zoomumba.constants.Gender;
   import com.bigpoint.zoomumba.model.app.core.vo.CurrencyVO;
   import com.bigpoint.zoomumba.model.app.items.ItemPackVO;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.model.inventory.InventoryProxy;
   import com.bigpoint.zoorama.data.settings.AnimalShopData;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class AdvBreedingEventProxy extends Proxy
   {
      public static const NAME:String = "AdvBreedingEventProxy";
      
      public var inventoryProxy:InventoryProxy;
      
      public var itemConfigProxy:ItemConfigProxy;
      
      public var currencies:Vector.<ItemPackVO>;
      
      public var rewards:Vector.<ItemPackVO>;
      
      public var selectedCurrencies:Vector.<AnimalShopData>;
      
      public var selectedGender:int = 0;
      
      private var _counterID:int;
      
      private var _totalItemsToTrade:int = 0;
      
      private var priceAnimal:AnimalShopData;
      
      private var rewardAnimal:AnimalShopData;
      
      public function AdvBreedingEventProxy(param1:Object)
      {
         var _loc2_:ItemPackVO = null;
         var _loc5_:Object = null;
         this.currencies = new Vector.<ItemPackVO>(0);
         this.rewards = new Vector.<ItemPackVO>(0);
         super(NAME);
         var _loc3_:Array = param1.currency;
         var _loc4_:Array = param1.reward;
         this._counterID = param1.counterId;
         for each(_loc5_ in _loc3_)
         {
            _loc2_ = new ItemPackVO(_loc5_.id,_loc5_.type);
            _loc2_.amount = _loc5_.amount;
            this._totalItemsToTrade += _loc2_.amount;
            this.currencies.push(_loc2_);
         }
         for each(_loc5_ in _loc4_)
         {
            _loc2_ = new ItemPackVO(_loc5_.id,_loc5_.type);
            _loc2_.count = _loc5_.amount;
            this.rewards.push(_loc2_);
         }
         this.reset();
      }
      
      override public function onRegister() : void
      {
         this.inventoryProxy = facade.retrieveProxy(InventoryProxy.NAME) as InventoryProxy;
         this.itemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
      }
      
      public function get totalItemsToTrade() : int
      {
         return this._totalItemsToTrade;
      }
      
      public function get counterID() : int
      {
         return this._counterID;
      }
      
      public function getCards() : Vector.<Object>
      {
         var _loc1_:Vector.<Object> = new Vector.<Object>();
         switch(this.selectedGender)
         {
            case Gender.MALE:
               this.priceAnimal = this.itemConfigProxy.getMaleAnimalData(this.currencies[0].id);
               this.rewardAnimal = this.itemConfigProxy.getMaleAnimalData(this.rewards[0].id);
               break;
            case Gender.FEMALE:
               this.priceAnimal = this.itemConfigProxy.getFemaleAnimalData(this.currencies[0].id);
               this.rewardAnimal = this.itemConfigProxy.getFemaleAnimalData(this.rewards[0].id);
               break;
            case Gender.CHILD:
               this.priceAnimal = this.itemConfigProxy.getChildAnimalData(this.currencies[0].id);
               this.rewardAnimal = this.itemConfigProxy.getChildAnimalData(this.rewards[0].id);
         }
         _loc1_.push(this.priceAnimal);
         _loc1_.push(this.rewardAnimal);
         return _loc1_;
      }
      
      public function isPrice(param1:AnimalShopData) : Boolean
      {
         return param1 == this.priceAnimal;
      }
      
      public function get canTrade() : Boolean
      {
         var _loc1_:int = -1;
         switch(this.selectedGender)
         {
            case Gender.MALE:
               _loc1_ = this.itemConfigProxy.getMaleAnimalData(this.currencies[0].id).animalId;
               break;
            case Gender.FEMALE:
               _loc1_ = this.itemConfigProxy.getFemaleAnimalData(this.currencies[0].id).animalId;
               break;
            case Gender.CHILD:
               _loc1_ = this.itemConfigProxy.getChildAnimalData(this.currencies[0].id).animalId;
         }
         return this.inInventory(_loc1_);
      }
      
      public function get reward() : CurrencyVO
      {
         var _loc1_:AnimalShopData = null;
         var _loc2_:CurrencyVO = new CurrencyVO();
         switch(this.selectedGender)
         {
            case Gender.MALE:
               _loc1_ = this.itemConfigProxy.getMaleAnimalData(this.rewards[0].id);
               break;
            case Gender.FEMALE:
               _loc1_ = this.itemConfigProxy.getFemaleAnimalData(this.rewards[0].id);
               break;
            case Gender.CHILD:
               _loc1_ = this.itemConfigProxy.getChildAnimalData(this.rewards[0].id);
         }
         _loc2_.amount = 1;
         _loc2_.id = _loc1_.animalId;
         _loc2_.type = _loc1_.categoryId;
         return _loc2_;
      }
      
      public function get selectedUniqueIDs() : Array
      {
         var _loc1_:int = -1;
         switch(this.selectedGender)
         {
            case Gender.MALE:
               _loc1_ = this.itemConfigProxy.getMaleAnimalData(this.currencies[0].id).animalId;
               break;
            case Gender.FEMALE:
               _loc1_ = this.itemConfigProxy.getFemaleAnimalData(this.currencies[0].id).animalId;
               break;
            case Gender.CHILD:
               _loc1_ = this.itemConfigProxy.getChildAnimalData(this.currencies[0].id).animalId;
         }
         return [this.inventoryProxy.getAnimalUid(_loc1_)];
      }
      
      public function reset() : void
      {
         this.selectedCurrencies = new Vector.<AnimalShopData>(this._totalItemsToTrade,true);
      }
      
      private function inInventory(param1:int) : Boolean
      {
         return this.inventoryProxy.getAnimalCountById(param1) > 0;
      }
   }
}

