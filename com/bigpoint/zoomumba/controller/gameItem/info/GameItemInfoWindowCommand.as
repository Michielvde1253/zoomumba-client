package com.bigpoint.zoomumba.controller.gameItem.info
{
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.constants.items.ItemInternalTypes;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoorama.data.settings.InheritedShopData;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class GameItemInfoWindowCommand extends SimpleCommand
   {
      public function GameItemInfoWindowCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:InheritedShopData = param1.getBody() as InheritedShopData;
         switch(_loc2_.internalType)
         {
            case ItemInternalTypes.ANIMAL:
               facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.ITEM_INFO_ANIMAL_WINDOW,"",_loc2_));
               break;
            case ItemInternalTypes.SPECIE:
               facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.ITEM_INFO_SPECIE_WINDOW,"",_loc2_));
               break;
            case ItemInternalTypes.FRIEND:
               facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.FRIEND_INFO_WINDOW,"",_loc2_));
               break;
            case ItemInternalTypes.FRIEND_RECEIVED:
            case ItemInternalTypes.FRIEND_SENT:
               facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.FRIEND_INFO_WINDOW,"",_loc2_));
               break;
            case ItemInternalTypes.MATERIAL:
               facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.ITEM_INFO_MATERIAL_WINDOW,"",_loc2_));
               break;
            default:
               facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.ITEM_INFO_BASE_WINDOW,"",_loc2_));
         }
      }
   }
}

