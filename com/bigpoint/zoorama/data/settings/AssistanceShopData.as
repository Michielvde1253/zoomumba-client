package com.bigpoint.zoorama.data.settings
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.items.ItemInternalTypes;
   
   public class AssistanceShopData extends ShopItemData
   {
      private var _lifeTime:Array;
      
      public var assistId:int;
      
      public var alias:String;
      
      public var experienceMod:Number;
      
      public var selectedType:int = 1;
      
      private var _mbuyReal:Array;
      
      public var playfields:Array = [];
      
      public function AssistanceShopData()
      {
         super();
         this._mbuyReal = new Array();
         this._lifeTime = new Array();
         internalType = ItemInternalTypes.ASSISTANT;
         categoryId = Categories.ASSISTANCE;
      }
      
      override public function get itemId() : int
      {
         return this.assistId;
      }
      
      override public function set itemId(param1:int) : void
      {
         this.assistId = param1;
      }
      
      public function set xpMod(param1:Number) : void
      {
         this.experienceMod = param1;
      }
      
      public function set mbuyReal(param1:Object) : void
      {
         var _loc2_:String = null;
         for(_loc2_ in param1)
         {
            this._mbuyReal.push(param1[_loc2_]);
         }
      }
      
      public function get mbuyReal() : Object
      {
         return this._mbuyReal;
      }
      
      public function set lifeTime(param1:Object) : void
      {
         var _loc2_:String = null;
         for(_loc2_ in param1)
         {
            this._lifeTime.push(param1[_loc2_]);
         }
      }
      
      public function get lifeTime() : Object
      {
         return this._lifeTime;
      }
      
      public function get assistLifeTimers() : Array
      {
         return this._lifeTime;
      }
      
      public function get assistBuyReal() : Array
      {
         return this._mbuyReal;
      }
      
      override public function getBuyReal() : int
      {
         return this._mbuyReal[this.selectedType - 1];
      }
   }
}

