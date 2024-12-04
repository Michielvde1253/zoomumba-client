package com.bigpoint.zoomumba.model.app.items
{
   import com.bigpoint.utils.ItemTypeHelper;
   
   public class ItemPackVO
   {
      public var packId:int;
      
      public var category:int;
      
      public var itemId:int;
      
      public var level:int = 0;
      
      public var count:Number;
      
      private var counts:Array = new Array();
      
      public function ItemPackVO(param1:int = -1, param2:int = -1)
      {
         super();
         this.itemId = param1;
         this.category = param2;
      }
      
      public function set type(param1:String) : void
      {
         this.category = ItemTypeHelper.typeToCategory(param1);
      }
      
      public function get type() : String
      {
         return ItemTypeHelper.categoryToType(this.category);
      }
      
      public function set id(param1:int) : void
      {
         this.itemId = param1;
      }
      
      public function get id() : int
      {
         return this.itemId;
      }
      
      public function set amount(param1:int) : void
      {
         this.count = param1;
      }
      
      public function get amount() : int
      {
         return this.count;
      }
      
      public function set amounts(param1:Object) : void
      {
         var _loc2_:String = null;
         for(_loc2_ in param1)
         {
            this.counts.push(param1[_loc2_]);
         }
      }
      
      public function get amounts() : Object
      {
         return this.counts;
      }
      
      public function get prices() : Array
      {
         return this.counts;
      }
   }
}

