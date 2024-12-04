package com.bigpoint.zoomumba.controller.playfield.cageActions
{
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.AnimalData;
   import com.bigpoint.zoomumba.model.playfield.PlayFieldProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.gameItem.moveToInventory.AnimalMoveToInventoryWindowInitParams;
   import com.bigpoint.zoorama.view.field.items.Cage;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class CageMoveAnimalToInventoryCommand extends SimpleCommand
   {
      public function CageMoveAnimalToInventoryCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:Cage = param1.getBody() as Cage;
         var _loc3_:PlayFieldProxy = facade.retrieveProxy(PlayFieldProxy.NAME) as PlayFieldProxy;
         var _loc4_:ItemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         var _loc5_:int = int(_loc4_.getShopAnimalSpecie(_loc2_.speciesId).animalIds[2]);
         var _loc6_:Vector.<AnimalData> = _loc3_.getAnimalsFromCage(_loc2_.uniqueId);
         facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.ANIMAL_TO_INVENTORY,"",new AnimalMoveToInventoryWindowInitParams(_loc2_,_loc5_,_loc6_)));
      }
   }
}

