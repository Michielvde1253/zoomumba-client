package com.bigpoint.zoomumba.model.managmentCenter.events
{
   import com.bigpoint.zoomumba.view.managmentCenter.vo.ManagmentCenterBuildingViewVo;
   import flash.events.Event;
   
   public class BuildingEvent extends Event
   {
      public static var CLICK_BUILDING:String = "clickBuilding";
      
      private var _dataVo:ManagmentCenterBuildingViewVo;
      
      public function BuildingEvent(param1:String, param2:ManagmentCenterBuildingViewVo, param3:Boolean = false)
      {
         super(param1,param3,false);
         this._dataVo = param2;
      }
      
      public function get dataVo() : ManagmentCenterBuildingViewVo
      {
         return this._dataVo;
      }
   }
}

