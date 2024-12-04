package com.bigpoint.zoomumba.view.features.map.config
{
   import com.bigpoint.zoomumba.constants.MAPOVERVIEW;
   import com.bigpoint.zoomumba.constants.PlayFieldsTypes;
   import com.bigpoint.zoomumba.view.features.map.config.vo.MapZooConfigVo;
   
   public class MapConfig
   {
      private var _configList:Vector.<MapZooConfigVo>;
      
      public function MapConfig()
      {
         var _loc1_:MapZooConfigVo = null;
         super();
         this._configList = new Vector.<MapZooConfigVo>();
         _loc1_ = new MapZooConfigVo();
         _loc1_.id = PlayFieldsTypes.FIELD_TYPE_NOT_SET;
         _loc1_.level = -1;
         _loc1_.extensionLevel = -1;
         _loc1_.cost = -1;
         _loc1_.assetName = MAPOVERVIEW.MC_MANAGMENT_CENTER;
         _loc1_.extensionFrom = PlayFieldsTypes.FIELD_TYPE_NOT_SET;
         _loc1_.tooltipId = "zoo.tooltip.mainBuildingUI.mcenter";
         this._configList.push(_loc1_);
         _loc1_ = new MapZooConfigVo();
         _loc1_.id = PlayFieldsTypes.FIELD_TYPE_MAIN_ZOO;
         _loc1_.level = -1;
         _loc1_.extensionLevel = -1;
         _loc1_.cost = -1;
         _loc1_.assetName = MAPOVERVIEW.MC_MAIN_ZOO;
         _loc1_.extensionFrom = PlayFieldsTypes.FIELD_TYPE_MAIN_ZOO;
         _loc1_.tooltipId = "zoo.tooltip.sign.mainZoo.return";
         this._configList.push(_loc1_);
         _loc1_ = new MapZooConfigVo();
         _loc1_.id = PlayFieldsTypes.FIELD_TYPE_FORGOTTEN_ZOO;
         _loc1_.level = -1;
         _loc1_.extensionLevel = 3;
         _loc1_.cost = 150;
         _loc1_.assetName = MAPOVERVIEW.MC_FORGOTTEN_ZOO;
         _loc1_.extensionFrom = PlayFieldsTypes.FIELD_TYPE_MAIN_ZOO;
         _loc1_.tooltipId = "zoo.tooltip.mainBuildingUI.ForgottenZoo";
         this._configList.push(_loc1_);
         _loc1_ = new MapZooConfigVo();
         _loc1_.id = PlayFieldsTypes.FIELD_TYPE_NEW_ZOO;
         _loc1_.level = -1;
         _loc1_.extensionLevel = 8;
         _loc1_.cost = 150;
         _loc1_.assetName = MAPOVERVIEW.MC_NEW_ZOO;
         _loc1_.extensionFrom = PlayFieldsTypes.FIELD_TYPE_FORGOTTEN_ZOO;
         _loc1_.tooltipId = "zoo.tooltip.mainBuildingUI.mumsZoo";
         this._configList.push(_loc1_);
         _loc1_ = new MapZooConfigVo();
         _loc1_.id = PlayFieldsTypes.FIELD_TYPE_RIVER_ZOO;
         _loc1_.level = 90;
         _loc1_.cost = 500;
         _loc1_.extensionLevel = -1;
         _loc1_.extensionFrom = -1;
         _loc1_.assetName = MAPOVERVIEW.MC_RIVER_ZOO;
         _loc1_.tooltipId = "zoo.tooltip.mainBuildingUI.fourthZoo";
         this._configList.push(_loc1_);
         _loc1_ = new MapZooConfigVo();
         _loc1_.id = PlayFieldsTypes.FIELD_TYPE_COAST_ZOO;
         _loc1_.level = 15;
         _loc1_.cost = 75;
         _loc1_.extensionLevel = -1;
         _loc1_.extensionFrom = -1;
         _loc1_.assetName = MAPOVERVIEW.MC_COAST_ZOO;
         _loc1_.tooltipId = "zoo.tooltip.mainBuildingUI.coastZoo";
         this._configList.push(_loc1_);
         _loc1_ = new MapZooConfigVo();
         _loc1_.id = PlayFieldsTypes.FIELD_TYPE_OCEANWORLD_ZOO;
         _loc1_.level = 17;
         _loc1_.cost = -1;
         _loc1_.extensionLevel = -1;
         _loc1_.extensionFrom = -1;
         _loc1_.assetName = MAPOVERVIEW.MC_OCEANWORLD_ZOO;
         _loc1_.tooltipId = "zoo.tooltip.mainBuildingUI.oceanZoo";
         this._configList.push(_loc1_);
      }
      
      public function getConfigByAssetName(param1:String) : MapZooConfigVo
      {
         var _loc2_:MapZooConfigVo = null;
         for each(_loc2_ in this._configList)
         {
            if(_loc2_.assetName == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getConfigById(param1:int) : MapZooConfigVo
      {
         var _loc2_:MapZooConfigVo = null;
         for each(_loc2_ in this._configList)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}

