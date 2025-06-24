package com.bigpoint.zoomumba.model.shop.vo
{
   import com.bigpoint.zoomumba.constants.items.ItemInternalTypes;
   
   public class ShopItemOrderVO
   {
      public var internalType:int = -1;
      
      public var itemId:int = -1;
      
      public function ShopItemOrderVO()
      {
         super();
      }
      
      public function set cage(param1:int) : void
      {
         this.internalType = ItemInternalTypes.CAGE;
         this.itemId = param1;
      }
      
      public function set store(param1:int) : void
      {
         this.internalType = ItemInternalTypes.STORE;
         this.itemId = param1;
      }
      
      public function set trashbin(param1:int) : void
      {
         this.internalType = ItemInternalTypes.TRASHBIN;
         this.itemId = param1;
      }
      
      public function set decor(param1:int) : void
      {
         this.internalType = ItemInternalTypes.DECORATION;
         this.itemId = param1;
      }
      
      public function set resource(param1:int) : void
      {
         this.internalType = ItemInternalTypes.RESOURCE;
         this.itemId = param1;
      }
      
      public function set assist(param1:int) : void
      {
         this.internalType = ItemInternalTypes.ASSISTANT;
         this.itemId = param1;
      }
      
      public function set assistId(param1:int) : void
      {
         this.internalType = ItemInternalTypes.ASSISTANT;
         this.itemId = param1;
      }
      
      public function set species(param1:int) : void
      {
         this.internalType = ItemInternalTypes.SPECIE;
         this.itemId = param1;
      }
      
      public function set road(param1:int) : void
      {
         this.internalType = ItemInternalTypes.ROAD;
         this.itemId = param1;
      }
      
      public function set premium(param1:int) : void
      {
         this.internalType = ItemInternalTypes.SPECIAL;
         this.itemId = param1;
      }
      
      public function set halloween(param1:int) : void
      {
         this.internalType = ItemInternalTypes.HALLOWEEN;
         this.itemId = param1;
      }
      
      public function set storage(param1:int) : void
      {
         this.internalType = ItemInternalTypes.DECORATION;
         this.itemId = param1;
      }
      
      public function set expansion(param1:int) : void
      {
         this.internalType = ItemInternalTypes.EXPANSION;
         this.itemId = param1;
      }
      
      public function set powerUp(param1:int) : void
      {
         this.internalType = ItemInternalTypes.POWERUP;
         this.itemId = param1;
      }
      
      public function set nursery(param1:int) : void
      {
         this.internalType = ItemInternalTypes.NURSERY;
         this.itemId = param1;
      }
      
      public function set breedingLab(param1:int) : void
      {
         this.internalType = ItemInternalTypes.BREEDING_LAB;
         this.itemId = param1;
      }
      
      public function set pack(param1:int) : void
      {
         this.internalType = ItemInternalTypes.PACK;
         this.itemId = param1;
      }
      
      public function set surpriseBox(param1:int) : void
      {
         this.internalType = ItemInternalTypes.SUPRISE_BOX;
         this.itemId = param1;
      }
   }
}

