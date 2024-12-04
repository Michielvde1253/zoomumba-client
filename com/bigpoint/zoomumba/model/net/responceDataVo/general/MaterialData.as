package com.bigpoint.zoomumba.model.net.responceDataVo.general
{
   public class MaterialData
   {
      private var _materialId:int = -1;
      
      private var _isRecyclable:int = -1;
      
      private var _count:int = -1;
      
      private var _maxCount:int = -1;
      
      public function MaterialData()
      {
         super();
      }
      
      public function set id(param1:int) : void
      {
         this._materialId = param1;
      }
      
      public function set cnt(param1:int) : void
      {
         this._count = param1;
      }
      
      public function set mCnt(param1:int) : void
      {
         this._maxCount = param1;
      }
      
      public function set uId(param1:int) : void
      {
      }
      
      public function set isRecyclable(param1:int) : void
      {
         this._isRecyclable = param1;
      }
      
      public function get materialId() : int
      {
         return this._materialId;
      }
      
      public function get count() : int
      {
         return this._count;
      }
      
      public function get maxCount() : int
      {
         return this._maxCount;
      }
      
      public function get isRecyclable() : int
      {
         return this._isRecyclable;
      }
   }
}

