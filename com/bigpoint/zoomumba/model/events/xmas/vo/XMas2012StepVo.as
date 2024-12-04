package com.bigpoint.zoomumba.model.events.xmas.vo
{
   import flash.geom.Point;
   import mx.core.IVisualElement;
   
   public class XMas2012StepVo
   {
      public var progress:uint;
      
      public var step:uint;
      
      public var putDrop:int;
      
      public var type:int;
      
      public var reward:Xmas2012RewardVo;
      
      public var position:Point;
      
      public var stepReference:IVisualElement;
      
      public function XMas2012StepVo()
      {
         super();
      }
   }
}

