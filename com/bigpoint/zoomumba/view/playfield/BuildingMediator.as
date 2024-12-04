package com.bigpoint.zoomumba.view.playfield
{
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoorama.view.field.items.NewBuilding;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.mediator.Mediator;
   
   public class BuildingMediator extends Mediator
   {
      private var name:String = null;
      
      public var catId:int = -1;
      
      public var uniqueId:int = -1;
      
      protected var bitmapsDataStatus:Vector.<BitmapData>;
      
      public function BuildingMediator(param1:String, param2:int, param3:int, param4:NewBuilding)
      {
         this.name = param1;
         this.catId = param2;
         this.uniqueId = param3;
         super(getFullName(param1,param2,param3),param4);
      }
      
      public static function getFullName(param1:String, param2:int, param3:int) : String
      {
         return param1 + "_" + param2 + "_" + param3;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Note.ZOOM_IN,Note.ZOOM_OUT];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case Note.ZOOM_IN:
            case Note.ZOOM_OUT:
               this.refreshStatusIcon();
         }
      }
      
      override public function onRegister() : void
      {
         this.building.addEventListener(this.building.EVENT_NAME_CLICK,this.handleClick);
         this.building.addEventListener(this.building.EVENT_NAME_STAT_ICON_OVER,this.handleStatusIconMouseOver);
         this.building.addEventListener(this.building.EVENT_NAME_STAT_ICON_OUT,this.handleStatusIconMouseOut);
      }
      
      protected function refreshStatusIcon() : void
      {
      }
      
      protected function handleClick(param1:Event) : void
      {
      }
      
      protected function handleStatusIconMouseOver(param1:MouseEvent) : void
      {
      }
      
      protected function handleStatusIconMouseOut(param1:MouseEvent) : void
      {
      }
      
      override public function onRemove() : void
      {
         var _loc1_:BitmapData = null;
         this.building.removeEventListener(this.building.EVENT_NAME_CLICK,this.handleClick);
         this.building.removeEventListener(this.building.EVENT_NAME_STAT_ICON_OVER,this.handleStatusIconMouseOver);
         this.building.removeEventListener(this.building.EVENT_NAME_STAT_ICON_OUT,this.handleStatusIconMouseOut);
         for each(_loc1_ in this.bitmapsDataStatus)
         {
            _loc1_.dispose();
         }
         this.bitmapsDataStatus = null;
      }
      
      protected function get building() : NewBuilding
      {
         return viewComponent as NewBuilding;
      }
   }
}

