package com.bigpoint.zoomumba.view.gui.effects.vo
{
   import flash.display.Sprite;
   
   public class PlayFieldEffectViewVo
   {
      public var fieldEffectDisplay:Sprite;
      
      public var frontEffectDisplay:Sprite;
      
      public function PlayFieldEffectViewVo(param1:Sprite, param2:Sprite)
      {
         super();
         this.fieldEffectDisplay = param1;
         this.frontEffectDisplay = param2;
      }
   }
}

