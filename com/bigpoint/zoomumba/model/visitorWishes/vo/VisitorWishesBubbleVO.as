package com.bigpoint.zoomumba.model.visitorWishes.vo
{
   import com.bigpoint.zoorama.data.settings.ShopItemData;
   
   public class VisitorWishesBubbleVO
   {
      public var item:ShopItemData = null;
      
      public var visitorId:int = -1;
      
      public var state:int = -1;
      
      public var type:int = -1;
      
      public var heartCount:int = 0;
      
      public var lastAction:int = -1;
      
      public function VisitorWishesBubbleVO()
      {
         super();
      }
      
      public function toString() : String
      {
         return "[VisitorWishesBubbleVO] :: " + "visitorId: " + this.visitorId + "; " + "type: " + this.type + "; " + "state: " + this.state + "; " + "item: " + this.item + "; ";
      }
   }
}

