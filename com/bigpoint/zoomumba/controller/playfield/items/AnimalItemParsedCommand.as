package com.bigpoint.zoomumba.controller.playfield.items
{
   import com.bigpoint.zoomumba.model.inventory.InventoryProxy;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.AnimalData;
   import com.bigpoint.zoomumba.model.playfield.PlayFieldProxy;
   import com.bigpoint.zoorama.core.PlayFieldManager;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class AnimalItemParsedCommand extends SimpleCommand
   {
      public function AnimalItemParsedCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:PlayFieldManager = facade.retrieveMediator(PlayFieldManager.NAME) as PlayFieldManager;
         var _loc3_:PlayFieldProxy = facade.retrieveProxy(PlayFieldProxy.NAME) as PlayFieldProxy;
         var _loc4_:InventoryProxy = facade.retrieveProxy(InventoryProxy.NAME) as InventoryProxy;
         var _loc5_:AnimalData = Object(param1.getBody())["animal"] as AnimalData;
         var _loc6_:int = Object(param1.getBody())["fieldId"] as int;
         _loc3_.setItem(_loc5_,_loc6_);
         _loc4_.reload = true;
      }
   }
}

