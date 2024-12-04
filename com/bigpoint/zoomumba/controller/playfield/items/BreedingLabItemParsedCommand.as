package com.bigpoint.zoomumba.controller.playfield.items
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.MainConstants;
   import com.bigpoint.zoomumba.constants.SHOP;
   import com.bigpoint.zoomumba.model.app.items.ItemPackVO;
   import com.bigpoint.zoomumba.model.inventory.InventoryProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayFieldProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayfieldSettingsProxy;
   import com.bigpoint.zoomumba.model.playfield.advBreed.BreedingLabProxy;
   import com.bigpoint.zoomumba.model.playfield.vo.BreedingLabVO;
   import com.bigpoint.zoorama.core.PlayFieldManager;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class BreedingLabItemParsedCommand extends SimpleCommand
   {
      public function BreedingLabItemParsedCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc6_:BreedingLabVO = null;
         var _loc2_:PlayFieldManager = facade.retrieveMediator(PlayFieldManager.NAME) as PlayFieldManager;
         var _loc3_:PlayFieldProxy = facade.retrieveProxy(PlayFieldProxy.NAME) as PlayFieldProxy;
         var _loc4_:PlayfieldSettingsProxy = facade.getProxy(PlayfieldSettingsProxy);
         var _loc5_:InventoryProxy = facade.retrieveProxy(InventoryProxy.NAME) as InventoryProxy;
         _loc6_ = Object(param1.getBody())["breedingLab"] as BreedingLabVO;
         var _loc7_:int = Object(param1.getBody())["fieldId"] as int;
         var _loc8_:ItemPackVO = new ItemPackVO();
         _loc8_.category = Categories.BREEDING_LAB;
         _loc8_.itemId = MainConstants.SPECIAL_BREEDING_LAB;
         sendNotification(SHOP.REMOVE_ITEM_FROM_SHOP,_loc8_);
         var _loc9_:BreedingLabProxy = facade.retrieveProxy(BreedingLabProxy.NAME + "_" + Categories.BREEDING_LAB + "_" + _loc6_.uniqueId) as BreedingLabProxy;
         if(!_loc9_)
         {
            facade.registerProxy(new BreedingLabProxy(Categories.BREEDING_LAB,_loc6_.uniqueId,_loc6_));
         }
         else
         {
            _loc9_.updateData(_loc6_);
         }
         if(_loc7_ == _loc4_.getCurrentPlayFieldId())
         {
            _loc6_.active = 1;
            _loc2_.setBreedingLabFields(_loc6_);
         }
         else if(-_loc7_ == _loc4_.getCurrentPlayFieldId())
         {
            _loc2_.setBreedingLabFields(_loc6_);
         }
         if(_loc6_.del == 1 && _loc6_.inv != 1)
         {
            sendNotification(SHOP.ADD_ITEM_FROM_SHOP,new ItemPackVO(MainConstants.SPECIAL_BREEDING_LAB,Categories.BREEDING_LAB));
         }
         _loc3_.setItem(_loc6_,_loc7_);
         _loc5_.reload = true;
      }
   }
}

