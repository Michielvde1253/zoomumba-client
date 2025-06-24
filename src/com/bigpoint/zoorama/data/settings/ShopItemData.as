package com.bigpoint.zoorama.data.settings
{
   import com.bigpoint.utils.ObjectHelper;
   import com.bigpoint.zoomumba.constants.Categories;
   
   public class ShopItemData extends InheritedShopData
   {
      public var linkageId:String = "";
      
      public var countType:String = "";
      
      public var localizedName:String = "";
      
      public var giftable:int = 0;
      
      public var prereqId:int = 0;
      
      public var order:int = 0;
      
      public var count:int = 0;
      
      public var eventId:int = -1;
      
      public var capacity:int = 0;
      
      public var cappedAmount:int = 0;
      
      public var level:int = 0;
      
      public var baseLevel:int = 0;
      
      public var isEvent:int;
      
      public var _availableInZoos:Array = new Array();
      
      public function ShopItemData()
      {
         super();
         categoryId = Categories.CATEGORY_UNDEFINED;
      }
      
      [Transient]
      public function set availableIn(param1:Object) : void
      {
         var _loc2_:String = null;
         for(_loc2_ in param1)
         {
            this._availableInZoos.push(int(param1[_loc2_]));
         }
      }
      
      public function checkAvailabirityInZooId(param1:int) : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:Boolean = false;
         if(this._availableInZoos.length)
         {
            _loc3_ = 0;
            while(_loc3_ < this._availableInZoos.length)
            {
               if(param1 == this._availableInZoos[_loc3_])
               {
                  _loc2_ = true;
                  break;
               }
               _loc3_++;
            }
         }
         else
         {
            _loc2_ = true;
         }
         return _loc2_;
      }
      
      public function clone() : ShopItemData
      {
         var _loc1_:ShopItemData = ObjectHelper.clone(this) as ShopItemData;
         _loc1_._availableInZoos = this._availableInZoos.slice();
         return _loc1_ as ShopItemData;
      }
   }
}

