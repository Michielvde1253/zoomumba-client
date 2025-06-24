package com.bigpoint.zoomumba.model.events.boardgame
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.GAMEBOARD;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.UserResources;
   import com.bigpoint.zoomumba.model.app.items.ItemVO;
   import com.bigpoint.zoomumba.model.events.boardgame.vo.BoardgameCollVo;
   import com.bigpoint.zoomumba.model.events.boardgame.vo.BoardgameFieldVo;
   import com.bigpoint.zoomumba.model.events.boardgame.vo.BoardgameObjectVo;
   import com.bigpoint.zoomumba.model.events.boardgame.vo.BoardgameRewardVo;
   import com.bigpoint.zoomumba.model.events.boardgame.vo.BoardgameRoundVo;
   import com.bigpoint.zoomumba.model.events.boardgame.vo.BoardgameVo;
   import com.bigpoint.zoomumba.model.features.collectables.CollectablesProxy;
   import com.bigpoint.zoomumba.model.gameConfig.CollectionPoolSetProxy;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import com.bigpoint.zoomumba.model.user.currency.CurrencyProxy;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class BoardgameProxy extends Proxy
   {
      public static const NAME:String = "BoardgameProxy";
      
      private var _lastRewardStepStr:String;
      
      private var _currentRewardStepStr:String;
      
      public function BoardgameProxy(param1:Object = null)
      {
         var _loc2_:Boolean = false;
         var _loc8_:Object = null;
         var _loc9_:String = null;
         var _loc10_:Object = null;
         var _loc11_:String = null;
         var _loc12_:Object = null;
         var _loc13_:String = null;
         var _loc3_:BoardgameVo = new BoardgameVo();
         var _loc4_:BoardgameFieldVo = new BoardgameFieldVo();
         var _loc5_:BoardgameRoundVo = new BoardgameRoundVo();
         var _loc6_:BoardgameCollVo = new BoardgameCollVo();
         var _loc7_:Vector.<BoardgameVo> = new Vector.<BoardgameVo>();
         this._lastRewardStepStr = "";
         for(_loc9_ in param1)
         {
            _loc8_ = param1[_loc9_];
            _loc3_.eventId = parseInt(_loc9_);
            if(_loc8_.steps)
            {
               _loc3_.rounds = new Vector.<BoardgameRoundVo>();
               _loc3_.boardgameObj = new BoardgameObjectVo();
               for(_loc11_ in _loc8_.steps)
               {
                  _loc10_ = _loc8_.steps[_loc11_];
                  _loc5_ = new BoardgameRoundVo();
                  _loc5_.fields = new Vector.<BoardgameFieldVo>();
                  _loc5_.roundNr = String(_loc11_);
                  for(_loc13_ in _loc10_)
                  {
                     _loc12_ = _loc10_[_loc13_];
                     _loc4_ = new BoardgameFieldVo();
                     _loc4_.stepStr = String(_loc13_);
                     if(_loc12_.putDropId != null)
                     {
                        _loc4_.putDropId = parseInt(String(_loc12_.putDropId));
                     }
                     if(_loc12_.putDropType != null)
                     {
                        _loc4_.putDropType = String(_loc12_.putDropType);
                     }
                     if(_loc12_.putAmount != null)
                     {
                        _loc4_.putAmount = parseInt(String(_loc12_.putAmount));
                     }
                     if(_loc12_.instantBuyReal != null)
                     {
                        _loc4_.instantBuyReal = parseInt(String(_loc12_.instantBuyReal));
                     }
                     if(_loc12_.progress != null)
                     {
                        _loc4_.progress = parseInt(String(_loc12_.progress));
                     }
                     if(_loc12_.amount != null)
                     {
                        _loc4_.setAmount = parseInt(String(_loc12_.amount));
                     }
                     _loc5_.fields.push(_loc4_);
                  }
                  _loc3_.rounds.push(_loc5_);
               }
               for each(_loc5_ in _loc3_.rounds)
               {
                  _loc3_.collect = new Vector.<BoardgameCollVo>();
                  for each(_loc4_ in _loc5_.fields)
                  {
                     _loc2_ = false;
                     for each(_loc6_ in _loc3_.collect)
                     {
                        if(_loc4_.putDropId == _loc6_.itemId)
                        {
                           _loc2_ = true;
                        }
                     }
                     if(_loc2_ == false)
                     {
                        _loc6_ = new BoardgameCollVo();
                        _loc6_.itemId = _loc4_.putDropId;
                        _loc6_.itemType = _loc4_.putDropType;
                        _loc3_.collect.push(_loc6_);
                     }
                  }
               }
            }
            _loc7_.push(_loc3_);
         }
         super(BoardgameProxy.NAME,_loc7_);
      }
      
      override public function onRegister() : void
      {
         super.onRegister();
         sendNotification(Note.ON_REGISTER_BOARDGAME);
         sendNotification(Note.START_BOARDGAME_WEATHER);
      }
      
      public function registierBoardIcons() : void
      {
         var _loc3_:BoardgameVo = null;
         var _loc4_:BoardgameCollVo = null;
         var _loc1_:Vector.<BoardgameVo> = this.proxyData;
         var _loc2_:Vector.<ItemVO> = new Vector.<ItemVO>();
         for each(_loc3_ in _loc1_)
         {
            for each(_loc4_ in _loc3_.collect)
            {
               _loc2_.push(new ItemVO(_loc4_.itemId,-1,Categories.COLLECTIBLE));
            }
         }
         (facade.getProxy(CollectionPoolSetProxy) as CollectionPoolSetProxy).loadItems(_loc2_);
      }
      
      public function parseBoardgameObject(param1:Object) : int
      {
         var dataVo:BoardgameVo = null;
         var groupData:Object = null;
         var groupString:String = null;
         var stepData:Object = null;
         var stepString:String = null;
         var rewardData:Object = null;
         var rewardString:String = null;
         var gameBoardVo:BoardgameVo = null;
         var gameBoardRewardVo:BoardgameRewardVo = null;
         var itemField:BoardgameFieldVo = null;
         var itemRound:BoardgameRoundVo = null;
         var lastBgReward:BoardgameRewardVo = null;
         var lastBgRewardItem:String = null;
         var field:BoardgameFieldVo = null;
         var dataNet:Object = param1;
         var eventId:int = 0;
         if(dataNet.boardgameRwd)
         {
            lastBgReward = new BoardgameRewardVo();
            for(lastBgRewardItem in dataNet.boardgameRwd)
            {
               groupData = dataNet.boardgameRwd[lastBgRewardItem];
               if(groupData.amount)
               {
                  lastBgReward.amount = groupData.amount;
               }
               if(groupData.id)
               {
                  lastBgReward.id = groupData.id;
               }
               if(groupData.type)
               {
                  lastBgReward.type = groupData.type;
               }
            }
         }
         if(dataNet.boardgame)
         {
            for(groupString in dataNet.boardgame)
            {
               groupData = dataNet.boardgame[groupString];
               if(parseInt(String(groupString)))
               {
                  dataVo = this.proxyDataById(parseInt(groupString));
                  eventId = parseInt(groupString);
                  gameBoardVo = this.proxyDataById(eventId);
                  if(groupData.roundPutAmounts != null)
                  {
                     for each(field in gameBoardVo.rounds[groupData.round - 1].fields)
                     {
                        field.putAmount = int(groupData.roundPutAmounts[field.stepStr]);
                     }
                  }
                  if(gameBoardVo.boardgameObj == null)
                  {
                     gameBoardVo.boardgameObj = new BoardgameObjectVo();
                  }
                  if(groupData.round != null)
                  {
                     gameBoardVo.boardgameObj.round = groupData.round;
                  }
                  if(groupData.instantBuyReal != null)
                  {
                     gameBoardVo.boardgameObj.instantBuyReal = parseInt(String(groupData.instantBuyReal));
                  }
                  if(groupData.progress != null)
                  {
                     gameBoardVo.boardgameObj.progress = parseInt(String(groupData.progress));
                  }
                  if(groupData.step != null && groupData.route != null)
                  {
                     gameBoardVo.boardgameObj.stepStr = String(groupData.route) + "_" + String(groupData.step);
                  }
                  if(groupData.userId != null)
                  {
                     gameBoardVo.boardgameObj.uid = groupData.userId;
                  }
                  try
                  {
                     if(groupData.dropedItems)
                     {
                        if(Boolean(groupData.dropedItems) && groupData.dropedItems[gameBoardVo.boardgameObj.stepStr] != null)
                        {
                           gameBoardVo.boardgameObj.progressAmount = parseInt(String(groupData.dropedItems[gameBoardVo.boardgameObj.stepStr].amount));
                        }
                        else
                        {
                           gameBoardVo.boardgameObj.progressAmount = 0;
                        }
                     }
                  }
                  catch(err:Error)
                  {
                     gameBoardVo.boardgameObj.progressAmount = 0;
                  }
                  if(groupData.rewards)
                  {
                     gameBoardVo.boardgameObj.rewards = new Vector.<BoardgameRewardVo>();
                     for each(itemRound in dataVo.rounds)
                     {
                        for each(itemField in itemRound.fields)
                        {
                           itemField.rewards = new Vector.<BoardgameRewardVo>();
                        }
                     }
                     for(stepString in groupData.rewards)
                     {
                        stepData = groupData.rewards[stepString];
                        for(rewardString in stepData)
                        {
                           rewardData = stepData[rewardString];
                           gameBoardRewardVo = new BoardgameRewardVo();
                           gameBoardRewardVo.stepStr = stepString;
                           if(rewardData.id != null)
                           {
                              gameBoardRewardVo.id = rewardData.id;
                           }
                           if(rewardData.amount != null)
                           {
                              gameBoardRewardVo.amount = rewardData.amount;
                           }
                           if(rewardData.type != null)
                           {
                              gameBoardRewardVo.type = rewardData.type;
                           }
                           if(rewardData.displayId != null)
                           {
                              gameBoardRewardVo.displayId = rewardData.displayId;
                           }
                           gameBoardVo.boardgameObj.rewards.push(gameBoardRewardVo);
                           for each(itemRound in dataVo.rounds)
                           {
                              for each(itemField in itemRound.fields)
                              {
                                 if(gameBoardRewardVo.stepStr == itemField.stepStr)
                                 {
                                    itemField.rewards.push(gameBoardRewardVo);
                                 }
                              }
                           }
                           if(lastBgReward)
                           {
                              if(lastBgReward.id == rewardData.id && lastBgReward.type == rewardData.type && lastBgReward.amount == rewardData.amount)
                              {
                                 this._lastRewardStepStr = stepString;
                              }
                           }
                        }
                     }
                  }
                  this.sortRewards(eventId);
                  this.updateFieldAndRewardStates(eventId);
               }
            }
         }
         this._currentRewardStepStr = gameBoardVo.boardgameObj.stepStr;
         return eventId;
      }
      
      private function sortRewards(param1:int) : void
      {
         var _loc5_:BoardgameCollVo = null;
         var _loc6_:int = 0;
         var _loc2_:BoardgameVo = this.proxyDataById(param1);
         var _loc3_:Vector.<BoardgameCollVo> = new Vector.<BoardgameCollVo>();
         var _loc4_:Array = new Array();
         for each(_loc5_ in _loc2_.collect)
         {
            _loc4_.push(_loc5_.itemId);
         }
         _loc4_.sort(Array.NUMERIC);
         for each(_loc6_ in _loc4_)
         {
            for each(_loc5_ in _loc2_.collect)
            {
               if(_loc5_.itemId == _loc6_)
               {
                  _loc3_.push(_loc5_);
               }
            }
         }
         this.proxyDataById(param1).collect = _loc3_;
      }
      
      public function updateFieldAndRewardStates(param1:int) : void
      {
         var _loc6_:BoardgameRewardVo = null;
         var _loc7_:BoardgameFieldVo = null;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         var _loc2_:BoardgameVo = this.proxyDataById(param1);
         var _loc3_:String = _loc2_.boardgameObj.stepStr;
         var _loc4_:BoardgameFieldVo = this.getFieldVoByFieldIdAndEventId(_loc3_,param1);
         var _loc5_:BoardgameRoundVo = this.getCurrentFieldRound(param1);
         if(_loc5_)
         {
            for each(_loc7_ in _loc5_.fields)
            {
               if(_loc7_.route == _loc4_.route && _loc4_.step > _loc7_.step)
               {
                  _loc7_.progress = 100;
                  _loc7_.state = GAMEBOARD.FIELD_STATE_FINISHED;
               }
               else
               {
                  _loc7_.progress = 0;
                  _loc7_.state = GAMEBOARD.FIELD_STATE_INACTIVE;
               }
               if(_loc7_.stepStr == _loc3_)
               {
                  _loc7_.progress = _loc2_.boardgameObj.progress;
                  _loc7_.state = this.stateActiveFieldLogik(_loc7_);
               }
               _loc8_ = _loc7_.rewards.length;
               _loc9_ = 0;
               while(_loc9_ < _loc8_)
               {
                  _loc6_ = _loc7_.rewards[_loc9_];
                  if(_loc6_)
                  {
                     _loc6_.progress = _loc7_.progress;
                     _loc6_.state = _loc7_.state;
                     _loc6_.putAmount = _loc7_.putAmount;
                     _loc6_.putDropId = _loc7_.putDropId;
                     _loc6_.putDropType = _loc7_.putDropType;
                  }
                  _loc9_++;
               }
            }
         }
      }
      
      public function getCurrentFieldRound(param1:int) : BoardgameRoundVo
      {
         var _loc3_:BoardgameRoundVo = null;
         var _loc2_:BoardgameVo = this.proxyDataById(param1);
         for each(_loc3_ in _loc2_.rounds)
         {
            if(parseInt(_loc3_.roundNr) == _loc2_.boardgameObj.round)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      public function getBoardgameVoById(param1:int) : BoardgameVo
      {
         return this.proxyDataById(param1);
      }
      
      private function stateActiveFieldLogik(param1:BoardgameFieldVo) : String
      {
         if(param1.putAmount == 0)
         {
            return GAMEBOARD.FIELD_STATE_FINISHED;
         }
         if(param1.progress == 100)
         {
            return GAMEBOARD.FIELD_STATE_FINISHED;
         }
         if(this.collectablesProxy.getCollectableAmmount(param1.putDropId) > 0)
         {
            return GAMEBOARD.FIELD_STATE_DESPOSIT_ITEMS;
         }
         if(this.currencyProxy.getCurrency(UserResources.REAL_MONEY) >= param1.instantBuyReal)
         {
            return GAMEBOARD.FIELD_STATE_INSTANTBUY;
         }
         return GAMEBOARD.FIELD_STATE_NOTENOUGH;
      }
      
      public function getFieldVoByFieldIdAndEventId(param1:String, param2:int) : BoardgameFieldVo
      {
         var _loc4_:BoardgameFieldVo = null;
         var _loc3_:BoardgameRoundVo = this.getCurrentFieldRound(param2);
         for each(_loc4_ in _loc3_.fields)
         {
            if(_loc4_.stepStr == param1)
            {
               return _loc4_;
            }
         }
         return null;
      }
      
      public function proxyDataById(param1:int) : BoardgameVo
      {
         var _loc3_:BoardgameVo = null;
         var _loc2_:Vector.<BoardgameVo> = this.proxyData;
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_.eventId == param1)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      public function get proxyData() : Vector.<BoardgameVo>
      {
         if(super.data == null)
         {
            super.data = new Vector.<BoardgameVo>();
         }
         return super.data as Vector.<BoardgameVo>;
      }
      
      public function get currencyProxy() : CurrencyProxy
      {
         return facade.retrieveProxy(CurrencyProxy.NAME) as CurrencyProxy;
      }
      
      public function get netProxy() : NetProxy
      {
         return facade.retrieveProxy(NetProxy.NAME) as NetProxy;
      }
      
      public function get collectablesProxy() : CollectablesProxy
      {
         return facade.retrieveProxy(CollectablesProxy.NAME) as CollectablesProxy;
      }
      
      public function get lastRewardStepStr() : String
      {
         return this._lastRewardStepStr;
      }
      
      public function get currentRewardStepStr() : String
      {
         return this._currentRewardStepStr;
      }
   }
}

