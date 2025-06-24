package com.bigpoint.zoorama.core.feature.tutorials.managers
{
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.CageData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.DecorData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.FieldItemData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.RoadData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.StoreData;
   import com.bigpoint.zoomumba.tempModel.TempGetterProxy;
   import com.bigpoint.zoorama.Settings;
   import com.bigpoint.zoorama.core.PlayFieldManager;
   import com.bigpoint.zoorama.core.feature.tutorials.TutorialReferences;
   import com.bigpoint.zoorama.data.fieldItems.TrashRoadData;
   import com.bigpoint.zoorama.data.settings.SpecieShopData;
   import com.bigpoint.zoorama.notices.view.actionMenu.ActionNotice;
   import com.bigpoint.zoorama.utils.configModules.ConfigurationModule;
   import com.bigpoint.zoorama.view.field.PlayField;
   import flash.geom.Point;
   
   public class TutorialServerClone
   {
      private static var instance:TutorialServerClone;
      
      private var _playFieldManager:PlayFieldManager;
      
      private var FUTURE_TIME:int = 3600;
      
      private var meadowCage:CageData = new CageData();
      
      private var iceCage:CageData = new CageData();
      
      private var road1:RoadData;
      
      private var road2:RoadData;
      
      private var road3:RoadData;
      
      private var storeData:StoreData;
      
      public var waitForPush:Boolean = false;
      
      private var highlightCage:DecorData;
      
      private var highlightRoadA:DecorData;
      
      private var highlightRoadB:DecorData;
      
      private var highlightRoadC:DecorData;
      
      public function TutorialServerClone()
      {
         super();
      }
      
      public static function getInstance() : TutorialServerClone
      {
         if(!instance)
         {
            instance = new TutorialServerClone();
         }
         return instance;
      }
      
      public function initStage() : void
      {
         var _loc1_:SpecieShopData = null;
         _loc1_ = ConfigurationModule.getInstance().getSpecieData(7);
         this.iceCage.uniqueId = 100;
         this.iceCage.active = 1;
         this.iceCage.speciesId = 7;
         this.iceCage.level = 1;
         this.iceCage.femaleCount = 1;
         this.iceCage.itemId = 3;
         this.iceCage.posX = 29;
         this.iceCage.posY = 86;
         this.iceCage.healthTimeStamp = TimeManager.currentTime + _loc1_.healthTime;
         this.iceCage.feedTimeStamp = TimeManager.currentTime;
         this.iceCage.cuddleTimeStamp = TimeManager.currentTime + _loc1_.cuddleTime;
         this.iceCage.waterTimeStamp = TimeManager.currentTime;
         this.iceCage.cleanTimeStamp = TimeManager.currentTime + _loc1_.cleanTime;
         this.storeData = new StoreData();
         this.storeData.active = 1;
         this.storeData.itemId = 1;
         this.storeData.posX = 32;
         this.storeData.posY = 86;
         this.storeData.collectTimeStamp = TimeManager.currentTime + this.FUTURE_TIME;
         this.playFieldManager.playField.setFieldItems(Vector.<FieldItemData>([this.iceCage,this.storeData]),PlayField.GUESS_COMMANDID);
      }
      
      public function setLevel2() : void
      {
         var _loc1_:SpecieShopData = ConfigurationModule.getInstance().getSpecieData(7);
         this.iceCage.uniqueId = 100;
         this.iceCage.active = 1;
         this.iceCage.speciesId = 7;
         this.iceCage.level = 1;
         this.iceCage.femaleCount = 1;
         this.iceCage.maleCount = 2;
         this.iceCage.itemId = 3;
         this.iceCage.posX = 29;
         this.iceCage.posY = 86;
         this.iceCage.healthTimeStamp = TimeManager.currentTime + _loc1_.healthTime;
         this.iceCage.feedTimeStamp = TimeManager.currentTime;
         this.iceCage.cuddleTimeStamp = TimeManager.currentTime + _loc1_.cuddleTime;
         this.iceCage.waterTimeStamp = TimeManager.currentTime;
         this.iceCage.cleanTimeStamp = TimeManager.currentTime + _loc1_.cleanTime;
         this.playFieldManager.playField.setFieldItems(Vector.<FieldItemData>([this.iceCage]),PlayField.GUESS_COMMANDID);
      }
      
      public function setLevel3() : void
      {
         var _loc1_:SpecieShopData = ConfigurationModule.getInstance().getSpecieData(7);
         this.iceCage.uniqueId = 100;
         this.iceCage.active = 1;
         this.iceCage.speciesId = 7;
         this.iceCage.level = 1;
         this.iceCage.femaleCount = 1;
         this.iceCage.itemId = 3;
         this.iceCage.posX = 29;
         this.iceCage.posY = 86;
         this.iceCage.healthTimeStamp = TimeManager.currentTime + _loc1_.healthTime;
         this.iceCage.feedTimeStamp = TimeManager.currentTime + _loc1_.feedTime;
         this.iceCage.cuddleTimeStamp = TimeManager.currentTime;
         this.iceCage.waterTimeStamp = TimeManager.currentTime + _loc1_.waterTime;
         this.iceCage.cleanTimeStamp = TimeManager.currentTime;
         this.playFieldManager.playField.setFieldItems(Vector.<FieldItemData>([this.iceCage]),PlayField.GUESS_COMMANDID);
      }
      
      public function set playFieldManager(param1:PlayFieldManager) : void
      {
         this._playFieldManager = param1;
      }
      
      public function panStartUp() : void
      {
         this.playFieldManager.playField.movePlayField(new Point(-90,-30));
      }
      
      public function getPlayfieldCoodByTilePoint(param1:int, param2:int) : Point
      {
         return this.playFieldManager.playField.getCordinatePossition(param1,param2);
      }
      
      public function getViewFieldCoordinates() : Point
      {
         return this.playFieldManager.playField.getFieldViewCoord();
      }
      
      public function getPlayfieldCoodByTilePointInScreenCoord(param1:int, param2:int) : Point
      {
         var _loc3_:Point = TutorialServerClone.getInstance().getPlayfieldCoodByTilePoint(param1,param2);
         var _loc4_:Point = TutorialServerClone.getInstance().getViewFieldCoordinates();
         return new Point(_loc3_.x + _loc4_.x,_loc3_.y + _loc4_.y);
      }
      
      public function panPlayField(param1:int) : void
      {
         var _loc4_:Point = null;
         var _loc2_:int = this.playFieldManager.playField.fieldSprite.stage.stageWidth;
         var _loc3_:int = this.playFieldManager.playField.fieldSprite.stage.stageHeight;
         switch(param1)
         {
            case TutorialReferences.TUTORIALSTEP_1:
               _loc4_ = TutorialServerClone.getInstance().getPlayfieldCoodByTilePoint(24,85);
               this.playFieldManager.playField.moveDirectPlayField(new Point(_loc4_.x * -1,_loc4_.y * -1));
               break;
            case TutorialReferences.TUTORIALSTEP_10:
               _loc4_ = TutorialServerClone.getInstance().getPlayfieldCoodByTilePoint(22,88);
               this.playFieldManager.playField.moveDirectPlayField(new Point(_loc4_.x * -1,_loc4_.y * -1));
               break;
            case TutorialReferences.TUTORIALSTEP_14:
               this.playFieldManager.playField.movePlayField(new Point(-120,340));
         }
      }
      
      public function panPlayFieldSocial() : void
      {
         this.playFieldManager.playField.movePlayField(new Point(220,20));
      }
      
      public function get playFieldManager() : PlayFieldManager
      {
         return this._playFieldManager;
      }
      
      public function putCageToPlayfield() : void
      {
         this.meadowCage.active = 0;
         this.meadowCage.level = 1;
         this.meadowCage.uniqueId = -5;
         this.meadowCage.itemId = 1;
         this.meadowCage.speciesId = 1;
         this.meadowCage.posX = 29;
         this.meadowCage.posY = 84;
         this.playFieldManager.playField.setFieldItems(Vector.<FieldItemData>([this.meadowCage]),PlayField.GUESS_COMMANDID);
      }
      
      public function addParrotToCage() : void
      {
         var _loc1_:SpecieShopData = ConfigurationModule.getInstance().getSpecieData(1);
         this.meadowCage.healthTimeStamp = TimeManager.currentTime + _loc1_.healthTime;
         this.meadowCage.feedTimeStamp = TimeManager.currentTime + _loc1_.feedTime;
         this.meadowCage.cuddleTimeStamp = TimeManager.currentTime + _loc1_.cuddleTime;
         this.meadowCage.waterTimeStamp = TimeManager.currentTime + _loc1_.waterTime;
         this.meadowCage.cleanTimeStamp = TimeManager.currentTime + _loc1_.cleanTime;
         this.playFieldManager.playField.setFieldItems(Vector.<FieldItemData>([this.meadowCage]),PlayField.GUESS_COMMANDID);
      }
      
      public function addFemaleToCage() : void
      {
         this.playFieldManager.playField.setFieldItems(Vector.<FieldItemData>([this.meadowCage]),PlayField.GUESS_COMMANDID);
      }
      
      public function roadComplete() : void
      {
         this.meadowCage.active = 1;
         this.playFieldManager.playField.setFieldItems(Vector.<FieldItemData>([this.meadowCage]),PlayField.GUESS_COMMANDID);
      }
      
      public function addRoadTrash() : void
      {
         var _loc1_:TrashRoadData = new TrashRoadData();
         if(Settings.TUTORIAL_STEP <= 7)
         {
            _loc1_.itemId = 1;
            _loc1_.posX = 31;
            _loc1_.posY = 83;
            _loc1_.trashAmount = 20;
            this.playFieldManager.playField.setFieldItems(Vector.<FieldItemData>([_loc1_]),PlayField.GUESS_COMMANDID);
         }
      }
      
      public function makeParrotsHungry() : void
      {
         this.meadowCage.waterTimeStamp = TimeManager.currentTime;
         this.meadowCage.feedTimeStamp = TimeManager.currentTime;
         this.playFieldManager.playField.setFieldItems(Vector.<FieldItemData>([this.meadowCage]),PlayField.GUESS_COMMANDID);
      }
      
      public function addParrotBaby() : void
      {
         this.meadowCage.childCount = 1;
         this.playFieldManager.playField.setFieldItems(Vector.<FieldItemData>([this.meadowCage]),PlayField.GUESS_COMMANDID);
      }
      
      public function skipStep1() : void
      {
         this.iceCage.uniqueId = 100;
         this.iceCage.maleCount = 2;
         this.iceCage.femaleCount = 1;
         this.playFieldManager.playField.setFieldItems(Vector.<FieldItemData>([this.iceCage]),PlayField.GUESS_COMMANDID);
      }
      
      public function skipStep2() : void
      {
         var _loc1_:SpecieShopData = ConfigurationModule.getInstance().getSpecieData(7);
         this.iceCage.uniqueId = 100;
         this.iceCage.healthTimeStamp = TimeManager.currentTime + _loc1_.healthTime;
         this.iceCage.feedTimeStamp = TimeManager.currentTime + _loc1_.feedTime;
         this.iceCage.cuddleTimeStamp = TimeManager.currentTime + _loc1_.cuddleTime;
         this.iceCage.waterTimeStamp = TimeManager.currentTime + _loc1_.waterTime;
         this.iceCage.cleanTimeStamp = TimeManager.currentTime + _loc1_.cleanTime;
         this.playFieldManager.playField.setFieldItems(Vector.<FieldItemData>([this.iceCage]),PlayField.GUESS_COMMANDID);
      }
      
      public function skipStep3() : void
      {
         var _loc1_:SpecieShopData = ConfigurationModule.getInstance().getSpecieData(7);
         this.iceCage.uniqueId = 100;
         this.iceCage.healthTimeStamp = TimeManager.currentTime + _loc1_.healthTime;
         this.iceCage.feedTimeStamp = TimeManager.currentTime + _loc1_.feedTime;
         this.iceCage.cuddleTimeStamp = TimeManager.currentTime + _loc1_.cuddleTime;
         this.iceCage.waterTimeStamp = TimeManager.currentTime + _loc1_.waterTime;
         this.iceCage.cleanTimeStamp = TimeManager.currentTime + _loc1_.cleanTime;
         this.playFieldManager.playField.setFieldItems(Vector.<FieldItemData>([this.iceCage]),PlayField.GUESS_COMMANDID);
      }
      
      public function skipStep4() : void
      {
         this.putCageToPlayfield();
      }
      
      public function skipStep5() : void
      {
         var _loc1_:SpecieShopData = ConfigurationModule.getInstance().getSpecieData(1);
         this.meadowCage.maleCount = 1;
         this.meadowCage.femaleCount = 1;
         this.meadowCage.healthTimeStamp = TimeManager.currentTime + _loc1_.healthTime;
         this.meadowCage.feedTimeStamp = TimeManager.currentTime + _loc1_.feedTime;
         this.meadowCage.cuddleTimeStamp = TimeManager.currentTime + _loc1_.cuddleTime;
         this.meadowCage.waterTimeStamp = TimeManager.currentTime + _loc1_.waterTime;
         this.meadowCage.cleanTimeStamp = TimeManager.currentTime + _loc1_.cleanTime;
         this.playFieldManager.playField.setFieldItems(Vector.<FieldItemData>([this.meadowCage]),PlayField.GUESS_COMMANDID);
      }
      
      public function skipStep6() : void
      {
         this.road1 = new RoadData();
         this.road1.itemId = 1;
         this.road1.uniqueId = 1;
         this.road1.posX = 31;
         this.road1.posY = 85;
         this.road2 = new RoadData();
         this.road2.itemId = 1;
         this.road2.uniqueId = 2;
         this.road2.posX = 31;
         this.road2.posY = 84;
         this.road3 = new RoadData();
         this.road3.itemId = 1;
         this.road3.uniqueId = 3;
         this.road3.posX = 31;
         this.road3.posY = 83;
         this.playFieldManager.playField.setFieldItems(Vector.<FieldItemData>([this.road1,this.road2,this.road3]),PlayField.GUESS_COMMANDID);
         this.roadComplete();
      }
      
      public function skipStep7() : void
      {
         if(Settings.TUTORIAL_STEP <= 7)
         {
            this.playFieldManager.handleActionTrashbinCleanButtonClick(new ActionNotice(ActionNotice.ACTION_MENU_BUTTON_CLICK,2,11,12,-1,"Muell_Ex_1"));
         }
      }
      
      public function skipStep8() : void
      {
         var _loc1_:SpecieShopData = ConfigurationModule.getInstance().getSpecieData(1);
         this.meadowCage.healthTimeStamp = TimeManager.currentTime + _loc1_.healthTime;
         this.meadowCage.feedTimeStamp = TimeManager.currentTime + _loc1_.feedTime;
         this.meadowCage.cuddleTimeStamp = TimeManager.currentTime + _loc1_.cuddleTime;
         this.meadowCage.waterTimeStamp = TimeManager.currentTime + _loc1_.waterTime;
         this.meadowCage.cleanTimeStamp = TimeManager.currentTime + _loc1_.cleanTime;
         this.playFieldManager.playField.setFieldItems(Vector.<FieldItemData>([this.meadowCage]),PlayField.GUESS_COMMANDID);
      }
      
      public function skipStep9() : void
      {
         this.meadowCage.childCount = 1;
         this.playFieldManager.playField.setFieldItems(Vector.<FieldItemData>([this.meadowCage]),PlayField.GUESS_COMMANDID);
      }
      
      public function skipStep10() : void
      {
         this.playFieldManager.closeAllActionMenus();
      }
      
      public function requestPush() : void
      {
         this.waitForPush = true;
         TempGetterProxy.sendNotification(NET.GET_USER);
         TempGetterProxy.sendNotification(NET.PUSH);
      }
      
      public function markAsDelete() : void
      {
         var _loc1_:Vector.<FieldItemData> = new Vector.<FieldItemData>();
         if(this.meadowCage)
         {
            this.meadowCage.del = 1;
            _loc1_.push(this.meadowCage);
         }
         if(this.iceCage)
         {
            this.iceCage.del = 1;
            _loc1_.push(this.iceCage);
         }
         if(this.road1)
         {
            this.road1.del = 1;
            _loc1_.push(this.road1);
         }
         if(this.road2)
         {
            this.road2.del = 1;
            _loc1_.push(this.road2);
         }
         if(this.road3)
         {
            this.road3.del = 1;
            _loc1_.push(this.road3);
         }
         if(this.storeData)
         {
            this.storeData.del = 1;
            _loc1_.push(this.storeData);
         }
         this.playFieldManager.playField.setFieldItems(_loc1_,PlayField.GUESS_COMMANDID);
      }
      
      public function setGridHighlighStep4() : void
      {
         this.highlightCage = new DecorData();
         this.highlightCage.uniqueId = -1024;
         this.highlightCage.active = 1;
         this.highlightCage.itemId = 3000;
         this.highlightCage.posX = 29;
         this.highlightCage.posY = 84;
         this.playFieldManager.playField.setFieldItems(Vector.<FieldItemData>([this.highlightCage]),PlayField.GUESS_COMMANDID);
      }
      
      public function removeGridHighlightStep4() : void
      {
         this.highlightCage.del = 1;
         this.playFieldManager.playField.setFieldItems(Vector.<FieldItemData>([this.highlightCage]),PlayField.GUESS_COMMANDID);
      }
      
      public function setHighlightStep6Roads(param1:int) : void
      {
         switch(param1)
         {
            case 1:
               if(!this.highlightRoadA)
               {
                  this.highlightRoadA = new DecorData();
                  this.highlightRoadA.uniqueId = -1025;
                  this.highlightRoadA.active = 1;
                  this.highlightRoadA.itemId = 3001;
                  this.highlightRoadA.posX = 31;
                  this.highlightRoadA.posY = 85;
                  this.playFieldManager.playField.setFieldItems(Vector.<FieldItemData>([this.highlightRoadA]),PlayField.GUESS_COMMANDID);
               }
               break;
            case 2:
               if(!this.highlightRoadB)
               {
                  this.highlightRoadB = new DecorData();
                  this.highlightRoadB.uniqueId = -1026;
                  this.highlightRoadB.active = 1;
                  this.highlightRoadB.itemId = 3001;
                  this.highlightRoadB.posX = 31;
                  this.highlightRoadB.posY = 84;
                  this.playFieldManager.playField.setFieldItems(Vector.<FieldItemData>([this.highlightRoadB]),PlayField.GUESS_COMMANDID);
               }
               break;
            case 3:
               if(!this.highlightRoadC)
               {
                  this.highlightRoadC = new DecorData();
                  this.highlightRoadC.uniqueId = -1027;
                  this.highlightRoadC.active = 1;
                  this.highlightRoadC.itemId = 3001;
                  this.highlightRoadC.posX = 31;
                  this.highlightRoadC.posY = 83;
                  this.playFieldManager.playField.setFieldItems(Vector.<FieldItemData>([this.highlightRoadC]),PlayField.GUESS_COMMANDID);
               }
         }
      }
      
      public function removeHighlightStep6Roads(param1:int) : void
      {
         switch(param1)
         {
            case 1:
               if(this.highlightRoadA)
               {
                  this.highlightRoadA.del = 1;
                  this.playFieldManager.playField.setFieldItems(Vector.<FieldItemData>([this.highlightRoadA]),PlayField.GUESS_COMMANDID);
               }
               break;
            case 2:
               if(this.highlightRoadB)
               {
                  this.highlightRoadB.del = 1;
                  this.playFieldManager.playField.setFieldItems(Vector.<FieldItemData>([this.highlightRoadB]),PlayField.GUESS_COMMANDID);
               }
               break;
            case 3:
               if(this.highlightRoadC)
               {
                  this.highlightRoadC.del = 1;
                  this.playFieldManager.playField.setFieldItems(Vector.<FieldItemData>([this.highlightRoadC]),PlayField.GUESS_COMMANDID);
               }
         }
      }
   }
}

