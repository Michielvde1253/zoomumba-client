package com.bigpoint.zoorama.view.field
{
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoomumba.constants.AppMode;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.DataNote;
   import com.bigpoint.zoomumba.constants.GUINote;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.PlayFieldsTypes;
   import com.bigpoint.zoomumba.model.app.core.AppProxy;
   import com.bigpoint.zoomumba.model.app.gameEvents.GlobalEventProxy;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.EventTypes;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.settings.AppConfigProxy;
   import com.bigpoint.zoomumba.model.events.advBreeding.AdvBreedingEventProxy;
   import com.bigpoint.zoomumba.model.events.xmas.XMas2012Proxy;
   import com.bigpoint.zoomumba.model.events.xmas.XmasProxy;
   import com.bigpoint.zoomumba.model.features.babyCaravan.BabyCaravanProxy;
   import com.bigpoint.zoomumba.model.features.circus.CircusProxy;
   import com.bigpoint.zoomumba.model.features.mainBuildingSelect.MainBuildingSelectionProxy;
   import com.bigpoint.zoomumba.model.features.powerup.PowerupProxy;
   import com.bigpoint.zoomumba.model.features.powerup.vo.PowerupItemType;
   import com.bigpoint.zoomumba.model.gui.particles.ParticlesProxy;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.CageData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.FieldItemData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.SpecialData;
   import com.bigpoint.zoomumba.model.playfield.PlayFieldProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayfieldSettingsProxy;
   import com.bigpoint.zoomumba.model.playfield.vo.PlayfieldSettingsVO;
   import com.bigpoint.zoomumba.model.user.core.UserProxy;
   import com.bigpoint.zoorama.MainConfig;
   import com.bigpoint.zoorama.Settings;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.core.VisitorManager;
   import com.bigpoint.zoorama.core.feature.tutorials.managers.TutorialInjectionManager;
   import com.bigpoint.zoorama.core.namespaces.logic;
   import com.bigpoint.zoorama.data.settings.CageShopData;
   import com.bigpoint.zoorama.data.settings.SpecieShopData;
   import com.bigpoint.zoorama.notices.playfield.EsterEggNotice;
   import com.bigpoint.zoorama.notices.view.field.DeleteItemNotice;
   import com.bigpoint.zoorama.notices.view.field.VisitorNotice;
   import com.bigpoint.zoorama.utils.configModules.ConfigurationModule;
   import com.bigpoint.zoorama.utils.mouseModule.MouseModule;
   import com.bigpoint.zoorama.utils.mouseModule.MouseState;
   import com.bigpoint.zoorama.view.field.items.Building;
   import com.bigpoint.zoorama.view.field.items.Decor;
   import com.bigpoint.zoorama.view.field.items.FieldItemStateNotice;
   import com.bigpoint.zoorama.view.field.items.ItemAbstract;
   import com.bigpoint.zoorama.view.field.items.ItemFactory;
   import com.bigpoint.zoorama.view.field.items.ItemNotice;
   import com.bigpoint.zoorama.view.field.items.RoadGlow;
   import com.bigpoint.zoorama.view.field.items.Special;
   import com.bigpoint.zoorama.view.field.items.TrashBin;
   import com.bigpoint.zoorama.view.field.items.Visitor;
   import com.greensock.TweenLite;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextField;
   import flash.utils.Dictionary;
   import mx.core.UIComponent;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.mediator.Mediator;
   import utils.GrayDisabler;
   
   use namespace logic;
   
   public class PlayField extends Mediator
   {
      public static const NAME:String = "PlayField";
      
      public static const GATE_ENTRANCE_BUILDING_ID:int = -1;
      
      private static const GATE_ENTRANCE_FENCE_ID:int = -2;
      
      private static const OCEANWORLD_SIGN_ID:int = -3;
      
      private static const TREE_FRONT_ENTRANCE_1_ID:int = -4;
      
      private static const TREE_FRONT_ENTRANCE_2_ID:int = -5;
      
      private static const EXPANDFIELD_SIGN_ID1:int = -6;
      
      private static const EXPANDFIELD_SIGN_ID2:int = -7;
      
      public static const SAFARI_MINI_GAME_JEEP_ITEM_ID:int = -8;
      
      private static const FORGOTTEN_ZOO_SIGN_ID:int = -9;
      
      private static const ANNIVERSARY_BAND_ID:int = -10;
      
      private static const ANNIVERSARY_TEASER:int = -11;
      
      private static const FORTUNE_WHEEL_UID:int = 1;
      
      private static const CIRCUS_UID:int = 2;
      
      private static const BABY_EVENT_UID:int = 3;
      
      public static const CINEMA_UID:int = 25;
      
      public static const BABY_CARAVAN_UID:int = 26;
      
      public static const SANTA_SLEIGH_UID:int = 27;
      
      public static const CHRISTMAS_TREE_UID:int = 28;
      
      public static const ADV_BREED_VAN_UID:int = 29;
      
      public static const GUESS_COMMANDID:int = int.MAX_VALUE;
      
      private var appProxy:AppProxy;
      
      private var playfieldProxy:PlayFieldProxy;
      
      private var playfieldSettingsProxy:PlayfieldSettingsProxy;
      
      private var mainBuildingSelectionProxy:MainBuildingSelectionProxy;
      
      private var babyCaravanProxy:BabyCaravanProxy;
      
      private var itemFactory:ItemFactory;
      
      private var skin:Sprite;
      
      public var fieldSprite:Sprite;
      
      private var gameBackGround:GameBackGround;
      
      private var itemContainer:Sprite;
      
      internal var zooGatePosX:int = -2147483648;
      
      internal var zooGatePosY:int = -2147483648;
      
      internal var maxHorizontal:int = -2147483648;
      
      internal var minHorizontal:int = -2147483648;
      
      internal var maxVertical:int = -2147483648;
      
      internal var minVertical:int = -2147483648;
      
      private var lastBgX:int;
      
      private var lastBgY:int;
      
      private var lastMousePosX:int;
      
      private var lastMousePosY:int;
      
      private var isMarkedForZSort:Boolean = false;
      
      private var notifier:Notifier;
      
      private var debugSprite:Sprite;
      
      private var debugFields:Vector.<Sprite> = new Vector.<Sprite>();
      
      private var _zoomLevel:Number = MainConfig.ZOOM_LEVELS[MainConfig.ZOOM_DEFAULT_ID];
      
      private var itemDictionary:Dictionary = new Dictionary();
      
      private var fieldItemTable:FieldItemTable = new FieldItemTable();
      
      private var itemStack:Vector.<ItemAbstract> = new Vector.<ItemAbstract>();
      
      private var roadTable:RoadItemTable = new RoadItemTable();
      
      private var preMoveMouseState:String;
      
      private var gameContainer:UIComponent;
      
      private var tileGlow:RoadGlow;
      
      private var trashManager:TrashManager;
      
      private var visitorManager:VisitorManager;
      
      private var userInitiated:Boolean = false;
      
      private var playFieldTataForDelayUse:PlayfieldSettingsVO;
      
      private var inScreenDragMode:Boolean = false;
      
      private var isSizedByServer:Boolean = false;
      
      private var gateItem:Special;
      
      private var fenceItem:Special;
      
      public var dragPlayFieldItems:Boolean = false;
      
      private var zooLeftBorder:int;
      
      private var zooRightBorder:int;
      
      private var zooUpperBorder:int;
      
      private var zooBottomBorder:int;
      
      private var fieldSize:int = 9;
      
      private var fadedOutFildItems:Vector.<ItemAbstract> = new Vector.<ItemAbstract>();
      
      private var currentGameFieldData:PlayfieldSettingsVO;
      
      private var specialItemData:Vector.<FieldItemData>;
      
      private var expandPlayFieldSign1:SpecialData;
      
      private var expandPlayFieldSign2:SpecialData;
      
      private var _fieldType:int = 1;
      
      private var forgottenZooSign:SpecialData;
      
      private var currentBuildingId:int;
      
      private var currentFenceId:int;
      
      private var gateItemData:SpecialData;
      
      private var gateFenceData:SpecialData;
      
      private var eventProxy:GlobalEventProxy;
      
      private var circusProxy:CircusProxy;
      
      private var _removeMe:int = 0;
      
      private var resetCrateAmount:Boolean = true;
      
      private var backGroundGridHolder:Sprite = new Sprite();
      
      private var _effectHolder:Sprite = new Sprite();
      
      private var _orginalSize:Point = new Point();
      
      public function PlayField(param1:Notifier, param2:UIComponent, param3:Point, param4:PlayfieldSettingsVO)
      {
         super(NAME);
         this._orginalSize = param3;
         this.notifier = new Notifier(param1);
         this.fieldItemTable = new FieldItemTable();
         this.trashManager = new TrashManager(this.roadTable);
         this.visitorManager = new VisitorManager(this.notifier,this,this.roadTable);
         this.tileGlow = new RoadGlow(param1);
         this.skin = new Sprite();
         this.skin.visible = false;
         this.fieldSprite = new Sprite();
         var _loc5_:Sprite = new Sprite();
         this.gameBackGround = new GameBackGround(this,param3,this.roadTable);
         this.gameBackGround.renderField(param4,this._fieldType,false);
         this.gameBackGround.showGrid(false);
         this.positionToDefault();
         this.backGroundGridHolder.addChild(this.gameBackGround.grid);
         _loc5_.addChild(this.gameBackGround);
         _loc5_.addChild(this.backGroundGridHolder);
         this.fieldSprite.addChild(_loc5_);
         this.itemContainer = new Sprite();
         this.fieldSprite.addChild(this.itemContainer);
         this.itemContainer.mouseEnabled = false;
         this._effectHolder = new Sprite();
         this._effectHolder.mouseChildren = false;
         this._effectHolder.mouseEnabled = false;
         this._effectHolder.scaleX = this._zoomLevel;
         this._effectHolder.scaleY = this._zoomLevel;
         this.fieldSprite.addChild(this._effectHolder);
         this.skin.addChild(this.fieldSprite);
         this.itemFactory = new ItemFactory(this.notifier,this.itemContainer);
         param2.addChild(this.skin);
         this.gameContainer = param2;
         _loc5_.addEventListener(MouseEvent.MOUSE_DOWN,this.startDragField);
         this.notifier.registerNoticeListener(ItemNotice.POSITION_UPDATE,this.handleItemPositionChange);
         this.notifier.registerNoticeListener(ItemNotice.SEND_POSITION_IN_CELL,this.sendVisitorPositionInCell);
         this.notifier.registerNoticeListener(VisitorNotice.WALK_ONE_CELL_END,this.handleNextVisitorAction);
         this.specialItemData = new Vector.<FieldItemData>();
         this.gateItemData = new SpecialData();
         this.gateItemData.posX = this.zooGatePosX - 2;
         this.gateItemData.posY = this.zooGatePosY;
         this.gateItemData.itemId = Special.GATE_UID_1;
         this.gateItemData.active = 1;
         this.gateItemData.uniqueId = GATE_ENTRANCE_BUILDING_ID;
         this.specialItemData.push(this.gateItemData);
         this.currentBuildingId = this.gateItemData.itemId;
         this.gateFenceData = new SpecialData();
         this.gateFenceData.posX = this.zooGatePosX + 1;
         this.gateFenceData.posY = this.zooGatePosY - 1;
         this.gateFenceData.itemId = Special.GATE_FENCE_UID_1;
         this.gateFenceData.active = 1;
         this.gateFenceData.uniqueId = GATE_ENTRANCE_FENCE_ID;
         this.specialItemData.push(this.gateFenceData);
         this.currentFenceId = Special.GATE_FENCE_UID_1;
         this.expandPlayFieldSign1 = new SpecialData();
         this.expandPlayFieldSign1.posX = 20;
         this.expandPlayFieldSign1.posY = 80;
         this.expandPlayFieldSign1.itemId = Special.EXPAND_FIELD_SIGN_UID;
         this.expandPlayFieldSign1.active = 1;
         this.expandPlayFieldSign1.uniqueId = EXPANDFIELD_SIGN_ID1;
         this.specialItemData.push(this.expandPlayFieldSign1);
         this.expandPlayFieldSign2 = new SpecialData();
         this.expandPlayFieldSign2.posX = 30;
         this.expandPlayFieldSign2.posY = 70;
         this.expandPlayFieldSign2.itemId = Special.EXPAND_FIELD_SIGN_UID;
         this.expandPlayFieldSign2.active = 1;
         this.expandPlayFieldSign2.uniqueId = EXPANDFIELD_SIGN_ID2;
         this.specialItemData.push(this.expandPlayFieldSign2);
         this.forgottenZooSign = new SpecialData();
         this.forgottenZooSign.posX = 45;
         this.forgottenZooSign.posY = 82;
         this.forgottenZooSign.itemId = Special.FORGOTTEN_ZOO_SIGN_UID;
         this.forgottenZooSign.active = 1;
         this.forgottenZooSign.uniqueId = FORGOTTEN_ZOO_SIGN_ID;
         this.specialItemData.push(this.forgottenZooSign);
         var _loc6_:SpecialData = new SpecialData();
         _loc6_.posX = 40;
         _loc6_.posY = 91;
         _loc6_.itemId = Special.HAUNTED_CARAVAN;
         _loc6_.active = 0;
         _loc6_.uniqueId = BABY_EVENT_UID;
         this.specialItemData.push(_loc6_);
         var _loc7_:SpecialData = new SpecialData();
         _loc7_.posX = 39;
         _loc7_.posY = 91;
         _loc7_.itemId = Special.BABY_CARAVAN;
         _loc7_.active = 1;
         _loc7_.uniqueId = BABY_CARAVAN_UID;
         this.specialItemData.push(_loc7_);
         var _loc8_:SpecialData = new SpecialData();
         _loc8_.posX = 39;
         _loc8_.posY = 88;
         _loc8_.rotatePos = 0;
         _loc8_.itemId = Special.XMAS_SLEIGH;
         _loc8_.active = 0;
         _loc8_.uniqueId = SANTA_SLEIGH_UID;
         this.specialItemData.push(_loc8_);
         var _loc9_:SpecialData = new SpecialData();
         _loc9_.posX = 43;
         _loc9_.posY = 90;
         _loc9_.rotatePos = 0;
         _loc9_.itemId = Special.XMAS_TREE;
         _loc9_.active = 0;
         _loc9_.uniqueId = CHRISTMAS_TREE_UID;
         this.specialItemData.push(_loc9_);
         var _loc10_:SpecialData = new SpecialData();
         _loc10_.posX = 35;
         _loc10_.posY = 90;
         _loc10_.active = 1;
         _loc10_.itemId = Special.OCEAN_WORLD_LIFE_GUARD;
         _loc10_.uniqueId = Special.OCEAN_WORLD_LIFE_GUARD;
         this.specialItemData.push(_loc10_);
         var _loc11_:SpecialData = new SpecialData();
         _loc11_.posX = 40;
         _loc11_.posY = 92;
         _loc11_.active = 0;
         _loc11_.itemId = Special.ADV_BREED_VAN;
         _loc11_.uniqueId = ADV_BREED_VAN_UID;
         this.specialItemData.push(_loc11_);
         this.setFieldItems(this.specialItemData,PlayField.GUESS_COMMANDID);
         this.gateItem = this.getFieldItem(Categories.SPECIAL,GATE_ENTRANCE_BUILDING_ID) as Special;
         this.fenceItem = this.getFieldItem(Categories.SPECIAL,GATE_ENTRANCE_FENCE_ID) as Special;
         if(Settings.TUTORIAL_ACTIVE)
         {
            TutorialInjectionManager.getInstance().injectMainBuilding(this.gateItem);
         }
         this.roadTable.addRoad(0,1,this.zooGatePosX,this.zooGatePosY);
         this.roadTable.addRoad(-1,1,this.zooGatePosX,this.zooGatePosY + 1);
         this.visitorManager.startSpowningVisitorsAt(this.zooGatePosX,this.zooGatePosY,MainConfig.VISITOR_SPOWN_INTERVALS);
      }
      
      public static function hidePlayfield() : void
      {
      }
      
      public static function showPlayfield() : void
      {
      }
      
      override public function listNotificationInterests() : Array
      {
         return [DataNote.USER_LEVEL,Note.SWITCH_PLAYFIELD,GUINote.ACTIVATE_SELECT_SUBTOOL,GUINote.ACTIVATE_MOVE_SUBTOOL,GUINote.ACTIVATE_ROTATE_SUBTOOL,GUINote.ACTIVATE_SELL_SUBTOOL,GUINote.ACTIVATE_STORE_SUBTOOL,Note.REMOVE_ALL_PLAYFIELD_ITEMS,Note.STORE_ALL_PLAYFIELD_ITEMS,Note.FULLSCREEN_MODE_CHANGE,Note.ANNIVERSARY_STAGE_LEVEL,Note.SWITCH_ENTRANCE,Note.HIDE_GRID,Note.SHOW_GRID,Note.KEYBOARD_CTRL_UP,Note.KEYBOARD_CTRL_DOWN];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case DataNote.USER_LEVEL:
               this.handleUserLevelChange();
               this.handleSpecialZooItems();
               break;
            case Note.XMAS_FINISH_EVENT:
               this.removeParkingLotItem(Special.XMAS_SLEIGH);
               break;
            case Note.GAME_CHANGE_PLAYFIELD:
               this.handleSpecialZooItems();
               break;
            case GUINote.ACTIVATE_SELECT_SUBTOOL:
               this.exitRoadGlowMode();
               this.dragPlayFieldItems = false;
               break;
            case GUINote.ACTIVATE_MOVE_SUBTOOL:
               this.dragPlayFieldItems = true;
               this.initRoadGlowMode();
               break;
            case GUINote.ACTIVATE_ROTATE_SUBTOOL:
               this.dragPlayFieldItems = true;
               this.initRoadGlowMode();
               break;
            case GUINote.ACTIVATE_SELL_SUBTOOL:
               this.initRoadGlowMode();
               this.dragPlayFieldItems = false;
               break;
            case GUINote.ACTIVATE_STORE_SUBTOOL:
               this.initRoadGlowMode();
               this.dragPlayFieldItems = false;
               break;
            case Note.REMOVE_ALL_PLAYFIELD_ITEMS:
               this.removeAllItems();
               break;
            case Note.STORE_ALL_PLAYFIELD_ITEMS:
               this.storeAllItems();
               break;
            case Note.FULLSCREEN_MODE_CHANGE:
               this.fitBgToScreen();
               break;
            case Note.ANNIVERSARY_STAGE_LEVEL:
               this.switchAnniversaryBear(param1.getBody() as int);
               break;
            case Note.SWITCH_ENTRANCE:
               this.handleSpecialZooItems();
               break;
            case Note.KEYBOARD_CTRL_UP:
            case Note.HIDE_GRID:
               this.hideGrid();
               break;
            case Note.KEYBOARD_CTRL_DOWN:
            case Note.SHOW_GRID:
               this.showGrid();
               break;
            case Note.SWITCH_PLAYFIELD:
               this.switchPlayField(param1);
         }
      }
      
      protected function switchPlayField(param1:INotification) : void
      {
         var _loc2_:int = int(param1.getBody());
      }
      
      public function showGrid() : void
      {
         this.gameBackGround.showGrid(true);
      }
      
      public function hideGrid() : void
      {
         this.gameBackGround.showGrid(false);
      }
      
      override public function onRegister() : void
      {
         facade.registerMediator(this.trashManager);
         facade.registerMediator(this.visitorManager);
         this.appProxy = facade.retrieveProxy(AppProxy.NAME) as AppProxy;
         this.playfieldProxy = facade.retrieveProxy(PlayFieldProxy.NAME) as PlayFieldProxy;
         this.playfieldSettingsProxy = facade.getProxy(PlayfieldSettingsProxy);
         this.eventProxy = facade.retrieveProxy(GlobalEventProxy.NAME) as GlobalEventProxy;
         this.circusProxy = facade.retrieveProxy(CircusProxy.NAME) as CircusProxy;
         this.mainBuildingSelectionProxy = facade.retrieveProxy(MainBuildingSelectionProxy.NAME) as MainBuildingSelectionProxy;
         this.babyCaravanProxy = facade.retrieveProxy(BabyCaravanProxy.NAME) as BabyCaravanProxy;
         this.playfieldProxy.hackItemTableIn(this.itemDictionary);
         sendNotification(Note.INIT_PLAYFIELD_EFFECT_SYSTEM);
         this.checkTheme();
      }
      
      private function checkTheme() : void
      {
         var _loc1_:AppConfigProxy = facade.retrieveProxy(AppConfigProxy.NAME) as AppConfigProxy;
         if(_loc1_.playfieldTheme != "")
         {
            this.gameBackGround.backgroundAssetName = _loc1_.playfieldTheme;
         }
      }
      
      public function enable() : void
      {
         this.skin.visible = true;
      }
      
      private function handleNextVisitorAction(param1:VisitorNotice) : void
      {
         this.visitorManager.decideOnNextAction(param1.visitorUniqueId);
      }
      
      public function setDemoCageFields(param1:Vector.<CageData>) : void
      {
         this.setFieldItems(param1 as Vector.<FieldItemData>,PlayField.GUESS_COMMANDID);
      }
      
      private function switchAnniversaryBear(param1:int) : void
      {
      }
      
      public function setFieldItems(param1:Vector.<FieldItemData>, param2:int) : void
      {
         var _loc4_:FieldItemData = null;
         var _loc5_:ItemAbstract = null;
         var _loc6_:ParticlesProxy = null;
         var _loc7_:int = 0;
         var _loc3_:int = -1;
         if(this.playfieldSettingsProxy)
         {
            _loc3_ = this.playfieldSettingsProxy.getCurrentPlayFieldId();
         }
         for each(_loc4_ in param1)
         {
            if(_loc3_ > -1)
            {
               if(_loc3_ == Math.abs(_loc4_.playFieldId) && _loc3_ != _loc4_.playFieldId && _loc4_.itemId == 34 && _loc4_.category == Categories.STORE)
               {
                  _loc4_.playFieldId = Math.abs(_loc4_.playFieldId);
                  _loc4_.active = 1;
                  if(this.resetCrateAmount)
                  {
                     this.circusProxy.resetCrateAmount();
                     this.resetCrateAmount = false;
                  }
               }
            }
            if(!(_loc4_.playFieldId == -1 || _loc3_ == _loc4_.playFieldId || this.appProxy.currentAppMode == AppMode.VISIT_NEIGHBOUR))
            {
               continue;
            }
            switch(_loc4_.category)
            {
               case Categories.CAGE:
               case Categories.STORE:
               case Categories.DECOR:
               case Categories.SPECIAL:
               case Categories.BREEDING_LAB:
               case Categories.NURSERY:
               case Categories.TRASHBIN:
               case Categories.TRASHROAD:
               case Categories.SPECIAL:
               case Categories.VISITOR:
                  _loc6_ = facade.retrieveProxy(ParticlesProxy.NAME) as ParticlesProxy;
                  if(this.isFieldItemExists(_loc4_.category,_loc4_.uniqueId))
                  {
                     if(_loc4_.uniqueId == -10)
                     {
                     }
                     _loc5_ = this.getFieldItem(_loc4_.category,_loc4_.uniqueId);
                  }
                  else
                  {
                     _loc5_ = this.createItem(_loc4_);
                  }
                  _loc5_.zoomlevel = this._zoomLevel;
                  _loc5_.updateState(_loc4_,param2);
                  if(_loc4_.posX != int.MIN_VALUE && _loc4_.posY != int.MIN_VALUE)
                  {
                     _loc5_.updatePosition(this.getCordinatePossition(_loc4_.posX,_loc4_.posY));
                  }
                  if(_loc5_.deleteFlag == 1)
                  {
                     this.notifier.dispatchNotice(new DeleteItemNotice(DeleteItemNotice.DELETE_ITEM,_loc4_.category,_loc4_.uniqueId));
                     this.removeItem(_loc4_);
                  }
                  if(_loc4_.itemId == 34 && _loc4_.category == Categories.STORE)
                  {
                     _loc5_.dragable = false;
                     this.circusProxy.registerCrate(_loc4_.posX,_loc4_.posY);
                  }
                  if(_loc5_.enabled)
                  {
                     if(_loc5_.itemId == 41 && _loc6_.whichParticlesRunning == "SnowFlakeParticleSprite")
                     {
                        this.notifier.dispatchNoticeToRoot(new FieldItemStateNotice(FieldItemStateNotice.CHANGE_ALL_ITEM_STATES,1,_loc5_.category,_loc5_.itemId));
                     }
                     if(_loc5_.itemId == Decor.HEARTS_GLOBE && _loc6_.whichParticlesRunning == "HeartParticleSprite")
                     {
                        this.notifier.dispatchNoticeToRoot(new FieldItemStateNotice(FieldItemStateNotice.CHANGE_ALL_ITEM_STATES,1,_loc5_.category,_loc5_.itemId));
                     }
                  }
                  break;
               case Categories.ROAD:
                  if(_loc4_.del != 1)
                  {
                     _loc7_ = this.roadTable.getCellRoadCommandId(_loc4_.uniqueId);
                     if(_loc7_ <= param2)
                     {
                        if(!this.roadTable.getRoadCords(_loc4_.uniqueId))
                        {
                           this.roadTable.addRoad(_loc4_.uniqueId,_loc4_.itemId,_loc4_.posX,_loc4_.posY);
                           this.gameBackGround.redrawBgCellsAt(_loc4_.posX,_loc4_.posY);
                        }
                     }
                  }
                  else
                  {
                     this.removeFieldRoad(_loc4_.uniqueId);
                  }
                  break;
            }
         }
         if(!this.userInitiated)
         {
            if(param2 != GUESS_COMMANDID && param2 >= -1)
            {
               this.userInitiated = true;
               if(this.playFieldTataForDelayUse)
               {
                  this.gameContainer.stage.addEventListener(Event.ENTER_FRAME,this.delayedShowPlayFieldData);
               }
            }
         }
         sendNotification(Note.GAME_CHANGE_PLAYFIELD);
      }
      
      public function removeFieldRoad(param1:int, param2:Boolean = false) : void
      {
         var _loc3_:Point = this.roadTable.getRoadCords(param1);
         if(_loc3_)
         {
            this.roadTable.removeRoadAtCords(_loc3_.x,_loc3_.y);
            this.gameBackGround.removeCellRoad(_loc3_.x,_loc3_.y,param2);
         }
      }
      
      public function set zoomLevel(param1:Number) : void
      {
         var _loc2_:Number = (-this.fieldSprite.x + MainConfig.STAGE_WIDTH / 2) / this.gameBackGround.fieldCurrentSize.x;
         var _loc3_:Number = (-this.fieldSprite.y + MainConfig.STAGE_HEIGHT / 2) / this.gameBackGround.fieldCurrentSize.y;
         this._zoomLevel = param1;
         this.gameBackGround.updateBackGround(this._zoomLevel,this._fieldType);
         if(this.appProxy.currentAppMode == AppMode.NORMAL)
         {
            this.gameBackGround.deleteAllOutdatedRoads();
         }
         this.gameBackGround.drawAllRoads();
         this.fieldSprite.x = Math.round(-(_loc2_ * this.gameBackGround.fieldCurrentSize.x) + MainConfig.STAGE_WIDTH / 2);
         this.fieldSprite.y = Math.round(-(_loc3_ * this.gameBackGround.fieldCurrentSize.y) + MainConfig.STAGE_HEIGHT / 2);
         this.tileGlow.scaleX = this._zoomLevel;
         this.tileGlow.scaleY = this._zoomLevel;
         this.repositionAllItems();
         this.fitBgToScreen();
         this.calculateZooBorders();
         this._effectHolder.scaleX = this._zoomLevel;
         this._effectHolder.scaleY = this._zoomLevel;
      }
      
      private function repositionExpandSignsOnly(param1:ItemAbstract, param2:String) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Point = null;
         var _loc6_:Point = null;
         var _loc7_:Boolean = false;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         if(this.currentGameFieldData)
         {
            if(this.currentGameFieldData.fSize < MainConfig.MAX_FIELD_SIZE && this.playfieldSettingsProxy.activePlayfieldType == PlayFieldsTypes.FIELD_TYPE_MAIN_ZOO)
            {
               param1.visible = true;
               switch(param2)
               {
                  case "Left":
                     _loc8_ = this.currentGameFieldData.minHorizontal;
                     _loc9_ = this.currentGameFieldData.minVertical;
                     _loc4_ = (_loc8_ - _loc9_) / 2;
                     _loc3_ = _loc8_ - _loc4_;
                     _loc5_ = new Point(_loc3_,_loc4_);
                     _loc6_ = new Point(1,1);
                     param1.updatePosition(this.getCordinatePossition(_loc3_,_loc4_));
                     break;
                  case "Right":
                     _loc10_ = this.currentGameFieldData.minHorizontal;
                     _loc11_ = this.currentGameFieldData.maxVertical;
                     _loc4_ = (_loc10_ - _loc11_) / 2;
                     _loc3_ = _loc10_ - _loc4_;
                     _loc5_ = new Point(_loc3_,_loc4_);
                     _loc6_ = new Point(1,1);
                     param1.updatePosition(this.getCordinatePossition(_loc3_,_loc4_));
                     if(param1.scaleX == 1)
                     {
                        param1.scaleX = -1;
                     }
               }
            }
            else
            {
               param1.visible = false;
               _loc3_ = 1;
               _loc4_ = 1;
            }
         }
         this.fieldItemTable.moveItemStatic(param1,_loc3_,_loc4_);
      }
      
      private function repositionAllItems() : void
      {
         var _loc1_:ItemAbstract = null;
         for each(_loc1_ in this.itemDictionary)
         {
            _loc1_.zoomlevel = this._zoomLevel;
            if(_loc1_.uniqueId == EXPANDFIELD_SIGN_ID1)
            {
               this.repositionExpandSignsOnly(_loc1_,"Left");
            }
            else if(_loc1_.uniqueId == EXPANDFIELD_SIGN_ID2)
            {
               this.repositionExpandSignsOnly(_loc1_,"Right");
            }
            else
            {
               _loc1_.updatePosition(this.getCordinatePossition(_loc1_.posX,_loc1_.posY));
            }
         }
      }
      
      public function get zoomLevel() : Number
      {
         return this._zoomLevel;
      }
      
      public function get effectHolder() : Sprite
      {
         return this._effectHolder;
      }
      
      public function set effectHolder(param1:Sprite) : void
      {
         this._effectHolder = param1;
      }
      
      public function markItem(param1:int, param2:int, param3:int) : void
      {
         var _loc4_:ItemAbstract = this.getFieldItem(param1,param2);
         if(_loc4_)
         {
            _loc4_.markType = param3;
         }
      }
      
      public function movePlayField(param1:Point) : void
      {
         this.fieldSprite.x -= param1.x;
         this.fieldSprite.y -= param1.y;
         this.fitBgToScreen();
      }
      
      public function moveDirectPlayField(param1:Point) : void
      {
         this.fieldSprite.x = param1.x;
         this.fieldSprite.y = param1.y;
         this.fitBgToScreen();
      }
      
      public function getFieldViewCoord() : Point
      {
         return new Point(this.fieldSprite.x,this.fieldSprite.y);
      }
      
      private function createItem(param1:FieldItemData) : ItemAbstract
      {
         var _loc2_:ItemAbstract = null;
         _loc2_ = this.itemFactory.createItem(param1.category,param1.itemId,param1.uniqueId) as ItemAbstract;
         this.itemDictionary[param1.uniqueId * 10 + param1.category] = _loc2_;
         this.fieldItemTable.addItem(_loc2_,param1.posX,param1.posY);
         if(Boolean(this.appProxy) && this.appProxy.currentAppMode == AppMode.VISIT_NEIGHBOUR)
         {
            _loc2_.enabled = false;
         }
         else
         {
            _loc2_.enabled = true;
         }
         if(_loc2_.category == Categories.TRASHBIN)
         {
            this.trashManager.addTrashBin(_loc2_ as TrashBin);
         }
         this.itemStack.push(_loc2_);
         return _loc2_;
      }
      
      private function removeItem(param1:FieldItemData) : void
      {
         var _loc2_:ItemAbstract = null;
         var _loc3_:int = 0;
         if(this.isFieldItemExists(param1.category,param1.uniqueId))
         {
            _loc2_ = this.getFieldItem(param1.category,param1.uniqueId);
            this.fieldItemTable.removeItem(_loc2_);
            if(_loc2_.category == Categories.TRASHBIN)
            {
               this.trashManager.removeTrashBin(_loc2_ as TrashBin);
            }
            _loc2_.dispose();
            delete this.itemDictionary[param1.uniqueId * 10 + param1.category];
            _loc3_ = 0;
            while(_loc3_ < this.itemStack.length)
            {
               if(this.itemStack[_loc3_] == _loc2_)
               {
                  this.itemStack.splice(_loc3_,1);
                  break;
               }
               _loc3_++;
            }
         }
      }
      
      public function cleanTrashBinFrom(param1:int, param2:int, param3:int) : void
      {
         this.trashManager.clearTrashInBin(param1,param2,param3);
      }
      
      public function cleanTrashRoadFrom(param1:int, param2:int, param3:int) : void
      {
         this.trashManager.clearTrashFromRoad(param1,param2,param3);
      }
      
      public function getRenderedBg() : BitmapData
      {
         return null;
      }
      
      public function addRoad(param1:int, param2:int, param3:int, param4:int) : void
      {
         this.roadTable.addRoad(param1,param2,param3,param4);
         this.gameBackGround.redrawBgCellsAt(param3,param4);
      }
      
      public function storeRoadCommandId(param1:int, param2:int) : void
      {
         this.roadTable.setRoadCommandId(param1,param2);
      }
      
      public function getFieldItem(param1:int, param2:int) : ItemAbstract
      {
         return this.itemDictionary[param2 * 10 + param1];
      }
      
      public function getFieldCellItems(param1:Point) : Vector.<ItemAbstract>
      {
         return this.fieldItemTable.getCellItems(param1.x,param1.y);
      }
      
      public function getItemPosInStage(param1:int, param2:int) : Point
      {
         var _loc3_:ItemAbstract = this.itemDictionary[param2 * 10 + param1];
         var _loc4_:Point = new Point(_loc3_.x,_loc3_.y);
         _loc4_.x += this.fieldSprite.x;
         _loc4_.y += this.fieldSprite.y;
         return _loc4_;
      }
      
      public function getRoadPosInStage(param1:int) : Point
      {
         var _loc2_:Point = this.roadTable.getRoadCords(param1);
         var _loc3_:Point = this.getCordinatePossition(_loc2_.x,_loc2_.y);
         _loc3_.x += this.fieldSprite.x;
         _loc3_.y += this.fieldSprite.y;
         return _loc3_;
      }
      
      public function getRoadCoordinates(param1:int) : Point
      {
         return this.roadTable.getRoadCords(param1);
      }
      
      public function getRoadTypeId(param1:int) : int
      {
         var _loc2_:Point = this.roadTable.getRoadCords(param1);
         return this.roadTable.getCellRoadType(_loc2_.x,_loc2_.y);
      }
      
      public function isFieldItemExists(param1:int, param2:int) : Boolean
      {
         var _loc3_:Boolean = false;
         var _loc4_:ItemAbstract = this.itemDictionary[param2 * 10 + param1] as ItemAbstract;
         if((Boolean(_loc4_)) && !_loc4_.isDisposed)
         {
            _loc3_ = true;
         }
         return _loc3_;
      }
      
      public function testBuildingColision(param1:Point, param2:Point, param3:int = -1, param4:int = -1) : Boolean
      {
         var _loc6_:int = 0;
         var _loc7_:Vector.<ItemAbstract> = null;
         var _loc8_:int = 0;
         var _loc9_:Building = null;
         var _loc10_:Boolean = false;
         var _loc11_:ItemAbstract = null;
         var _loc5_:int = param1.x;
         while(_loc5_ < param1.x + param2.x)
         {
            _loc6_ = param1.y;
            while(_loc6_ < param1.y + param2.y)
            {
               _loc7_ = this.fieldItemTable.getCellItems(_loc5_,_loc6_);
               if(_loc7_ != null)
               {
                  _loc8_ = 0;
                  while(_loc8_ < _loc7_.length)
                  {
                     if(_loc7_[_loc8_].itemFamily == ItemAbstract.ITEM_FAMILY_BUILDING)
                     {
                        _loc9_ = Building(_loc7_[_loc8_]);
                        if(_loc9_)
                        {
                           _loc10_ = false;
                           if(param3 != -1 && param4 != -1)
                           {
                              _loc11_ = this.getFieldItem(param3,param4);
                              if(_loc11_ == _loc7_[_loc8_])
                              {
                                 _loc10_ = true;
                              }
                           }
                           if(!_loc10_)
                           {
                              return true;
                           }
                        }
                     }
                     _loc8_++;
                  }
               }
               _loc6_++;
            }
            _loc5_++;
         }
         return false;
      }
      
      public function testRoadColision(param1:Point, param2:Point) : Boolean
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc3_:int = param1.x;
         while(_loc3_ < param1.x + param2.x)
         {
            _loc4_ = param1.y;
            while(_loc4_ < param1.y + param2.y)
            {
               _loc5_ = this.roadTable.getCellRoadType(_loc3_,_loc4_);
               if(_loc5_ > -1)
               {
                  return true;
               }
               _loc4_++;
            }
            _loc3_++;
         }
         return false;
      }
      
      public function clearFieldFX() : void
      {
         GrayDisabler.enableIcon(this.fieldSprite,true);
      }
      
      public function setFieldFX(param1:Array) : void
      {
         GrayDisabler.enableIcon(this.fieldSprite,false,param1);
      }
      
      public function checkAvailabilityWithCage(param1:int, param2:int) : Boolean
      {
         var _loc3_:CageShopData = ConfigurationModule.getInstance().getCageData(param1);
         var _loc4_:int = _loc3_.type;
         var _loc5_:SpecieShopData = ConfigurationModule.getInstance().getSpecieData(param2);
         var _loc6_:Array = _loc5_.cageTypesPlaceable;
         var _loc7_:Boolean = false;
         var _loc8_:int = int(_loc6_.length);
         var _loc9_:int = 0;
         while(_loc9_ < _loc8_)
         {
            if(_loc6_[_loc9_] == _loc4_)
            {
               _loc7_ = true;
               break;
            }
            _loc9_++;
         }
         return _loc7_;
      }
      
      public function checkAvailabilityWithGround(param1:int, param2:Point, param3:Point, param4:int = -1, param5:int = -1) : Boolean
      {
         var _loc7_:Boolean = false;
         var _loc8_:Point = null;
         var _loc6_:Boolean = false;
         if(!this.testBuildingColision(param2,param3,param4,param5))
         {
            if(param1 == ItemAbstract.GROUND_ANY)
            {
               _loc6_ = true;
            }
            else
            {
               _loc7_ = this.testRoadColision(param2,param3);
               if(_loc7_)
               {
                  if(param1 == ItemAbstract.GROUND_ROAD)
                  {
                     _loc8_ = new Point(31,89);
                     if(_loc8_.equals(param2))
                     {
                        _loc6_ = false;
                     }
                     else
                     {
                        _loc6_ = true;
                     }
                  }
               }
               else if(param1 == ItemAbstract.GROUND_GRASS)
               {
                  _loc6_ = true;
               }
            }
         }
         if(_loc6_ == false)
         {
            this.gameBackGround.killColorInGrid();
         }
         else
         {
            this.gameBackGround.colorInGrid(param2,param3);
         }
         return _loc6_;
      }
      
      public function testBuildingOutOfFieldBonuds(param1:Point, param2:Point) : Boolean
      {
         var _loc4_:int = 0;
         var _loc3_:int = param1.x;
         while(_loc3_ < param1.x + param2.x)
         {
            _loc4_ = param1.y;
            while(_loc4_ < param1.y + param2.y)
            {
               if(this.testCellOutOfFieldBonuds(_loc3_,_loc4_))
               {
                  this.gameBackGround.killColorInGrid();
                  return true;
               }
               _loc4_++;
            }
            _loc3_++;
         }
         return false;
      }
      
      public function testCellOutOfFieldBonuds(param1:int, param2:int) : Boolean
      {
         return param1 + param2 < this.minHorizontal || param1 + param2 > this.maxHorizontal || param1 - param2 < this.minVertical || param1 - param2 > this.maxVertical;
      }
      
      public function testColisionWithCategory(param1:Point, param2:int) : ItemAbstract
      {
         var _loc3_:Vector.<ItemAbstract> = this.fieldItemTable.getCellItems(param1.x,param1.y);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            if(_loc3_[_loc4_].category == param2)
            {
               return _loc3_[_loc4_];
            }
            _loc4_++;
         }
         return null;
      }
      
      public function getStageToFieldCords(param1:Point) : Point
      {
         return this.gameBackGround.getStageToFieldCords(param1);
      }
      
      public function getCordinatePossition(param1:int, param2:int) : Point
      {
         return this.gameBackGround.getCordinatePossition(param1,param2);
      }
      
      public function getCordinatePositionRenew(param1:int, param2:int) : Point
      {
         return this.gameBackGround.getCordinatePositionRenew(param1,param2);
      }
      
      public function stageToField(param1:Point) : Point
      {
         return new Point(param1.x - this.fieldSprite.x,param1.y - this.fieldSprite.y);
      }
      
      private function positionToDefault() : void
      {
         this.fieldSprite.x = -700 + 100 * (this.fieldSize - 10);
         this.fieldSprite.y = -1350;
         this.fitBgToScreen();
      }
      
      private function calculateZooBorders() : void
      {
         var _loc1_:Point = this.getCordinatePossition(this.zooGatePosX - 2 - this.fieldSize,this.zooGatePosY + 2 - this.fieldSize);
         this.zooLeftBorder = _loc1_.x;
         this.zooUpperBorder = _loc1_.y;
         _loc1_ = this.getCordinatePossition(this.zooGatePosX + this.fieldSize + 2,this.zooGatePosY - this.fieldSize + 2);
         this.zooRightBorder = _loc1_.x;
         this.zooBottomBorder = _loc1_.y;
      }
      
      public function startDragField(param1:MouseEvent = null) : void
      {
         var _loc2_:MouseModule = null;
         if(this.fieldSprite.mouseX < this.zooLeftBorder || this.fieldSprite.mouseX > this.zooRightBorder || this.fieldSprite.mouseY < this.zooUpperBorder)
         {
            this.notifier.dispatchNotice(new PlayFieldNotice(PlayFieldNotice.ACTIVATE_EXPAND_BUY));
         }
         else if(!this.inScreenDragMode)
         {
            this.inScreenDragMode = true;
            this.lastBgX = this.fieldSprite.x;
            this.lastBgY = this.fieldSprite.y;
            this.lastMousePosX = this.skin.mouseX;
            this.lastMousePosY = this.skin.mouseY;
            this.skin.addEventListener(Event.ENTER_FRAME,this.handleMouseMove);
            this.gameContainer.stage.addEventListener(MouseEvent.MOUSE_UP,this.stopDragField);
            _loc2_ = MouseModule.getInstance();
            this.preMoveMouseState = _loc2_.mouseType;
            _loc2_.show(MouseState.MOVE_SCREEN);
         }
      }
      
      public function stopDragField(param1:MouseEvent = null) : void
      {
         if(this.inScreenDragMode)
         {
            this.inScreenDragMode = false;
            this.skin.removeEventListener(Event.ENTER_FRAME,this.handleMouseMove);
            this.gameContainer.stage.removeEventListener(MouseEvent.MOUSE_UP,this.stopDragField);
            if(this.preMoveMouseState)
            {
               if(this.preMoveMouseState == MouseState.MOVE_SCREEN)
               {
                  MouseModule.getInstance().show(MouseState.DEFAULT);
               }
               else
               {
                  MouseModule.getInstance().show(this.preMoveMouseState);
               }
            }
         }
         this.preMoveMouseState = null;
      }
      
      public function hackPreMoveMouseState(param1:String) : void
      {
         this.preMoveMouseState = param1;
      }
      
      private function handleMouseMove(param1:Event) : void
      {
         if(!Settings.TUTORIAL_ACTIVE)
         {
            this.fieldSprite.x = this.lastBgX - (this.lastMousePosX - this.skin.mouseX);
            this.fieldSprite.y = this.lastBgY - (this.lastMousePosY - this.skin.mouseY);
            this.fitBgToScreen();
         }
         this.notifier.dispatchNotice(new PlayFieldNotice(PlayFieldNotice.SCREEN_MOVE,this.fieldSprite.x,this.fieldSprite.y));
      }
      
      public function debugField() : void
      {
         var _loc2_:Sprite = null;
         var _loc3_:int = 0;
         var _loc4_:Vector.<ItemAbstract> = null;
         var _loc5_:ItemAbstract = null;
         var _loc6_:Sprite = null;
         var _loc7_:Point = null;
         while(this.debugFields.length)
         {
            _loc2_ = this.debugFields.pop();
            this.debugSprite.removeChild(_loc2_);
         }
         var _loc1_:int = 0;
         while(_loc1_ < 200)
         {
            _loc3_ = 0;
            while(_loc3_ < 200)
            {
               _loc4_ = this.fieldItemTable.getCellItems(_loc1_,_loc3_);
               if(!_loc4_.length)
               {
               }
               for each(_loc5_ in _loc4_)
               {
                  _loc6_ = AssetLibrary.getSprite(AssetConfig.ASSET_DEBUG,"FieldMaperSPR");
                  _loc7_ = this.getCordinatePossition(_loc1_,_loc3_);
                  _loc6_.x = _loc7_.x;
                  _loc6_.y = _loc7_.y;
                  (_loc6_["debug_txt"] as TextField).text = _loc5_.posX + ":" + _loc5_.posY + "\n" + _loc1_ + " - " + _loc3_;
                  this.debugSprite.addChild(_loc6_);
                  this.debugFields.push(_loc6_);
               }
               _loc3_++;
            }
            _loc1_++;
         }
      }
      
      private function handleItemPositionChange(param1:ItemNotice) : void
      {
         var _loc2_:ItemAbstract = null;
         if(this.getFieldItem(param1.categoryId,param1.uniqueId))
         {
            _loc2_ = this.getFieldItem(param1.categoryId,param1.uniqueId);
            this.fieldItemTable.moveItem(_loc2_);
         }
         this.activateZSorting();
      }
      
      private function sendVisitorPositionInCell(param1:ItemNotice) : void
      {
         var _loc2_:Visitor = this.getFieldItem(param1.categoryId,param1.uniqueId) as Visitor;
         if(_loc2_)
         {
            _loc2_.sendPositionInCell(this.getCordinatePossition(_loc2_.posX,_loc2_.posY));
         }
      }
      
      private function activateZSorting() : void
      {
         if(!this.isMarkedForZSort)
         {
            this.skin.addEventListener(Event.ENTER_FRAME,this.zSsortItems);
            this.isMarkedForZSort = true;
         }
      }
      
      private function zSsortItems(param1:Event) : void
      {
         var _loc3_:ItemAbstract = null;
         var _loc4_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this.itemStack.length)
         {
            _loc3_ = this.itemStack[_loc2_];
            _loc4_ = _loc2_ - 1;
            while(_loc4_ > -1 && this.itemStack[_loc4_].zDepth > _loc3_.zDepth)
            {
               this.itemStack[_loc4_ + 1] = this.itemStack[_loc4_];
               _loc4_--;
            }
            this.itemStack[_loc4_ + 1] = _loc3_;
            this.itemContainer.setChildIndex(this.itemStack[_loc4_ + 1],_loc4_ + 1);
            _loc2_++;
         }
         this.isMarkedForZSort = false;
         this.skin.removeEventListener(Event.ENTER_FRAME,this.zSsortItems);
      }
      
      public function initRoadGlowMode() : void
      {
         if(!this.itemContainer.contains(this.tileGlow))
         {
            this.itemContainer.addChild(this.tileGlow);
            this.tileGlow.scaleX = this._zoomLevel;
            this.tileGlow.scaleY = this._zoomLevel;
            this.tileGlow.removeEventListener(Event.ENTER_FRAME,this.checkForRoadUnderMouse);
            this.tileGlow.addEventListener(Event.ENTER_FRAME,this.checkForRoadUnderMouse);
         }
      }
      
      public function exitRoadGlowMode() : void
      {
         if(this.itemContainer.contains(this.tileGlow))
         {
            this.tileGlow.removeEventListener(Event.ENTER_FRAME,this.checkForRoadUnderMouse);
            this.itemContainer.removeChild(this.tileGlow);
         }
      }
      
      private function checkForRoadUnderMouse(param1:Event) : void
      {
         var _loc2_:Point = this.getStageToFieldCords(new Point(this.gameContainer.stage.mouseX,this.gameContainer.stage.mouseY));
         var _loc3_:int = this.roadTable.getCellRoadType(_loc2_.x,_loc2_.y);
         var _loc4_:int = this.roadTable.getCellRoadUniqueId(_loc2_.x,_loc2_.y);
         var _loc5_:Boolean = this.testBuildingColision(_loc2_,new Point(1,1));
         if(!_loc5_ && _loc4_ > 0)
         {
            this.showRoadGlow(_loc4_,_loc3_,_loc2_.x,_loc2_.y);
         }
         else
         {
            this.hideRoadGlow();
         }
      }
      
      private function hideRoadGlow() : void
      {
         this.tileGlow.x = -2000;
         this.tileGlow.y = -2000;
      }
      
      private function showRoadGlow(param1:int, param2:int, param3:int, param4:int) : void
      {
         var _loc5_:Point = this.getCordinatePossition(param3,param4);
         this.tileGlow.x = _loc5_.x;
         this.tileGlow.y = _loc5_.y;
         this.tileGlow.uniqueId = param1;
         this.tileGlow.typeId = param2;
      }
      
      public function showPlayFieldData(param1:PlayfieldSettingsVO, param2:int) : void
      {
         if(this.userInitiated)
         {
            if(param1.trashbins > -1)
            {
               TweenLite.delayedCall(0.01,this.distributeBinTrash,[param1.trashbins,param2]);
            }
            if(param1.trashroads > -1)
            {
               TweenLite.delayedCall(0.02,this.distributeRoadTrash,[param1.trashroads,param2]);
            }
            if(param1.att > -1 && param1.attMax > -1)
            {
               this.visitorManager.setVisitorPercentage(param1.att / param1.attMax);
            }
         }
         else
         {
            this.playFieldTataForDelayUse = param1;
         }
         var _loc3_:UserProxy = facade.getProxy(UserProxy);
         if(_loc3_.entranceFee > -1)
         {
            this.updateEntranceFee(_loc3_.entranceFee);
         }
         this.handleSpecialZooItems();
      }
      
      public function updateEntranceFee(param1:int) : void
      {
         this.gateItem.entranceFee = param1;
         this.fenceItem.entranceFee = param1;
      }
      
      private function distributeBinTrash(param1:int, param2:int) : void
      {
         this.trashManager.distributeBinTrash(param1,param2);
      }
      
      private function distributeRoadTrash(param1:int, param2:int) : void
      {
         var _loc3_:Vector.<FieldItemData> = this.trashManager.distributeRoadTrash(param1,param2);
         this.setFieldItems(_loc3_,PlayField.GUESS_COMMANDID);
      }
      
      private function delayedShowPlayFieldData(param1:Event) : void
      {
         this.gameContainer.stage.removeEventListener(Event.ENTER_FRAME,this.delayedShowPlayFieldData);
         this.showPlayFieldData(this.playFieldTataForDelayUse,GUESS_COMMANDID);
         this.playFieldTataForDelayUse = null;
      }
      
      private function fitBgToScreen() : void
      {
         if(this.fieldSprite.x > 0)
         {
            this.fieldSprite.x = 0;
         }
         if(this.fieldSprite.y > 0)
         {
            this.fieldSprite.y = 0;
         }
         if(this.fieldSprite.x < -this.gameBackGround.fieldCurrentSize.x + MainConfig.STAGE_WIDTH)
         {
            this.fieldSprite.x = -this.gameBackGround.fieldCurrentSize.x + MainConfig.STAGE_WIDTH;
         }
         if(this.fieldSprite.y < -this.gameBackGround.fieldCurrentSize.y + MainConfig.STAGE_HEIGHT)
         {
            this.fieldSprite.y = -this.gameBackGround.fieldCurrentSize.y + MainConfig.STAGE_HEIGHT;
         }
         sendNotification(Note.PLAY_FIELD_VIEW_PORT_CHANGED);
      }
      
      public function stopDragAction(param1:int, param2:int) : void
      {
         var _loc3_:Building = Building(this.getFieldItem(param1,param2));
         if(_loc3_)
         {
            _loc3_.stopDragAction();
         }
      }
      
      public function renderField(param1:PlayfieldSettingsVO) : void
      {
         this.currentGameFieldData = param1;
         var _loc2_:int = this.playfieldSettingsProxy.activePlayfieldType;
         if(param1.minHorizontal != this.minHorizontal || param1.maxHorizontal != this.maxHorizontal || param1.minVertical != this.minVertical || param1.maxVertical != this.maxVertical || this._fieldType != _loc2_)
         {
            this._fieldType = _loc2_;
            this.gameBackGround.renderField(param1,this._fieldType);
            this.gameBackGround.drawAllRoads();
            if(!this.isSizedByServer)
            {
               if(param1.fSize > -1)
               {
                  this.isSizedByServer = true;
                  this.positionToDefault();
               }
            }
            this.fieldSize = param1.fSize;
            this.calculateZooBorders();
         }
         this.repositionAllItems();
         this.calculateZooBorders();
         this.handleSpecialZooItems();
         sendNotification(Note.GAME_RENDER_PLAYFIELD);
      }
      
      private function handleSpecialZooItems() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:SpecialData = null;
         var _loc6_:SpecialData = null;
         var _loc7_:SpecialData = null;
         var _loc8_:SpecialData = null;
         var _loc9_:BabyCaravanProxy = null;
         var _loc10_:XmasProxy = null;
         var _loc11_:SpecialData = null;
         var _loc12_:XMas2012Proxy = null;
         var _loc13_:SpecialData = null;
         var _loc14_:SpecialData = null;
         var _loc15_:AdvBreedingEventProxy = null;
         var _loc16_:SpecialData = null;
         var _loc1_:UserProxy = facade.getProxy(UserProxy);
         if(_loc1_.userLevel > 0)
         {
            this.specialItemData = new Vector.<FieldItemData>();
            _loc2_ = this.mainBuildingSelectionProxy.currentBuildingID;
            _loc3_ = this.playfieldSettingsProxy.activePlayfieldType;
            if(_loc3_ == PlayFieldsTypes.FIELD_TYPE_MAIN_ZOO || _loc3_ == PlayFieldsTypes.FIELD_TYPE_FOREIGN || _loc3_ == PlayFieldsTypes.FIELD_TYPE_NOT_SET || _loc3_ == PlayFieldsTypes.FIELD_TYPE_OCEANWORLD_ZOO)
            {
               _loc4_ = 0;
               _loc2_ = this.currentGameFieldData.eBuildingId;
               if(_loc3_ != PlayFieldsTypes.FIELD_TYPE_FOREIGN)
               {
                  _loc4_ = _loc1_.userLevel;
               }
               else
               {
                  _loc2_ = this.currentGameFieldData.eBuildingId;
               }
               _loc5_ = new SpecialData();
               _loc5_.uniqueId = GATE_ENTRANCE_BUILDING_ID;
               _loc5_.visible = true;
               switch(_loc2_)
               {
                  case Special.GATE_UID_8:
                     this.showGateBuilding(Special.GATE_UID_8);
                     this.showGateFence(Special.GATE_FENCE_UID_8);
                     break;
                  case Special.GATE_UID_7:
                     this.showGateBuilding(Special.GATE_UID_7);
                     this.showGateFence(Special.GATE_FENCE_UID_7);
                     break;
                  case Special.GATE_UID_5:
                     this.showGateBuilding(Special.GATE_UID_5);
                     this.showGateFence(Special.GATE_FENCE_UID_5);
                     break;
                  case Special.GATE_UID_4:
                     this.showGateBuilding(Special.GATE_UID_4);
                     this.showGateFence(Special.GATE_FENCE_UID_4);
                     break;
                  case Special.GATE_UID_3:
                     this.showGateBuilding(Special.GATE_UID_3);
                     this.showGateFence(Special.GATE_FENCE_UID_3);
                     break;
                  case Special.GATE_UID_2:
                     this.showGateBuilding(Special.GATE_UID_2);
                     this.showGateFence(Special.GATE_FENCE_UID_2);
                     break;
                  default:
                     this.showGateBuilding(Special.GATE_UID_1);
                     this.showGateFence(Special.GATE_FENCE_UID_1);
               }
               _loc6_ = new SpecialData();
               _loc6_.uniqueId = GATE_ENTRANCE_FENCE_ID;
               _loc6_.visible = true;
               this.specialItemData.push(_loc6_);
               if(_loc3_ == PlayFieldsTypes.FIELD_TYPE_OCEANWORLD_ZOO)
               {
                  this.forgottenZooSign.posX = 32;
                  this.forgottenZooSign.posY = 94;
               }
               else
               {
                  this.forgottenZooSign.posX = 34;
                  this.forgottenZooSign.posY = 88;
               }
               this.forgottenZooSign.rotatePos = ItemAbstract.ROTATION_90;
               this.forgottenZooSign.visible = true;
               this.specialItemData.push(this.forgottenZooSign);
               _loc7_ = new SpecialData();
               _loc7_.uniqueId = BABY_EVENT_UID;
               _loc7_.visible = _loc3_ == PlayFieldsTypes.FIELD_TYPE_MAIN_ZOO && this.eventProxy.isEventActive(EventTypes.HALLOWEEN_EVENT_2012);
               this.specialItemData.push(_loc7_);
               _loc8_ = new SpecialData();
               _loc9_ = facade.retrieveProxy(BabyCaravanProxy.NAME) as BabyCaravanProxy;
               _loc8_.uniqueId = BABY_CARAVAN_UID;
               _loc8_.visible = _loc3_ == PlayFieldsTypes.FIELD_TYPE_MAIN_ZOO && _loc9_.isEventActive && _loc9_.canRedeemMore;
               this.specialItemData.push(_loc8_);
               _loc10_ = facade.retrieveProxy(XmasProxy.NAME) as XmasProxy;
               _loc11_ = new SpecialData();
               _loc11_.uniqueId = SANTA_SLEIGH_UID;
               _loc11_.visible = _loc10_.showEventGui && _loc3_ == PlayFieldsTypes.FIELD_TYPE_MAIN_ZOO && this.eventProxy.isEventActive(EventTypes.XMAS_EVENT);
               this.specialItemData.push(_loc11_);
               _loc12_ = facade.retrieveProxy(XMas2012Proxy.NAME) as XMas2012Proxy;
               _loc13_ = new SpecialData();
               _loc13_.uniqueId = CHRISTMAS_TREE_UID;
               _loc13_.visible = _loc3_ == PlayFieldsTypes.FIELD_TYPE_MAIN_ZOO && this.eventProxy.isEventActive(EventTypes.XMAS_EVENT_2012) && Boolean(_loc12_);
               this.specialItemData.push(_loc13_);
               _loc14_ = new SpecialData();
               _loc14_.posX = 35;
               _loc14_.posY = 90;
               _loc14_.active = 1;
               _loc14_.itemId = Special.OCEAN_WORLD_LIFE_GUARD;
               _loc14_.uniqueId = Special.OCEAN_WORLD_LIFE_GUARD;
               _loc14_.visible = _loc3_ == PlayFieldsTypes.FIELD_TYPE_OCEANWORLD_ZOO;
               this.specialItemData.push(_loc14_);
               _loc15_ = facade.retrieveProxy(AdvBreedingEventProxy.NAME) as AdvBreedingEventProxy;
               _loc16_ = new SpecialData();
               _loc16_.uniqueId = ADV_BREED_VAN_UID;
               _loc16_.visible = _loc3_ == PlayFieldsTypes.FIELD_TYPE_MAIN_ZOO && this.eventProxy.isEventActive(EventTypes.ADV_BREEDING_EVENT);
               this.specialItemData.push(_loc16_);
            }
            else if(_loc3_ == PlayFieldsTypes.FIELD_TYPE_FORGOTTEN_ZOO || _loc3_ == PlayFieldsTypes.FIELD_TYPE_NEW_ZOO || _loc3_ == PlayFieldsTypes.FIELD_TYPE_RIVER_ZOO || _loc3_ == PlayFieldsTypes.FIELD_TYPE_COAST_ZOO)
            {
               _loc5_ = new SpecialData();
               _loc5_.uniqueId = GATE_ENTRANCE_BUILDING_ID;
               _loc5_.visible = false;
               this.specialItemData.push(_loc5_);
               _loc6_ = new SpecialData();
               _loc6_.uniqueId = GATE_ENTRANCE_FENCE_ID;
               _loc6_.visible = false;
               this.specialItemData.push(_loc6_);
               this.forgottenZooSign.posX = 30;
               this.forgottenZooSign.posY = 90;
               this.forgottenZooSign.rotatePos = ItemAbstract.ROTATION_0;
               this.forgottenZooSign.visible = true;
               this.specialItemData.push(this.forgottenZooSign);
               _loc7_ = new SpecialData();
               _loc7_.uniqueId = BABY_EVENT_UID;
               _loc7_.visible = false;
               this.specialItemData.push(_loc7_);
               _loc8_ = new SpecialData();
               _loc8_.uniqueId = BABY_CARAVAN_UID;
               _loc8_.visible = false;
               this.specialItemData.push(_loc8_);
               _loc11_ = new SpecialData();
               _loc11_.uniqueId = SANTA_SLEIGH_UID;
               _loc11_.visible = false;
               this.specialItemData.push(_loc11_);
               _loc13_ = new SpecialData();
               _loc13_.uniqueId = CHRISTMAS_TREE_UID;
               _loc13_.visible = false;
               this.specialItemData.push(_loc13_);
               _loc14_ = new SpecialData();
               _loc14_.posX = 35;
               _loc14_.posY = 90;
               _loc14_.active = 1;
               _loc14_.itemId = Special.OCEAN_WORLD_LIFE_GUARD;
               _loc14_.uniqueId = Special.OCEAN_WORLD_LIFE_GUARD;
               _loc14_.visible = _loc3_ == PlayFieldsTypes.FIELD_TYPE_OCEANWORLD_ZOO;
               this.specialItemData.push(_loc14_);
               _loc16_ = new SpecialData();
               _loc16_.uniqueId = ADV_BREED_VAN_UID;
               _loc16_.visible = false;
               this.specialItemData.push(_loc16_);
            }
            this.setFieldItems(this.specialItemData,PlayField.GUESS_COMMANDID);
         }
      }
      
      public function removeParkingLotItem(param1:int) : void
      {
         var _loc2_:SpecialData = new SpecialData();
         _loc2_.uniqueId = param1;
         _loc2_.visible = false;
         this.specialItemData.push(_loc2_);
         this.setFieldItems(this.specialItemData,PlayField.GUESS_COMMANDID);
      }
      
      public function showGateBuilding(param1:int) : void
      {
         var _loc2_:int = 0;
         if(this.currentBuildingId != param1)
         {
            this.currentBuildingId = param1;
            _loc2_ = this.gateItem.entranceFee;
            this.gateItemData.del = 1;
            this.setFieldItems(Vector.<FieldItemData>([this.gateItemData]),PlayField.GUESS_COMMANDID);
            this.gateItemData.del = 0;
            this.gateItemData.itemId = param1;
            this.setFieldItems(Vector.<FieldItemData>([this.gateItemData]),PlayField.GUESS_COMMANDID);
            this.gateItem = this.getFieldItem(Categories.SPECIAL,GATE_ENTRANCE_BUILDING_ID) as Special;
            this.gateItem.entranceFee = _loc2_;
         }
      }
      
      private function showGateFence(param1:int) : void
      {
         var _loc2_:int = 0;
         if(this.currentFenceId != param1)
         {
            this.currentFenceId = param1;
            _loc2_ = this.fenceItem.entranceFee;
            this.gateFenceData.del = 1;
            this.setFieldItems(Vector.<FieldItemData>([this.gateFenceData]),PlayField.GUESS_COMMANDID);
            this.gateFenceData.del = 0;
            this.gateFenceData.itemId = this.currentFenceId;
            this.setFieldItems(Vector.<FieldItemData>([this.gateFenceData]),PlayField.GUESS_COMMANDID);
            this.fenceItem = this.getFieldItem(Categories.SPECIAL,GATE_ENTRANCE_FENCE_ID) as Special;
            this.fenceItem.entranceFee = _loc2_;
         }
      }
      
      public function sendRoadTableToThisObject() : void
      {
      }
      
      public function enableVisitors(param1:Boolean) : void
      {
         this.visitorManager.enabled = param1;
      }
      
      public function handleUserLevelChange() : void
      {
      }
      
      public function handleFieldItemStateChange(param1:FieldItemStateNotice) : void
      {
         var _loc2_:Building = null;
         var _loc3_:int = 0;
         var _loc4_:ItemAbstract = null;
         if(param1.type == FieldItemStateNotice.CHANGE_ITEM_STATE)
         {
            if(param1.category > -1 && param1.uniqueId > -1)
            {
               _loc2_ = this.getFieldItem(param1.category,param1.uniqueId) as Building;
               if(_loc2_.category == Categories.DECOR)
               {
                  (_loc2_ as Decor).switchState(param1.newStateId,param1.itemId);
               }
            }
         }
         else if(param1.type == FieldItemStateNotice.CHANGE_ALL_ITEM_STATES)
         {
            if(param1.category > -1 && param1.itemId > -1)
            {
               _loc3_ = 0;
               while(_loc3_ < this.itemStack.length)
               {
                  _loc4_ = this.itemStack[_loc3_];
                  if(_loc4_)
                  {
                     if(_loc4_.category == Categories.DECOR)
                     {
                        (_loc4_ as Decor).switchState(param1.newStateId,param1.itemId);
                     }
                  }
                  _loc3_++;
               }
            }
         }
      }
      
      public function hideField() : void
      {
         TweenLite.to(this.skin,MainConfig.GAME_MODE_TRANSITION_ANIM_TIME,{
            "alpha":0,
            "visible":false
         });
      }
      
      public function showField() : void
      {
         this.skin.visible = true;
         TweenLite.to(this.skin,MainConfig.GAME_MODE_TRANSITION_ANIM_TIME,{
            "alpha":1,
            "visible":true
         });
      }
      
      public function removeAllItemsHACKED(param1:String) : void
      {
         var _loc2_:ItemAbstract = null;
         var _loc3_:Vector.<int> = null;
         var _loc4_:int = 0;
         var _loc5_:FieldItemData = null;
         var _loc6_:int = 0;
         for each(_loc2_ in this.itemDictionary)
         {
            _loc5_ = new FieldItemData();
            if(!_loc2_.systemItem)
            {
               _loc5_.logic::setCategory(_loc2_.category);
               _loc5_.itemId = _loc2_.itemId;
               _loc5_.uniqueId = _loc2_.uniqueId;
            }
            this.removeItem(_loc5_);
         }
         _loc3_ = this.roadTable.getAllRoadsIds();
         _loc4_ = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc6_ = _loc3_[_loc4_];
            if(_loc6_ > 0)
            {
               this.removeFieldRoad(_loc6_,true);
            }
            _loc4_++;
         }
         this.notifier.dispatchNoticeToRoot(new PlayFieldNotice(PlayFieldNotice.ALL_ITEMS_REMOVED,-1,-1,param1));
         this.trashManager.clearAllData();
      }
      
      public function fadeItemsInFront(param1:Point, param2:int, param3:int) : void
      {
         var _loc4_:int = 1;
         while(_loc4_ < 3)
         {
            this.fadeMouseColidingItems(this.getFieldCellItems(new Point(param1.x + _loc4_,param1.y + _loc4_)),param2,param3);
            this.fadeMouseColidingItems(this.getFieldCellItems(new Point(param1.x + _loc4_,param1.y)),param2,param3);
            this.fadeMouseColidingItems(this.getFieldCellItems(new Point(param1.x,param1.y + _loc4_)),param2,param3);
            _loc4_++;
         }
      }
      
      private function fadeMouseColidingItems(param1:Vector.<ItemAbstract>, param2:int, param3:int) : void
      {
         var _loc5_:ItemAbstract = null;
         var _loc6_:Boolean = false;
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            _loc5_ = param1[_loc4_];
            if(_loc5_.category != param2 || _loc5_.uniqueId != param3)
            {
               _loc6_ = _loc5_.hitTestPoint(this.gameContainer.mouseX,this.gameContainer.mouseY,true);
               if(_loc6_)
               {
                  this.fadeItemIn(_loc5_);
               }
               else
               {
                  this.fadeItemOut(_loc5_);
               }
            }
            _loc4_++;
         }
      }
      
      private function fadeItemIn(param1:ItemAbstract) : void
      {
         var _loc4_:ItemAbstract = null;
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         while(_loc3_ < this.fadedOutFildItems.length)
         {
            _loc4_ = this.fadedOutFildItems[_loc3_];
            if(param1 == _loc4_)
            {
               _loc2_ = true;
               break;
            }
            _loc3_++;
         }
         if(!_loc2_)
         {
            this.fadedOutFildItems.push(param1);
            TweenLite.to(param1,0.5,{"alpha":0.3});
         }
      }
      
      private function fadeItemOut(param1:ItemAbstract) : void
      {
         var _loc3_:ItemAbstract = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.fadedOutFildItems.length)
         {
            _loc3_ = this.fadedOutFildItems[_loc2_];
            if(param1 == _loc3_)
            {
               TweenLite.to(param1,0.5,{"alpha":1});
               this.fadedOutFildItems.splice(_loc2_,1);
               break;
            }
            _loc2_++;
         }
      }
      
      public function fadeOutAllItems() : void
      {
         while(this.fadedOutFildItems.length)
         {
            TweenLite.to(this.fadedOutFildItems.pop(),0.5,{"alpha":1});
         }
      }
      
      public function spownEasternEggAtBunny(param1:int, param2:int, param3:int) : void
      {
         var _loc5_:Vector.<FieldItemData> = null;
         var _loc6_:SpecialData = null;
         var _loc7_:PowerupProxy = null;
         var _loc8_:Special = null;
         var _loc4_:Visitor = this.getFieldItem(Categories.VISITOR,param2) as Visitor;
         if(_loc4_)
         {
            _loc5_ = new Vector.<FieldItemData>();
            _loc6_ = new SpecialData();
            _loc6_.posX = _loc4_.posX;
            _loc6_.posY = _loc4_.posY;
            _loc6_.itemId = 20;
            _loc6_.active = 1;
            _loc6_.uniqueId = param3 * 100 + param1;
            _loc6_.stateId = Math.floor(Math.random() * 4);
            _loc5_.push(_loc6_);
            this.setFieldItems(_loc5_,PlayField.GUESS_COMMANDID);
            _loc7_ = facade.retrieveProxy(PowerupProxy.NAME) as PowerupProxy;
            if(_loc7_.isPowerupActive(PowerupItemType.EASTER_HELPER))
            {
               _loc8_ = this.getFieldItem(Categories.SPECIAL,_loc6_.uniqueId) as Special;
               TweenLite.delayedCall(10,this.autoCollectEgg,[_loc8_]);
            }
         }
      }
      
      private function autoCollectEgg(param1:Special) : void
      {
         if(!param1.isDisposed)
         {
            this.notifier.dispatchNotice(new EsterEggNotice(EsterEggNotice.AUTO_COLLECT_ESTER_EGG,param1));
         }
      }
      
      private function removeAllItems() : void
      {
         var _loc3_:int = 0;
         this.removeAllPlayFieldItems();
         var _loc1_:Vector.<int> = this.roadTable.getAllRoadsIds();
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.length)
         {
            _loc3_ = _loc1_[_loc2_];
            if(_loc3_ > 0)
            {
               this.removeFieldRoad(_loc3_,true);
            }
            _loc2_++;
         }
         this.trashManager.clearAllData();
      }
      
      public function storeAllItems() : void
      {
         var _loc3_:int = 0;
         this.removeAllPlayFieldItems();
         var _loc1_:Vector.<int> = this.roadTable.getAllRoadsIds();
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.length)
         {
            _loc3_ = _loc1_[_loc2_];
            if(_loc3_ > 0)
            {
               this.removeFieldRoad(_loc3_);
            }
            _loc2_++;
         }
         this.trashManager.clearAllData();
      }
      
      protected function removeAllPlayFieldItems() : void
      {
         var _loc1_:ItemAbstract = null;
         var _loc2_:FieldItemData = null;
         for each(_loc1_ in this.itemDictionary)
         {
            _loc2_ = new FieldItemData();
            if(!_loc1_.systemItem)
            {
               _loc2_.logic::setCategory(_loc1_.category);
               _loc2_.itemId = _loc1_.itemId;
               _loc2_.uniqueId = _loc1_.uniqueId;
            }
            this.removeItem(_loc2_);
         }
      }
      
      public function get fieldWidth() : int
      {
         return this._orginalSize.x;
      }
      
      public function get fieldHeight() : int
      {
         return this._orginalSize.y;
      }
      
      public function get fieldType() : int
      {
         return this._fieldType;
      }
   }
}

