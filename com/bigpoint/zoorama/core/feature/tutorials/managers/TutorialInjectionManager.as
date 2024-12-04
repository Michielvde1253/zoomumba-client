package com.bigpoint.zoorama.core.feature.tutorials.managers
{
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoomumba.constants.UserResources;
   import com.bigpoint.zoomumba.model.user.core.UserProxy;
   import com.bigpoint.zoomumba.tempModel.TempGetterProxy;
   import com.bigpoint.zoorama.Settings;
   import com.bigpoint.zoorama.core.GUInterfaceManager;
   import com.bigpoint.zoorama.core.feature.tutorials.TutorialOverlay;
   import com.bigpoint.zoorama.core.feature.tutorials.TutorialReferences;
   import com.bigpoint.zoorama.core.feature.tutorials.TutorialStyleOverlay;
   import com.bigpoint.zoorama.core.feature.tutorials.notices.TutorialNotices;
   import com.bigpoint.zoorama.core.feature.tutorials.states.ItemModel;
   import com.bigpoint.zoorama.data.settings.AnimalShopData;
   import com.bigpoint.zoorama.data.settings.CageShopData;
   import com.bigpoint.zoorama.data.settings.ResourceShopData;
   import com.bigpoint.zoorama.data.settings.RoadShopData;
   import com.bigpoint.zoorama.data.settings.ShopItemData;
   import com.bigpoint.zoorama.notices.view.actionMenu.ActionMenuNotice;
   import com.bigpoint.zoorama.notices.view.quickInfo.QuickInfoNotice;
   import com.bigpoint.zoorama.view.actionMenu.ActionMenuTypes;
   import com.bigpoint.zoorama.view.field.TrashManager;
   import com.bigpoint.zoorama.view.field.items.Special;
   import com.greensock.TweenMax;
   import flash.display.Sprite;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   import org.puremvc.as3.patterns.facade.Facade;
   
   public class TutorialInjectionManager
   {
      private static var instance:TutorialInjectionManager;
      
      private var pushTimer:Timer;
      
      public var tutorialCompleteStatus:Boolean = false;
      
      public var currentStep:int = 0;
      
      public var testObject:Sprite;
      
      public var xpReward:Array = [0,0,20,50,50,100,50,50,50,50,50,50,50,100];
      
      private var items:Vector.<ItemModel> = new Vector.<ItemModel>();
      
      private var overlay:TutorialOverlay;
      
      public var styleOverlay:TutorialStyleOverlay;
      
      private var notifier:Notifier;
      
      private var _showCageMenu:int = 0;
      
      public var currentActiveStep:int = 0;
      
      public var roadsPosition:Array;
      
      private var trashManager:TrashManager;
      
      private var mainBuilding:Special;
      
      public var guiInterfaceManager:GUInterfaceManager;
      
      public var parrotMalePlaced:Boolean = false;
      
      public var parrotFemalePlaced:Boolean = false;
      
      public function TutorialInjectionManager()
      {
         super();
         this.init();
      }
      
      public static function getInstance() : TutorialInjectionManager
      {
         if(!instance)
         {
            instance = new TutorialInjectionManager();
         }
         return instance;
      }
      
      private function init() : void
      {
         this.roadsPosition = new Array();
         this.roadsPosition.push(new Point(31,85));
         this.roadsPosition.push(new Point(31,84));
         this.roadsPosition.push(new Point(31,83));
      }
      
      public function setNextStep(param1:int) : void
      {
         var _loc2_:Point = null;
         this.giveXPReward(param1);
         this.currentActiveStep = param1;
         switch(param1)
         {
            case TutorialReferences.TUTORIALSTEP_0:
               break;
            case TutorialReferences.TUTORIALSTEP_1:
               this.currentStep = 1;
               this.grayMenuButtons();
               this.initShopWinow();
               TutorialServerClone.getInstance().setLevel2();
               break;
            case TutorialReferences.TUTORIALSTEP_2:
               TutorialServerClone.getInstance().panPlayField(1);
               this.grayMenuButtons();
               this.initShopWinow();
               this.currentStep = 2;
               this.setShowCageMenu(1);
               _loc2_ = TutorialServerClone.getInstance().getPlayfieldCoodByTilePointInScreenCoord(29,86);
               this.styleOverlay.addFieldArrow(_loc2_,true);
               this.showCagePopupIcon("CAGE_MENU_FEED");
               this.showCagePopupIcon("CAGE_MENU_SUPER_FEED");
               this.showCagePopupIcon("CAGE_MENU_WATER");
               TutorialServerClone.getInstance().setLevel2();
               break;
            case TutorialReferences.TUTORIALSTEP_3:
               this.currentStep = 3;
               this.setShowCageMenu(2);
               _loc2_ = TutorialServerClone.getInstance().getPlayfieldCoodByTilePointInScreenCoord(29,86);
               this.styleOverlay.addFieldArrow(_loc2_,true);
               this.showCagePopupIcon("CAGE_MENU_CLEAN");
               this.showCagePopupIcon("CAGE_MENU_CUDLE");
               TutorialServerClone.getInstance().setLevel3();
               break;
            case TutorialReferences.TUTORIALSTEP_4:
               this.currentStep = 4;
               this.setShowCageMenu(0);
               this.enableItems(["MAIN_MENU_BUTTON_SHOP"],true);
               this.styleOverlay.hideCageArrow();
               this.styleOverlay.showShopButtonArrow(this.getItemById("MAIN_MENU_BUTTON_SHOP"));
               TutorialServerClone.getInstance().setGridHighlighStep4();
               break;
            case TutorialReferences.TUTORIALSTEP_5:
               this.currentStep = 5;
               TutorialServerClone.getInstance().removeGridHighlightStep4();
               this.styleOverlay.showShopButtonArrow(this.getItemById("MAIN_MENU_BUTTON_SHOP"));
               break;
            case TutorialReferences.TUTORIALSTEP_6:
               this.currentStep = 6;
               this.styleOverlay.showShopButtonArrow(this.getItemById("MAIN_MENU_BUTTON_SHOP"));
               this.increaseLevel();
               break;
            case TutorialReferences.TUTORIALSTEP_7:
               this.currentStep = 7;
               this.disableMainMenuButtons();
               this.styleOverlay.hideShopButtonArrow();
               _loc2_ = TutorialServerClone.getInstance().getPlayfieldCoodByTilePointInScreenCoord(31,83);
               this.styleOverlay.addFieldArrow(_loc2_,true);
               TutorialServerClone.getInstance().addRoadTrash();
               this._showCageMenu = 6;
               break;
            case TutorialReferences.TUTORIALSTEP_8:
               this.currentStep = 8;
               this.setShowCageMenu(1);
               this.enableItems(["MAIN_MENU_BUTTON_SHOP"]);
               this.showCagePopupIcon("CAGE_MENU_FEED");
               this.styleOverlay.hideCageArrow();
               TutorialServerClone.getInstance().makeParrotsHungry();
               this.styleOverlay.showShopButtonArrow(this.getItemById("MAIN_MENU_BUTTON_SHOP"));
               this.shopWindowOpen();
               break;
            case TutorialReferences.TUTORIALSTEP_9:
               this.currentStep = 9;
               this.setShowCageMenu(3);
               this.showCagePopupIcon("CAGE_MENU_BREED");
               _loc2_ = TutorialServerClone.getInstance().getPlayfieldCoodByTilePointInScreenCoord(29,84);
               this.styleOverlay.addFieldArrow(_loc2_,true);
               this.styleOverlay.hideShopButtonArrow();
               this.disableMainMenuButtons();
               break;
            case TutorialReferences.TUTORIALSTEP_10:
               this.currentStep = 10;
               this.styleOverlay.hideCageArrow();
               this._showCageMenu = 1;
               TutorialServerClone.getInstance().panPlayField(TutorialReferences.TUTORIALSTEP_10);
               this.setShowCageMenu(1);
               this.mainBuilding.entranceFee = 500;
               this.notifier.dispatchNoticeToRoot(new ActionMenuNotice(ActionMenuNotice.OPEN_ACTION_MENU,ActionMenuTypes.MENU_TYPE_GATE,this.mainBuilding,TutorialServerClone.getInstance().playFieldManager.gateActionMenuPositionCalc(-1)));
               _loc2_ = TutorialServerClone.getInstance().getPlayfieldCoodByTilePointInScreenCoord(27,87);
               _loc2_.x += 68;
               this.styleOverlay.addFieldArrow(_loc2_,true);
               break;
            case TutorialReferences.TUTORIALSTEP_11:
               this.currentStep = 11;
               this.setShowCageMenu(0);
               this.styleOverlay.showAllArrows();
               this.overlay.visible = false;
               this.enableAllMenuButtons();
               this.styleOverlay.hideCageArrow();
               this.styleOverlay.hideRoadPositionArrow();
               this.styleOverlay.hideShopButtonArrow();
               break;
            case TutorialReferences.TUTORIALSTEP_12:
               this.currentStep = 12;
               this.styleOverlay.destroyArrowLayer();
               break;
            case TutorialReferences.TUTORIALSTEP_13:
            case TutorialReferences.TUTORIALSTEP_14:
         }
      }
      
      private function increaseLevel() : void
      {
         var _loc1_:UserProxy = Facade.getInstance().getProxy(UserProxy);
         _loc1_.userLevel = 2;
      }
      
      private function giveXPReward(param1:int) : void
      {
         if(this.xpReward[param1] > 0)
         {
            this.notifier.dispatchNotice(new QuickInfoNotice(QuickInfoNotice.INCREASE_CURRENCY,UserResources.EXPERIENCE,this.xpReward[param1],new Point(300,300)));
            TempGetterProxy.increaseCurrency(UserResources.EXPERIENCE,this.xpReward[param1]);
         }
      }
      
      public function giveXPForJump() : void
      {
         this.notifier.dispatchNotice(new QuickInfoNotice(QuickInfoNotice.INCREASE_CURRENCY,UserResources.EXPERIENCE,500,new Point(300,300)));
         TempGetterProxy.increaseCurrency(UserResources.EXPERIENCE,500);
      }
      
      private function initShopWinow() : void
      {
         this.guiInterfaceManager.closeAllWindowns();
      }
      
      public function handleSkipSteps(param1:int) : void
      {
         switch(param1)
         {
            case TutorialReferences.TUTORIALSTEP_0:
               break;
            case TutorialReferences.TUTORIALSTEP_1:
               this.styleOverlay.skipStep1();
               TutorialServerClone.getInstance().skipStep1();
               break;
            case TutorialReferences.TUTORIALSTEP_2:
               TutorialServerClone.getInstance().skipStep2();
               break;
            case TutorialReferences.TUTORIALSTEP_3:
               TutorialServerClone.getInstance().skipStep3();
               break;
            case TutorialReferences.TUTORIALSTEP_4:
               TutorialServerClone.getInstance().skipStep4();
               break;
            case TutorialReferences.TUTORIALSTEP_5:
               TutorialServerClone.getInstance().skipStep5();
               break;
            case TutorialReferences.TUTORIALSTEP_6:
               TutorialServerClone.getInstance().skipStep6();
               break;
            case TutorialReferences.TUTORIALSTEP_7:
               TutorialServerClone.getInstance().skipStep7();
               break;
            case TutorialReferences.TUTORIALSTEP_8:
               TutorialServerClone.getInstance().skipStep8();
               break;
            case TutorialReferences.TUTORIALSTEP_9:
               TutorialServerClone.getInstance().skipStep9();
               break;
            case TutorialReferences.TUTORIALSTEP_10:
               TutorialServerClone.getInstance().skipStep10();
         }
         this.setNextStep(++param1);
      }
      
      private function enableAllMenuButtons() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.items.length)
         {
            TweenMax.to(this.items[_loc1_].object,0.5,{"colorMatrixFilter":{"saturation":1}});
            _loc1_++;
         }
      }
      
      public function showArrowAtPoint(param1:Point) : void
      {
         var _loc2_:Point = TutorialServerClone.getInstance().getPlayfieldCoodByTilePointInScreenCoord(param1.x,param1.y);
         this.styleOverlay.addFieldArrow(_loc2_,true);
      }
      
      public function addTestView() : void
      {
         if(this.testObject == null)
         {
            this.testObject = new Sprite();
            this.testObject.graphics.beginFill(65280);
            this.testObject.graphics.lineStyle(12,1044480);
            this.testObject.graphics.drawCircle(10810,280,200);
            this.testObject.graphics.endFill();
            this.styleOverlay.addChild(this.testObject);
         }
      }
      
      public function highlightRoads() : void
      {
         this.styleOverlay.highlightRoads();
      }
      
      public function showCagePlaceArrow(param1:int) : void
      {
         this.styleOverlay.showRoadPositionArrow(param1);
      }
      
      private function addDataToCageTab() : ShopItemData
      {
         var _loc1_:CageShopData = new CageShopData();
         _loc1_.cageId = 1;
         _loc1_.width = 2;
         _loc1_.height = 2;
         _loc1_.userLevelRequired = 0;
         _loc1_.buyable = 1;
         _loc1_.buildTime = 0;
         _loc1_.directBuildReal = 1;
         _loc1_.alias = "dsa";
         _loc1_.baseLevel = 0;
         _loc1_.attraction = 1;
         _loc1_.buyVirtual = 100;
         return ShopItemData(_loc1_);
      }
      
      private function addDataToRoadsTab() : ShopItemData
      {
         var _loc1_:RoadShopData = new RoadShopData();
         _loc1_.buyVirtual = 100;
         _loc1_.itemId = 1;
         _loc1_.roadId = 1;
         _loc1_.userLevelRequired = 1;
         _loc1_.buyable = 1;
         return ShopItemData(_loc1_);
      }
      
      public function getShopData(param1:String, param2:Vector.<ShopItemData> = null) : Vector.<ShopItemData>
      {
         var _loc4_:ShopItemData = null;
         var _loc5_:Vector.<ShopItemData> = null;
         var _loc6_:ShopItemData = null;
         var _loc7_:ShopItemData = null;
         var _loc8_:int = 0;
         var _loc3_:Vector.<ShopItemData> = new Vector.<ShopItemData>();
         switch(param1)
         {
            case "null":
               _loc3_ = new Vector.<ShopItemData>();
               break;
            case "cage":
               _loc3_ = this.cloneVector(param2);
               _loc4_ = this.addDataToCageTab();
               this.removeItemFromVector(_loc4_,_loc3_);
               _loc3_.unshift(this.addDataToCageTab());
               break;
            case "animals":
               _loc3_ = this.cloneVector(param2);
               _loc5_ = this.addDataToAnimalsTab();
               _loc8_ = 0;
               while(_loc8_ < _loc5_.length)
               {
                  this.removeItemFromVector(_loc5_[_loc8_],_loc3_);
                  _loc3_.unshift(_loc5_[_loc8_]);
                  _loc8_++;
               }
               _loc5_[0].buyable = 1;
               break;
            case "roads":
               _loc3_ = this.cloneVector(param2);
               _loc6_ = this.addDataToRoadsTab();
               this.removeItemFromVector(_loc6_,_loc3_);
               _loc3_.unshift(this.addDataToRoadsTab());
               break;
            case "resources":
               _loc3_ = this.cloneVector(param2);
               _loc7_ = this.addDataToResourcesTab()[0];
               this.removeItemFromVector(_loc7_,_loc3_);
               _loc3_.unshift(this.addDataToResourcesTab()[0]);
         }
         return _loc3_;
      }
      
      private function cloneVector(param1:Vector.<ShopItemData>) : Vector.<ShopItemData>
      {
         var _loc2_:Vector.<ShopItemData> = new Vector.<ShopItemData>();
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc2_.push(param1[_loc3_].clone());
            _loc3_++;
         }
         return _loc2_;
      }
      
      private function removeItemFromVector(param1:ShopItemData, param2:Vector.<ShopItemData>) : void
      {
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            if(param2[_loc3_].categoryId == param1.categoryId && param2[_loc3_].itemId == param1.itemId)
            {
               param2.splice(_loc3_,1);
            }
            param2[_loc3_].buyable = 0;
            _loc3_++;
         }
      }
      
      private function addDataToResourcesTab() : Vector.<ShopItemData>
      {
         var _loc1_:ResourceShopData = new ResourceShopData();
         _loc1_.buyable = 1;
         _loc1_.buyVirtual = 10;
         _loc1_.count = 10;
         _loc1_.itemId = 5;
         _loc1_.resourceId = 5;
         return Vector.<ShopItemData>([ShopItemData(_loc1_)]);
      }
      
      private function addDataToAnimalsTab() : Vector.<ShopItemData>
      {
         var _loc1_:AnimalShopData = new AnimalShopData();
         _loc1_.speciesId = 1;
         _loc1_.animalId = 1;
         _loc1_.gender = 0;
         _loc1_.categoryId = 11;
         _loc1_.buyable = 1;
         _loc1_.alias = "parrot";
         _loc1_.itemId = 1;
         _loc1_.buyVirtual = 100;
         var _loc2_:AnimalShopData = new AnimalShopData();
         _loc2_.speciesId = 1;
         _loc2_.animalId = 2;
         _loc2_.gender = 1;
         _loc2_.categoryId = 11;
         _loc2_.buyable = 1;
         _loc2_.alias = "parrot";
         _loc2_.itemId = 2;
         _loc2_.buyVirtual = 100;
         return Vector.<ShopItemData>([ShopItemData(_loc1_),ShopItemData(_loc2_)]);
      }
      
      private function setShowCageMenu(param1:int) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.items.length)
         {
            if(this.items[_loc2_].oId.slice(0,10) == "CAGE_MENU_")
            {
               this.items[_loc2_].object.visible = false;
            }
            _loc2_++;
         }
         this._showCageMenu = param1;
      }
      
      public function addItem(param1:Object, param2:String) : void
      {
         var _loc3_:ItemModel = new ItemModel();
         _loc3_.object = param1;
         _loc3_.oId = param2;
         this.items.push(_loc3_);
      }
      
      public function enableItems(param1:Array, param2:Boolean = true) : void
      {
         var _loc5_:ItemModel = null;
         var _loc3_:Array = new Array();
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            _loc5_ = this.getItemById(param1[_loc4_]);
            _loc3_.push(_loc5_);
            _loc4_++;
         }
         this.overlay.redrawLayer(_loc3_,param2);
      }
      
      public function disableItem(param1:String) : void
      {
         var _loc2_:ItemModel = this.getItemById(param1);
         _loc2_.object.visible = false;
      }
      
      private function showCagePopupIcon(param1:String) : void
      {
         this.getItemById(param1).object.visible = true;
      }
      
      private function disableMainMenuButtons() : void
      {
         this.grayMenuButtons();
         this.enableItems([]);
      }
      
      public function addOverlay(param1:TutorialOverlay) : void
      {
         this.overlay = param1;
      }
      
      public function grayMenuButtons() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.items.length)
         {
            if(this.items[_loc1_].oId.slice(0,9) == "MAIN_MENU")
            {
               TweenMax.to(this.items[_loc1_].object,0.5,{"colorMatrixFilter":{"saturation":0.2}});
            }
            _loc1_++;
         }
      }
      
      public function addStyleOverlay(param1:TutorialStyleOverlay) : void
      {
         this.styleOverlay = param1;
      }
      
      public function disableAllItems() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.items.length)
         {
            this.items[_loc1_].object.alpha = 0;
            _loc1_++;
         }
      }
      
      public function disableOverlay() : void
      {
         this.overlay.visible = false;
      }
      
      public function enableOverlay() : void
      {
         this.overlay.visible = true;
      }
      
      public function addEscapedPenguis() : void
      {
         this.styleOverlay.addPenguins();
      }
      
      private function getItemById(param1:String) : ItemModel
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.items.length)
         {
            if(this.items[_loc2_].oId == param1)
            {
               return this.items[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function traceItemList() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.items.length)
         {
            _loc1_++;
         }
      }
      
      public function redrawLayer(param1:Array, param2:Boolean) : void
      {
         this.overlay.redrawLayer(param1,param2);
      }
      
      public function animalAdded(param1:int, param2:int) : void
      {
         if(param1 == 19)
         {
            this.styleOverlay.enableNextPenguin();
         }
         else
         {
            if(param2 == 1 && param1 == 1)
            {
               TutorialServerClone.getInstance().addParrotToCage();
               this.notifier.dispatchNoticeToRoot(new TutorialNotices(TutorialNotices.TASK_COMPLETE,1));
               this.parrotMalePlaced = true;
               this.styleOverlay.showShopButtonArrow(this.getItemById("MAIN_MENU_BUTTON_SHOP"));
               this.styleOverlay.hideCageArrow();
            }
            if(param2 == 1 && param1 == 2)
            {
               TutorialServerClone.getInstance().addParrotToCage();
               this.notifier.dispatchNoticeToRoot(new TutorialNotices(TutorialNotices.TASK_COMPLETE,2));
               this.parrotFemalePlaced = true;
               this.styleOverlay.showShopButtonArrow(this.getItemById("MAIN_MENU_BUTTON_SHOP"));
               this.styleOverlay.hideCageArrow();
            }
            if(this.parrotFemalePlaced && this.parrotMalePlaced)
            {
               this.styleOverlay.hideShopButtonArrow();
            }
         }
      }
      
      public function animalNotInCage() : void
      {
         if(this.currentStep == 1)
         {
            this.styleOverlay.reactivateLastPenguin();
         }
      }
      
      public function step2SuperFeed() : void
      {
         this.notifier.dispatchNoticeToRoot(new TutorialNotices(TutorialNotices.TASK_COMPLETE,1));
      }
      
      public function step3Clean() : void
      {
         this.notifier.dispatchNoticeToRoot(new TutorialNotices(TutorialNotices.TASK_COMPLETE,2));
      }
      
      public function step3Cuddle() : void
      {
         this.notifier.dispatchNoticeToRoot(new TutorialNotices(TutorialNotices.TASK_COMPLETE,1));
      }
      
      public function get showCageMenu() : int
      {
         return this._showCageMenu;
      }
      
      public function addCageButton() : void
      {
      }
      
      public function setNotifier(param1:Notifier) : void
      {
         this.notifier = new Notifier(param1);
      }
      
      public function shopWindowOpen() : void
      {
      }
      
      public function cageBuyFromShop() : void
      {
         this.styleOverlay.hideShopButtonArrow();
         var _loc1_:Point = TutorialServerClone.getInstance().getPlayfieldCoodByTilePointInScreenCoord(29,84);
         this.styleOverlay.addFieldArrow(_loc1_,true);
      }
      
      public function animalBuyFromShop() : void
      {
         this.styleOverlay.hideShopButtonArrow();
         var _loc1_:Point = TutorialServerClone.getInstance().getPlayfieldCoodByTilePointInScreenCoord(29,84);
         this.styleOverlay.addFieldArrow(_loc1_,true);
      }
      
      public function cagePlacedCorrectly() : void
      {
         this.styleOverlay.hideCageArrow();
         TutorialServerClone.getInstance().putCageToPlayfield();
         this.currentStep = 5;
         this.notifier.dispatchNoticeToRoot(new TutorialNotices(TutorialNotices.TASK_COMPLETE,1));
      }
      
      public function handleHighlightCorrectSex(param1:int) : void
      {
      }
      
      public function roadsPlaced() : void
      {
         this.notifier.dispatchNoticeToRoot(new TutorialNotices(TutorialNotices.TASK_COMPLETE,1));
         TutorialServerClone.getInstance().roadComplete();
         this.styleOverlay.hideRoadPositionArrow();
         this.styleOverlay.hideShopButtonArrow();
         TutorialServerClone.getInstance().removeHighlightStep6Roads(1);
         TutorialServerClone.getInstance().removeHighlightStep6Roads(2);
         TutorialServerClone.getInstance().removeHighlightStep6Roads(3);
      }
      
      public function trashCleaned() : void
      {
         this.notifier.dispatchNoticeToRoot(new TutorialNotices(TutorialNotices.TASK_COMPLETE,1));
         this._showCageMenu = 0;
      }
      
      public function feedAnimals(param1:int) : void
      {
         if(param1 == 3 && this.currentStep == 2)
         {
            this.notifier.dispatchNoticeToRoot(new TutorialNotices(TutorialNotices.TASK_COMPLETE,1));
         }
         if(param1 == 1 && this.currentStep == 8)
         {
            this.notifier.dispatchNoticeToRoot(new TutorialNotices(TutorialNotices.TASK_COMPLETE,2));
            this.styleOverlay.hideShopButtonArrow();
         }
      }
      
      public function superFeedAnimals(param1:int) : void
      {
         if(param1 == 3 && this.currentStep == 2)
         {
            this.notifier.dispatchNoticeToRoot(new TutorialNotices(TutorialNotices.TASK_COMPLETE,1));
         }
         if(param1 == 1 && this.currentStep == 8)
         {
         }
      }
      
      public function waterAnimals(param1:int) : void
      {
         if(param1 == 3)
         {
            this.notifier.dispatchNoticeToRoot(new TutorialNotices(TutorialNotices.TASK_COMPLETE,2));
         }
         if(param1 == 1)
         {
         }
      }
      
      public function instantBreed(param1:int) : void
      {
         if(this.currentStep == 9 && param1 == 1)
         {
            this.notifier.dispatchNoticeToRoot(new TutorialNotices(TutorialNotices.TASK_COMPLETE,1));
            TutorialServerClone.getInstance().addParrotBaby();
         }
      }
      
      public function hideShopArrow() : void
      {
         this.styleOverlay.hideShopButtonArrow();
      }
      
      public function collectGateMoney() : void
      {
         if(this.currentStep == 10)
         {
            this.notifier.dispatchNoticeToRoot(new TutorialNotices(TutorialNotices.TASK_COMPLETE,1));
         }
      }
      
      public function injectMainBuilding(param1:Special) : void
      {
         this.mainBuilding = param1;
      }
      
      public function injectGuiInterfaceManager(param1:GUInterfaceManager) : void
      {
         this.guiInterfaceManager = param1;
      }
      
      public function injectTrashManager(param1:TrashManager) : void
      {
         this.trashManager = param1;
      }
      
      public function disableTutorialMode() : void
      {
         var _loc1_:int = 0;
         this.tutorialCompleteStatus = true;
         this.showFinalReward();
         this._showCageMenu = 1;
         while(_loc1_ < this.items.length)
         {
            if(this.items[_loc1_].oId.slice(0,10) == "CAGE_MENU_")
            {
               this.items[_loc1_].object.visible = true;
            }
            _loc1_++;
         }
         TutorialServerClone.getInstance().markAsDelete();
         this.pushTimer = new Timer(5000);
         this.pushTimer.addEventListener(TimerEvent.TIMER,this.timedRequestToPush);
         this.pushTimer.start();
      }
      
      private function timedRequestToPush(param1:TimerEvent) : void
      {
         TutorialServerClone.getInstance().requestPush();
         this.pushTimer.removeEventListener(TimerEvent.TIMER,this.timedRequestToPush);
         this.pushTimer = null;
      }
      
      private function showFinalReward() : void
      {
         this.giveXPReward(13);
      }
      
      public function shopItemSelected(param1:TutorialNotices) : void
      {
         var _loc2_:Point = null;
         if(this.currentStep == TutorialReferences.TUTORIALSTEP_8)
         {
            this.notifier.dispatchNoticeToRoot(new TutorialNotices(TutorialNotices.TASK_COMPLETE,1));
            _loc2_ = TutorialServerClone.getInstance().getPlayfieldCoodByTilePointInScreenCoord(29,84);
            this.styleOverlay.addFieldArrow(_loc2_,true);
            this.styleOverlay.hideShopButtonArrow();
         }
      }
      
      public function shopWindowClosed(param1:TutorialNotices) : void
      {
         var _loc2_:Point = null;
         if(this.currentStep == TutorialReferences.TUTORIALSTEP_5)
         {
            this.styleOverlay.hideShopButtonArrow();
            _loc2_ = TutorialServerClone.getInstance().getPlayfieldCoodByTilePointInScreenCoord(29,84);
            this.styleOverlay.addFieldArrow(_loc2_,true);
         }
      }
      
      public function pushArrived() : void
      {
         if(TutorialServerClone.getInstance().waitForPush)
         {
            TutorialServerClone.getInstance().waitForPush = false;
            this.notifier.dispatchNoticeToRoot(new TutorialNotices(TutorialNotices.CLOSE_TUTORIAL_WINDOW,1));
            Settings.TUTORIAL_ACTIVE = false;
            Settings.DISABLE_ALL_KEYS = false;
         }
      }
      
      public function showIndividualStepItems(param1:int) : void
      {
         switch(param1)
         {
            case TutorialReferences.TUTORIALSTEP_13:
               this.styleOverlay.visible = true;
               this.styleOverlay.alpha = 1;
               this.styleOverlay.showShopButtonArrow(this.getItemById("MAIN_MENU_BUTTON_SHOP"));
               this.styleOverlay.shopButtonArrow.x = 670;
               break;
            case TutorialReferences.TUTORIALSTEP_14:
               TutorialServerClone.getInstance().panPlayField(TutorialReferences.TUTORIALSTEP_14);
               this.styleOverlay.visible = true;
               this.styleOverlay.alpha = 1;
               this.styleOverlay.showShopButtonArrow(this.getItemById("MAIN_MENU_BUTTON_SHOP"));
               this.styleOverlay.shopButtonArrow.x = 300;
               this.styleOverlay.shopButtonArrow.y = 320;
         }
      }
      
      public function clearIndividualTutorialItems() : void
      {
         this.styleOverlay.visible = false;
      }
      
      public function restoreShopCardStates() : void
      {
      }
   }
}

