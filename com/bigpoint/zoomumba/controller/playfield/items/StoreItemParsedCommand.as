package com.bigpoint.zoomumba.controller.playfield.items
{
   import com.bigpoint.zoomumba.constants.AppMode;
   import com.bigpoint.zoomumba.constants.PlayFieldsTypes;
   import com.bigpoint.zoomumba.model.app.core.AppProxy;
   import com.bigpoint.zoomumba.model.inventory.InventoryProxy;
   import com.bigpoint.zoomumba.model.managmentCenter.ManagmentCenterProxy;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.StoreData;
   import com.bigpoint.zoomumba.model.playfield.PlayFieldProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayfieldSettingsProxy;
   import com.bigpoint.zoomumba.view.managmentCenter.ManagmentCenterMediator;
   import com.bigpoint.zoorama.core.PlayFieldManager;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class StoreItemParsedCommand extends SimpleCommand
   {
      public function StoreItemParsedCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:PlayFieldManager = facade.retrieveMediator(PlayFieldManager.NAME) as PlayFieldManager;
         var _loc3_:ManagmentCenterMediator = facade.retrieveMediator(ManagmentCenterMediator.NAME) as ManagmentCenterMediator;
         var _loc4_:PlayFieldProxy = facade.retrieveProxy(PlayFieldProxy.NAME) as PlayFieldProxy;
         var _loc5_:PlayfieldSettingsProxy = facade.getProxy(PlayfieldSettingsProxy);
         var _loc6_:InventoryProxy = facade.retrieveProxy(InventoryProxy.NAME) as InventoryProxy;
         var _loc7_:ManagmentCenterProxy = facade.retrieveProxy(ManagmentCenterProxy.NAME) as ManagmentCenterProxy;
         var _loc8_:AppProxy = facade.retrieveProxy(AppProxy.NAME) as AppProxy;
         var _loc9_:StoreData = Object(param1.getBody())["store"] as StoreData;
         var _loc10_:int = Object(param1.getBody())["fieldId"] as int;
         if(-_loc10_ == _loc5_.getPlayFieldId(PlayFieldsTypes.FIELD_TYPE_MAIN_ZOO))
         {
            _loc7_.setCirusBox(_loc9_);
         }
         if(_loc8_.currentAppMode == AppMode.NORMAL)
         {
            if(_loc10_ == _loc5_.getCurrentPlayFieldId())
            {
               _loc2_.setStoreFields(_loc9_);
            }
            else if(-_loc10_ == _loc5_.getCurrentPlayFieldId())
            {
            }
         }
         else if(_loc8_.currentAppMode == AppMode.MANAGMENT_CENTER)
         {
            _loc3_.updateCityData();
         }
         _loc4_.setItem(_loc9_,_loc10_);
         _loc6_.reload = true;
      }
   }
}

