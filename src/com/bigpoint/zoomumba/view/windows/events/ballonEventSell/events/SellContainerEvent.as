package com.bigpoint.zoomumba.view.windows.events.ballonEventSell.events
{
   import com.bigpoint.zoomumba.model.events.ballonEvent.vo.BoardgameDropPackVo;
   import flash.events.Event;
   
   public class SellContainerEvent extends Event
   {
      public static const ON_BUY_ITEM:String = "ON_BUY_ITEM";
      
      private var _data:BoardgameDropPackVo;
      
      public function SellContainerEvent(param1:String, param2:BoardgameDropPackVo)
      {
         super(param1);
         this._data = param2;
      }
      
      override public function clone() : Event
      {
         return new SellContainerEvent(type,this._data);
      }
      
      override public function toString() : String
      {
         return formatToString("SellContainerEvent","type","bubbles","cancelable","eventPhase");
      }
      
      public function get data() : BoardgameDropPackVo
      {
         return this._data;
      }
   }
}

