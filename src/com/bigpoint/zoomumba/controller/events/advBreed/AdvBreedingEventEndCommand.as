package com.bigpoint.zoomumba.controller.events.advBreed
{
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.events.advBreeding.AdvBreedingEventProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoorama.view.field.PlayField;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class AdvBreedingEventEndCommand extends SimpleCommand
   {
      public function AdvBreedingEventEndCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:AdvBreedingEventProxy = facade.retrieveProxy(AdvBreedingEventProxy.NAME) as AdvBreedingEventProxy;
         var _loc3_:PlayField = facade.retrieveMediator(PlayField.NAME) as PlayField;
         _loc3_.removeParkingLotItem(PlayField.ADV_BREED_VAN_UID);
         sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(WindowTypes.ADV_BREEDING_EVENT_WINDOW));
         sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.ADV_BREEDING_EVENT_ENDED_WINDOW));
      }
   }
}

