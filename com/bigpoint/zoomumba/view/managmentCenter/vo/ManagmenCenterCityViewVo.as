package com.bigpoint.zoomumba.view.managmentCenter.vo
{
   public class ManagmenCenterCityViewVo
   {
      public var buildingViewVo:Vector.<ManagmentCenterBuildingViewVo>;
      
      public function ManagmenCenterCityViewVo()
      {
         super();
         this.buildingViewVo = new Vector.<ManagmentCenterBuildingViewVo>();
      }
   }
}

