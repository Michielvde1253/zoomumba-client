package com.bigpoint.zoomumba.controller.features.babyCaravan
{
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.features.babyCaravan.BabyCaravanProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.information.InformationInitParams;
   import com.bigpoint.zoorama.utils.configModules.TextReplace;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.view.field.PlayField;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class BabyCaravanEventEndCommand extends SimpleCommand
   {
      public function BabyCaravanEventEndCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:BabyCaravanProxy = facade.retrieveProxy(BabyCaravanProxy.NAME) as BabyCaravanProxy;
         var _loc3_:PlayField = facade.retrieveMediator(PlayField.NAME) as PlayField;
         _loc2_.eventFinished();
         _loc3_.removeParkingLotItem(PlayField.BABY_CARAVAN_UID);
         var _loc4_:String = _loc2_.animalName;
         var _loc5_:Vector.<TextReplace> = new Vector.<TextReplace>();
         _loc5_.push(new TextReplace("%species%",_loc4_));
         var _loc6_:String = TextResourceModule.getTextReplaced("zoo.event.caravan.end",_loc5_);
         sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.BABY_CARAVAN_INFO_WINDOW,"",new InformationInitParams(TextResourceModule.getText("zoo.window.construction.info"),_loc6_)));
      }
   }
}

