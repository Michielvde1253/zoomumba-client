package com.bigpoint.zoomumba.model.managmentCenter.events
{
   import com.bigpoint.zoomumba.view.managmentCenter.vo.ManagmentCenterCircusBoxesVo;
   import flash.events.Event;
   
   public class CircusBoxEvent extends Event
   {
      public static var CIRCUS_OPEN_BOX:String = "OpenCircusBox";
      
      private var _dataVo:ManagmentCenterCircusBoxesVo;
      
      private var _uniqueId:int;
      
      public function CircusBoxEvent(param1:String, param2:ManagmentCenterCircusBoxesVo, param3:int, param4:Boolean = false)
      {
         super(param1,param4,false);
         this._dataVo = param2;
         this._uniqueId = param3;
      }
      
      public function get dataVo() : ManagmentCenterCircusBoxesVo
      {
         return this._dataVo;
      }
      
      public function get uniqueId() : int
      {
         return this._uniqueId;
      }
   }
}

