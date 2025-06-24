package com.bigpoint.zoomumba.model.managmentCenter.vo
{
   public class ManagmentCenterDataVo
   {
      public var buildingDataVo:Vector.<ManagmentCenterBuildingDataVo>;
      
      public function ManagmentCenterDataVo()
      {
         super();
         this.buildingDataVo = new Vector.<ManagmentCenterBuildingDataVo>();
      }
   }
}

