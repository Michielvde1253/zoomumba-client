package com.bigpoint.zoomumba.controller.collectables
{
   import com.bigpoint.utils.ItemTypeHelper;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.controller.collectables.param.GetCollectionRewardVO;
   import com.bigpoint.zoomumba.model.app.items.ItemPackVO;
   import com.bigpoint.zoomumba.model.app.items.ItemVO;
   import com.bigpoint.zoomumba.model.features.collectables.CollectablesProxy;
   import com.bigpoint.zoomumba.model.gameConfig.CollectionSetsConfigProxy;
   import com.bigpoint.zoomumba.model.gameConfig.vo.CollectionSetConfigVO;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.info.ItemToInventoryInfoInitParams;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class GetCollectionRewardCommand extends SimpleCommand
   {
      public function GetCollectionRewardCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:GetCollectionRewardVO = param1.getBody() as GetCollectionRewardVO;
         var _loc3_:CollectablesProxy = facade.retrieveProxy(CollectablesProxy.NAME) as CollectablesProxy;
         var _loc4_:CollectionSetsConfigProxy = facade.retrieveProxy(CollectionSetsConfigProxy.NAME) as CollectionSetsConfigProxy;
         var _loc5_:CollectionSetConfigVO = _loc4_.getSetsItem(_loc2_.currentCategoryID,_loc2_.currentPage);
         var _loc6_:ItemVO = null;
         var _loc7_:int = 0;
         while(_loc7_ < _loc5_.collectables.length)
         {
            _loc6_ = _loc5_.collectables[_loc7_];
            _loc3_.decreaseCollectableAmount(_loc6_.itemId,1);
            _loc7_++;
         }
         facade.sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(WindowTypes.COLLECTION_SET_REWORD));
         var _loc8_:ItemPackVO = _loc5_.rewards[_loc2_.rewardId] as ItemPackVO;
         sendNotification(Note.UPDATE_RESOURCE_COUNT,_loc8_);
         sendNotification(NET.REDEEM_COLLECTION_SET_REWARD,[ItemTypeHelper.categoryToType(_loc5_.setCategory),_loc5_.setItemId,_loc2_.rewardId + 1]);
         if(_loc8_.category != Categories.USER && _loc8_.category != Categories.RESOURCES && _loc8_.category != Categories.COLLECTIBLE && _loc8_.category != Categories.ASSISTANCE)
         {
            facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.ITEM_TO_INVENTORY_INFO,"",new ItemToInventoryInfoInitParams(_loc8_)));
         }
         if(_loc8_.category == Categories.COLLECTIBLE)
         {
            _loc3_.increaseCollectableAmount(_loc8_.itemId,1);
         }
      }
   }
}

