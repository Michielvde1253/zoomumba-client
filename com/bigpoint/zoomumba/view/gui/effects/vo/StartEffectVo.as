package com.bigpoint.zoomumba.view.gui.effects.vo
{
   public class StartEffectVo
   {
      public var effectName:String = "";
      
      public var effectTime:int = 0;
      
      public function StartEffectVo(param1:String, param2:int = 20)
      {
         super();
         this.effectName = param1;
         this.effectTime = param2;
      }
   }
}

