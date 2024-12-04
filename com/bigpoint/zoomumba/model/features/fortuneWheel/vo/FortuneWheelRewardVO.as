package com.bigpoint.zoomumba.model.features.fortuneWheel.vo
{
   public class FortuneWheelRewardVO
   {
      private var _id:int = -1;
      
      private var _count:int = -1;
      
      private var _category:int = -1;
      
      private var _blueprintId:int = -1;
      
      public function FortuneWheelRewardVO()
      {
         super();
      }
      
      public function get isBlueprint() : Boolean
      {
         return this._blueprintId != -1;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function set category(param1:int) : void
      {
         this._category = param1;
      }
      
      public function set type(param1:int) : void
      {
         this._category = param1;
      }
      
      public function get count() : int
      {
         return this._count;
      }
      
      public function set cnt(param1:int) : void
      {
         this._count = param1;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function set id(param1:int) : void
      {
         this._id = param1;
      }
      
      public function get blueprintId() : int
      {
         return this._blueprintId;
      }
      
      public function set blueprintId(param1:int) : void
      {
         this._blueprintId = param1;
      }
   }
}

