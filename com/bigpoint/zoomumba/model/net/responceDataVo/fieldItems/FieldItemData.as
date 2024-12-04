package com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems
{
   import com.bigpoint.zoorama.core.namespaces.logic;
   
   use namespace logic;
   
   public class FieldItemData
   {
      protected var _category:int = -1;
      
      public var uniqueId:int = -1;
      
      public var useAsTempId:Boolean = true;
      
      public var stateId:int = 0;
      
      public var itemId:int = -1;
      
      public var active:int = -1;
      
      public var posX:int = -2147483648;
      
      public var posY:int = -2147483648;
      
      public var rotatePos:int = -1;
      
      public var visible:Boolean = true;
      
      protected var _del:int = -1;
      
      public var buildTimeStamp:int = -1;
      
      public var inv:int = -1;
      
      public var playFieldId:int = -1;
      
      public function FieldItemData()
      {
         super();
      }
      
      public function toString() : String
      {
         return "FieldItemData:{" + " category:" + this._category + " uniqueId:" + this.uniqueId + " itemId:" + this.itemId + " active:" + this.active + " posX:" + this.posX + " posY:" + this.posY + " buildTimeStamp:" + this.buildTimeStamp + " rotatePos:" + this.rotatePos + " del:" + this.del + " playFieldId:" + this.playFieldId + " inv:" + this.inv + "}";
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      logic function setCategory(param1:int) : void
      {
         this._category = param1;
      }
      
      public function set id(param1:int) : void
      {
         this.uniqueId = param1;
      }
      
      public function set x(param1:int) : void
      {
         this.posX = param1;
      }
      
      public function set y(param1:int) : void
      {
         this.posY = param1;
      }
      
      public function set r(param1:int) : void
      {
         this.rotatePos = param1;
      }
      
      public function set act(param1:int) : void
      {
         this.active = param1;
      }
      
      public function set build(param1:int) : void
      {
         this.buildTimeStamp = param1;
      }
      
      public function get del() : int
      {
         return this._del;
      }
      
      public function set del(param1:int) : void
      {
         this._del = param1;
      }
      
      public function set uId(param1:int) : void
      {
      }
      
      public function set fId(param1:int) : void
      {
         this.playFieldId = param1;
      }
   }
}

