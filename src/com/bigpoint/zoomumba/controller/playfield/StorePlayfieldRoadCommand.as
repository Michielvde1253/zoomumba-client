package com.bigpoint.zoomumba.controller.playfield
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.NET;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class StorePlayfieldRoadCommand extends SimpleCommand
   {
      public function StorePlayfieldRoadCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:int = param1.getBody() as int;
         sendNotification(NET.MOVE_ITEM_FROM_FIELD_TO_INVENTORY,[Categories.ROAD,_loc2_]);
      }
   }
}

