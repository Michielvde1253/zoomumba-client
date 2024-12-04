package com.bigpoint.zoomumba.view.itemAnimations.vo
{
   import com.bigpoint.zoorama.data.settings.ShopItemData;
   import flash.geom.Point;
   
   public class ShopItemAnimationVo
   {
      public var shopItem:ShopItemData;
      
      public var passition:Point;
      
      public function ShopItemAnimationVo(param1:ShopItemData, param2:Point)
      {
         super();
         this.passition = param2;
         this.shopItem = param1;
      }
   }
}

