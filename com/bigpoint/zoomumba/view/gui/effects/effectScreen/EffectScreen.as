package com.bigpoint.zoomumba.view.gui.effects.effectScreen
{
   import com.bigpoint.zoomumba.view.gui.effects.vo.PlayFieldEffectVo;
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class EffectScreen extends MovieClip
   {
      private var _id:String;
      
      private var _displayItem:MovieClip;
      
      private var _playFieldEffectVo:PlayFieldEffectVo;
      
      private var _topLeft:MovieClip;
      
      private var _topRight:MovieClip;
      
      private var _buttomLeft:MovieClip;
      
      private var _buttomRight:MovieClip;
      
      private var _displayMain:MovieClip;
      
      public function EffectScreen(param1:String, param2:MovieClip, param3:PlayFieldEffectVo)
      {
         super();
         this._playFieldEffectVo = param3;
         if(param2.main_display_mc)
         {
            this._displayMain = param2.main_display_mc;
            addChild(this._displayMain);
         }
         if(param2.top_left_mc)
         {
            this._topLeft = param2.top_left_mc;
            addChild(this._topLeft);
         }
         if(param2.buttom_left_mc)
         {
            this._buttomLeft = param2.buttom_left_mc;
            addChild(this._buttomLeft);
         }
         if(param2.buttom_right_mc)
         {
            this._buttomRight = param2.buttom_right_mc;
            addChild(this._buttomRight);
         }
         if(param2.top_right_mc)
         {
            this._topRight = param2.top_right_mc;
            addChild(this._topRight);
         }
      }
      
      public function update(param1:Point) : void
      {
         if(this._displayMain)
         {
            this._displayMain.width = param1.x;
            this._displayMain.height = param1.y;
         }
         if(this._topLeft)
         {
            this._displayMain.x = 0;
            this._displayMain.y = 0;
         }
         if(this._buttomLeft)
         {
            this._buttomLeft.x = 0;
            this._buttomLeft.y = Number(param1.y - this._buttomLeft.height);
         }
         if(this._buttomRight)
         {
            this._buttomRight.x = Number(param1.x - this._buttomRight.width);
            this._buttomRight.y = Number(param1.y - this._buttomRight.height);
         }
         if(this._topRight)
         {
            this._topRight.x = Number(param1.x - this._topRight.width);
            this._topRight.y = 0;
         }
      }
      
      public function get playFieldEffectVo() : PlayFieldEffectVo
      {
         return this._playFieldEffectVo;
      }
   }
}

