package com.bigpoint.zoomumba.model.managmentCenter.vo
{
   public class ManagmentCenterConfigVo
   {
      public var buildingConfigVo:Vector.<ManagmentCenterBuildingConfigVo>;
      
      public function ManagmentCenterConfigVo()
      {
         super();
         this.buildingConfigVo = new Vector.<ManagmentCenterBuildingConfigVo>();
      }
   }
}

