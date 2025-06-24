package com.bigpoint.zoomumba.model.net.responceDataVo.safari
{
   public class SafariTileData
   {
      public static const TERAIN_TYPE_IMPASSABLE:int = 0;
      
      public static const TERAIN_TYPE_EASY:int = 1;
      
      public static const TERAIN_TYPE_HARD:int = 2;
      
      public static const CONTENT_TYPE_EMPTY:int = 0;
      
      public static const CONTENT_TYPE_TRAP:int = 1;
      
      public static const CONTENT_TYPE_TREASURE:int = 2;
      
      public static const CONTENT_TYPE_ANIMAL:int = 3;
      
      public static const CONTENT_TYPE_TRAIL_UP:int = 10;
      
      public static const CONTENT_TYPE_TRAIL_RIGHT:int = 11;
      
      public static const CONTENT_TYPE_TRAIL_DOWN:int = 12;
      
      public static const CONTENT_TYPE_TRAIL_LEFT:int = 13;
      
      public var terainType:int = 0;
      
      public var isOpened:Boolean = false;
      
      public var contentType:int = -1;
      
      public var isMapped:Boolean = false;
      
      public var isVisited:Boolean = false;
      
      public function SafariTileData()
      {
         super();
      }
      
      public function set c(param1:int) : void
      {
         this.contentType = param1;
      }
      
      public function set t(param1:int) : void
      {
         this.terainType = param1;
      }
      
      public function set v(param1:Boolean) : void
      {
         this.isVisited = param1;
      }
      
      public function set o(param1:Boolean) : void
      {
         this.isOpened = param1;
      }
      
      public function set m(param1:Boolean) : void
      {
         this.isMapped = param1;
      }
      
      public function toString() : String
      {
         return "[SafariTileData terainType=" + this.terainType + " isOpened=" + this.isOpened + " contentType=" + this.contentType + " isMapped=" + this.isMapped + "]";
      }
   }
}

