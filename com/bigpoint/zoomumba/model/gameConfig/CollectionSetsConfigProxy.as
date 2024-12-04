package com.bigpoint.zoomumba.model.gameConfig
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.app.items.ItemVO;
   import com.bigpoint.zoomumba.model.gameConfig.vo.CollectionSetConfigVO;
   import flash.utils.Dictionary;
   import org.puremvc.as3.interfaces.IProxy;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class CollectionSetsConfigProxy extends Proxy implements IProxy
   {
      public static const NAME:String = "CollectionSetsConfigProxy";
      
      private var collectionSetData:Dictionary;
      
      private var collectionSetsByCollectables:Dictionary;
      
      public function CollectionSetsConfigProxy(param1:Dictionary)
      {
         var _loc2_:Vector.<CollectionSetConfigVO> = null;
         var _loc3_:int = 0;
         var _loc4_:CollectionSetConfigVO = null;
         var _loc5_:int = 0;
         var _loc6_:ItemVO = null;
         this.collectionSetData = param1;
         super(NAME,param1);
         this.collectionSetsByCollectables = new Dictionary();
         for each(_loc2_ in param1)
         {
            _loc3_ = 0;
            while(_loc3_ < _loc2_.length)
            {
               _loc4_ = _loc2_[_loc3_];
               _loc5_ = 0;
               while(_loc5_ < _loc4_.collectables.length)
               {
                  _loc6_ = _loc4_.collectables[_loc5_];
                  this.collectionSetsByCollectables[_loc6_.itemId] = _loc4_;
                  _loc5_++;
               }
               _loc3_++;
            }
         }
      }
      
      public function getSetsCount(param1:int) : int
      {
         var _loc2_:int = 0;
         if(this.collectionSetData[param1])
         {
            _loc2_ = int(this.collectionSetData[param1].length);
         }
         else
         {
            sendNotification(Note.WARNING_REPORT,"CollectionSetsConfigProxy.getPageCount > tabCatgoryId : " + param1 + " - data for tabCatgoryId does not exists. ");
         }
         return _loc2_;
      }
      
      public function getSetsItem(param1:int, param2:int) : CollectionSetConfigVO
      {
         var _loc3_:CollectionSetConfigVO = null;
         if(this.collectionSetData[param1])
         {
            if(this.collectionSetData[param1].length > param2)
            {
               _loc3_ = this.collectionSetData[param1][param2];
            }
            else
            {
               sendNotification(Note.WARNING_REPORT,"CollectionSetsConfigProxy.getPageItems > tabCatgoryId : " + param1 + ", pageNr : " + param2 + " - data for pageNr does not exists. ");
            }
         }
         else
         {
            sendNotification(Note.WARNING_REPORT,"CollectionSetsConfigProxy.getPageItems > tabCatgoryId : " + param1 + ", pageNr : " + param2 + " - data for tabCatgoryId does not exists. ");
         }
         return _loc3_;
      }
      
      public function getSetConfigByCollectionId(param1:int) : CollectionSetConfigVO
      {
         var _loc2_:CollectionSetConfigVO = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc3_:int = Math.floor(param1 / 10000);
         var _loc4_:int = param1 % 10000;
         for(_loc5_ in this.collectionSetData)
         {
            for(_loc6_ in this.collectionSetData[_loc5_])
            {
               if(this.collectionSetData[_loc5_][_loc6_].collectionId == param1)
               {
                  return this.collectionSetData[_loc5_][_loc6_];
               }
            }
         }
         return null;
      }
      
      public function getTabCategoryByCollectionId(param1:int) : int
      {
         var _loc2_:CollectionSetConfigVO = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc3_:int = Math.floor(param1 / 10000);
         var _loc4_:int = param1 % 10000;
         for(_loc5_ in this.collectionSetData)
         {
            for(_loc6_ in this.collectionSetData[_loc5_])
            {
               if(this.collectionSetData[_loc5_][_loc6_].setCategory == _loc3_)
               {
                  return int(_loc5_);
               }
            }
         }
         return -1;
      }
      
      public function getAllSetsItemsByTabCategory(param1:int) : Vector.<CollectionSetConfigVO>
      {
         var _loc2_:Vector.<CollectionSetConfigVO> = null;
         if(this.collectionSetData[param1])
         {
            _loc2_ = this.collectionSetData[param1];
         }
         else
         {
            sendNotification(Note.WARNING_REPORT,"CollectionSetsConfigProxy.getPageCount > tabCatgoryId : " + param1 + " - data for tabCatgoryId does not exists. ");
         }
         return _loc2_;
      }
      
      public function getAllSetsItemsByItemCategory(param1:int) : Vector.<CollectionSetConfigVO>
      {
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc2_:Vector.<CollectionSetConfigVO> = null;
         for(_loc3_ in this.collectionSetData)
         {
            for(_loc4_ in this.collectionSetData[_loc3_])
            {
               if(this.collectionSetData[_loc3_][_loc4_].setCategory == param1)
               {
                  return this.collectionSetData[_loc3_];
               }
            }
         }
         if(_loc2_ == null)
         {
            sendNotification(Note.WARNING_REPORT,"CollectionSetsConfigProxy.getPageItems > tabCatgoryId : " + param1 + "data for tabCatgoryId does not exists. ");
         }
         return _loc2_;
      }
      
      public function getCollectionSetByMemberId(param1:int) : CollectionSetConfigVO
      {
         return this.collectionSetsByCollectables[param1];
      }
      
      public function getCollectionDatabySpecieId(param1:int) : Vector.<ItemVO>
      {
         return this.getDropItemIdsByCategorieAndId(Categories.SPECIES,param1);
      }
      
      public function getCollectionDatabyTCategorieAndId(param1:int, param2:int) : Vector.<ItemVO>
      {
         return this.getDropItemIdsByCategorieAndId(param1,param2);
      }
      
      public function getCollectionDatabyCageId(param1:int) : Vector.<ItemVO>
      {
         return this.getDropItemIdsByCategorieAndId(Categories.CAGE,param1);
      }
      
      private function getDropItemIdsByCategorieAndId(param1:int, param2:int) : Vector.<ItemVO>
      {
         var _loc4_:CollectionSetConfigVO = null;
         var _loc3_:Vector.<CollectionSetConfigVO> = this.collectionSetData[param1];
         for each(_loc4_ in _loc3_)
         {
            if(_loc4_.setItemId == param2)
            {
               return _loc4_.collectables;
            }
         }
         return null;
      }
   }
}

