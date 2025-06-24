package com.bigpoint.zoomumba.view.cards.discountInfo
{
   import com.bigpoint.zoomumba.model.app.gameEvents.GlobalEventProxy;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.GlobalEventVO;
   import com.bigpoint.zoomumba.model.gameConfig.vo.AnimalSpeciesVO;
   import com.bigpoint.zoorama.data.settings.AssistanceShopData;
   import com.bigpoint.zoorama.data.settings.CageShopData;
   import com.bigpoint.zoorama.data.settings.DecorShopData;
   import com.bigpoint.zoorama.data.settings.InheritedShopData;
   import com.bigpoint.zoorama.data.settings.ResourceShopData;
   import com.bigpoint.zoorama.data.settings.RoadShopData;
   import com.bigpoint.zoorama.data.settings.StoreShopData;
   import com.bigpoint.zoorama.data.settings.SurpriseBoxShopData;
   import com.bigpoint.zoorama.data.settings.TrashbinShopData;
   import flash.utils.Dictionary;
   import org.puremvc.as3.patterns.facade.Facade;
   
   public class DiscountInfoCalculator
   {
      private var _globalEventProxy:GlobalEventProxy;
      
      private var _itemId:uint;
      
      public function DiscountInfoCalculator(param1:uint)
      {
         super();
         this._itemId = param1;
         this._globalEventProxy = Facade.getInstance().retrieveProxy(GlobalEventProxy.NAME) as GlobalEventProxy;
      }
      
      public function returnDiscountForItem(param1:InheritedShopData, param2:String) : int
      {
         if(param1 is AnimalSpeciesVO)
         {
            return this.calculateDiscountInfo(param2,StoreDiscounts.ANIMAL_SPECIES_DISCOUNT);
         }
         if(param1 is CageShopData)
         {
            return this.calculateDiscountInfo(param2,StoreDiscounts.CAGES_DISCOUNT);
         }
         if(param1 is StoreShopData)
         {
            return this.calculateDiscountInfo(param2,StoreDiscounts.STORES_DISCOUNT);
         }
         if(param1 is DecorShopData)
         {
            return this.calculateDiscountInfo(param2,StoreDiscounts.DECOS_DISCOUNT);
         }
         if(param1 is ResourceShopData)
         {
            return this.calculateDiscountInfo(param2,StoreDiscounts.RESOURCES_DISCOUNT);
         }
         if(param1 is AssistanceShopData)
         {
            return this.calculateDiscountInfo(param2,StoreDiscounts.ASSISTANTS_DISCOUNT);
         }
         if(param1 is SurpriseBoxShopData)
         {
            return this.calculateDiscountInfo(param2,StoreDiscounts.SUPRISE_BOXES_DISCOUNT);
         }
         if(param1 is RoadShopData)
         {
            return this.calculateDiscountInfo(param2,StoreDiscounts.ROADS_DISCOUNT);
         }
         if(param1 is TrashbinShopData)
         {
            return this.calculateDiscountInfo(param2,StoreDiscounts.TRASHBINS_DISCOUNT);
         }
         return 0;
      }
      
      protected function calculateDiscountInfo(param1:String, param2:String) : int
      {
         var _loc3_:Object = null;
         var _loc4_:Object = null;
         var _loc6_:Object = null;
         var _loc8_:GlobalEventVO = null;
         var _loc5_:int = 0;
         var _loc7_:Dictionary = this._globalEventProxy.globalEventList;
         for each(_loc8_ in _loc7_)
         {
            if(this._globalEventProxy.isEventActive(_loc8_.eventId))
            {
               if(_loc8_.affectedActionObject != null && _loc8_.affectedActionObject[param2] != null)
               {
                  _loc3_ = _loc8_.affectedActionObject[param2];
                  _loc4_ = _loc3_[0];
                  if(_loc4_ == null || _loc3_[this._itemId] != null)
                  {
                     _loc4_ = _loc3_[this._itemId];
                  }
                  else
                  {
                     this._itemId = 0;
                  }
                  if(_loc4_ != null && Boolean(_loc4_.hasOwnProperty(param1)))
                  {
                     _loc6_ = _loc4_[param1];
                     if(_loc6_.hasOwnProperty(0))
                     {
                        _loc5_ = int((1 - _loc6_[0]) * 100);
                     }
                     else
                     {
                        _loc5_ = int((1 - Number(_loc6_)) * 100);
                     }
                     break;
                  }
               }
            }
         }
         return _loc5_;
      }
   }
}

