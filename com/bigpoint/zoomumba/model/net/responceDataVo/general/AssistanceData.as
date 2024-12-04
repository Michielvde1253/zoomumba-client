package com.bigpoint.zoomumba.model.net.responceDataVo.general
{
   public class AssistanceData
   {
      public var assistanceId:int = -1;
      
      public var endTimeStamp:int = -1;
      
      public var noLayer:int = -1;
      
      public function AssistanceData()
      {
         super();
      }
      
      public function set asId(param1:int) : void
      {
         this.assistanceId = param1;
      }
      
      public function set end(param1:int) : void
      {
         this.endTimeStamp = param1;
      }
      
      public function set nL(param1:int) : void
      {
         this.noLayer = param1;
      }
      
      public function toString() : String
      {
         return "AssistanceData{" + "assistanceId:" + this.assistanceId + ", endTimeStamp:" + this.endTimeStamp + "}";
      }
   }
}

