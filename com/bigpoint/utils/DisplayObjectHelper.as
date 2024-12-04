package com.bigpoint.utils
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.display.Stage;
   
   public class DisplayObjectHelper
   {
      private static var debugPosition:DebugPosition;
      
      private static var _debugStage:Stage;
      
      public function DisplayObjectHelper()
      {
         super();
      }
      
      public static function addChild(param1:DisplayObjectContainer, param2:DisplayObject) : void
      {
         if(Boolean(param2) && Boolean(param1))
         {
            if(!param1.contains(param2))
            {
               param1.addChild(param2);
            }
         }
      }
      
      public static function removeChild(param1:DisplayObjectContainer, param2:DisplayObject) : void
      {
         if(Boolean(param2) && Boolean(param1))
         {
            if(param1.contains(param2))
            {
               param1.removeChild(param2);
            }
         }
      }
      
      public static function removeChildByName(param1:DisplayObjectContainer, param2:String) : void
      {
         var _loc3_:DisplayObject = null;
         if(param1)
         {
            _loc3_ = null;
            _loc3_ = param1.getChildByName(param2);
            if(_loc3_)
            {
               param1.removeChild(_loc3_);
            }
         }
      }
      
      public static function removeChildren(param1:Sprite) : void
      {
         var _loc3_:DisplayObject = null;
         var _loc2_:int = 0;
         while(_loc2_ < param1.numChildren)
         {
            _loc3_ = param1.getChildAt(_loc2_);
            param1.removeChild(_loc3_);
            _loc2_++;
         }
      }
      
      public static function debugVisualProperties(param1:DisplayObject, param2:Boolean = true) : void
      {
         if(debugPosition == null)
         {
            debugPosition = new DebugPosition(_debugStage);
         }
         else if(param2)
         {
            debugPosition.toggle();
         }
         debugPosition.target = param1;
      }
      
      public static function set debugStage(param1:Stage) : void
      {
         _debugStage = param1;
      }
   }
}

import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.display.Stage;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.text.TextFieldType;

class DebugPosition
{
   private var debugPanel:Sprite;
   
   private var _target:DisplayObject;
   
   private var inputX:Sprite;
   
   private var inputY:Sprite;
   
   private var inputH:Sprite;
   
   private var inputW:Sprite;
   
   private var debugStage:Stage;
   
   public function DebugPosition(param1:Stage)
   {
      super();
      this.debugStage = param1;
   }
   
   public function set target(param1:DisplayObject) : void
   {
      this._target = param1;
      this.updateData();
   }
   
   public function toggle() : void
   {
      this.debugPanel.visible = !this.debugPanel.visible;
   }
   
   private function updateData(... rest) : void
   {
      if(this._target)
      {
         if(this.debugPanel == null)
         {
            this.buildDebugPanel();
         }
         this._target.x = Number((this.inputX.getChildByName("$txtInput") as TextField).text);
         this._target.y = Number((this.inputY.getChildByName("$txtInput") as TextField).text);
         this._target.width = Number((this.inputW.getChildByName("$txtInput") as TextField).text);
         this._target.height = Number((this.inputH.getChildByName("$txtInput") as TextField).text);
      }
   }
   
   private function buildDebugPanel() : void
   {
      var dragArea:Sprite;
      this.debugPanel = new Sprite();
      this.debugPanel.x = this.debugPanel.y = 10;
      dragArea = new Sprite();
      dragArea.addEventListener(MouseEvent.MOUSE_DOWN,function(param1:MouseEvent):void
      {
         debugPanel.startDrag();
      });
      dragArea.addEventListener(MouseEvent.MOUSE_UP,function(param1:MouseEvent):void
      {
         debugPanel.stopDrag();
      });
      this.debugPanel.addChild(dragArea);
      this.inputX = this.createInpuText("x:",this._target.x,this.updateData);
      this.inputX.y = 10;
      this.inputY = this.createInpuText("y:",this._target.y,this.updateData);
      this.inputY.y = this.inputX.y + this.inputX.height + 10;
      this.inputX.x = this.inputY.x = 10;
      this.inputW = this.createInpuText("w:",this._target.width,this.updateData);
      this.inputW.y = 10;
      this.inputH = this.createInpuText("h:",this._target.height,this.updateData);
      this.inputH.y = this.inputW.y + this.inputW.height + 10;
      this.inputW.x = this.inputH.x = this.inputX.x + this.inputX.width + 10;
      this.debugPanel.addChild(this.inputX);
      this.debugPanel.addChild(this.inputY);
      this.debugPanel.addChild(this.inputW);
      this.debugPanel.addChild(this.inputH);
      dragArea.graphics.beginFill(13421772,0.6);
      dragArea.graphics.drawRect(0,0,this.debugPanel.width + 20,this.debugPanel.height + 20);
      dragArea.graphics.endFill();
      this.debugStage.addChild(this.debugPanel);
   }
   
   private function createInpuText(param1:String, param2:int, param3:Function) : Sprite
   {
      var _loc4_:Sprite = new Sprite();
      var _loc5_:TextField = new TextField();
      _loc5_.text = param1;
      _loc5_.name = "$txtLabel";
      _loc5_.width = 15;
      _loc5_.height = 20;
      _loc5_.selectable = false;
      _loc5_.defaultTextFormat = _loc5_.defaultTextFormat;
      _loc4_.addChild(_loc5_);
      _loc5_ = new TextField();
      _loc5_.text = String(param2);
      _loc5_.name = "$txtInput";
      _loc5_.border = true;
      _loc5_.backgroundColor = 13421772;
      _loc5_.background = true;
      _loc5_.type = TextFieldType.INPUT;
      _loc5_.width = 40;
      _loc5_.height = 20;
      _loc5_.selectable = true;
      _loc5_.x = 15;
      _loc5_.addEventListener(KeyboardEvent.KEY_UP,param3);
      _loc4_.addChild(_loc5_);
      return _loc4_;
   }
}
