package com.bigpoint.zoomumba.model.events.frog.vo
{
   import com.bigpoint.zoomumba.view.windows.events.frogEvent.components.FrogStepItem;
   import flash.geom.Point;
   
   public class FrogFieldVo
   {
      public var putAmount:uint;
      
      public var putDrop:uint;
      
      public var step:uint;
      
      public var rewards:Vector.<FrogRewardVo>;
      
      public var position:Point;
      
      public var stepReference:FrogStepItem;
      
      public function FrogFieldVo()
      {
         super();
      }
   }
}

