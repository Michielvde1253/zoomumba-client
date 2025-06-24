package com.bigpoint.zoorama.utils.items
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoorama.data.settings.AnimalShopData;
   import com.bigpoint.zoorama.data.settings.ShopItemData;
   import com.bigpoint.zoorama.utils.configModules.ConfigurationModule;
   import com.bigpoint.zoorama.view.field.items.Building;
   import com.bigpoint.zoorama.view.field.items.Cage;
   
   public class BuildingHelper
   {
      public function BuildingHelper()
      {
         super();
      }
      
      public static function getSellPrice(param1:Building, param2:ShopItemData) : Number
      {
         var _loc4_:Cage = null;
         var _loc5_:AnimalShopData = null;
         var _loc6_:AnimalShopData = null;
         var _loc7_:AnimalShopData = null;
         var _loc3_:Number = param2.getSellVirtual();
         if(param1.category == Categories.CAGE)
         {
            _loc4_ = Cage(param1);
            if(_loc4_.adultCount > 0)
            {
               if(_loc4_.childCount > 0)
               {
                  _loc5_ = ConfigurationModule.getInstance().getChildAnimalData(_loc4_.speciesId);
                  _loc3_ += _loc4_.childCount * _loc5_.getSellVirtual();
               }
               if(_loc4_.maleCount > 0)
               {
                  _loc6_ = ConfigurationModule.getInstance().getMaleAnimalData(_loc4_.speciesId);
                  _loc3_ += _loc4_.maleCount * _loc6_.getSellVirtual();
               }
               if(_loc4_.femaleCount > 0)
               {
                  _loc7_ = ConfigurationModule.getInstance().getFemaleAnimalData(_loc4_.speciesId);
                  _loc3_ += _loc4_.femaleCount * _loc7_.getSellVirtual();
               }
            }
         }
         return _loc3_;
      }
   }
}

