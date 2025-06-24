package com.bigpoint.zoomumba.controller.playfield
{
   import com.bigpoint.zoorama.core.PlayFieldManager;
   import com.bigpoint.zoorama.view.field.items.Building;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class SellItemCommand extends SimpleCommand
   {
      public function SellItemCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:Building = param1.getBody() as Building;
         var _loc3_:PlayFieldManager = facade.retrieveMediator(PlayFieldManager.NAME) as PlayFieldManager;
         _loc3_.sendSellItemNotification(_loc2_);
      }
   }
}

