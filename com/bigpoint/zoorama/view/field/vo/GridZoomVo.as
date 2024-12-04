package com.bigpoint.zoorama.view.field.vo
{
   import flash.display.BitmapData;
   import flash.display.Sprite;
   
   public class GridZoomVo
   {
      public var zoomLevel:Number;
      
      public var viewArea:BitmapData;
      
      public var viewSpriteArea:Sprite;
      
      public var items:Vector.<GridItemVo>;
      
      public function GridZoomVo(param1:int, param2:int)
      {
         super();
         this.viewArea = new BitmapData(param1,param2,true,16777215);
         this.items = new Vector.<GridItemVo>();
         this.viewSpriteArea = new Sprite();
      }
   }
}

