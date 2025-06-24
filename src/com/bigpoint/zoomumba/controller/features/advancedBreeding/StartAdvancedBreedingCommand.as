package com.bigpoint.zoomumba.controller.features.advancedBreeding
{
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.gameEvents.GlobalEventProxy;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.EventTypes;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.GlobalEventVO;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.model.inventory.InventoryProxy;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import com.bigpoint.zoomumba.model.playfield.advBreed.BreedingLabProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.advancedBreeding.AdvancedBreedingWindowInitParams;
   import com.bigpoint.zoomumba.model.windows.information.InformationInitParams;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class StartAdvancedBreedingCommand extends SimpleCommand
   {
      public function StartAdvancedBreedingCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc12_:GlobalEventVO = null;
         var _loc2_:BreedingLabProxy = facade.retrieveProxy(this.getBreedingLabProxyName(param1.getBody() as AdvancedBreedingWindowInitParams)) as BreedingLabProxy;
         var _loc3_:InventoryProxy = facade.retrieveProxy(InventoryProxy.NAME) as InventoryProxy;
         var _loc4_:ItemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         var _loc5_:NetProxy = facade.retrieveProxy(NetProxy.NAME) as NetProxy;
         var _loc6_:GlobalEventProxy = facade.retrieveProxy(GlobalEventProxy.NAME) as GlobalEventProxy;
         var _loc10_:Array = [];
         if(_loc4_.getAnimalData(_loc2_.selectedAnimals[0]).male == 1)
         {
            _loc8_ = _loc3_.getAnimalUid(_loc2_.selectedAnimals[0]);
            _loc9_ = _loc3_.getAnimalUid(_loc2_.selectedAnimals[1]);
         }
         else
         {
            _loc8_ = _loc3_.getAnimalUid(_loc2_.selectedAnimals[1]);
            _loc9_ = _loc3_.getAnimalUid(_loc2_.selectedAnimals[0]);
         }
         _loc7_ = _loc2_.breedId;
         var _loc11_:int = 0;
         while(_loc11_ < _loc2_.selectedChanceItems.length)
         {
            if(_loc2_.selectedChanceItems[_loc11_])
            {
               _loc10_.push({
                  "type":_loc2_.selectedChanceItems[_loc11_]["category"],
                  "id":_loc2_.selectedChanceItems[_loc11_]["itemId"]
               });
            }
            _loc11_++;
         }
         if(_loc6_.isEventActive(EventTypes.BREEDING_EVENT))
         {
            _loc12_ = _loc6_.getGlobalEvent(EventTypes.BREEDING_EVENT);
            if(_loc12_.endDate - TimeManager.currentTime < _loc2_.selectedBreedingTime)
            {
               sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.INFORMATION,"",new InformationInitParams(TextResourceModule.getText("zoo.window.construction.info"),TextResourceModule.getText("zoo.advancedBreed.layer.startTwinsLate"))));
            }
         }
         _loc2_.fakeRunning();
         sendNotification(Note.REFRESH_ADVANCED_BREEDING_BUILDING);
         _loc5_.callServer(NET.START_ADVANCED_BREEDING_NET,[_loc7_,_loc8_,_loc9_,_loc10_]).addCallbackIfFalse(Note.RESET_ADVANCED_BREEDING_BUILDING).addCallbackIfTrue(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.ADVANCED_BREEDING_PROGRESS_WINDOW,"",_loc7_)).addCallbackIfTrue(Note.MANAGMENTCENTER_REFRESH).sendNow();
      }
      
      private function getBreedingLabProxyName(param1:AdvancedBreedingWindowInitParams) : String
      {
         return BreedingLabProxy.NAME + "_" + param1.categoryId + "_" + param1.uniqueId;
      }
   }
}

