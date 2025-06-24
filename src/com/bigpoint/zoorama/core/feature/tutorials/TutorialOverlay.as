package com.bigpoint.zoorama.core.feature.tutorials
{
   import com.greensock.TweenMax;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class TutorialOverlay extends Sprite
   {
      private var _arguments:Array;
      
      private var _enablePlayfield:Boolean;
      
      public function TutorialOverlay()
      {
         super();
      }
      
      public function redrawLayer(param1:Array, param2:Boolean) : void
      {
         this._arguments = param1;
         this._enablePlayfield = param2;
         this.onUpdateOverlay();
         if(stage)
         {
            this.initReszie();
         }
         else
         {
            this.addEventListener(Event.ADDED_TO_STAGE,this.initReszie,false,0,true);
         }
      }
      
      private function initReszie(param1:Event = null) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.initReszie);
         this.stage.removeEventListener(Event.RESIZE,this.onUpdateOverlay);
         this.stage.addEventListener(Event.RESIZE,this.onUpdateOverlay);
      }
      
      private function onUpdateOverlay(param1:Event = null) : void
      {
         var _loc3_:Point = null;
         graphics.clear();
         graphics.beginFill(0,0);
         graphics.drawRect(0,0,stage.stageWidth,stage.stageHeight);
         if(this._enablePlayfield)
         {
            graphics.drawRect(80,20,stage.stageWidth - 160,stage.stageHeight - 120);
         }
         var _loc2_:int = 0;
         while(_loc2_ < this._arguments.length)
         {
            TweenMax.to(this._arguments[_loc2_].object,0.5,{"colorMatrixFilter":{"saturation":1}});
            _loc3_ = this._arguments[_loc2_].object.localToGlobal(new Point());
            graphics.drawCircle(_loc3_.x,_loc3_.y,this._arguments[_loc2_].object.height / 3);
            _loc2_++;
         }
         graphics.endFill();
      }
   }
}

