package com.bigpoint.zoomumba.controller.features.itemDrop
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.items.ItemVO;
   import com.bigpoint.zoomumba.model.features.collectables.CollectablesProxy;
   import com.bigpoint.zoomumba.model.features.powerup.PowerupProxy;
   import com.bigpoint.zoomumba.model.gameConfig.CollectionSetsConfigProxy;
   import com.bigpoint.zoomumba.model.gameConfig.vo.CollectionSetConfigVO;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.collectienSets.CollectionSetCongratulationInitParams;
   import com.bigpoint.zoorama.view.itemDrop.items.DropItem;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class IncreaseCollectableAmountCommand extends SimpleCommand
   {
      public function IncreaseCollectableAmountCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:DropItem = param1.getBody() as DropItem;
         var _loc3_:CollectablesProxy = facade.retrieveProxy(CollectablesProxy.NAME) as CollectablesProxy;
         var _loc4_:CollectionSetsConfigProxy = facade.retrieveProxy(CollectionSetsConfigProxy.NAME) as CollectionSetsConfigProxy;
         var _loc5_:CollectionSetConfigVO = _loc4_.getCollectionSetByMemberId(_loc2_.dropId);
         if(_loc5_ != null)
         {
            this.checkForCollectedSet(_loc2_.dropId);
         }
         _loc3_.increaseCollectableAmount(_loc2_.dropId,_loc2_.count);
      }
      
      private function getDropCount(param1:DropItem) : int
      {
         var _loc2_:PowerupProxy = facade.getProxy(PowerupProxy);
         var _loc3_:Number = 0;
         switch(param1.dropId)
         {
            case 305:
            case 306:
            case 307:
               _loc3_ = _loc2_.getMultiplierByAffectedProperty(Categories.COLLECTIBLE,param1.dropId);
         }
         return param1.count + param1.count * _loc3_;
      }
      
      private function checkForCollectedSet(param1:int) : void
      {
         var _loc8_:int = 0;
         var _loc9_:ItemVO = null;
         var _loc10_:int = 0;
         var _loc2_:CollectionSetsConfigProxy = facade.retrieveProxy(CollectionSetsConfigProxy.NAME) as CollectionSetsConfigProxy;
         var _loc3_:CollectablesProxy = facade.retrieveProxy(CollectablesProxy.NAME) as CollectablesProxy;
         var _loc4_:CollectionSetConfigVO = _loc2_.getCollectionSetByMemberId(param1);
         var _loc5_:Boolean = true;
         var _loc6_:* = !_loc3_.isCollectableCollected(param1);
         var _loc7_:int = _loc3_.getCollectableAmmount(param1);
         if(_loc4_)
         {
            _loc8_ = 0;
            while(_loc8_ < _loc4_.collectables.length)
            {
               _loc9_ = _loc4_.collectables[_loc8_];
               if(_loc9_.itemId != param1)
               {
                  _loc10_ = _loc3_.getCollectableAmmount(_loc9_.itemId);
                  if(_loc10_ <= 0 || _loc10_ <= _loc7_)
                  {
                     _loc5_ = false;
                     break;
                  }
               }
               _loc8_++;
            }
         }
         if(_loc5_)
         {
            facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.COLLECTION_SET_CONGRATULATION,"setWindow_" + _loc4_.collectionId,new CollectionSetCongratulationInitParams(_loc4_.setCategory,_loc4_.setItemId,_loc4_.collectionId,_loc6_)));
         }
      }
   }
}

