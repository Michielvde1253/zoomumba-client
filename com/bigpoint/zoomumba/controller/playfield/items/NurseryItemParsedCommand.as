package com.bigpoint.zoomumba.controller.playfield.items
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.MainConstants;
   import com.bigpoint.zoomumba.constants.SHOP;
   import com.bigpoint.zoomumba.model.app.items.ItemPackVO;
   import com.bigpoint.zoomumba.model.inventory.InventoryProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayFieldProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayfieldSettingsProxy;
   import com.bigpoint.zoomumba.model.playfield.advBreed.NurseryProxy;
   import com.bigpoint.zoomumba.model.playfield.vo.NurseryVO;
   import com.bigpoint.zoorama.core.PlayFieldManager;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class NurseryItemParsedCommand extends SimpleCommand
   {
      public function NurseryItemParsedCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:PlayFieldManager = facade.retrieveMediator(PlayFieldManager.NAME) as PlayFieldManager;
         var _loc3_:PlayFieldProxy = facade.retrieveProxy(PlayFieldProxy.NAME) as PlayFieldProxy;
         var _loc4_:PlayfieldSettingsProxy = facade.getProxy(PlayfieldSettingsProxy);
         var _loc5_:InventoryProxy = facade.retrieveProxy(InventoryProxy.NAME) as InventoryProxy;
         var _loc6_:NurseryVO = Object(param1.getBody())["nursery"] as NurseryVO;
         var _loc7_:int = Object(param1.getBody())["fieldId"] as int;
         var _loc8_:ItemPackVO = new ItemPackVO();
         _loc8_.category = Categories.NURSERY;
         _loc8_.itemId = MainConstants.SPECIAL_NURSERY;
         sendNotification(SHOP.REMOVE_ITEM_FROM_SHOP,_loc8_);
         var _loc9_:NurseryProxy = facade.retrieveProxy(NurseryProxy.NAME) as NurseryProxy;
         if(!_loc9_)
         {
            facade.registerProxy(new NurseryProxy(Categories.NURSERY,_loc6_.uniqueId,_loc6_));
         }
         else
         {
            _loc9_.updateData(_loc6_);
         }
         if(_loc7_ == _loc4_.getCurrentPlayFieldId())
         {
            _loc6_.active = 1;
            _loc2_.setNurseryFields(_loc6_);
         }
         else if(-_loc7_ == _loc4_.getCurrentPlayFieldId())
         {
            _loc2_.setNurseryFields(_loc6_);
         }
         if(_loc6_.del == 1 && _loc6_.inv != 1)
         {
            sendNotification(SHOP.ADD_ITEM_FROM_SHOP,new ItemPackVO(MainConstants.SPECIAL_NURSERY,Categories.NURSERY));
         }
         _loc3_.setItem(_loc6_,_loc7_);
         _loc5_.reload = true;
      }
   }
}

