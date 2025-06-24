package com.bigpoint.zoomumba.model.visitorWishes.vo
{
   public class VisitorWishesVO
   {
      public var timeOfTheLastWishedFullfilled:int = -1;
      
      public var timeOfTheLastCheckForTrash:int = -1;
      
      public var currentAction:int = 0;
      
      public var currentVisitorId:int = -1;
      
      public function VisitorWishesVO()
      {
         super();
      }
   }
}

