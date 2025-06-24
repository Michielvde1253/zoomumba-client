package com.bigpoint.zoomumba.model.events.babyEvent.vo
{
   public class BabyEventConfigVO
   {
      public var eventId:int = 3;
      
      public var eventDropId:int = 14;
      
      public var eventBabySpecieId:int = 25;
      
      public var eventBabyAnimalId:int = 72;
      
      public var eventExchange1Cat:int = 16;
      
      public var eventExchange1Id:int = 124;
      
      public var eventExchange2Cat:int = 16;
      
      public var eventExchange2Id:int = 123;
      
      public var eventSliderMin:int = -225;
      
      public var eventSliderMax:int = 225;
      
      public var eventSliderStart:int = 0;
      
      public var eventDisplayValues:Array = [["disp1",11,this.eventBabyAnimalId,"zoo.event.halloween.tooltip.bats"],["disp2",this.eventExchange1Cat,this.eventExchange1Id,"zoo.event.halloween.tooltip.treats"],["disp3",this.eventExchange2Cat,this.eventExchange2Id,"zoo.event.halloween.tooltip.tricks"]];
      
      public var eventButtonValues:Array = [["bt1",11,75,".NOTIFICATION.",0,0],["bt2",11,75,".NOTIFICATION.",0,0],["bt3",11,75,".NOTIFICATION.",0,0],["bt4",11,75,".NOTIFICATION.",0,0],["bt5",11,75,".NOTIFICATION.",0,0],["bt6",11,75,".NOTIFICATION.",0,0]];
      
      public var headerFilename:String = "header_halloweenCaravan";
      
      public var eventInfoTextId:String = "zoo.event.halloween.layer.prizes";
      
      public var eventCageMenuTooltipId:String = "zoo.event.halloween.tooltip.babyToInventory";
      
      public var eventAvatarFileId:String = "BabyEvent";
      
      public var eventAvatarAssetBarBGId:String = "BarBG";
      
      public var eventAvatarAssetBarSliderId:String = "Eye";
      
      public var eventAvatarAssetFocusPatternId:String = "FocusPattern";
      
      public var eventAvatarAssetBarSliderBubbleId:String = "Bubble";
      
      public var eventAvatarAssetBarLiquidId:String = "BarLiquid";
      
      public var eventAvatarAssetBarFrontId:String = "BarScroll";
      
      public var eventAvatarAssetIconId:String = "Lucy";
      
      public var eventAvatarAssetLeftId:String = "Treats";
      
      public var eventAvatarAssetRightId:String = "Tricks";
      
      public function BabyEventConfigVO()
      {
         super();
      }
   }
}

