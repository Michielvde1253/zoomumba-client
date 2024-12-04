package com.bigpoint.zoomumba.controller.shop
{
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.inventory.InventoryProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class OpenInventoryOnTabCommand extends SimpleCommand
   {
      public function OpenInventoryOnTabCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:int = param1.getBody() as int;
         var _loc3_:InventoryProxy = facade.retrieveProxy(InventoryProxy.NAME) as InventoryProxy;
         _loc3_.currentTab = _loc2_;
         facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.INVENTORY));
      }
   }
}

