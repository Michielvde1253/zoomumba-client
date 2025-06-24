package com.bigpoint.zoomumba.controller.playfield
{
   import com.bigpoint.zoomumba.constants.MainConstants;
   import com.bigpoint.zoorama.core.PlayFieldManager;
   import com.bigpoint.zoorama.view.field.items.NewBuilding;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class SellPlayfieldNewBuildingCommand extends SimpleCommand
   {
      public function SellPlayfieldNewBuildingCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:NewBuilding = param1.getBody() as NewBuilding;
         var _loc3_:PlayFieldManager = facade.retrieveMediator(PlayFieldManager.NAME) as PlayFieldManager;
         switch(_loc2_.itemId)
         {
            case MainConstants.SPECIAL_NURSERY:
               _loc3_.sendSellItemNotification(_loc2_);
               break;
            case MainConstants.SPECIAL_BREEDING_LAB:
               _loc3_.sendSellItemNotification(_loc2_);
         }
      }
   }
}

