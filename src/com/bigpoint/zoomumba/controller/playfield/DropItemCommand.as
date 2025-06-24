package com.bigpoint.zoomumba.controller.playfield
{
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.items.DraggedItemVO;
   import com.bigpoint.zoomumba.model.events.xmas.XmasProxy;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.model.gameConfig.vo.AnimalSpeciesVO;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.information.InformationInitParams;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class DropItemCommand extends SimpleCommand
   {
      public function DropItemCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:DraggedItemVO = param1.getBody() as DraggedItemVO;
         var _loc3_:XmasProxy = facade.retrieveProxy(XmasProxy.NAME) as XmasProxy;
         var _loc4_:ItemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         var _loc5_:NetProxy = facade.retrieveProxy(NetProxy.NAME) as NetProxy;
         var _loc6_:AnimalSpeciesVO = _loc4_.getShopAnimalSpecieByAnimalId(_loc2_.dragged.itemId);
         if(_loc6_.speciesId == _loc3_.TIER_3_SPECIE)
         {
            if(_loc3_.canPlaceTier3)
            {
               sendNotification(Note.LOCK_SLEIGH);
               _loc5_.callServer(NET.XMAS_GIVE_REINDEED_TO_SANTA_CLAUS,[_loc2_.dragged.uniqueId]).addCallbackIfTrue(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.CHRISTMAS_REWARD_WINDOW,"",_loc3_.sleighLevel())).addCallbackIfTrue(Note.UNLOCK_SLEIGH).addCallbackIfFalse(Note.UNLOCK_SLEIGH).sendNow();
            }
            else
            {
               facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.INFORMATION,"",new InformationInitParams(TextResourceModule.getText("zoo.window.infoLayers.breedInInventory.title"),TextResourceModule.getText("zoo.event.christmas.layer.firstReindeer"))));
            }
            return;
         }
         if(_loc6_.speciesId == _loc3_.TIER_2_SPECIE)
         {
            if(_loc3_.canPlaceTier2)
            {
               sendNotification(Note.LOCK_SLEIGH);
               _loc5_.callServer(NET.XMAS_GIVE_REINDEED_TO_SANTA_CLAUS,[_loc2_.dragged.uniqueId]).addCallbackIfTrue(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.CHRISTMAS_REWARD_WINDOW,"",_loc3_.sleighLevel())).addCallbackIfTrue(Note.UNLOCK_SLEIGH).addCallbackIfFalse(Note.UNLOCK_SLEIGH).sendNow();
            }
            else
            {
               facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.INFORMATION,"",new InformationInitParams(TextResourceModule.getText("zoo.window.infoLayers.breedInInventory.title"),TextResourceModule.getText("zoo.event.christmas.layer.lastReindeer"))));
            }
         }
      }
   }
}

