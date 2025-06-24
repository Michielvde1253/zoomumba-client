package com.bigpoint.zoomumba.model.events.frog.vo
{
   import flash.geom.Point;
   import mx.core.IVisualElement;
   
   public class FrogRewardVo
   {
      public var amount:Number;
      
      public var id:uint;
      
      public var type:String;
      
      public var position:Point;
      
      public var itemReference:IVisualElement;
      
      public function FrogRewardVo()
      {
         super();
      }
   }
}

