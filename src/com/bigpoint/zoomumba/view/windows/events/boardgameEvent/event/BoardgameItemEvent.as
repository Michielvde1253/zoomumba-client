package com.bigpoint.zoomumba.view.windows.events.boardgameEvent.event
{
   import flash.events.Event;
   
   public class BoardgameItemEvent extends Event
   {
      public static const ITEM_OVER:String = "itemOver";
      
      public static const ITEM_OUT:String = "itemOut";
      
      private var _amount:int;
      
      private var _stepId:String;
      
      private var _collItemName:String;
      
      public function BoardgameItemEvent(param1:String, param2:int = 0, param3:String = "", param4:String = "")
      {
         super(param1);
         this._amount = param2;
         this._stepId = param3;
         this._collItemName = param4;
      }
      
      override public function clone() : Event
      {
         return new BoardgameItemEvent(type,this._amount,this._stepId,this._collItemName);
      }
      
      public function get amount() : int
      {
         return this._amount;
      }
      
      public function get stepId() : String
      {
         return this._stepId;
      }
      
      public function get collItemName() : String
      {
         return this._collItemName;
      }
   }
}

