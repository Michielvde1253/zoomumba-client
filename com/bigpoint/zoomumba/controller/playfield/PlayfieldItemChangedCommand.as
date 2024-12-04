package com.bigpoint.zoomumba.controller.playfield
{
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.features.babyCaravan.BabyCaravanProxy;
   import com.bigpoint.zoomumba.model.inventory.InventoryProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayfieldSettingsProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowParams;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.information.InformationInitParams;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class PlayfieldItemChangedCommand extends SimpleCommand
   {
      public function PlayfieldItemChangedCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc4_:InventoryProxy = null;
         var _loc5_:int = 0;
         var _loc6_:Vector.<Object> = null;
         var _loc7_:int = 0;
         var _loc8_:String = null;
         var _loc2_:PlayfieldSettingsProxy = facade.getProxy(PlayfieldSettingsProxy);
         _loc2_.recalculatePlayfieldsInfo();
         var _loc3_:BabyCaravanProxy = facade.retrieveProxy(BabyCaravanProxy.NAME) as BabyCaravanProxy;
         if(_loc3_.isEventActive)
         {
            _loc4_ = facade.retrieveProxy(InventoryProxy.NAME) as InventoryProxy;
            _loc5_ = _loc4_.getAnimalCountById(_loc3_.childId);
            _loc6_ = _loc3_.rewardsData;
            _loc7_ = _loc3_.maxCurrencyNeeded;
            _loc8_ = _loc3_.animalName;
            if(_loc5_ >= _loc7_ / 2 && _loc7_ != -1 && _loc5_ != _loc3_.lastBabyCount)
            {
               if(_loc3_.canRedeemMore)
               {
                  sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.BABY_CARAVAN_INFO_WINDOW,"",new InformationInitParams(TextResourceModule.getText("zoo.window.construction.info"),TextResourceModule.getText("zoo.event.caravan.getBaby").replace("%species%",_loc8_)),new WindowParams("",null,"",null,WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.BABY_CARAVAN_WINDOW))));
               }
            }
            if(!_loc3_.canRedeemMore && _loc5_ != _loc3_.lastBabyCount && _loc3_.hasLoanedItems)
            {
               sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.BABY_CARAVAN_INFO_WINDOW,"",new InformationInitParams(TextResourceModule.getText("zoo.window.construction.info"),TextResourceModule.getText("zoo.event.caravan.success"))));
               _loc3_.finishEvent();
            }
            _loc3_.lastBabyCount = _loc5_;
         }
      }
   }
}

