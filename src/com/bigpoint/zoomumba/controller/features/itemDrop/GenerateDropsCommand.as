package com.bigpoint.zoomumba.controller.features.itemDrop
{
   import com.bigpoint.zoomumba.constants.CageActionIds;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.UserResources;
   import com.bigpoint.zoomumba.model.app.gameEvents.GlobalEventProxy;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.EventTypes;
   import com.bigpoint.zoomumba.model.app.items.DropVO;
   import com.bigpoint.zoomumba.model.app.items.ItemPackVO;
   import com.bigpoint.zoomumba.model.features.itemDrops.ItemDropProxy;
   import com.bigpoint.zoomumba.model.features.itemDrops.vo.CageDropRequestVO;
   import com.bigpoint.zoomumba.model.features.itemDrops.vo.DropTargetConfig;
   import com.bigpoint.zoomumba.model.features.itemDrops.vo.ItemDropVO;
   import com.bigpoint.zoomumba.model.features.powerup.PowerupProxy;
   import com.bigpoint.zoomumba.model.gameConfig.PremiumPackConfigProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayFieldProxy;
   import com.bigpoint.zoomumba.view.gui.main.events.GenericEventUIMediator;
   import flash.geom.Point;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class GenerateDropsCommand extends SimpleCommand
   {
      private var _cageId:int;
      
      public function GenerateDropsCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc13_:ItemDropVO = null;
         var _loc15_:int = 0;
         var _loc2_:CageDropRequestVO = param1.getBody() as CageDropRequestVO;
         var _loc3_:int = _loc2_.cageId;
         this._cageId = _loc3_;
         var _loc4_:int = _loc2_.cageActionType;
         var _loc5_:Boolean = false;
         switch(param1.getName())
         {
            case Note.GENERATE_DROPS:
               _loc5_ = false;
               break;
            case Note.GENERATE_DROPS_STACK_PAWS:
               _loc5_ = true;
         }
         var _loc6_:int = 1;
         var _loc7_:PlayFieldProxy = facade.retrieveProxy(PlayFieldProxy.NAME) as PlayFieldProxy;
         var _loc8_:DropVO = _loc7_.getCageActionDrop(_loc3_,_loc4_);
         var _loc9_:Point = _loc7_.getItemPossition(Categories.CAGE,_loc3_);
         var _loc10_:ItemDropProxy = facade.retrieveProxy(ItemDropProxy.NAME) as ItemDropProxy;
         var _loc11_:PremiumPackConfigProxy = facade.retrieveProxy(PremiumPackConfigProxy.NAME) as PremiumPackConfigProxy;
         var _loc12_:PowerupProxy = facade.retrieveProxy(PowerupProxy.NAME) as PowerupProxy;
         var _loc14_:Number = 1;
         if(_loc12_.getMultiplierByAffectedProperty(Categories.USER,UserResources.PET_POWNS))
         {
            if(_loc12_.getMultiplierByAffectedProperty(Categories.USER,UserResources.PET_POWNS) > 0)
            {
               _loc14_ += _loc12_.getMultiplierByAffectedProperty(Categories.USER,UserResources.PET_POWNS);
            }
         }
         switch(_loc4_)
         {
            case CageActionIds.POWERFEED:
               _loc6_ = 4;
               break;
            case CageActionIds.SUPERHEAL:
               _loc6_ = 2;
               break;
            case CageActionIds.SUPERBREAD:
               _loc6_ = 2;
         }
         _loc8_.petPaws = Math.ceil(_loc8_.petPaws * _loc6_ * _loc11_.fieldActionPetPawsMultiplyer * _loc14_) * _loc10_.pawMultiplier;
         if(!_loc5_)
         {
            if(_loc8_.petPaws > 0)
            {
               _loc13_ = new ItemDropVO();
               _loc13_.dropId = 1001;
               _loc13_.count = _loc8_.petPaws;
               _loc13_.position = _loc9_;
               _loc13_.flyTo = DropTargetConfig.TARGET_INVENTORY_ICON;
               sendNotification(Note.SHOW_DROP,_loc13_);
            }
         }
         else if(_loc8_.petPaws > 0)
         {
            _loc10_.stackPaws(_loc8_.petPaws);
         }
         _loc14_ = 1;
         if(_loc12_.getMultiplierByAffectedProperty(Categories.USER,UserResources.PEARLS))
         {
            if(_loc12_.getMultiplierByAffectedProperty(Categories.USER,UserResources.PEARLS) > 0)
            {
               _loc14_ += _loc12_.getMultiplierByAffectedProperty(Categories.USER,UserResources.PEARLS);
            }
         }
         _loc8_.pearls = Math.ceil(_loc8_.pearls * _loc6_ * _loc11_.fieldActionPearlsMultiplyer * _loc14_) * _loc10_.pearlMultiplier;
         if(!_loc5_)
         {
            if(_loc8_.pearls > 0)
            {
               _loc13_ = new ItemDropVO();
               _loc13_.dropId = 1002;
               _loc13_.count = _loc8_.pearls;
               _loc13_.position = _loc9_;
               _loc13_.flyTo = DropTargetConfig.TARGET_INVENTORY_ICON;
               sendNotification(Note.SHOW_DROP,_loc13_);
            }
         }
         else if(_loc8_.pearls > 0)
         {
            _loc10_.stackPearls(_loc8_.pearls);
         }
         if(_loc8_.zooDollars > 0)
         {
            _loc13_ = new ItemDropVO();
            _loc13_.dropId = 1000;
            _loc13_.count = _loc8_.zooDollars;
            _loc13_.position = _loc9_;
            _loc13_.flyTo = DropTargetConfig.TARGET_ZOO_DOLLARS_PANEL;
            sendNotification(Note.SHOW_DROP,_loc13_);
         }
         if(_loc8_.collectablePacks)
         {
            _loc15_ = 0;
            while(_loc15_ < _loc8_.collectablePacks.length)
            {
               _loc13_ = new ItemDropVO();
               _loc13_.dropId = _loc8_.collectablePacks[_loc15_].itemId;
               _loc13_.count = _loc8_.collectablePacks[_loc15_].count;
               _loc13_.position = _loc9_;
               _loc13_.flyTo = DropTargetConfig.TARGET_COLLECTION_PANEL;
               sendNotification(Note.SHOW_DROP,_loc13_);
               _loc15_++;
            }
         }
         if(_loc8_.eventCollectablePacks)
         {
            this.dropEventCollectablePack(_loc8_.eventCollectablePacks);
         }
         if(_loc8_.eventItemPacks)
         {
            this.dropEventItemPack(_loc8_.eventItemPacks);
         }
      }
      
      private function dropEventCollectablePack(param1:Vector.<ItemPackVO>) : void
      {
         var _loc2_:ItemDropVO = null;
         var _loc3_:PlayFieldProxy = facade.retrieveProxy(PlayFieldProxy.NAME) as PlayFieldProxy;
         var _loc4_:Point = _loc3_.getItemPossition(Categories.CAGE,this._cageId);
         var _loc5_:int = 0;
         while(_loc5_ < param1.length)
         {
            if(this.canDrop(param1[_loc5_].itemId))
            {
               _loc2_ = new ItemDropVO();
               _loc2_.dropId = param1[_loc5_].itemId;
               _loc2_.count = param1[_loc5_].count;
               _loc2_.position = _loc4_;
               _loc2_.flyTo = DropTargetConfig.TARGET_COLLECTION_PANEL;
               sendNotification(Note.SHOW_DROP,_loc2_);
            }
            _loc5_++;
         }
      }
      
      private function dropEventItemPack(param1:Vector.<ItemPackVO>) : void
      {
         var _loc2_:ItemDropVO = null;
         var _loc3_:PlayFieldProxy = facade.retrieveProxy(PlayFieldProxy.NAME) as PlayFieldProxy;
         var _loc4_:Point = _loc3_.getItemPossition(Categories.CAGE,this._cageId);
         var _loc5_:int = 0;
         while(_loc5_ < param1.length)
         {
            if(this.canDrop(param1[_loc5_].itemId))
            {
               _loc2_ = new ItemDropVO();
               _loc2_.dropId = param1[_loc5_].itemId;
               _loc2_.count = param1[_loc5_].count;
               _loc2_.position = _loc4_;
               _loc2_.flyTo = this.getPosition(DropTargetConfig.TARGET_EVENT_UI);
               sendNotification(Note.SHOW_DROP,_loc2_);
            }
            _loc5_++;
         }
      }
      
      private function canDrop(param1:int) : Boolean
      {
         var _loc2_:Boolean = true;
         var _loc3_:GlobalEventProxy = facade.retrieveProxy(GlobalEventProxy.NAME) as GlobalEventProxy;
         switch(param1)
         {
            case 10000:
            case 10001:
            case 10002:
            case 10003:
            case 10004:
            case 10005:
               if(!_loc3_.isEventActive(EventTypes.ANNIVERSARY_CAKE_EVENT))
               {
                  _loc2_ = false;
               }
               break;
            case 10006:
               if(!_loc3_.isEventActive(EventTypes.ANNIVERSARY_BALLON_EVENT))
               {
                  _loc2_ = false;
               }
               break;
            case 305:
            case 306:
            case 307:
            case 140:
            case 141:
            case 142:
               if(!_loc3_.isEventActive(EventTypes.VALENTINES_EVENT))
               {
                  _loc2_ = false;
               }
               break;
            case 153:
            case 154:
            case 155:
               if(!_loc3_.isEventActive(EventTypes.EASTER_EVENT_2012))
               {
                  _loc2_ = false;
               }
               break;
            case 182:
            case 183:
            case 184:
               if(!_loc3_.isEventActive(EventTypes.FROG_EVENT))
               {
                  _loc2_ = false;
               }
               break;
            case 335:
            case 336:
            case 337:
               if(!_loc3_.isEventActive(EventTypes.EASTER2013))
               {
                  _loc2_ = false;
               }
         }
         return _loc2_;
      }
      
      private function getPosition(param1:int) : Point
      {
         var _loc3_:GenericEventUIMediator = null;
         var _loc2_:Point = new Point(0,0);
         switch(param1)
         {
            case DropTargetConfig.TARGET_EVENT_UI:
               _loc3_ = facade.retrieveMediator(GenericEventUIMediator.NAME) as GenericEventUIMediator;
               if(_loc3_)
               {
                  _loc2_ = _loc3_.getPosition();
               }
         }
         return _loc2_;
      }
   }
}

