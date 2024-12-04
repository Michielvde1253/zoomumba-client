package com.bigpoint.zoomumba.view.gui.event.vo
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class BallonTypeVo
   {
      public var id:String;
      
      public var type:int = -1;
      
      public var displayObject:MovieClip;
      
      public var startinSeconds:int;
      
      public var maxCoord:Point = new Point();
      
      public var sounds:Vector.<String> = new Vector.<String>();
      
      public function BallonTypeVo()
      {
         super();
      }
   }
}

