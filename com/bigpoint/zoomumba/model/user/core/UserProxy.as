package com.bigpoint.zoomumba.model.user.core
{
   import com.bigpoint.utils.ObjectHelper;
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.utils.timeManager.TimeTrack;
   import com.bigpoint.zoomumba.constants.DataNote;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.UserResources;
   import com.bigpoint.zoomumba.controller.features.cheat.AntiCheatProxy;
   import com.bigpoint.zoomumba.model.gameConfig.MainConfigProxy;
   import com.bigpoint.zoomumba.model.gameConfig.PremiumPackConfigProxy;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayfieldSettingsProxy;
   import com.bigpoint.zoomumba.model.user.core.vo.UserAccountCenterVO;
   import com.bigpoint.zoomumba.model.user.core.vo.UserCommunicationIdsVO;
   import com.bigpoint.zoomumba.model.user.core.vo.UserVO;
   import com.bigpoint.zoomumba.model.user.currency.CurrencyProxy;
   import com.bigpoint.zoomumba.model.user.quests.QuestsProxy;
   import com.bigpoint.zoorama.view.field.PlayField;
   import org.puremvc.as3.interfaces.IProxy;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class UserProxy extends Proxy implements IProxy
   {
      public static const NAME:String = "UserProxy";
      
      private var antiCheatProxy:AntiCheatProxy;
      
      private var premiumPackProxy:PremiumPackConfigProxy;
      
      private var currencyProxy:CurrencyProxy;
      
      private var netProxy:NetProxy;
      
      private var fieldSettingsProxy:PlayfieldSettingsProxy;
      
      private var questsProxy:QuestsProxy;
      
      private var _accountCenterVo:UserAccountCenterVO;
      
      private var premium1TimeTracker1:TimeTrack;
      
      private var premium1TimeTracker2:TimeTrack;
      
      public var commandIds:UserCommunicationIdsVO = new UserCommunicationIdsVO();
      
      public function UserProxy()
      {
         super(NAME,new UserVO());
         this.premium1TimeTracker1 = TimeManager.creatEmptyTrack(this.handlePremiumPack1);
         this.premium1TimeTracker2 = TimeManager.creatEmptyTrack(this.handlePremiumPack2);
      }
      
      private function get userVO() : UserVO
      {
         return data as UserVO;
      }
      
      public function get userId() : int
      {
         return this.userVO.uId;
      }
      
      public function get userName() : String
      {
         return this.userVO.uName;
      }
      
      public function get userPremium() : int
      {
         return this.userVO.uPrem;
      }
      
      public function get userMode() : String
      {
         return this.userVO.uMode;
      }
      
      public function get userLevel() : int
      {
         return this.userVO.uLvl;
      }
      
      public function get userExperience() : Number
      {
         return this.userVO.uEp;
      }
      
      public function get entranceFee() : int
      {
         return this.userVO.entranceFee;
      }
      
      public function get addedEntranceFee() : int
      {
         return this.userVO.efAdd;
      }
      
      public function get virtualAmount() : int
      {
         return this.userVO.uCv;
      }
      
      public function get realAmount() : int
      {
         return this.userVO.uCr;
      }
      
      public function get petPaws() : int
      {
         return this.userVO.pPaw;
      }
      
      public function get pearls() : int
      {
         return this.userVO.pearls;
      }
      
      public function get premiumTimeStamp1() : int
      {
         return this.userVO.uPremium1;
      }
      
      public function get premiumTimeStamp2() : int
      {
         return this.userVO.uPremium2;
      }
      
      public function get needToShowLevelUp() : Boolean
      {
         return this.userVO.lvlUp == 1;
      }
      
      public function get fieldSize() : int
      {
         return this.fieldSettingsProxy.getCurrentFieldSettings().fSize;
      }
      
      public function set userLevel(param1:int) : void
      {
         this.userVO.uLvl = param1;
      }
      
      public function get accountCenterVo() : UserAccountCenterVO
      {
         return this._accountCenterVo;
      }
      
      public function set accountCenterVo(param1:UserAccountCenterVO) : void
      {
         this._accountCenterVo = param1;
      }
      
      override public function onRegister() : void
      {
         this.antiCheatProxy = facade.getProxy(AntiCheatProxy);
         this.premiumPackProxy = facade.getProxy(PremiumPackConfigProxy);
         this.fieldSettingsProxy = facade.getProxy(PlayfieldSettingsProxy);
         this.currencyProxy = facade.getProxy(CurrencyProxy);
         this.netProxy = facade.getProxy(NetProxy);
         this.questsProxy = facade.getProxy(QuestsProxy);
      }
      
      public function storeData(param1:Object) : void
      {
         var _loc10_:Number = NaN;
         var _loc11_:MainConfigProxy = null;
         var _loc2_:Number = this.netProxy.lastParsedResponse;
         var _loc3_:Boolean = Boolean(param1.uId) && (param1.uId >= 0 && this.userId != param1.uId);
         var _loc4_:Boolean = Boolean(param1.uName) && (param1.uName.length > 0 && this.userName != param1.uName);
         var _loc5_:Boolean = Boolean(param1.uLvl) && (param1.uLvl >= 0 && this.userLevel != param1.uLvl);
         var _loc6_:Boolean = Boolean(param1.lvlUp) && param1.lvlUp == 1;
         var _loc7_:Boolean = Boolean(param1.uPremium1) && (param1.uPremium1 >= 0 && this.premiumTimeStamp1 != param1.uPremium1);
         var _loc8_:Boolean = Boolean(param1.uPremium2) && (param1.uPremium2 >= 0 && this.premiumTimeStamp2 != param1.uPremium2);
         if(_loc3_)
         {
            this.antiCheatProxy.start(param1.uId);
         }
         if(Boolean(param1.uLvl) && (this.userLevel > 0 && this.userLevel != param1.uLvl))
         {
            _loc10_ = Number(param1.uLvl);
            if(Boolean(param1.uEp) && (_loc10_ <= 0 && param1.uEp > 0))
            {
               _loc11_ = facade.getProxy(MainConfigProxy);
               _loc10_ = _loc11_.getLevel(param1.uEp);
            }
            _loc6_ ||= this.userLevel < _loc10_;
         }
         if(Boolean(param1.uEp) && _loc2_ >= this.commandIds.experience)
         {
            this.currencyProxy.setCurrency(UserResources.EXPERIENCE,param1.uEp);
         }
         if(Boolean(param1.uCv) && _loc2_ >= this.commandIds.virtualMoney)
         {
            this.currencyProxy.setCurrency(UserResources.VIRTUAL_MONEY,param1.uCv);
         }
         if(Boolean(param1.uCr) && _loc2_ >= this.commandIds.realMoney)
         {
            this.currencyProxy.setCurrency(UserResources.REAL_MONEY,param1.uCr);
         }
         if(Boolean(param1.pPaw) && _loc2_ >= this.commandIds.petPaws)
         {
            this.currencyProxy.setCurrency(UserResources.PET_POWNS,param1.pPaw);
         }
         if(Boolean(param1.pearls) && _loc2_ >= this.commandIds.pearls)
         {
            this.currencyProxy.setCurrency(UserResources.PEARLS,param1.pearls);
         }
         if(Boolean(param1.nDQ) && (param1.nDQ >= 0 && this.questsProxy.userNextDailyQuestTimestamp != param1.nDQ))
         {
            this.questsProxy.userNextDailyQuestTimestamp = param1.nDQ;
         }
         ObjectHelper.copyData(data,param1);
         if(_loc3_)
         {
            sendNotification(DataNote.USER_ID);
         }
         if(_loc4_)
         {
            sendNotification(DataNote.USER_NAME);
         }
         if(_loc5_)
         {
            sendNotification(DataNote.USER_LEVEL);
         }
         if(_loc6_)
         {
            sendNotification(Note.USER_LEVEL_UP);
         }
         if(_loc7_)
         {
            TimeManager.updateTrackTime(this.premium1TimeTracker1,this.premiumTimeStamp1);
            this.updatePremiumPackTimeStamp();
         }
         if(_loc8_)
         {
            TimeManager.updateTrackTime(this.premium1TimeTracker2,this.premiumTimeStamp2);
            this.updatePremiumPackTimeStamp();
         }
         sendNotification(Note.USER_DATA_UPDATED);
         var _loc9_:PlayField = facade.retrieveMediator(PlayField.NAME) as PlayField;
         _loc9_.updateEntranceFee(this.userVO.entranceFee);
         sendNotification(Note.UPDATE_GATE_MENU);
      }
      
      private function handlePremiumPack1() : void
      {
         this.updatePremiumPackTimeStamp();
      }
      
      private function handlePremiumPack2() : void
      {
         this.updatePremiumPackTimeStamp();
      }
      
      private function updatePremiumPackTimeStamp() : void
      {
         if(TimeManager.currentTime < this.premiumTimeStamp1 && TimeManager.currentTime < this.premiumTimeStamp2)
         {
            this.premiumPackProxy.enablePremiumFull();
            sendNotification(Note.PREMIUM_PACK_CHANGED,"PREMIUM FULL");
         }
         else if(TimeManager.currentTime < this.premiumTimeStamp1)
         {
            this.premiumPackProxy.enablePremiumOne();
            sendNotification(Note.PREMIUM_PACK_CHANGED,"PREMIUM ONE");
         }
         else if(TimeManager.currentTime < this.premiumTimeStamp2)
         {
            this.premiumPackProxy.enablePremiumTwo();
            sendNotification(Note.PREMIUM_PACK_CHANGED,"PREMIUM TWO");
         }
         else
         {
            this.premiumPackProxy.disablePremiumPacks();
            sendNotification(Note.PREMIUM_PACK_CHANGED,"PREMIUM DISABLED");
         }
      }
   }
}

