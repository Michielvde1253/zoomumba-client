package com.bigpoint.zoomumba.controller.features.itemDrop
{
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.features.itemDrops.ItemDropProxy;
   import com.bigpoint.zoomumba.model.gameConfig.CollectionSetsConfigProxy;
   import com.bigpoint.zoomumba.model.gameConfig.vo.CollectionSetConfigVO;
   import com.bigpoint.zoomumba.view.features.collectables.CollectablesPanelMediator;
   import com.bigpoint.zoorama.view.itemDrop.items.DropItem;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class CollectDropCommand extends SimpleCommand
   {
      public function CollectDropCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:ItemDropProxy = null;
         var _loc4_:DropItem = null;
         var _loc5_:CollectionSetConfigVO = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:CollectionSetConfigVO = null;
         var _loc9_:CollectablesPanelMediator = null;
         _loc2_ = facade.retrieveProxy(ItemDropProxy.NAME) as ItemDropProxy;
         var _loc3_:CollectionSetsConfigProxy = facade.retrieveProxy(CollectionSetsConfigProxy.NAME) as CollectionSetsConfigProxy;
         if(_loc2_.queue.length > 0)
         {
            for each(_loc4_ in _loc2_.queue)
            {
               if(_loc2_.currentRunning == -1)
               {
                  _loc2_.currentRunning = _loc4_.dropId;
               }
               if(this.isBrotherOf(_loc2_.currentRunning,_loc4_.dropId))
               {
                  _loc5_ = _loc3_.getCollectionSetByMemberId(_loc4_.dropId);
                  _loc6_ = 1;
                  _loc7_ = 0;
                  while(_loc7_ < _loc5_.collectables.length)
                  {
                     if(_loc5_.collectables[_loc7_].itemId == _loc4_.dropId)
                     {
                        _loc6_ = _loc7_ + 1;
                     }
                     _loc7_++;
                  }
                  _loc8_ = _loc3_.getCollectionSetByMemberId(_loc4_.dropId);
                  sendNotification(Note.SHOW_COLLECTABLES_PANEL,_loc8_.collectionId);
                  _loc9_ = facade.retrieveMediator(CollectablesPanelMediator.NAME) as CollectablesPanelMediator;
                  _loc4_.flyTo.x = _loc9_.getItemPosition(_loc6_).x;
                  _loc4_.flyTo.y = _loc9_.getItemPosition(_loc6_).y;
                  sendNotification(Note.ANIMATE_OUT_DROP,_loc4_);
                  _loc2_.removeFromQueue(_loc4_);
                  _loc2_.currentRunning = _loc4_.dropId;
               }
               else
               {
                  _loc4_.disable();
               }
            }
         }
      }
      
      private function isBrotherOf(param1:int, param2:int) : Boolean
      {
         var _loc6_:int = 0;
         var _loc3_:Boolean = false;
         var _loc4_:CollectionSetsConfigProxy = facade.retrieveProxy(CollectionSetsConfigProxy.NAME) as CollectionSetsConfigProxy;
         var _loc5_:CollectionSetConfigVO = _loc4_.getCollectionSetByMemberId(param1);
         if(_loc5_)
         {
            _loc6_ = 0;
            while(_loc6_ < _loc5_.collectables.length)
            {
               if(_loc5_.collectables[_loc6_].itemId == param2)
               {
                  _loc3_ = true;
               }
               _loc6_++;
            }
         }
         return _loc3_;
      }
   }
}

