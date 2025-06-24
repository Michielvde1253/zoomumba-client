package com.bigpoint.zoomumba.controller.playfield
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.MainConstants;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoorama.view.field.items.NewBuilding;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class StorePlayfieldNewBuildingCommand extends SimpleCommand
   {
      public function StorePlayfieldNewBuildingCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:NewBuilding = param1.getBody() as NewBuilding;
         switch(_loc2_.itemId)
         {
            case MainConstants.SPECIAL_NURSERY:
               sendNotification(NET.MOVE_ITEM_FROM_FIELD_TO_INVENTORY,[Categories.SPECIALS,_loc2_.uniqueId]);
               break;
            case MainConstants.SPECIAL_BREEDING_LAB:
               sendNotification(NET.MOVE_ITEM_FROM_FIELD_TO_INVENTORY,[Categories.SPECIALS,_loc2_.uniqueId]);
               break;
            case MainConstants.SPECIAL_ROAD:
               sendNotification(NET.MOVE_ITEM_FROM_FIELD_TO_INVENTORY,[Categories.ROAD,_loc2_.uniqueId]);
         }
      }
   }
}

