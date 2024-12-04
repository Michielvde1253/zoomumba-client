package com.bigpoint.zoomumba.model.playfield.vo
{
   public class PlayfieldSettingsVO
   {
      public var uId:int;
      
      public var fId:int;
      
      public var fType:int;
      
      public var fSize:int = 0;
      
      public var attMax:int;
      
      public var att:int;
      
      public var attStatic:int;
      
      public var trashbins:int;
      
      public var trashroads:int;
      
      public var lastPush:int;
      
      public var eBuildingId:int = 1;
      
      public var zooGatePosX:int;
      
      public var zooGatePosY:int;
      
      public var minHorizontal:int;
      
      public var maxHorizontal:int;
      
      public var minVertical:int;
      
      public var maxVertical:int;
      
      public function PlayfieldSettingsVO()
      {
         super();
      }
   }
}

