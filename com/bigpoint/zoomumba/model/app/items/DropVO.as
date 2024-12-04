package com.bigpoint.zoomumba.model.app.items
{
   public class DropVO
   {
      public var petPaws:int = -1;
      
      public var pearls:int = -1;
      
      public var zooDollars:int = -1;
      
      public var collectablePacks:Vector.<ItemPackVO> = new Vector.<ItemPackVO>();
      
      public var eventCollectablePacks:Vector.<ItemPackVO> = new Vector.<ItemPackVO>();
      
      public var eventItemPacks:Vector.<ItemPackVO> = new Vector.<ItemPackVO>();
      
      public function DropVO()
      {
         super();
      }
   }
}

