package com.bigpoint.zoomumba.model.net.responceDataVo.safari
{
   import flash.geom.Point;
   
   public class SafariData
   {
      public var fuelAmmount:int = -2147483648;
      
      public var nextGameTimeStamp:int = -1;
      
      public var gameStarted:int = -1;
      
      public var regeonId:int = -1;
      
      public var jokers:Vector.<int> = null;
      
      public var map:Vector.<Vector.<SafariTileData>> = null;
      
      public var tokenPosition:Point = null;
      
      public var revardData:SafariRewardData = null;
      
      public var error:String = null;
      
      public function SafariData()
      {
         super();
      }
      
      public function set g(param1:int) : void
      {
         this.fuelAmmount = param1;
      }
      
      public function set time(param1:int) : void
      {
         this.nextGameTimeStamp = param1;
      }
      
      public function set running(param1:int) : void
      {
         this.gameStarted = param1;
      }
      
      public function set x(param1:int) : void
      {
         if(!this.tokenPosition)
         {
            this.tokenPosition = new Point(-1,-1);
         }
         this.tokenPosition.x = param1;
      }
      
      public function set y(param1:int) : void
      {
         if(!this.tokenPosition)
         {
            this.tokenPosition = new Point(-1,-1);
         }
         this.tokenPosition.y = param1;
      }
      
      public function set rId(param1:int) : void
      {
         this.regeonId = param1;
      }
      
      public function toString() : String
      {
         return "[SafariData fuelAmmount=" + this.fuelAmmount + " nextGameTimeStamp=" + this.nextGameTimeStamp + " gameStarted=" + this.gameStarted + " jokers=" + this.jokers + " map=" + this.map + " tokenPosition=" + this.tokenPosition + " error=" + this.error + "]";
      }
   }
}

