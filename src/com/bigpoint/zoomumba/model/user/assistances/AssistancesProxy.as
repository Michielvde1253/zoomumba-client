package com.bigpoint.zoomumba.model.user.assistances
{
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.utils.timeManager.TimeTrack;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.PlayFieldsTypes;
   import com.bigpoint.zoomumba.constants.SHOP;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.net.responceDataVo.general.AssistanceData;
   import com.bigpoint.zoomumba.model.playfield.PlayfieldSettingsProxy;
   import com.bigpoint.zoomumba.model.user.assistances.vo.AssistantVO;
   import com.bigpoint.zoomumba.model.user.assistances.vo.AssistantsVO;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowParams;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.assistants.AssistantsRenewalWindowInitParams;
   import com.bigpoint.zoorama.data.settings.AssistanceShopData;
   import com.bigpoint.zoorama.utils.configModules.ConfigurationModule;
   import org.puremvc.as3.interfaces.IProxy;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class AssistancesProxy extends Proxy implements IProxy
   {
      public static const NAME:String = "UserAssistancesProxy";
      
      private var userAsistances:Vector.<AssistantVO> = new Vector.<AssistantVO>(AssistantsVO.ASSIST_COUNT + 1);
      
      private var assistanceChangeListeners:Vector.<Function> = new Vector.<Function>();
      
      private var assitantsEndTimeTracks:Vector.<TimeTrack> = new Vector.<TimeTrack>(7);
      
      private var assistantsRawData:Vector.<AssistanceData>;
      
      private var _playfieldSettingsProxy:PlayfieldSettingsProxy;
      
      private var _shownThisSession:Vector.<int> = new Vector.<int>();
      
      private var _waitForCommandId:int = -1;
      
      private var _lastAssistCID:int = -1;
      
      private var _lastAssistType:int = -1;
      
      private var _currentCageNumber:int = 0;
      
      private var _maxCages:int = -1;
      
      public var allowOtherCommands:Boolean = true;
      
      public function AssistancesProxy()
      {
         super(NAME);
      }
      
      public function get currentCageNumber() : int
      {
         return this._currentCageNumber;
      }
      
      public function get maxCages() : int
      {
         return this._maxCages;
      }
      
      public function get waitForCommandId() : int
      {
         return this._waitForCommandId;
      }
      
      public function get lastAssistCID() : int
      {
         return this._lastAssistCID;
      }
      
      public function get lastAssistType() : int
      {
         return this._lastAssistType;
      }
      
      public function set waitForCommandId(param1:int) : void
      {
         this._waitForCommandId = param1;
      }
      
      public function set currentCageNumber(param1:int) : void
      {
         this._currentCageNumber = param1;
      }
      
      public function set maxCages(param1:int) : void
      {
         this._maxCages = param1;
      }
      
      override public function onRegister() : void
      {
         super.onRegister();
         this._playfieldSettingsProxy = facade.retrieveProxy(PlayfieldSettingsProxy.NAME) as PlayfieldSettingsProxy;
      }
      
      public function initAssistants() : void
      {
         this.initAssistanceData();
         this.initTimeTracks();
      }
      
      private function initTimeTracks() : void
      {
         var _loc2_:TimeTrack = null;
         var _loc1_:int = 0;
         while(_loc1_ < AssistantsVO.ACTIVE_ASSISTANCES.length)
         {
            _loc2_ = TimeManager.creatEmptyTrack(this.handleAssistanceFinished,AssistantsVO.ACTIVE_ASSISTANCES[_loc1_]);
            this.assitantsEndTimeTracks[AssistantsVO.ACTIVE_ASSISTANCES[_loc1_]] = _loc2_;
            _loc1_++;
         }
      }
      
      private function handleAssistanceFinished(param1:Object) : void
      {
         var _loc2_:int = param1 as int;
         if(this.getAssistantData(_loc2_))
         {
            this.getAssistantData(_loc2_).isActive = false;
            if(this.getAssistantData(_loc2_).noLayer == 0 && !this.wasPopped(_loc2_))
            {
               facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.ASSISTANT_RENEW,param1.toString(),new AssistantsRenewalWindowInitParams(_loc2_),new WindowParams("",null,"",null,"",null,Note.REFUSE_BUY_ASSISTANT,_loc2_)));
            }
         }
         this._shownThisSession.push(_loc2_);
         sendNotification(SHOP.REFRESH_ASSISTANTS);
      }
      
      public function storeData(param1:Vector.<AssistanceData>) : void
      {
         this.assistantsRawData = param1;
         this.updateAssistantsState();
      }
      
      private function updateAssistantsState() : void
      {
         var i:int = 0;
         while(i < this.assistantsRawData.length)
         {
            try
            {
               this.userAsistances[this.assistantsRawData[i].assistanceId].endTimeStamp = this.assistantsRawData[i].endTimeStamp;
               this.userAsistances[this.assistantsRawData[i].assistanceId].noLayer = this.assistantsRawData[i].noLayer;
               this.userAsistances[this.assistantsRawData[i].assistanceId].isActive = this.assistantsRawData[i].endTimeStamp >= TimeManager.currentTime;
               TimeManager.updateTrackTime(this.assitantsEndTimeTracks[this.assistantsRawData[i].assistanceId],this.assistantsRawData[i].endTimeStamp);
            }
            catch(err:Error)
            {
            }
            i++;
         }
         sendNotification(SHOP.REFRESH_ASSISTANTS);
      }
      
      private function wasPopped(param1:int) : Boolean
      {
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         while(_loc3_ < this._shownThisSession.length)
         {
            if(this._shownThisSession[_loc3_] == param1)
            {
               _loc2_ = true;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      private function initAssistanceData() : void
      {
         var _loc2_:AssistanceShopData = null;
         var _loc3_:AssistantVO = null;
         var _loc1_:int = 0;
         while(_loc1_ < AssistantsVO.ACTIVE_ASSISTANCES.length)
         {
            _loc2_ = ConfigurationModule.getInstance().getAssistanceData(AssistantsVO.ACTIVE_ASSISTANCES[_loc1_]);
            _loc3_ = new AssistantVO();
            _loc3_.assistId = AssistantsVO.ACTIVE_ASSISTANCES[_loc1_];
            _loc3_.isActive = _loc3_.endTimeStamp >= TimeManager.currentTime;
            this.userAsistances[AssistantsVO.ACTIVE_ASSISTANCES[_loc1_]] = _loc3_;
            _loc1_++;
         }
      }
      
      public function setActiveAssistant(param1:int, param2:int) : void
      {
         this._lastAssistCID = param1;
         this._lastAssistType = param2;
      }
      
      public function assistatDataParsed() : void
      {
         this._lastAssistCID = -1;
         this._lastAssistType = -1;
         this.maxCages = 0;
         this.currentCageNumber = 0;
      }
      
      public function getAssistantData(param1:int) : AssistantVO
      {
         return this.userAsistances[param1];
      }
      
      public function get haveAllAssistantsActive() : Boolean
      {
         var _loc1_:Boolean = true;
         if(this._playfieldSettingsProxy.activePlayfieldType != PlayFieldsTypes.FIELD_TYPE_OCEANWORLD_ZOO)
         {
            return this.allNormalPlayfieldAssistantsActive();
         }
         return this.allOceanPlayfieldAssistantsActive();
      }
      
      private function allNormalPlayfieldAssistantsActive() : Boolean
      {
         var _loc1_:int = this.getAssistantData(AssistantsVO.FEED_ASSIST).endTimeStamp;
         var _loc2_:int = this.getAssistantData(AssistantsVO.WATER_ASSIST).endTimeStamp;
         var _loc3_:int = this.getAssistantData(AssistantsVO.CLEAN_ASSIST).endTimeStamp;
         var _loc4_:int = this.getAssistantData(AssistantsVO.CUDDLE_ASSIST).endTimeStamp;
         var _loc5_:int = this.getAssistantData(AssistantsVO.TRASH_ASSIST).endTimeStamp;
         var _loc6_:int = this.getAssistantData(AssistantsVO.CASH_ASSIST).endTimeStamp;
         if(_loc1_ - TimeManager.currentTime <= 0 || _loc2_ - TimeManager.currentTime <= 0 || _loc3_ - TimeManager.currentTime <= 0 || _loc4_ - TimeManager.currentTime <= 0 || _loc5_ - TimeManager.currentTime <= 0 || _loc6_ - TimeManager.currentTime <= 0)
         {
            return false;
         }
         return true;
      }
      
      private function allOceanPlayfieldAssistantsActive() : Boolean
      {
         var _loc1_:int = this.getAssistantData(AssistantsVO.OCEAN_FEED_ASSIST).endTimeStamp;
         var _loc2_:int = this.getAssistantData(AssistantsVO.OCEAN_WATER_ASSIST).endTimeStamp;
         var _loc3_:int = this.getAssistantData(AssistantsVO.OCEAN_CLEAN_ASSIST).endTimeStamp;
         var _loc4_:int = this.getAssistantData(AssistantsVO.OCEAN_CUDDLE_ASSIST).endTimeStamp;
         var _loc5_:int = this.getAssistantData(AssistantsVO.TRASH_ASSIST).endTimeStamp;
         var _loc6_:int = this.getAssistantData(AssistantsVO.CASH_ASSIST).endTimeStamp;
         if(_loc1_ - TimeManager.currentTime <= 0 || _loc2_ - TimeManager.currentTime <= 0 || _loc3_ - TimeManager.currentTime <= 0 || _loc4_ - TimeManager.currentTime <= 0 || _loc5_ - TimeManager.currentTime <= 0 || _loc6_ - TimeManager.currentTime <= 0)
         {
            return false;
         }
         return true;
      }
   }
}

