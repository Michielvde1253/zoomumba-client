package com.bigpoint.zoomumba.model.events.easter.vo
{
   import com.bigpoint.zoomumba.view.windows.events.easter.components.EasterStepItem;
   import flash.geom.Point;
   
   public class EasterFieldVo
   {
      public var putAmount:uint;
      
      public var putEgg:uint;
      
      public var step:uint;
      
      public var rewards:Vector.<EasterRewardVo>;
      
      public var position:Point;
      
      public var stepReference:EasterStepItem;
      
      public function EasterFieldVo()
      {
         super();
      }
   }
}

