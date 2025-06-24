package com.bigpoint.zoomumba.controller.playfield
{
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoorama.view.field.items.Building;
   import com.bigpoint.zoorama.view.field.items.Cage;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class ItemFromPlayfieldToInventoryCommand extends SimpleCommand
   {
      public function ItemFromPlayfieldToInventoryCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:Building = param1.getBody() as Building;
         var _loc3_:int = _loc2_ is Cage ? (_loc2_ as Cage).level : -1;
         sendNotification(NET.MOVE_ITEM_FROM_FIELD_TO_INVENTORY,[_loc2_.category,_loc2_.uniqueId,_loc3_]);
      }
   }
}

