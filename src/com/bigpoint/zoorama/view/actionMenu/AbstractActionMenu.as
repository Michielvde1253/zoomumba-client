package com.bigpoint.zoorama.view.actionMenu
{
   import com.bigpoint.zoorama.view.field.items.ItemAbstract;
   import flash.display.Sprite;
   
   public class AbstractActionMenu extends Sprite
   {
      protected var _menuType:int = -1;
      
      protected var _mustMoveIfNotFitsRight:Boolean = false;
      
      protected var _moveLeftBy:int = 0;
      
      protected var _mustMoveIfNotFitsLeft:Boolean = false;
      
      protected var _moveRightBy:int = 0;
      
      public function AbstractActionMenu()
      {
         super();
      }
      
      public function close() : void
      {
         throw Error("AbstractActionMenu - Override :  public function close():void {");
      }
      
      public function setTargetItem(param1:ItemAbstract) : void
      {
         throw Error("AbstractActionMenu - Override :  public function setTargetItem(item:ItemAbstract):void {");
      }
      
      public function get menuType() : int
      {
         return this._menuType;
      }
      
      public function get mustMoveIfNotFitsRight() : Boolean
      {
         return this._mustMoveIfNotFitsRight;
      }
      
      public function get moveLeftBy() : int
      {
         return this._moveLeftBy;
      }
      
      public function get mustMoveIfNotFitsLeft() : Boolean
      {
         return this._mustMoveIfNotFitsLeft;
      }
      
      public function get moveRightBy() : int
      {
         return this._moveRightBy;
      }
   }
}

