package com.bigpoint.zoomumba.controller.playfield.cageActions
{
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.EventTypes;
   import com.bigpoint.zoomumba.model.features.collectables.CollectablesProxy;
   import com.bigpoint.zoomumba.model.features.collectables.vo.CollectableItemType;
   import com.bigpoint.zoomumba.model.windows.cageUpgrade.CageUpgradeInitParams;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class CageUpgradeActionCommand extends SimpleCommand
   {
      public function CageUpgradeActionCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc3_:CollectablesProxy = null;
         var _loc2_:CageUpgradeInitParams = param1.getBody() as CageUpgradeInitParams;
         if(!_loc2_)
         {
            throw new Error("The cage upgrade window sent me an empty data object");
         }
         switch(_loc2_.eventId)
         {
            case -1:
               sendNotification(NET.UPGRADE_CAGE,[_loc2_.cageItem.uniqueId]);
               break;
            case EventTypes.BDAY2014_EVENT:
               sendNotification(NET.UPGRADE_EVENT_CAGE,[_loc2_.cageItem.uniqueId,EventTypes.BDAY2014_EVENT]);
               _loc3_ = facade.retrieveProxy(CollectablesProxy.NAME) as CollectablesProxy;
               _loc3_.decreaseCollectableAmount(CollectableItemType.CAKE2014,1);
               break;
            default:
               throw new Error("You are trying to update a cage using a wrong event ID");
         }
      }
   }
}

