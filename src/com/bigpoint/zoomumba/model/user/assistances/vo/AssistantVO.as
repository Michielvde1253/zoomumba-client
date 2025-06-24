package com.bigpoint.zoomumba.model.user.assistances.vo
{
   public class AssistantVO
   {
      private var _assistId:int = -1;
      
      private var _lifeTime:int = -1;
      
      private var _endTimeStamp:int = 0;
      
      private var _noLayer:int = -1;
      
      public var isActive:Boolean = false;
      
      public function AssistantVO()
      {
         super();
      }
      
      public function showRenewWindow() : void
      {
      }
      
      private function showNextRenewWindow() : void
      {
      }
      
      private function handleAssistanceFinished() : void
      {
      }
      
      private function handleCofirm() : void
      {
      }
      
      private function handleClose() : void
      {
         this.showNextRenewWindow();
      }
      
      private function handleRefuse() : void
      {
         this.showNextRenewWindow();
      }
      
      public function get assistId() : int
      {
         return this._assistId;
      }
      
      public function get lifeTime() : int
      {
         return this._lifeTime;
      }
      
      public function get endTimeStamp() : int
      {
         return this._endTimeStamp;
      }
      
      public function set endTimeStamp(param1:int) : void
      {
         if(param1 != -1)
         {
            this._endTimeStamp = param1;
         }
      }
      
      public function set assistId(param1:int) : void
      {
         this._assistId = param1;
      }
      
      public function set lifeTime(param1:int) : void
      {
         this._lifeTime = param1;
      }
      
      public function get noLayer() : int
      {
         return this._noLayer;
      }
      
      public function set noLayer(param1:int) : void
      {
         this._noLayer = param1;
      }
   }
}

