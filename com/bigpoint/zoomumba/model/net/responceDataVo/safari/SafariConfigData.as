package com.bigpoint.zoomumba.model.net.responceDataVo.safari
{
   public class SafariConfigData
   {
      public var jokerConfig:Vector.<SafariJokerConfigData> = new Vector.<SafariJokerConfigData>();
      
      public var gasPrice:int;
      
      public var skipTimerPrice:int;
      
      public var regionLevels:Vector.<int>;
      
      public var startingFuel:Vector.<StartingFuelData>;
      
      public var easyTileXPReward:int = 100;
      
      public var hardTileXPReward:int = 200;
      
      public var animalTileXPReward:int = 800;
      
      public var treasureTileXPReward:int = 400;
      
      public function SafariConfigData()
      {
         super();
      }
   }
}

