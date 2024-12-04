package com.bigpoint.zoomumba.view.managmentCenter.vo
{
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.StoreData;
   import flash.display.MovieClip;
   
   public class ManagmentCenterCircusBoxesVo
   {
      public var fieldItemData:StoreData;
      
      public var item_mc:MovieClip;
      
      public function ManagmentCenterCircusBoxesVo(param1:MovieClip, param2:StoreData)
      {
         super();
         this.item_mc = param1;
         this.fieldItemData = param2;
      }
   }
}

