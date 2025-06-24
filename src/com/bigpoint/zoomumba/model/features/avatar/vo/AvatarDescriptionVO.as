package com.bigpoint.zoomumba.model.features.avatar.vo
{
   public class AvatarDescriptionVO
   {
      public var uId:int;
      
      public var fa:int;
      
      public var ha:int;
      
      public var ey:int;
      
      public var mo:int;
      
      public var ht:int;
      
      public var cl:int;
      
      public var gender:int;
      
      private var _bg:int;
      
      public function AvatarDescriptionVO()
      {
         super();
      }
      
      public function get bg() : int
      {
         return this._bg;
      }
      
      public function set bg(param1:int) : void
      {
         this._bg = param1;
         this.gender = this._bg == 1 ? 0 : 1;
      }
   }
}

