package com.bigpoint.zoomumba.controller.playfield.items
{
   import com.bigpoint.zoomumba.constants.CageActionIds;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.ActionType;
   import com.bigpoint.zoomumba.model.features.itemDrops.vo.CageDropRequestVO;
   import com.bigpoint.zoomumba.model.inventory.InventoryProxy;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.CageData;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayFieldProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayfieldSettingsProxy;
   import com.bigpoint.zoomumba.model.playfield.vo.AssistantTypeVO;
   import com.bigpoint.zoomumba.model.user.assistances.AssistancesProxy;
   import com.bigpoint.zoorama.core.PlayFieldManager;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class CageItemParsedCommand extends SimpleCommand
   {
      public function CageItemParsedCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc10_:CageDropRequestVO = null;
         var _loc11_:CageDropRequestVO = null;
         var _loc12_:CageDropRequestVO = null;
         var _loc13_:CageDropRequestVO = null;
         var _loc14_:CageDropRequestVO = null;
         var _loc15_:CageDropRequestVO = null;
         var _loc2_:PlayFieldManager = facade.retrieveMediator(PlayFieldManager.NAME) as PlayFieldManager;
         var _loc3_:PlayFieldProxy = facade.retrieveProxy(PlayFieldProxy.NAME) as PlayFieldProxy;
         var _loc4_:PlayfieldSettingsProxy = facade.getProxy(PlayfieldSettingsProxy);
         var _loc5_:InventoryProxy = facade.retrieveProxy(InventoryProxy.NAME) as InventoryProxy;
         var _loc6_:AssistancesProxy = facade.retrieveProxy(AssistancesProxy.NAME) as AssistancesProxy;
         var _loc7_:NetProxy = facade.retrieveProxy(NetProxy.NAME) as NetProxy;
         var _loc8_:CageData = Object(param1.getBody())["cage"] as CageData;
         var _loc9_:int = Object(param1.getBody())["fieldId"] as int;
         if(_loc6_.lastAssistCID != -1 && _loc7_.lastParsedResponse >= _loc6_.lastAssistCID)
         {
            ++_loc6_.currentCageNumber;
            if((_loc6_.lastAssistType == AssistantTypeVO.FEED_ASSISTANT || _loc6_.lastAssistType == AssistantTypeVO.ZOO_DIRECTOR_ASSISTANT) && this.actionPerformed(_loc8_,ActionType.FEED))
            {
               _loc10_ = new CageDropRequestVO(_loc8_.uniqueId,CageActionIds.FEED);
               sendNotification(Note.GENERATE_DROPS_STACK_PAWS,_loc10_);
            }
            if(_loc6_.lastAssistType == AssistantTypeVO.SUPER_FEED_ASSISTANT && this.actionPerformed(_loc8_,ActionType.SUPER_FEED))
            {
               _loc11_ = new CageDropRequestVO(_loc8_.uniqueId,CageActionIds.SUPERFEED);
               sendNotification(Note.GENERATE_DROPS_STACK_PAWS,_loc11_);
            }
            if(_loc6_.lastAssistType == AssistantTypeVO.POWER_FEED_ASSISTANT && this.actionPerformed(_loc8_,ActionType.POWER_FEED))
            {
               _loc12_ = new CageDropRequestVO(_loc8_.uniqueId,CageActionIds.POWERFEED);
               sendNotification(Note.GENERATE_DROPS_STACK_PAWS,_loc12_);
            }
            if((_loc6_.lastAssistType == AssistantTypeVO.CUDDLE_ASSISTANT || _loc6_.lastAssistType == AssistantTypeVO.ZOO_DIRECTOR_ASSISTANT) && this.actionPerformed(_loc8_,ActionType.CUDDLE))
            {
               _loc13_ = new CageDropRequestVO(_loc8_.uniqueId,CageActionIds.CUDDLE);
               sendNotification(Note.GENERATE_DROPS_STACK_PAWS,_loc13_);
            }
            if((_loc6_.lastAssistType == AssistantTypeVO.WATER_ASSISTANT || _loc6_.lastAssistType == AssistantTypeVO.ZOO_DIRECTOR_ASSISTANT) && this.actionPerformed(_loc8_,ActionType.WATER))
            {
               _loc14_ = new CageDropRequestVO(_loc8_.uniqueId,CageActionIds.WATER);
               sendNotification(Note.GENERATE_DROPS_STACK_PAWS,_loc14_);
            }
            if((_loc6_.lastAssistType == AssistantTypeVO.CLEAN_ASSISTANT || _loc6_.lastAssistType == AssistantTypeVO.ZOO_DIRECTOR_ASSISTANT) && this.actionPerformed(_loc8_,ActionType.CLEAN))
            {
               _loc15_ = new CageDropRequestVO(_loc8_.uniqueId,CageActionIds.CLEAN);
               sendNotification(Note.GENERATE_DROPS_STACK_PAWS,_loc15_);
            }
            if(_loc6_.maxCages == _loc6_.currentCageNumber)
            {
               _loc6_.assistatDataParsed();
            }
         }
         if(_loc9_ == _loc4_.getCurrentPlayFieldId())
         {
            _loc2_.setCageFields(_loc8_);
         }
         _loc3_.setItem(_loc8_,_loc9_);
         _loc5_.reload = true;
      }
      
      private function actionPerformed(param1:CageData, param2:int) : Boolean
      {
         var _loc3_:PlayFieldProxy = facade.retrieveProxy(PlayFieldProxy.NAME) as PlayFieldProxy;
         var _loc4_:Boolean = false;
         var _loc5_:CageData = _loc3_.getItemByTypeAndId(Categories.CAGE,param1.uniqueId) as CageData;
         if(!_loc5_)
         {
            return false;
         }
         switch(param2)
         {
            case ActionType.SUPER_FEED:
            case ActionType.POWER_FEED:
            case ActionType.FEED:
               if(param1.feedTimeStamp != _loc5_.feedTimeStamp && param1.feedTimeStamp != 0)
               {
                  _loc4_ = true;
               }
               break;
            case ActionType.CUDDLE:
               if(param1.cuddleTimeStamp != _loc5_.cuddleTimeStamp && param1.cuddleTimeStamp != 0)
               {
                  _loc4_ = true;
               }
               break;
            case ActionType.WATER:
               if(param1.waterTimeStamp != _loc5_.waterTimeStamp && param1.waterTimeStamp != 0)
               {
                  _loc4_ = true;
               }
               break;
            case ActionType.CLEAN:
               if(param1.cleanTimeStamp != _loc5_.cleanTimeStamp && param1.cleanTimeStamp != 0)
               {
                  _loc4_ = true;
               }
         }
         return _loc4_;
      }
   }
}

