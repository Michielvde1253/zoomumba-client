package com.bigpoint.zoomumba.model.features.fortuneWheel.vo
{
   public class FortuneWheelVO
   {
      private var _isFreeTicketBooked:Boolean = false;
      
      private var _possibleRewards:Vector.<FortuneWheelRewardVO> = new Vector.<FortuneWheelRewardVO>();
      
      private var _ticketCount:int = -1;
      
      private var _wonReward:FortuneWheelRewardVO = new FortuneWheelRewardVO();
      
      public function FortuneWheelVO()
      {
         super();
      }
      
      public function get possibleRewards() : Vector.<FortuneWheelRewardVO>
      {
         return this._possibleRewards;
      }
      
      public function set possibleRewards(param1:Vector.<FortuneWheelRewardVO>) : void
      {
         this._possibleRewards = param1;
      }
      
      public function get wonReward() : FortuneWheelRewardVO
      {
         return this._wonReward;
      }
      
      public function set wonReward(param1:FortuneWheelRewardVO) : void
      {
         this._wonReward = param1;
      }
      
      public function get ticketCount() : int
      {
         return this._ticketCount;
      }
      
      public function set t(param1:int) : void
      {
         this._ticketCount = param1;
      }
      
      public function get isFreeTicketBooked() : Boolean
      {
         return this._isFreeTicketBooked;
      }
      
      public function set ftb(param1:Boolean) : void
      {
         this._isFreeTicketBooked = param1;
      }
   }
}

