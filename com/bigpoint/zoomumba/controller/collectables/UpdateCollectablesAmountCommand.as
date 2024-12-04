package com.bigpoint.zoomumba.controller.collectables
{
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.app.gameEvents.GlobalEventProxy;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.EventTypes;
   import com.bigpoint.zoomumba.model.features.collectables.CollectablesProxy;
   import com.bigpoint.zoomumba.model.features.collectables.vo.CollectableItemType;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoorama.data.settings.PremiumShopData;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class UpdateCollectablesAmountCommand extends SimpleCommand
   {
      public function UpdateCollectablesAmountCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc4_:Vector.<PremiumShopData> = null;
         var _loc5_:Vector.<PremiumShopData> = null;
         var _loc6_:Vector.<int> = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:CollectablesProxy = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc2_:GlobalEventProxy = facade.retrieveProxy(GlobalEventProxy.NAME) as GlobalEventProxy;
         var _loc3_:int = param1.getBody() as int;
         if(_loc2_.isEventActive(EventTypes.BDAY2014_EVENT) && _loc3_ == CollectableItemType.BALOONS2014)
         {
            _loc4_ = this.getAnniversaryEventRewards();
            _loc5_ = _loc4_.sort(this.sortPrice);
            _loc6_ = new Vector.<int>();
            _loc7_ = -1;
            _loc8_ = 0;
            while(_loc8_ < _loc5_.length)
            {
               if(_loc7_ > -1)
               {
                  if(_loc6_[_loc7_] != _loc5_[_loc8_].params.cnt)
                  {
                     _loc6_.push(_loc5_[_loc8_].params.cnt);
                     _loc7_++;
                  }
               }
               else
               {
                  _loc6_.push(_loc5_[_loc8_].params.cnt);
                  _loc7_++;
               }
               _loc8_++;
            }
            _loc9_ = 0;
            _loc10_ = facade.retrieveProxy(CollectablesProxy.NAME) as CollectablesProxy;
            _loc11_ = _loc10_.getCollectableAmmount(CollectableItemType.BALOONS2014);
            _loc12_ = 0;
            while(_loc12_ < _loc6_.length)
            {
               if(_loc11_ >= _loc6_[_loc12_])
               {
                  _loc9_ = _loc12_;
               }
               _loc12_++;
            }
            sendNotification(Note.ANNIVERSARY_STAGE_LEVEL,_loc9_);
         }
      }
      
      private function getAnniversaryEventRewards() : Vector.<PremiumShopData>
      {
         var _loc1_:ItemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         return _loc1_.getAllShopPremiumsByEventAsVector(EventTypes.BDAY2014_EVENT);
      }
      
      private function sortPrice(param1:PremiumShopData, param2:PremiumShopData) : Number
      {
         var _loc3_:Number = this.sortNumbers(param1.params.cnt,param2.params.cnt);
         if(_loc3_ != 0)
         {
            return _loc3_;
         }
         return this.sortNumbers(param1.params.cnt,param2.params.cnt);
      }
      
      private function sortNumbers(param1:int, param2:int) : int
      {
         if(param1 < param2)
         {
            return -1;
         }
         if(param1 > param2)
         {
            return 1;
         }
         return 0;
      }
   }
}

