package com.bigpoint.zoomumba.controller.playfield.items
{
   import com.bigpoint.zoomumba.model.inventory.InventoryProxy;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.DecorData;
   import com.bigpoint.zoomumba.model.playfield.PlayFieldProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayfieldSettingsProxy;
   import com.bigpoint.zoorama.core.PlayFieldManager;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class DecoItemParsedCommand extends SimpleCommand
   {
      public function DecoItemParsedCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:PlayFieldManager = facade.retrieveMediator(PlayFieldManager.NAME) as PlayFieldManager;
         var _loc3_:InventoryProxy = facade.retrieveProxy(InventoryProxy.NAME) as InventoryProxy;
         var _loc4_:PlayFieldProxy = facade.retrieveProxy(PlayFieldProxy.NAME) as PlayFieldProxy;
         var _loc5_:PlayfieldSettingsProxy = facade.getProxy(PlayfieldSettingsProxy);
         var _loc6_:DecorData = Object(param1.getBody())["deco"] as DecorData;
         var _loc7_:int = Object(param1.getBody())["fieldId"] as int;
         if(_loc7_ == _loc5_.getCurrentPlayFieldId())
         {
            _loc2_.setDecorFields(_loc6_);
         }
         _loc4_.setItem(_loc6_,_loc7_);
         _loc3_.reload = true;
      }
   }
}

