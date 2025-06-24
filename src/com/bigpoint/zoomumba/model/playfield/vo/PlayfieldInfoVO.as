package com.bigpoint.zoomumba.model.playfield.vo
{
   public class PlayfieldInfoVO
   {
      public static const ATT_MAX_PERCENTAGE:int = 150;
      
      public var maxAttraction:int = 0;
      
      public var staticAttraction:int = 0;
      
      public var currentAttraction:int = 0;
      
      public var fieldAttraction:int = 0;
      
      public var fieldMaxAttraction:int = 0;
      
      public var fieldCurrentAttraction:int = 0;
      
      public var storesMoney:int = 0;
      
      public function PlayfieldInfoVO()
      {
         super();
      }
      
      public function reset() : void
      {
         this.maxAttraction = 0;
         this.staticAttraction = 0;
         this.currentAttraction = 0;
         this.fieldAttraction = 0;
         this.fieldMaxAttraction = 0;
         this.fieldCurrentAttraction = 0;
         this.storesMoney = 0;
      }
   }
}

