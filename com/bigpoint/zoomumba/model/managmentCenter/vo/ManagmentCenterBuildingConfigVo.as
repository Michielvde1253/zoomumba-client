package com.bigpoint.zoomumba.model.managmentCenter.vo
{
   public class ManagmentCenterBuildingConfigVo
   {
      public var userLevelRequired:int = 0;
      
      public var buyable:Boolean = false;
      
      public var levelConfig:Vector.<ManagmentCenterLevelConfigVo>;
      
      public var id:String = "";
      
      public function ManagmentCenterBuildingConfigVo()
      {
         super();
         this.levelConfig = new Vector.<ManagmentCenterLevelConfigVo>();
      }
   }
}

