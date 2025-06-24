package com.bigpoint.zoorama.notices.itemDrop
{
   import com.bigpoint.utils.notificator.Notice;
   import com.bigpoint.zoorama.view.field.items.Cage;
   import flash.geom.Point;
   
   public class ItemDropNotice extends Notice
   {
      public static const SHOW_DROP:String = "showDrop";
      
      public static const REPOSITION_LAYER:String = "repositionLayer";
      
      protected var _dropType:String;
      
      protected var _actionType:String;
      
      protected var _actionPerc:Number;
      
      protected var _coords:Point;
      
      protected var _target:Cage;
      
      protected var _commandId:int;
      
      protected var _pfX:int = -1;
      
      protected var _pfY:int = -1;
      
      public function ItemDropNotice(param1:String, param2:String, param3:String, param4:Number, param5:Point, param6:Cage, param7:int = -1, param8:int = -1, param9:int = -1)
      {
         super(param1);
         this._dropType = param3;
         this._actionPerc = param4;
         this._coords = param5;
         this._actionType = param2;
         this._target = param6;
         this._pfX = param8;
         this._pfY = param9;
         this.commandId = param7;
      }
      
      public function get dropType() : String
      {
         return this._dropType;
      }
      
      public function get actionPerc() : Number
      {
         return this._actionPerc;
      }
      
      public function get coords() : *
      {
         return this._coords;
      }
      
      public function get pfX() : int
      {
         return this._pfX;
      }
      
      public function set pfX(param1:int) : void
      {
         this._pfX = param1;
      }
      
      public function get pfY() : int
      {
         return this._pfY;
      }
      
      public function set pfY(param1:int) : void
      {
         this._pfY = param1;
      }
      
      public function get actionType() : String
      {
         return this._actionType;
      }
      
      public function set dropType(param1:String) : void
      {
         this._dropType = param1;
      }
      
      public function get target() : Cage
      {
         return this._target;
      }
      
      public function set target(param1:Cage) : void
      {
         this._target = param1;
      }
      
      public function toString() : String
      {
         return "[ItemDropNotice dropType=" + this.dropType + " actionPerc=" + this.actionPerc + " coords=" + this.coords + " pfX=" + this.pfX + " pfY=" + this.pfY + " actionType=" + this.actionType + " target=" + this.target + "]";
      }
      
      public function get commandId() : int
      {
         return this._commandId;
      }
      
      public function set commandId(param1:int) : void
      {
         this._commandId = param1;
      }
   }
}

