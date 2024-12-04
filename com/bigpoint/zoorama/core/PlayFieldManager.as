package com.bigpoint.zoorama.core
{
   import cmodule.aircall.CLibInit;
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.utils.timeManager.TimeFormat;
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.zoomumba.constants.ADMIN;
   import com.bigpoint.zoomumba.constants.AppMode;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.DataNote;
   import com.bigpoint.zoomumba.constants.GUINote;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.PLAYFIELD;
   import com.bigpoint.zoomumba.constants.PlayFieldsTypes;
   import com.bigpoint.zoomumba.constants.Resources;
   import com.bigpoint.zoomumba.constants.SHOP;
   import com.bigpoint.zoomumba.constants.UserResources;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.core.AppProxy;
   import com.bigpoint.zoomumba.model.app.gameEvents.GlobalEventProxy;
   import com.bigpoint.zoomumba.model.app.gameEvents.UserResourcesProxy;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.ActionType;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.EventTypes;
   import com.bigpoint.zoomumba.model.app.items.DraggedItemVO;
   import com.bigpoint.zoomumba.model.app.items.ItemVO;
   import com.bigpoint.zoomumba.model.events.xmas.XmasProxy;
   import com.bigpoint.zoomumba.model.features.babyCaravan.BabyCaravanProxy;
   import com.bigpoint.zoomumba.model.features.circus.CircusProxy;
   import com.bigpoint.zoomumba.model.features.collectables.CollectablesProxy;
   import com.bigpoint.zoomumba.model.features.powerup.PowerupProxy;
   import com.bigpoint.zoomumba.model.features.powerup.vo.PowerupItemType;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.model.gameConfig.PremiumPackConfigProxy;
   import com.bigpoint.zoomumba.model.gameConfig.vo.AnimalSpeciesVO;
   import com.bigpoint.zoomumba.model.gui.particles.ParticlesProxy;
   import com.bigpoint.zoomumba.model.gui.particles.vo.ParticleType;
   import com.bigpoint.zoomumba.model.instantDrag.vo.LastBuyVo;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.CageData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.DecorData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.FieldItemData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.RoadData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.StoreData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.TrashBinData;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayFieldAnimationProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayFieldProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayfieldSettingsProxy;
   import com.bigpoint.zoomumba.model.playfield.vo.AssistantTypeVO;
   import com.bigpoint.zoomumba.model.playfield.vo.BreedingLabVO;
   import com.bigpoint.zoomumba.model.playfield.vo.NurseryVO;
   import com.bigpoint.zoomumba.model.playfield.vo.PlayfieldSettingsVO;
   import com.bigpoint.zoomumba.model.shop.vo.ShopTabs;
   import com.bigpoint.zoomumba.model.user.assistances.AssistancesProxy;
   import com.bigpoint.zoomumba.model.user.assistances.vo.AssistantsVO;
   import com.bigpoint.zoomumba.model.user.core.UserProxy;
   import com.bigpoint.zoomumba.model.user.currency.CurrencyProxy;
   import com.bigpoint.zoomumba.model.user.resources.ResourcesProxy;
   import com.bigpoint.zoomumba.model.user.snapShot.SnapShotProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowParams;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.confirmation.ConfirmationInitParams;
   import com.bigpoint.zoomumba.view.app.ApplicationMediator;
   import com.bigpoint.zoomumba.view.features.itemDrops.ItemDropMediator;
   import com.bigpoint.zoomumba.view.gui.particles.ParticleMediator;
   import com.bigpoint.zoorama.MainConfig;
   import com.bigpoint.zoorama.Settings;
   import com.bigpoint.zoorama.core.feature.FeatureActiveReference;
   import com.bigpoint.zoorama.core.feature.tutorials.managers.TutorialInjectionManager;
   import com.bigpoint.zoorama.data.OldWindowTypes;
   import com.bigpoint.zoorama.data.SoundEffectNames;
   import com.bigpoint.zoorama.data.fieldItems.TrashRoadData;
   import com.bigpoint.zoorama.data.settings.AnimalShopData;
   import com.bigpoint.zoorama.data.settings.BreedingLabShopData;
   import com.bigpoint.zoorama.data.settings.CageShopData;
   import com.bigpoint.zoorama.data.settings.DecorShopData;
   import com.bigpoint.zoorama.data.settings.NurseryShopData;
   import com.bigpoint.zoorama.data.settings.RoadShopData;
   import com.bigpoint.zoorama.data.settings.ShopItemData;
   import com.bigpoint.zoorama.data.settings.SpecieShopData;
   import com.bigpoint.zoorama.data.settings.StorageShopData;
   import com.bigpoint.zoorama.data.settings.StoreShopData;
   import com.bigpoint.zoorama.data.settings.TrashbinShopData;
   import com.bigpoint.zoorama.notices.bonus.BonusCodeNotice;
   import com.bigpoint.zoorama.notices.gui.window.AnimalBreedWindowNotice;
   import com.bigpoint.zoorama.notices.gui.window.ConfirmationWindowNotice;
   import com.bigpoint.zoorama.notices.gui.window.ConstructionWindowNotice;
   import com.bigpoint.zoorama.notices.gui.window.ItemWindowActionNotice;
   import com.bigpoint.zoorama.notices.gui.window.SaveScreenshotNotice;
   import com.bigpoint.zoorama.notices.gui.window.UpgradeWindowNotice;
   import com.bigpoint.zoorama.notices.gui.window.WindowNotice;
   import com.bigpoint.zoorama.notices.itemDrop.ItemDropNotice;
   import com.bigpoint.zoorama.notices.playfield.EsterEggNotice;
   import com.bigpoint.zoorama.notices.view.actionMenu.ActionMenuNotice;
   import com.bigpoint.zoorama.notices.view.actionMenu.ActionNotice;
   import com.bigpoint.zoorama.notices.view.actionMenu.CageSlotMenuNotice;
   import com.bigpoint.zoorama.notices.view.field.CageNotice;
   import com.bigpoint.zoorama.notices.view.field.DeleteItemNotice;
   import com.bigpoint.zoorama.notices.view.field.RoadItemNotice;
   import com.bigpoint.zoorama.notices.view.quickInfo.QuickInfoNotice;
   import com.bigpoint.zoorama.sound.SoundManager;
   import com.bigpoint.zoorama.utils.configModules.ConfigurationModule;
   import com.bigpoint.zoorama.utils.configModules.TextReplace;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.items.BuildingHelper;
   import com.bigpoint.zoorama.utils.mouseModule.MouseModule;
   import com.bigpoint.zoorama.utils.mouseModule.MouseState;
   import com.bigpoint.zoorama.view.actionMenu.ActionButton;
   import com.bigpoint.zoorama.view.actionMenu.ActionMenuManager;
   import com.bigpoint.zoorama.view.actionMenu.ActionMenuTypes;
   import com.bigpoint.zoorama.view.actionMenu.StoreActionMenu;
   import com.bigpoint.zoorama.view.dragItem.DragItem;
   import com.bigpoint.zoorama.view.dragItem.DragNotice;
   import com.bigpoint.zoorama.view.field.PlayField;
   import com.bigpoint.zoorama.view.field.PlayFieldNotice;
   import com.bigpoint.zoorama.view.field.items.Building;
   import com.bigpoint.zoorama.view.field.items.Cage;
   import com.bigpoint.zoorama.view.field.items.Decor;
   import com.bigpoint.zoorama.view.field.items.FieldItemStateNotice;
   import com.bigpoint.zoorama.view.field.items.ItemAbstract;
   import com.bigpoint.zoorama.view.field.items.ItemMarkType;
   import com.bigpoint.zoorama.view.field.items.ItemNotice;
   import com.bigpoint.zoorama.view.field.items.Sleigh;
   import com.bigpoint.zoorama.view.field.items.Special;
   import com.bigpoint.zoorama.view.field.items.Store;
   import com.bigpoint.zoorama.view.field.items.TrashBin;
   import com.bigpoint.zoorama.view.field.items.TrashRoad;
   import com.bigpoint.zoorama.view.gui.mainmenu.MouseToolNotice;
   import com.bigpoint.zoorama.view.gui.tooltip.TooltipNewManager;
   import com.bigpoint.zoorama.view.gui.win.generals.WindowButtonParams;
   import com.bigpoint.zoorama.view.itemDrop.ItemDropLayer;
   import com.greensock.TweenLite;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.StageDisplayState;
   import flash.events.Event;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.net.FileReference;
   import flash.utils.ByteArray;
   import mx.core.UIComponent;
   import org.flintparticles.twoD.renderers.DisplayObjectRenderer;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.mediator.Mediator;
   
   public class PlayFieldManager extends Mediator
   {
      public static const NAME:String = "PlayFieldManager";
      
      private var appProxy:AppProxy;
      
      private var playFieldProxy:PlayFieldProxy;
      
      private var playfieldSettingsProxy:PlayfieldSettingsProxy;
      
      private var currencyProxy:CurrencyProxy;
      
      private var appMediator:ApplicationMediator;
      
      public var playField:PlayField;
      
      private var dragItem:DragItem;
      
      private var actionMenuManager:ActionMenuManager;
      
      private var totalZoomLevels:int = MainConfig.ZOOM_LEVELS.length;
      
      public var currentZoomLevel:int = 2;
      
      private var notifier:Notifier;
      
      private var soundManager:SoundManager;
      
      private var currTimeItemMouseOver:Number = 0;
      
      private var rateTimeItemMouseOver:Number = 0.3;
      
      private var maxTimeItemMouseOver:Number = 1;
      
      private var isItemMouseOver:Boolean = false;
      
      private var infoBeingShowed:int = -1;
      
      private var isFullsScreen:Boolean = false;
      
      private var mouseModule:MouseModule = MouseModule.getInstance();
      
      public var itemDropLayer:ItemDropLayer;
      
      private var particleContainer:DisplayObjectRenderer;
      
      private var premiumProxy:PremiumPackConfigProxy;
      
      private var collectablesProxy:CollectablesProxy;
      
      private var gameContainer:UIComponent;
      
      private var jpeginit:CLibInit = new CLibInit();
      
      private var jpeglib:* = this.jpeginit.init();
      
      private var imgEncoded:ByteArray;
      
      private var imgBitmap:BitmapData;
      
      private var powerupProxy:PowerupProxy;
      
      private var resourcesProxy:ResourcesProxy;
      
      private var userResourcesProxy:UserResourcesProxy;
      
      private var assistantsProxy:AssistancesProxy;
      
      private var eventProxy:GlobalEventProxy;
      
      private var animalCage:Cage;
      
      private var newCageData:CageData;
      
      private var cagePositionInStage:Point;
      
      private var spiecieShopData:SpecieShopData;
      
      private var snapShotProxy:SnapShotProxy;
      
      private var netProxy:NetProxy;
      
      private var itemConfigProxy:ItemConfigProxy;
      
      private var xmasProxy:XmasProxy;
      
      private var userProxy:UserProxy;
      
      private var mouseOverBuilding:Building;
      
      public function PlayFieldManager(param1:Notifier, param2:UIComponent)
      {
         super(NAME);
         this.notifier = new Notifier(param1);
         this.gameContainer = param2;
         var _loc3_:PlayfieldSettingsVO = new PlayfieldSettingsVO();
         _loc3_.zooGatePosX = 31;
         _loc3_.zooGatePosY = 89;
         _loc3_.minVertical = -60;
         _loc3_.maxVertical = -40;
         _loc3_.minHorizontal = 60;
         _loc3_.maxHorizontal = 60;
         this.playField = new PlayField(this.notifier,param2,new Point(MainConfig.GAME_FIELD_WIDTH,MainConfig.GAME_FIELD_HEIGHT),_loc3_);
         facade.registerProxy(new PlayFieldAnimationProxy());
         this.itemDropLayer = new ItemDropLayer();
         param2.addChild(this.itemDropLayer);
         this.dragItem = new DragItem(this.notifier,param2);
         this.actionMenuManager = new ActionMenuManager(this.notifier,param2);
         facade.registerMediator(new ItemDropMediator(this.itemDropLayer));
         this.soundManager = SoundManager.getInstance();
         this.particleContainer = new DisplayObjectRenderer();
         param2.addChild(this.particleContainer);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [DataNote.APP_MODE_CHANGED,GUINote.MENU_ZOOM_IN_BUTTON_CLICKED,GUINote.MENU_ZOOM_OUT_BUTTON_CLICKED,Note.FULLSCREEN_MODE_CHANGE,Note.MAKE_SCREEN_SHOT,Note.INVENTORY_USE_ITEM,Note.SET_FIELDS_ITEMS,Note.CLOSE_ALL_ACTION_MENUS,Note.OPEN_CAGE_BREED_WINDOW,Note.SEND_CAGE_TO_INVENTORY,Note.CLOSE_ALL_ACTION_MENUS,Note.OPEN_CAGE_BREED_WINDOW,Note.ENABLE_VISITORS,Note.DISABLE_VISITORS,Note.START_NEXT_BUY_ITEM_DRAG,Note.START_NEXT_BUY_ANIMAL_DRAG,Note.KEYBOARD_CTRL_UP,Note.START_NEXT_INVENTORY_ITEM_DRAG,SHOP.REFRESH_ASSISTANTS];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:ApplicationMediator = null;
         switch(param1.getName())
         {
            case DataNote.APP_MODE_CHANGED:
               this.changeAppMode();
               break;
            case Note.SEND_CAGE_TO_INVENTORY:
               this.sendCageToInventory(param1.getBody() as Building);
               break;
            case Note.FULLSCREEN_MODE_CHANGE:
               if(this.currentZoomLevel < 1)
               {
                  this.zoomIn();
               }
               _loc3_ = facade.retrieveMediator(ApplicationMediator.NAME) as ApplicationMediator;
               if(_loc3_.application.stage.displayState == StageDisplayState.NORMAL)
               {
                  this.isFullsScreen = false;
               }
               else
               {
                  this.isFullsScreen = true;
               }
               break;
            case GUINote.MENU_ZOOM_IN_BUTTON_CLICKED:
               if(!Settings.TUTORIAL_ACTIVE)
               {
                  this.zoomIn();
               }
               break;
            case GUINote.MENU_ZOOM_OUT_BUTTON_CLICKED:
               if(!Settings.TUTORIAL_ACTIVE)
               {
                  this.zoomOut();
               }
               break;
            case Note.MAKE_SCREEN_SHOT:
               this.makeScreenshot();
               break;
            case Note.SET_FIELDS_ITEMS:
               this.setFieldItems(param1.getBody() as Vector.<FieldItemData>);
               break;
            case Note.CLOSE_ALL_ACTION_MENUS:
               this.closeAllActionMenus();
               break;
            case Note.OPEN_CAGE_BREED_WINDOW:
               this.handleOpenCageBreedWindow(param1.getBody() as CageNotice);
               break;
            case Note.ENABLE_VISITORS:
               this.enableVisitors(true);
               break;
            case Note.DISABLE_VISITORS:
               this.enableVisitors(false);
               break;
            case Note.INVENTORY_USE_ITEM:
               this.startDragInvonteryItem(param1.getBody() as ShopItemData);
               break;
            case Note.START_NEXT_BUY_ITEM_DRAG:
               _loc2_ = param1.getBody();
               this.startDragShopItem(_loc2_ as ShopItemData,false);
               break;
            case Note.START_NEXT_BUY_ANIMAL_DRAG:
               _loc2_ = param1.getBody();
               this.startDragShopAnimalItem(_loc2_ as AnimalSpeciesVO,false);
               break;
            case Note.START_NEXT_INVENTORY_ITEM_DRAG:
               _loc2_ = param1.getBody();
               this.startDragInvonteryItem(_loc2_ as ShopItemData);
               break;
            case Note.KEYBOARD_CTRL_UP:
               this.stopDragShopItem();
               break;
            case SHOP.REFRESH_ASSISTANTS:
               this.actionMenuManager.updateActionMenuIcons(this.playfieldSettingsProxy.activePlayfieldType);
         }
      }
      
      public function startDragInvonteryItem(param1:ShopItemData) : void
      {
         this.dragItem.startDragInventoryItem(param1);
         this.closeAllActionMenus();
      }
      
      override public function onRegister() : void
      {
         super.onRegister();
         facade.registerMediator(this.dragItem);
         facade.registerMediator(this.actionMenuManager);
         facade.registerMediator(this.playField);
         this.appProxy = facade.retrieveProxy(AppProxy.NAME) as AppProxy;
         this.premiumProxy = facade.retrieveProxy(PremiumPackConfigProxy.NAME) as PremiumPackConfigProxy;
         this.playFieldProxy = facade.retrieveProxy(PlayFieldProxy.NAME) as PlayFieldProxy;
         this.playfieldSettingsProxy = facade.getProxy(PlayfieldSettingsProxy);
         this.collectablesProxy = facade.retrieveProxy(CollectablesProxy.NAME) as CollectablesProxy;
         this.powerupProxy = facade.retrieveProxy(PowerupProxy.NAME) as PowerupProxy;
         this.resourcesProxy = facade.retrieveProxy(ResourcesProxy.NAME) as ResourcesProxy;
         this.userResourcesProxy = facade.retrieveProxy(UserResourcesProxy.NAME) as UserResourcesProxy;
         this.currencyProxy = facade.retrieveProxy(CurrencyProxy.NAME) as CurrencyProxy;
         facade.registerMediator(new ParticleMediator(this.particleContainer));
         this.assistantsProxy = facade.retrieveProxy(AssistancesProxy.NAME) as AssistancesProxy;
         this.snapShotProxy = facade.retrieveProxy(SnapShotProxy.NAME) as SnapShotProxy;
         this.netProxy = facade.retrieveProxy(NetProxy.NAME) as NetProxy;
         this.itemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         this.appMediator = facade.retrieveMediator(ApplicationMediator.NAME) as ApplicationMediator;
         this.eventProxy = facade.retrieveProxy(GlobalEventProxy.NAME) as GlobalEventProxy;
         this.xmasProxy = facade.retrieveProxy(XmasProxy.NAME) as XmasProxy;
         this.userProxy = facade.getProxy(UserProxy);
      }
      
      private function makeScreenshot() : void
      {
         var _loc1_:ApplicationMediator = facade.retrieveMediator(ApplicationMediator.NAME) as ApplicationMediator;
         this.imgBitmap = new BitmapData(_loc1_.application.width,_loc1_.application.height);
         var _loc2_:Rectangle = new Rectangle(0,0,_loc1_.application.width,_loc1_.application.height);
         var _loc3_:Matrix = new Matrix();
         _loc3_.tx = this.playField.fieldSprite.x;
         _loc3_.ty = this.playField.fieldSprite.y;
         this.imgBitmap.draw(this.playField.fieldSprite,_loc3_);
         var _loc4_:ByteArray = this.imgBitmap.clone().getPixels(_loc2_);
         this.imgEncoded = new ByteArray();
         _loc4_.position = 0;
         this.jpeglib.encodeAsync(this.encodeComplete,_loc4_,this.imgEncoded,this.imgBitmap.width,this.imgBitmap.height,85);
      }
      
      private function encodeComplete(param1:Event) : void
      {
         var _loc2_:WindowButtonParams = new WindowButtonParams(this.cancelSaveJpeg,null,this.saveJpegToDisk,null,this.cancelSaveJpeg);
         this.notifier.dispatchNoticeToRoot(new SaveScreenshotNotice(WindowNotice.OPEN_WINDOW,OldWindowTypes.SAVE_SCREENSHOT,this.imgBitmap,_loc2_));
         sendNotification(Note.SCREEN_SHOT_ENCODED);
         sendNotification(Note.EXIT_FULLSCREEN_MODE);
      }
      
      private function cancelSaveJpeg() : void
      {
         this.imgBitmap.dispose();
      }
      
      private function saveJpegToDisk() : void
      {
         var _loc1_:FileReference = new FileReference();
         var _loc2_:Date = new Date();
         var _loc3_:* = "Zoomumba_" + _loc2_.date + "." + String(_loc2_.month + 1) + "." + _loc2_.getFullYear() + "-" + _loc2_.hours + "." + _loc2_.minutes + ".jpg";
         _loc1_.save(this.imgEncoded,_loc3_);
         this.imgBitmap.dispose();
      }
      
      public function enable() : void
      {
         this.playField.enable();
      }
      
      public function init() : void
      {
         this.notifier.registerNoticeListener(DragNotice.PRESS_ITEM,this.finishDragShopItem);
         this.notifier.registerNoticeListener(ItemNotice.DRAG_START,this.handleItemDragStart);
         this.notifier.registerNoticeListener(DragNotice.DRAG,this.handleDrag);
         this.notifier.registerNoticeListener(DragNotice.DROP_ITEM,this.handleItemDragStop);
         this.notifier.registerNoticeListener(DeleteItemNotice.DELETE_ITEM,this.handleItemDelete);
         this.notifier.registerNoticeListener(ItemNotice.MOUSE_OVER,this.handleItemMouseOver);
         this.notifier.registerNoticeListener(ItemNotice.MOUSE_OUT,this.handleItemMouseOut);
         this.notifier.registerNoticeListener(ItemNotice.MOUSE_UP,this.handleItemMouseUp);
         this.notifier.registerNoticeListener(ItemNotice.CLICK,this.handleItemClick);
         this.notifier.registerNoticeListener(ItemNotice.CLICK,this.handleItemClick);
         this.notifier.registerNoticeListener(RoadItemNotice.CLICK,this.handleRoadItemClick);
         this.notifier.registerNoticeListener(ActionNotice.ACTION_MENU_BUTTON_CLICK,this.handleActionButtonClick);
         this.notifier.registerNoticeListener(PlayFieldNotice.SCREEN_MOVE,this.handleScreenMove);
         this.notifier.registerNoticeListener(CageNotice.OPEN_CAGE_BREED_WINDOW,this.handleOpenCageBreedWindow);
         this.notifier.registerNoticeListener(ActionMenuNotice.EXECUTE_ALL_ACTIONS,this.handleCenterActionMenuPicClick);
      }
      
      public function setCageFields(param1:CageData) : void
      {
         var _loc2_:Vector.<FieldItemData> = new Vector.<FieldItemData>();
         _loc2_.push(param1 as FieldItemData);
         this.playField.setFieldItems(_loc2_,this.netProxy.lastParsedResponse);
      }
      
      public function setDecorFields(param1:DecorData) : void
      {
         var _loc2_:Vector.<FieldItemData> = new Vector.<FieldItemData>();
         _loc2_.push(param1 as FieldItemData);
         this.playField.setFieldItems(_loc2_,this.netProxy.lastParsedResponse);
      }
      
      public function setStoreFields(param1:StoreData) : void
      {
         var _loc2_:Vector.<FieldItemData> = new Vector.<FieldItemData>();
         _loc2_.push(param1 as FieldItemData);
         this.playField.setFieldItems(_loc2_,this.netProxy.lastParsedResponse);
      }
      
      public function setNurseryFields(param1:NurseryVO) : void
      {
         var _loc2_:Vector.<FieldItemData> = new Vector.<FieldItemData>();
         _loc2_.push(param1 as FieldItemData);
         this.playField.setFieldItems(_loc2_,this.netProxy.lastParsedResponse);
      }
      
      public function setBreedingLabFields(param1:BreedingLabVO) : void
      {
         var _loc2_:Vector.<FieldItemData> = new Vector.<FieldItemData>();
         _loc2_.push(param1 as FieldItemData);
         this.playField.setFieldItems(_loc2_,this.netProxy.lastParsedResponse);
      }
      
      public function setRoadFields(param1:RoadData) : void
      {
         var _loc2_:Vector.<FieldItemData> = new Vector.<FieldItemData>();
         _loc2_.push(param1 as FieldItemData);
         this.playField.setFieldItems(_loc2_,this.netProxy.lastParsedResponse);
      }
      
      public function setTrashBinFields(param1:TrashBinData) : void
      {
         var _loc2_:Vector.<FieldItemData> = new Vector.<FieldItemData>();
         _loc2_.push(param1 as FieldItemData);
         this.playField.setFieldItems(_loc2_,this.netProxy.lastParsedResponse);
      }
      
      public function activateSnowFall() : void
      {
         sendNotification(GUINote.ENABLE_PARTICLES,ParticleType.SNOW_PARTICLE);
      }
      
      public function stopSnowFall() : void
      {
         sendNotification(GUINote.DISABLE_PARTICLES,ParticleType.SNOW_PARTICLE);
      }
      
      public function activateHeartsFall() : void
      {
         sendNotification(GUINote.ENABLE_PARTICLES,ParticleType.VALENTINES_PARTICLE);
      }
      
      public function stopHeartsFall() : void
      {
         sendNotification(GUINote.DISABLE_PARTICLES,ParticleType.VALENTINES_PARTICLE);
      }
      
      public function zoomIn() : void
      {
         if(this.currentZoomLevel < this.totalZoomLevels - 1)
         {
            ++this.currentZoomLevel;
            this.playField.zoomLevel = MainConfig.ZOOM_LEVELS[this.currentZoomLevel];
            this.dragItem.zoomLevel = MainConfig.ZOOM_LEVELS[this.currentZoomLevel];
            sendNotification(Note.ZOOM_IN,this.playField.zoomLevel);
         }
         this.closeAllActionMenus();
         this.notifier.dispatchNotice(new ItemDropNotice(ItemDropNotice.REPOSITION_LAYER,null,null,-1,null,null,-1,this.playField.fieldSprite.x,this.playField.fieldSprite.y));
      }
      
      public function zoomOut() : void
      {
         if(this.isFullsScreen && this.currentZoomLevel == 1)
         {
            return;
         }
         if(this.currentZoomLevel > 0)
         {
            --this.currentZoomLevel;
            this.playField.zoomLevel = MainConfig.ZOOM_LEVELS[this.currentZoomLevel];
            this.dragItem.zoomLevel = MainConfig.ZOOM_LEVELS[this.currentZoomLevel];
            sendNotification(Note.ZOOM_OUT,this.playField.zoomLevel);
         }
         this.closeAllActionMenus();
         this.notifier.dispatchNotice(new ItemDropNotice(ItemDropNotice.REPOSITION_LAYER,null,null,-1,null,null,-1,this.playField.fieldSprite.x,this.playField.fieldSprite.y));
      }
      
      public function closeAllActionMenus() : void
      {
         this.notifier.dispatchNoticeToRoot(new ActionMenuNotice(ActionMenuNotice.CLOSE_ACTION_MENU));
      }
      
      public function startDragShopItem(param1:ShopItemData, param2:Boolean) : void
      {
         this.dragItem.startDragShopItem(param1,param2);
         this.closeAllActionMenus();
         if(Settings.TUTORIAL_ACTIVE)
         {
            if(param1.categoryId == Categories.CAGE)
            {
               TutorialInjectionManager.getInstance().cageBuyFromShop();
            }
         }
      }
      
      public function startDragShopAnimalItem(param1:AnimalSpeciesVO, param2:Boolean) : void
      {
         this.dragItem.startDragAnimalShopItem(param1,param2);
         this.closeAllActionMenus();
         if(Settings.TUTORIAL_ACTIVE)
         {
            TutorialInjectionManager.getInstance().animalBuyFromShop();
         }
      }
      
      public function finishDragShopItem(param1:DragNotice) : void
      {
         var _loc2_:FieldItemData = null;
         var _loc5_:ItemAbstract = null;
         var _loc6_:Cage = null;
         var _loc7_:AnimalShopData = null;
         var _loc8_:Number = NaN;
         var _loc9_:int = 0;
         var _loc10_:Sleigh = null;
         var _loc11_:Boolean = false;
         var _loc12_:CageShopData = null;
         var _loc13_:Point = null;
         var _loc14_:Number = NaN;
         var _loc15_:StoreShopData = null;
         var _loc16_:Number = NaN;
         var _loc17_:BreedingLabShopData = null;
         var _loc18_:Number = NaN;
         var _loc19_:NurseryShopData = null;
         var _loc20_:Number = NaN;
         var _loc21_:StorageShopData = null;
         var _loc22_:Number = NaN;
         var _loc23_:DecorShopData = null;
         var _loc24_:Number = NaN;
         var _loc25_:Vector.<ShopItemData> = null;
         var _loc26_:Building = null;
         var _loc27_:* = undefined;
         var _loc28_:Array = null;
         var _loc29_:int = 0;
         var _loc30_:RoadShopData = null;
         var _loc31_:TrashbinShopData = null;
         this.closeAllActionMenus();
         var _loc3_:Point = this.playField.getStageToFieldCords(param1.dragPoint);
         var _loc4_:Point = param1.dragPoint;
         switch(param1.categoryId)
         {
            case Categories.CAGE:
               if(Settings.TUTORIAL_ACTIVE)
               {
                  _loc13_ = new Point(29,84);
                  if(!(_loc3_.y == _loc13_.y && _loc3_.x == _loc13_.x))
                  {
                     this.dragItem.stopDragItem();
                     return;
                  }
                  TutorialInjectionManager.getInstance().cagePlacedCorrectly();
               }
               _loc12_ = ConfigurationModule.getInstance().getCageData(param1.itemId);
               if(this.playField.checkAvailabilityWithGround(param1.groundRequired,_loc3_,new Point(_loc12_.width,_loc12_.height)) && !this.playField.testBuildingOutOfFieldBonuds(_loc3_,new Point(_loc12_.width,_loc12_.height)))
               {
                  if(_loc12_)
                  {
                     if(param1.useInventory)
                     {
                        sendNotification(Note.SAVE_LAST_DRAG_ITEM,new LastBuyVo(param1.categoryId,param1.itemId,!param1.useInventory,0,param1.uniqueId));
                        sendNotification(NET.MOVE_ITEM_FROM_INVENTORY_TO_FIELD,[param1.categoryId,param1.uniqueId,_loc3_.x,_loc3_.y,param1.rotatePos]);
                     }
                     else if(param1.realMoney)
                     {
                        this.currencyProxy.reduceCurrency(UserResources.REAL_MONEY,_loc12_.buyReal);
                        this.notifier.dispatchNotice(new QuickInfoNotice(QuickInfoNotice.REDUCE_CURRENCY,UserResources.REAL_MONEY,_loc12_.buyReal,new Point(_loc4_.x,_loc4_.y)));
                        sendNotification(NET.BUY_CAGE,[param1.itemId,_loc3_.x,_loc3_.y,param1.rotatePos,1]);
                     }
                     else
                     {
                        _loc14_ = _loc12_.buyVirtual;
                        _loc14_ = Math.floor(_loc14_ * this.premiumProxy.allNormalBuildingsCostMultiplyer);
                        this.currencyProxy.reduceCurrency(UserResources.VIRTUAL_MONEY,_loc14_);
                        this.notifier.dispatchNotice(new QuickInfoNotice(QuickInfoNotice.REDUCE_CURRENCY,UserResources.VIRTUAL_MONEY,_loc14_,new Point(_loc4_.x,_loc4_.y)));
                        sendNotification(Note.SAVE_LAST_DRAG_ITEM,new LastBuyVo(param1.categoryId,param1.itemId,!param1.useInventory,_loc14_));
                        sendNotification(NET.BUY_CAGE,[param1.itemId,_loc3_.x,_loc3_.y,param1.rotatePos,0]);
                     }
                  }
               }
               break;
            case Categories.STORE:
               _loc15_ = ConfigurationModule.getInstance().getStoreData(param1.itemId);
               if(this.playField.checkAvailabilityWithGround(param1.groundRequired,_loc3_,new Point(_loc15_.width,_loc15_.height)) && !this.playField.testBuildingOutOfFieldBonuds(_loc3_,new Point(_loc15_.width,_loc15_.height)))
               {
                  if(_loc15_)
                  {
                     if(param1.useInventory)
                     {
                        sendNotification(NET.MOVE_ITEM_FROM_INVENTORY_TO_FIELD,[param1.categoryId,param1.uniqueId,_loc3_.x,_loc3_.y,param1.rotatePos]);
                        sendNotification(Note.SAVE_LAST_DRAG_ITEM,new LastBuyVo(param1.categoryId,param1.itemId,!param1.useInventory,0,param1.uniqueId));
                     }
                     else if(param1.realMoney)
                     {
                        this.currencyProxy.reduceCurrency(UserResources.REAL_MONEY,_loc15_.buyReal);
                        this.notifier.dispatchNotice(new QuickInfoNotice(QuickInfoNotice.REDUCE_CURRENCY,UserResources.REAL_MONEY,_loc15_.buyReal,new Point(_loc4_.x,_loc4_.y)));
                        sendNotification(NET.BUY_STORE,[param1.itemId,_loc3_.x,_loc3_.y,param1.rotatePos,1]);
                     }
                     else
                     {
                        _loc16_ = _loc15_.buyVirtual;
                        _loc16_ = Math.floor(_loc16_ * this.premiumProxy.allNormalBuildingsCostMultiplyer);
                        this.currencyProxy.reduceCurrency(UserResources.VIRTUAL_MONEY,_loc16_);
                        this.notifier.dispatchNotice(new QuickInfoNotice(QuickInfoNotice.REDUCE_CURRENCY,UserResources.VIRTUAL_MONEY,_loc16_,new Point(_loc4_.x,_loc4_.y)));
                        sendNotification(NET.BUY_STORE,[param1.itemId,_loc3_.x,_loc3_.y,param1.rotatePos,0]);
                        sendNotification(Note.SAVE_LAST_DRAG_ITEM,new LastBuyVo(param1.categoryId,param1.itemId,!param1.useInventory,_loc16_));
                     }
                  }
               }
               break;
            case Categories.BREEDING_LAB:
               _loc17_ = ConfigurationModule.getInstance().getBreedingLabData();
               if(this.playField.checkAvailabilityWithGround(param1.groundRequired,_loc3_,new Point(_loc17_.width,_loc17_.height)) && !this.playField.testBuildingOutOfFieldBonuds(_loc3_,new Point(_loc17_.width,_loc17_.height)))
               {
                  if(_loc17_)
                  {
                     if(param1.useInventory)
                     {
                        sendNotification(NET.MOVE_ITEM_FROM_INVENTORY_TO_FIELD,[5,param1.uniqueId,_loc3_.x,_loc3_.y,param1.rotatePos]);
                        sendNotification(Note.SAVE_LAST_DRAG_ITEM,new LastBuyVo(param1.categoryId,param1.itemId,!param1.useInventory,0,param1.uniqueId));
                     }
                     else if(param1.realMoney)
                     {
                        this.currencyProxy.reduceCurrency(UserResources.REAL_MONEY,_loc17_.buyReal);
                        this.notifier.dispatchNotice(new QuickInfoNotice(QuickInfoNotice.REDUCE_CURRENCY,UserResources.REAL_MONEY,_loc17_.buyReal,new Point(_loc4_.x,_loc4_.y)));
                        sendNotification(NET.BUY_BREEDING_LAB,[_loc3_.x,_loc3_.y,param1.rotatePos,1]);
                     }
                     else
                     {
                        _loc18_ = _loc17_.buyVirtual;
                        _loc18_ = Math.floor(_loc18_ * this.premiumProxy.allNormalBuildingsCostMultiplyer);
                        this.currencyProxy.reduceCurrency(UserResources.VIRTUAL_MONEY,_loc18_);
                        this.notifier.dispatchNotice(new QuickInfoNotice(QuickInfoNotice.REDUCE_CURRENCY,UserResources.VIRTUAL_MONEY,_loc18_,new Point(_loc4_.x,_loc4_.y)));
                        sendNotification(NET.BUY_BREEDING_LAB,[_loc3_.x,_loc3_.y,param1.rotatePos,0]);
                        sendNotification(Note.SAVE_LAST_DRAG_ITEM,new LastBuyVo(param1.categoryId,param1.itemId,!param1.useInventory,_loc18_));
                     }
                  }
               }
               break;
            case Categories.NURSERY:
               _loc19_ = ConfigurationModule.getInstance().getNurseryData();
               if(this.playField.checkAvailabilityWithGround(param1.groundRequired,_loc3_,new Point(_loc19_.width,_loc19_.height)) && !this.playField.testBuildingOutOfFieldBonuds(_loc3_,new Point(_loc19_.width,_loc19_.height)))
               {
                  if(_loc19_)
                  {
                     if(param1.useInventory)
                     {
                        sendNotification(NET.MOVE_ITEM_FROM_INVENTORY_TO_FIELD,[5,param1.uniqueId,_loc3_.x,_loc3_.y,param1.rotatePos]);
                        sendNotification(Note.SAVE_LAST_DRAG_ITEM,new LastBuyVo(param1.categoryId,param1.itemId,!param1.useInventory,0,param1.uniqueId));
                     }
                     else if(param1.realMoney)
                     {
                        this.currencyProxy.reduceCurrency(UserResources.REAL_MONEY,_loc19_.buyReal);
                        this.notifier.dispatchNotice(new QuickInfoNotice(QuickInfoNotice.REDUCE_CURRENCY,UserResources.REAL_MONEY,_loc19_.buyReal,new Point(_loc4_.x,_loc4_.y)));
                        sendNotification(NET.BUY_NURSERY,[_loc3_.x,_loc3_.y,param1.rotatePos,1]);
                     }
                     else
                     {
                        _loc20_ = _loc19_.buyVirtual;
                        _loc20_ = Math.floor(_loc20_ * this.premiumProxy.allNormalBuildingsCostMultiplyer);
                        this.currencyProxy.reduceCurrency(UserResources.VIRTUAL_MONEY,_loc20_);
                        this.notifier.dispatchNotice(new QuickInfoNotice(QuickInfoNotice.REDUCE_CURRENCY,UserResources.VIRTUAL_MONEY,_loc20_,new Point(_loc4_.x,_loc4_.y)));
                        sendNotification(NET.BUY_NURSERY,[_loc3_.x,_loc3_.y,param1.rotatePos,0]);
                        sendNotification(Note.SAVE_LAST_DRAG_ITEM,new LastBuyVo(param1.categoryId,param1.itemId,!param1.useInventory,_loc20_));
                     }
                  }
               }
               break;
            case Categories.STORAGE:
               _loc21_ = this.itemConfigProxy.getStorageData(param1.itemId);
               _loc21_.instancesInGame = this.playFieldProxy.getItemCount(Categories.STORAGE,-1,true,param1.itemId);
               if(this.playField.checkAvailabilityWithGround(param1.groundRequired,_loc3_,new Point(_loc21_.width,_loc21_.height)) && !this.playField.testBuildingOutOfFieldBonuds(_loc3_,new Point(_loc21_.width,_loc21_.height)))
               {
                  if(param1.useInventory)
                  {
                     sendNotification(NET.MOVE_ITEM_FROM_INVENTORY_TO_FIELD,[Categories.DECOR,param1.uniqueId,_loc3_.x,_loc3_.y,param1.rotatePos]);
                     sendNotification(Note.SAVE_LAST_DRAG_ITEM,new LastBuyVo(param1.categoryId,param1.itemId,!param1.useInventory,0,param1.uniqueId));
                  }
                  else if(param1.realMoney)
                  {
                     this.currencyProxy.reduceCurrency(UserResources.REAL_MONEY,_loc21_.getBuyReal());
                     this.notifier.dispatchNotice(new QuickInfoNotice(QuickInfoNotice.REDUCE_CURRENCY,UserResources.REAL_MONEY,_loc21_.getBuyReal(),new Point(_loc4_.x,_loc4_.y)));
                     sendNotification(NET.BUY_DECO,[param1.itemId,_loc3_.x,_loc3_.y,param1.rotatePos,1]);
                  }
                  else
                  {
                     _loc22_ = _loc21_.getBuyVirtual();
                     _loc22_ = Math.floor(_loc22_ * this.premiumProxy.allNormalBuildingsCostMultiplyer);
                     this.currencyProxy.reduceCurrency(UserResources.VIRTUAL_MONEY,_loc22_);
                     this.notifier.dispatchNotice(new QuickInfoNotice(QuickInfoNotice.REDUCE_CURRENCY,UserResources.VIRTUAL_MONEY,_loc22_,new Point(_loc4_.x,_loc4_.y)));
                     sendNotification(NET.BUY_DECO,[param1.itemId,_loc3_.x,_loc3_.y,param1.rotatePos,0]);
                     sendNotification(Note.SAVE_LAST_DRAG_ITEM,new LastBuyVo(param1.categoryId,param1.itemId,!param1.useInventory,_loc22_));
                  }
               }
               break;
            case Categories.PREMIUM:
            case Categories.DECOR:
               _loc23_ = ConfigurationModule.getInstance().getDecorationData(param1.itemId);
               if(this.playField.checkAvailabilityWithGround(param1.groundRequired,_loc3_,new Point(_loc23_.width,_loc23_.height)) && !this.playField.testBuildingOutOfFieldBonuds(_loc3_,new Point(_loc23_.width,_loc23_.height)))
               {
                  if(_loc23_)
                  {
                     if(param1.useInventory)
                     {
                        sendNotification(NET.MOVE_ITEM_FROM_INVENTORY_TO_FIELD,[param1.categoryId,param1.uniqueId,_loc3_.x,_loc3_.y,param1.rotatePos]);
                        sendNotification(Note.SAVE_LAST_DRAG_ITEM,new LastBuyVo(param1.categoryId,param1.itemId,!param1.useInventory,0,param1.uniqueId));
                     }
                     else if(param1.realMoney)
                     {
                        this.currencyProxy.reduceCurrency(UserResources.REAL_MONEY,_loc23_.buyReal);
                        this.notifier.dispatchNotice(new QuickInfoNotice(QuickInfoNotice.REDUCE_CURRENCY,UserResources.REAL_MONEY,_loc23_.buyReal,new Point(_loc4_.x,_loc4_.y)));
                        sendNotification(NET.BUY_DECO,[param1.itemId,_loc3_.x,_loc3_.y,param1.rotatePos,1]);
                     }
                     else
                     {
                        _loc24_ = _loc23_.buyVirtual;
                        _loc24_ = Math.floor(_loc24_ * this.premiumProxy.allNormalBuildingsCostMultiplyer);
                        this.currencyProxy.reduceCurrency(UserResources.VIRTUAL_MONEY,_loc24_);
                        this.notifier.dispatchNotice(new QuickInfoNotice(QuickInfoNotice.REDUCE_CURRENCY,UserResources.VIRTUAL_MONEY,_loc24_,new Point(_loc4_.x,_loc4_.y)));
                        sendNotification(NET.BUY_DECO,[param1.itemId,_loc3_.x,_loc3_.y,param1.rotatePos,0]);
                        sendNotification(Note.SAVE_LAST_DRAG_ITEM,new LastBuyVo(param1.categoryId,param1.itemId,!param1.useInventory,_loc24_));
                     }
                  }
               }
               break;
            case Categories.ANIMAL:
               if(Settings.TUTORIAL_ACTIVE)
               {
                  TutorialInjectionManager.getInstance().animalNotInCage();
               }
               _loc5_ = this.playField.testColisionWithCategory(_loc3_,Categories.CAGE);
               if(_loc5_)
               {
                  _loc6_ = _loc5_ as Cage;
                  if(Settings.TUTORIAL_ACTIVE)
                  {
                     TutorialInjectionManager.getInstance().animalAdded(param1.itemId,_loc6_.itemId);
                  }
                  if(_loc6_.buildTimeStamp < TimeManager.currentTime)
                  {
                     _loc25_ = this.playFieldProxy.getAnimalWithConfigList();
                     _loc9_ = 0;
                     while(_loc9_ < _loc25_.length)
                     {
                        if(AnimalShopData(_loc25_[_loc9_]).uniqueId == param1.uniqueId)
                        {
                           _loc7_ = AnimalShopData(_loc25_[_loc9_]);
                           break;
                        }
                        _loc9_++;
                     }
                     if(_loc7_ == null)
                     {
                        this.dragItem.stopDragItem();
                        return;
                     }
                     _loc7_ = ConfigurationModule.getInstance().getAnimalData(param1.itemId);
                     _loc11_ = this.playField.checkAvailabilityWithCage(_loc6_.itemId,_loc7_.speciesId);
                     if(_loc11_)
                     {
                        if(_loc6_.speciesId <= 0 || _loc6_.speciesId == _loc7_.speciesId && _loc6_.adultCount < _loc6_.maxAdultCount)
                        {
                           if(_loc7_.male)
                           {
                              ++_loc6_.maleCount;
                           }
                           else if(_loc7_.child < 1)
                           {
                              ++_loc6_.femaleCount;
                           }
                           if(param1.useInventory)
                           {
                              if(_loc7_.child)
                              {
                                 if(_loc6_.childCount < _loc6_.maxChildCount)
                                 {
                                    if(_loc6_.maleCount > _loc6_.childCount && _loc6_.femaleCount > _loc6_.childCount)
                                    {
                                       sendNotification(NET.MOVE_ANIMAL_FROM_INVENTORY_TO_CAGE,[param1.uniqueId,_loc6_.uniqueId]);
                                       sendNotification(Note.SAVE_LAST_DRAG_ITEM,new LastBuyVo(param1.categoryId,param1.itemId,!param1.useInventory,0,param1.uniqueId));
                                    }
                                 }
                              }
                              else
                              {
                                 sendNotification(NET.MOVE_ANIMAL_FROM_INVENTORY_TO_CAGE,[param1.uniqueId,_loc6_.uniqueId]);
                                 sendNotification(Note.SAVE_LAST_DRAG_ITEM,new LastBuyVo(param1.categoryId,param1.itemId,!param1.useInventory,0,param1.uniqueId));
                              }
                           }
                           else if(param1.realMoney)
                           {
                              this.currencyProxy.reduceCurrency(UserResources.REAL_MONEY,_loc7_.buyReal);
                              this.notifier.dispatchNotice(new QuickInfoNotice(QuickInfoNotice.REDUCE_CURRENCY,UserResources.REAL_MONEY,_loc7_.buyReal,new Point(_loc4_.x,_loc4_.y)));
                              sendNotification(NET.BUY_ANIMAL_CAGE,[_loc6_.uniqueId,_loc7_.animalId,1]);
                           }
                           else if(!Settings.TUTORIAL_ACTIVE)
                           {
                              _loc8_ = _loc7_.buyVirtual;
                              _loc8_ = Math.floor(_loc8_ * this.premiumProxy.allNormalBuildingsCostMultiplyer);
                              this.currencyProxy.reduceCurrency(UserResources.VIRTUAL_MONEY,_loc8_);
                              this.notifier.dispatchNotice(new QuickInfoNotice(QuickInfoNotice.REDUCE_CURRENCY,UserResources.VIRTUAL_MONEY,_loc8_,new Point(_loc4_.x,_loc4_.y)));
                              sendNotification(NET.BUY_ANIMAL_CAGE,[_loc6_.uniqueId,_loc7_.animalId,0]);
                              sendNotification(Note.SAVE_LAST_DRAG_ITEM,new LastBuyVo(param1.categoryId,param1.itemId,!param1.useInventory,_loc8_));
                           }
                        }
                        else if(param1.useInventory && Boolean(_loc7_.child))
                        {
                           if(_loc6_.speciesId <= 0 || _loc6_.speciesId == _loc7_.speciesId && _loc6_.childCount < _loc6_.maxChildCount)
                           {
                              if(_loc6_.maleCount > _loc6_.childCount && _loc6_.femaleCount > _loc6_.childCount)
                              {
                                 sendNotification(NET.MOVE_ANIMAL_FROM_INVENTORY_TO_CAGE,[param1.uniqueId,_loc6_.uniqueId]);
                                 sendNotification(Note.SAVE_LAST_DRAG_ITEM,new LastBuyVo(param1.categoryId,param1.itemId,!param1.useInventory,_loc8_,param1.uniqueId));
                              }
                           }
                        }
                     }
                  }
               }
               else
               {
                  _loc10_ = null;
                  if(this.eventProxy.isEventActive(EventTypes.XMAS_EVENT))
                  {
                     for each(_loc26_ in this.playField.getFieldCellItems(_loc3_))
                     {
                        if(_loc26_ is Sleigh)
                        {
                           _loc10_ = _loc26_ as Sleigh;
                           break;
                        }
                     }
                  }
                  if(_loc10_)
                  {
                     if(this.xmasProxy.canPlaceInSleigh(param1.itemId))
                     {
                        sendNotification(Note.DROP_ITEM_SUCCESSFUL,new DraggedItemVO(new ItemVO(param1.itemId,param1.uniqueId,param1.categoryId),new ItemVO(_loc10_.itemId,_loc10_.uniqueId,_loc10_.category)));
                     }
                  }
               }
               break;
            case Categories.SPECIES:
               if(Settings.TUTORIAL_ACTIVE)
               {
                  TutorialInjectionManager.getInstance().animalNotInCage();
               }
               _loc5_ = this.playField.testColisionWithCategory(_loc3_,Categories.CAGE);
               if(_loc5_)
               {
                  _loc6_ = _loc5_ as Cage;
                  if(Settings.TUTORIAL_ACTIVE)
                  {
                     TutorialInjectionManager.getInstance().animalAdded(param1.itemId,_loc6_.itemId);
                  }
                  if(_loc6_.buildTimeStamp < TimeManager.currentTime)
                  {
                     _loc7_ = ConfigurationModule.getInstance().getAnimalData(param1.itemId);
                     _loc11_ = this.playField.checkAvailabilityWithCage(_loc6_.itemId,_loc7_.speciesId);
                     if(_loc11_)
                     {
                        if(_loc6_.speciesId <= 0 || _loc6_.speciesId == _loc7_.speciesId && _loc6_.adultCount < _loc6_.maxAdultCount)
                        {
                           if(_loc7_.male)
                           {
                              ++_loc6_.maleCount;
                           }
                           else if(_loc7_.child < 1)
                           {
                              ++_loc6_.femaleCount;
                           }
                           if(param1.useInventory)
                           {
                              if(_loc7_.child)
                              {
                                 if(_loc6_.childCount < _loc6_.maxChildCount)
                                 {
                                    if(_loc6_.maleCount > _loc6_.childCount && _loc6_.femaleCount > _loc6_.childCount)
                                    {
                                       sendNotification(NET.MOVE_ANIMAL_FROM_INVENTORY_TO_CAGE,[param1.uniqueId,_loc6_.uniqueId]);
                                       sendNotification(Note.SAVE_LAST_DRAG_ITEM,new LastBuyVo(param1.categoryId,param1.itemId,!param1.useInventory,0,param1.uniqueId));
                                    }
                                 }
                              }
                              else
                              {
                                 sendNotification(NET.MOVE_ANIMAL_FROM_INVENTORY_TO_CAGE,[param1.uniqueId,_loc6_.uniqueId]);
                                 sendNotification(Note.SAVE_LAST_DRAG_ITEM,new LastBuyVo(param1.categoryId,param1.itemId,!param1.useInventory,0,param1.uniqueId));
                              }
                           }
                           else if(param1.realMoney)
                           {
                              this.currencyProxy.reduceCurrency(UserResources.REAL_MONEY,_loc7_.buyReal);
                              this.notifier.dispatchNotice(new QuickInfoNotice(QuickInfoNotice.REDUCE_CURRENCY,UserResources.REAL_MONEY,_loc7_.buyReal,new Point(_loc4_.x,_loc4_.y)));
                              sendNotification(NET.BUY_ANIMAL_CAGE,[_loc6_.uniqueId,_loc7_.animalId,1]);
                           }
                           else if(!Settings.TUTORIAL_ACTIVE)
                           {
                              _loc8_ = _loc7_.buyVirtual;
                              _loc8_ = Math.floor(_loc8_ * this.premiumProxy.allNormalBuildingsCostMultiplyer);
                              this.currencyProxy.reduceCurrency(UserResources.VIRTUAL_MONEY,_loc8_);
                              this.notifier.dispatchNotice(new QuickInfoNotice(QuickInfoNotice.REDUCE_CURRENCY,UserResources.VIRTUAL_MONEY,_loc8_,new Point(_loc4_.x,_loc4_.y)));
                              sendNotification(NET.BUY_ANIMAL_CAGE,[_loc6_.uniqueId,_loc7_.animalId,0]);
                              sendNotification(Note.SAVE_LAST_DRAG_ITEM,new LastBuyVo(param1.categoryId,param1.itemId,!param1.useInventory,_loc8_));
                           }
                        }
                        else if(param1.useInventory && Boolean(_loc7_.child))
                        {
                           if(_loc6_.speciesId <= 0 || _loc6_.speciesId == _loc7_.speciesId && _loc6_.childCount < _loc6_.maxChildCount)
                           {
                              if(_loc6_.maleCount > _loc6_.childCount && _loc6_.femaleCount > _loc6_.childCount)
                              {
                                 sendNotification(NET.MOVE_ANIMAL_FROM_INVENTORY_TO_CAGE,[param1.uniqueId,_loc6_.uniqueId]);
                                 sendNotification(Note.SAVE_LAST_DRAG_ITEM,new LastBuyVo(param1.categoryId,param1.itemId,!param1.useInventory,0,param1.uniqueId));
                              }
                           }
                        }
                     }
                  }
               }
               else
               {
                  _loc10_ = null;
                  if(this.eventProxy.isEventActive(EventTypes.XMAS_EVENT))
                  {
                     for each(_loc27_ in this.playField.getFieldCellItems(_loc3_))
                     {
                        if(_loc27_ is Sleigh)
                        {
                           _loc10_ = _loc27_ as Sleigh;
                           break;
                        }
                     }
                  }
                  if(_loc10_)
                  {
                     if(this.xmasProxy.canPlaceInSleigh(param1.itemId))
                     {
                        sendNotification(Note.DROP_ITEM_SUCCESSFUL,new DraggedItemVO(new ItemVO(param1.itemId,param1.uniqueId,param1.categoryId),new ItemVO(_loc10_.itemId,_loc10_.uniqueId,_loc10_.category)));
                     }
                  }
               }
               break;
            case Categories.ROAD:
               if(Settings.TUTORIAL_ACTIVE)
               {
                  _loc28_ = TutorialInjectionManager.getInstance().roadsPosition;
                  _loc29_ = -1;
                  _loc9_ = 0;
                  while(_loc9_ < _loc28_.length)
                  {
                     if(_loc3_.x == _loc28_[_loc9_].x && _loc3_.y == _loc28_[_loc9_].y)
                     {
                        _loc29_ = _loc9_;
                     }
                     _loc9_++;
                  }
                  if(_loc29_ <= -1)
                  {
                     return;
                  }
                  TutorialInjectionManager.getInstance().roadsPosition.splice(_loc29_,1);
                  if(TutorialInjectionManager.getInstance().roadsPosition.length == 0)
                  {
                     TutorialInjectionManager.getInstance().roadsPlaced();
                     this.dragItem.stopDragItem();
                  }
               }
               if(this.playField.checkAvailabilityWithGround(ItemAbstract.GROUND_GRASS,_loc3_,new Point(1,1)) && !this.playField.testBuildingOutOfFieldBonuds(_loc3_,new Point(1,1)))
               {
                  _loc30_ = ConfigurationModule.getInstance().getRoadData(param1.itemId);
                  if(param1.isMoveRoad)
                  {
                     this.playField.removeFieldRoad(param1.uniqueId);
                     sendNotification(NET.MOVE_ROAD,[param1.uniqueId,_loc3_.x,_loc3_.y,0]);
                     this.dragItem.stopDragItem();
                  }
                  else if(param1.useInventory)
                  {
                     sendNotification(NET.MOVE_ITEM_FROM_INVENTORY_TO_FIELD,[param1.categoryId,param1.uniqueId,_loc3_.x,_loc3_.y,param1.rotatePos]);
                     sendNotification(Note.SAVE_LAST_DRAG_ITEM,new LastBuyVo(param1.categoryId,param1.itemId,!param1.useInventory,0,param1.uniqueId));
                     this.dragItem.stopDragItem();
                  }
                  else if(param1.realMoney)
                  {
                     this.currencyProxy.reduceCurrency(UserResources.REAL_MONEY,_loc30_.buyReal);
                     this.notifier.dispatchNotice(new QuickInfoNotice(QuickInfoNotice.REDUCE_CURRENCY,UserResources.REAL_MONEY,_loc30_.buyReal,new Point(_loc4_.x,_loc4_.y)));
                     sendNotification(NET.BUY_ROAD,[param1.itemId,_loc3_.x,_loc3_.y,0,1]);
                  }
                  else
                  {
                     this.currencyProxy.reduceCurrency(UserResources.VIRTUAL_MONEY,_loc30_.buyVirtual);
                     this.notifier.dispatchNotice(new QuickInfoNotice(QuickInfoNotice.REDUCE_CURRENCY,UserResources.VIRTUAL_MONEY,_loc30_.buyVirtual,new Point(_loc4_.x,_loc4_.y)));
                     sendNotification(NET.BUY_ROAD,[param1.itemId,_loc3_.x,_loc3_.y,0,0]);
                     sendNotification(Note.SAVE_LAST_DRAG_ITEM,new LastBuyVo(param1.categoryId,param1.itemId,!param1.useInventory,_loc30_.buyVirtual));
                  }
                  this.playField.addRoad(param1.uniqueId,param1.itemId,_loc3_.x,_loc3_.y);
                  if(param1.realMoney)
                  {
                     if(this.userProxy.realAmount < _loc30_.buyReal)
                     {
                        this.dragItem.stopDragItem();
                     }
                  }
                  else if(this.userProxy.virtualAmount < _loc30_.buyVirtual)
                  {
                     this.dragItem.stopDragItem();
                  }
               }
               break;
            case Categories.TRASHBIN:
               _loc31_ = ConfigurationModule.getInstance().getTrashBinData(param1.itemId);
               if(this.playField.checkAvailabilityWithGround(ItemAbstract.GROUND_ROAD,_loc3_,new Point(_loc31_.width,_loc31_.height)) && !this.playField.testBuildingOutOfFieldBonuds(_loc3_,new Point(_loc31_.width,_loc31_.height)))
               {
                  if(param1.useInventory)
                  {
                     sendNotification(NET.MOVE_ITEM_FROM_INVENTORY_TO_FIELD,[param1.categoryId,param1.uniqueId,_loc3_.x,_loc3_.y,param1.rotatePos]);
                     sendNotification(Note.SAVE_LAST_DRAG_ITEM,new LastBuyVo(param1.categoryId,param1.itemId,!param1.useInventory,0,param1.uniqueId));
                  }
                  else if(param1.realMoney)
                  {
                     this.currencyProxy.reduceCurrency(UserResources.REAL_MONEY,_loc31_.buyReal);
                     this.notifier.dispatchNotice(new QuickInfoNotice(QuickInfoNotice.REDUCE_CURRENCY,UserResources.REAL_MONEY,_loc31_.buyReal,new Point(_loc4_.x,_loc4_.y)));
                     sendNotification(NET.BUY_TRASHBIN,[param1.itemId,_loc3_.x,_loc3_.y,param1.rotatePos,1]);
                  }
                  else
                  {
                     this.currencyProxy.reduceCurrency(UserResources.VIRTUAL_MONEY,_loc31_.buyVirtual);
                     this.notifier.dispatchNotice(new QuickInfoNotice(QuickInfoNotice.REDUCE_CURRENCY,UserResources.VIRTUAL_MONEY,_loc31_.buyVirtual,new Point(_loc4_.x,_loc4_.y)));
                     sendNotification(NET.BUY_TRASHBIN,[param1.itemId,_loc3_.x,_loc3_.y,param1.rotatePos,0]);
                     sendNotification(Note.SAVE_LAST_DRAG_ITEM,new LastBuyVo(param1.categoryId,param1.itemId,!param1.useInventory,_loc31_.buyVirtual));
                  }
               }
         }
         if(param1.categoryId != Categories.ROAD)
         {
            this.dragItem.stopDragItem();
         }
         if(param1.useInventory == true)
         {
            this.dragItem.stopDragItem();
         }
         sendNotification(Note.FINISHED_DRAG_ITEM);
      }
      
      private function handleItemDragStart(param1:ItemNotice) : void
      {
         var _loc2_:ItemAbstract = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Cage = null;
         if(!this.playField.dragPlayFieldItems)
         {
            if(!Settings.TUTORIAL_ACTIVE)
            {
               this.playField.startDragField();
            }
         }
         else
         {
            this.closeAllActionMenus();
            _loc2_ = this.playField.getFieldItem(param1.categoryId,param1.uniqueId) as ItemAbstract;
            if(_loc2_.dragable)
            {
               _loc3_ = 0;
               _loc4_ = -1;
               if(_loc2_["buildTimeStamp"])
               {
                  if(_loc2_["buildTimeStamp"] > 0)
                  {
                     _loc3_ = 1;
                  }
               }
               _loc5_ = -1;
               if(param1.categoryId == Categories.TRASHBIN)
               {
                  _loc5_ = (_loc2_ as TrashBin).statusId;
               }
               if(param1.categoryId == Categories.CAGE)
               {
                  _loc6_ = _loc2_ as Cage;
                  if(_loc6_.eventId > 0 && _loc6_.eventTimeStamp > TimeManager.currentTime)
                  {
                     _loc4_ = _loc6_.eventId;
                     param1.level = 5;
                  }
               }
               this.dragItem.startDragFieldItem(false,true,param1.categoryId,param1.itemId,param1.level,param1.uniqueId,param1.rotatePos,new Point(_loc2_.itemWidth,_loc2_.itemHeight),_loc3_,_loc5_,_loc4_);
               this.playField.markItem(param1.categoryId,param1.uniqueId,ItemMarkType.GRAY_OUT);
            }
         }
      }
      
      public function handleItemMouseOver(param1:ItemNotice) : void
      {
         this.isItemMouseOver = true;
         TweenLite.delayedCall(this.rateTimeItemMouseOver,this.eventTimerMouseOver,[param1]);
         this.playField.fadeItemsInFront(this.playField.getStageToFieldCords(new Point(this.gameContainer.mouseX,this.gameContainer.mouseY)),param1.categoryId,param1.uniqueId);
      }
      
      private function eventTimerMouseOver(param1:ItemNotice) : void
      {
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc2_:Building = this.playField.getFieldItem(param1.categoryId,param1.uniqueId) as Building;
         this.mouseOverBuilding = _loc2_;
         var _loc3_:int = -1;
         var _loc4_:Cage = _loc2_ as Cage;
         if(_loc2_)
         {
            if(this.isItemMouseOver)
            {
               switch(param1.categoryId)
               {
                  case Categories.CAGE:
                     _loc3_ = 0;
                     sendNotification(ADMIN.SHOW_CAGE_ID,_loc4_.uniqueId);
                     this.currTimeItemMouseOver += this.rateTimeItemMouseOver;
                     _loc4_.hideFrontFence();
                     break;
                  case Categories.DECOR:
                     sendNotification(ADMIN.SHOW_CAGE_ID,param1.uniqueId);
                     if(param1.uniqueId == PlayField.SAFARI_MINI_GAME_JEEP_ITEM_ID)
                     {
                        if(this.userProxy.userLevel < MainConfig.SAFARI_ENABLED_LEVEL)
                        {
                           _loc3_ = 4;
                        }
                     }
                     this.currTimeItemMouseOver += this.rateTimeItemMouseOver;
                     sendNotification(ADMIN.SHOW_CAGE_ID,param1.uniqueId);
                     break;
                  case Categories.SPECIAL:
                     if(!_loc2_.isMouseOver && _loc2_.itemId == Special.FORGOTTEN_ZOO_SIGN_UID)
                     {
                     }
                     break;
                  case Categories.STORE:
                     sendNotification(ADMIN.SHOW_CAGE_ID,param1.uniqueId);
                     if(!_loc2_.isMouseOver && _loc2_.itemId == 34)
                     {
                        if((_loc2_ as Store).canCollect)
                        {
                           TooltipNewManager.setToolTip(_loc2_ as DisplayObject,TextResourceModule.getText("zoo.event.circus.tooltipOpenedBox"),true,-1,-1,true);
                        }
                        else
                        {
                           _loc5_ = TimeFormat.secondsToTimeString((this.mouseOverBuilding as Store).collectTimeStamp - TimeManager.currentTime);
                           _loc6_ = TextResourceModule.getTextReplaced("zoo.event.circus.tooltipClosedBox",Vector.<TextReplace>([new TextReplace("%amount%",_loc5_)]));
                           TooltipNewManager.setToolTip(_loc2_ as DisplayObject,_loc6_,true,-1,-1,true);
                           TimeManager.registerTickFunction(this.circusTimerUpdate);
                        }
                     }
                     else if(!_loc2_.isMouseOver)
                     {
                        if((this.mouseOverBuilding as Store).collectTimeStamp > TimeManager.currentTime)
                        {
                           _loc5_ = TimeFormat.secondsToTimeString((this.mouseOverBuilding as Store).collectTimeStamp - TimeManager.currentTime);
                           _loc6_ = TextResourceModule.getTextReplaced("zoo.tooltip.store.harvest",Vector.<TextReplace>([new TextReplace("%time%",_loc5_)]));
                           TooltipNewManager.setToolTip(_loc2_ as DisplayObject,_loc6_,true,-1,-1,true);
                           TimeManager.registerTickFunction(this.shopTimerUpdate);
                        }
                     }
                     break;
                  default:
                     this.currTimeItemMouseOver = 0;
               }
               sendNotification(ADMIN.SHOW_CAGE_ID,param1.uniqueId);
               if(_loc2_)
               {
                  if(_loc2_.isMouseOverInfIcon)
                  {
                     if(_loc2_.active == 0)
                     {
                        _loc3_ = 1;
                     }
                     else if(_loc4_)
                     {
                        _loc3_ = _loc4_.isBreedingFinishedFlag ? 2 : (_loc4_.isBreedingReadyFlag ? 3 : _loc3_);
                     }
                     else
                     {
                        _loc3_ = -1;
                     }
                  }
               }
               if(this.infoBeingShowed != _loc3_)
               {
                  this.handleItemMouseOut(param1);
                  switch(_loc3_)
                  {
                     case 0:
                        if(TooltipNewManager.isEnable)
                        {
                           this.notifier.dispatchNoticeToRoot(new CageSlotMenuNotice(ActionMenuNotice.OPEN_ACTION_MENU,ActionMenuTypes.MENU_TYPE_CAGESLOTS,_loc4_,null,null,false));
                        }
                        break;
                     case 1:
                        TooltipNewManager.setToolTip(_loc2_ as DisplayObject,TextResourceModule.getText("zoo.tooltip.fielditem.roadconnection.missing"),true);
                        break;
                     case 2:
                        TooltipNewManager.setToolTip(_loc2_ as DisplayObject,TextResourceModule.getText("zoo.tooltip.fielditem.breeding.finished"),true);
                        break;
                     case 3:
                        TooltipNewManager.setToolTip(_loc2_ as DisplayObject,TextResourceModule.getText("zoo.tooltip.fielditem.breeding.ready"),true);
                        break;
                     case 4:
                        TooltipNewManager.setToolTip(_loc2_ as DisplayObject,TextResourceModule.getText("zoo.safari.tooltip.cantStartSafari"),true);
                  }
                  this.infoBeingShowed = _loc3_;
               }
               this.handleItemMouseOver(param1);
            }
            _loc2_.isMouseOver = true;
         }
      }
      
      private function circusTimerUpdate() : void
      {
         var _loc1_:String = TimeFormat.secondsToTimeString((this.mouseOverBuilding as Store).collectTimeStamp - TimeManager.currentTime);
         var _loc2_:String = TextResourceModule.getTextReplaced("zoo.event.circus.tooltipClosedBox",Vector.<TextReplace>([new TextReplace("%amount%",_loc1_)]));
         TooltipNewManager.current.updateText(_loc2_);
      }
      
      private function shopTimerUpdate() : void
      {
         var _loc1_:String = null;
         var _loc2_:String = null;
         _loc1_ = TimeFormat.secondsToTimeString((this.mouseOverBuilding as Store).collectTimeStamp - TimeManager.currentTime);
         _loc2_ = TextResourceModule.getTextReplaced("zoo.tooltip.store.harvest",Vector.<TextReplace>([new TextReplace("%time%",_loc1_)]));
         TooltipNewManager.current.updateText(_loc2_);
      }
      
      public function handleItemMouseOut(param1:ItemNotice) : void
      {
         var _loc2_:Building = null;
         var _loc3_:Cage = null;
         this.isItemMouseOver = false;
         TimeManager.unregisterTickFunction(this.circusTimerUpdate);
         TimeManager.unregisterTickFunction(this.shopTimerUpdate);
         TweenLite.killDelayedCallsTo(this.eventTimerMouseOver);
         this.infoBeingShowed = -1;
         _loc2_ = this.playField.getFieldItem(param1.categoryId,param1.uniqueId) as Building;
         if(_loc2_)
         {
            _loc2_.isMouseOver = false;
         }
         switch(param1.categoryId)
         {
            case Categories.CAGE:
               _loc3_ = _loc2_ as Cage;
               TooltipNewManager.removeToolTip();
               _loc3_.showFrontFence();
               this.notifier.dispatchNoticeToRoot(new CageSlotMenuNotice(ActionMenuNotice.CLOSE_ACTION_MENU,ActionMenuTypes.MENU_TYPE_CAGESLOTS,this.playField.getFieldItem(param1.categoryId,param1.uniqueId) as Cage,null,null,false));
               break;
            case Categories.SPECIAL:
               TooltipNewManager.removeToolTip();
               break;
            default:
               TooltipNewManager.removeToolTip();
               this.currTimeItemMouseOver = 0;
         }
         this.playField.fadeOutAllItems();
         TweenLite.to(_loc2_,0.0001,{"glowFilter":{"remove":true}});
      }
      
      public function handleItemMouseUp(param1:ItemNotice) : void
      {
      }
      
      private function handleDrag(param1:DragNotice) : void
      {
         var _loc2_:Point = null;
         var _loc3_:Point = null;
         var _loc4_:Array = null;
         var _loc5_:Boolean = false;
         var _loc6_:int = 0;
         var _loc7_:ItemAbstract = null;
         var _loc8_:Cage = null;
         var _loc9_:AnimalShopData = null;
         var _loc10_:* = false;
         var _loc11_:* = false;
         var _loc12_:Boolean = false;
         var _loc13_:* = undefined;
         _loc2_ = this.playField.getStageToFieldCords(param1.dragPoint);
         if(!Settings.TUTORIAL_ACTIVE)
         {
            if(param1.dragPoint.x > this.appMediator.STAGE_WIDTH - 100)
            {
               this.movePlayField(new Point(10,0));
            }
            if(param1.dragPoint.x < 100)
            {
               this.movePlayField(new Point(-10,0));
            }
            if(param1.dragPoint.y > this.appMediator.STAGE_HEIGHT - 100)
            {
               this.movePlayField(new Point(0,10));
            }
            if(param1.dragPoint.y < 100)
            {
               this.movePlayField(new Point(0,-10));
            }
         }
         if(Settings.TUTORIAL_ACTIVE)
         {
            if(param1.categoryId == Categories.CAGE)
            {
               _loc3_ = new Point(29,84);
               this.dragItem.showColisionState(!(_loc2_.y == _loc3_.y && _loc2_.x == _loc3_.x));
               return;
            }
            if(param1.categoryId == Categories.ROAD)
            {
               TutorialInjectionManager.getInstance().hideShopArrow();
               _loc4_ = TutorialInjectionManager.getInstance().roadsPosition;
               if(_loc4_.length > 0)
               {
                  TutorialInjectionManager.getInstance().showArrowAtPoint(new Point(_loc4_[0].x,_loc4_[0].y));
                  TutorialInjectionManager.getInstance().addTestView();
                  TutorialInjectionManager.getInstance().highlightRoads();
               }
               _loc5_ = false;
               _loc6_ = 0;
               while(_loc6_ < _loc4_.length)
               {
                  if(_loc2_.x == _loc4_[_loc6_].x && _loc2_.y == _loc4_[_loc6_].y)
                  {
                     _loc5_ = true;
                  }
                  _loc6_++;
               }
               this.dragItem.showColisionState(!_loc5_);
               return;
            }
         }
         switch(param1.categoryId)
         {
            case Categories.CAGE:
            case Categories.STORE:
            case Categories.DECOR:
            case Categories.PREMIUM:
            case Categories.TRASHBIN:
            case Categories.STORAGE:
            case Categories.BREEDING_LAB:
            case Categories.NURSERY:
               this.dragItem.showColisionState(!this.playField.checkAvailabilityWithGround(this.dragItem.dragGroundRequired,_loc2_,this.dragItem.size,param1.categoryId,param1.uniqueId) || this.playField.testBuildingOutOfFieldBonuds(_loc2_,this.dragItem.size));
               break;
            case Categories.ANIMAL:
            case Categories.SPECIES:
               this.dragItem.showColisionState(true);
               _loc7_ = this.playField.testColisionWithCategory(_loc2_,Categories.CAGE);
               if(_loc7_)
               {
                  _loc8_ = _loc7_ as Cage;
                  this.notifier.dispatchNoticeToRoot(new CageSlotMenuNotice(ActionMenuNotice.OPEN_ACTION_MENU,ActionMenuTypes.MENU_TYPE_CAGESLOTS,_loc8_,this.dragItem));
                  if(_loc8_.buildTimeStamp <= 0)
                  {
                     _loc9_ = ConfigurationModule.getInstance().getAnimalData(param1.itemId);
                     if(_loc8_.speciesId <= 0 || _loc8_.speciesId == _loc9_.speciesId)
                     {
                        if(_loc9_.child)
                        {
                           if(_loc8_.childCount < _loc8_.maxChildCount)
                           {
                              if(_loc8_.maleCount > _loc8_.childCount && _loc8_.femaleCount > _loc8_.childCount)
                              {
                                 _loc10_ = !this.playField.checkAvailabilityWithCage(_loc8_.itemId,_loc9_.speciesId);
                                 this.dragItem.showColisionState(_loc10_);
                              }
                           }
                        }
                        else if(_loc8_.adultCount < _loc8_.maxAdultCount || _loc8_.adultCount <= 0)
                        {
                           _loc11_ = !this.playField.checkAvailabilityWithCage(_loc8_.itemId,_loc9_.speciesId);
                           this.dragItem.showColisionState(_loc11_);
                        }
                     }
                  }
               }
               else
               {
                  _loc12_ = false;
                  if(this.eventProxy.isEventActive(EventTypes.XMAS_EVENT))
                  {
                     for each(_loc13_ in this.playField.getFieldCellItems(_loc2_))
                     {
                        if(_loc13_ is Sleigh)
                        {
                           _loc12_ = true;
                           break;
                        }
                     }
                  }
                  if(_loc12_)
                  {
                     if(this.xmasProxy.canPlaceInSleigh(param1.itemId))
                     {
                        this.dragItem.showColisionState(false);
                     }
                  }
                  this.closeAllActionMenus();
               }
               break;
            case Categories.ROAD:
               this.dragItem.showColisionState(!this.playField.checkAvailabilityWithGround(ItemAbstract.GROUND_GRASS,_loc2_,this.dragItem.size,param1.categoryId,param1.uniqueId) || this.playField.testBuildingOutOfFieldBonuds(_loc2_,this.dragItem.size));
         }
      }
      
      public function gateActionMenuPositionCalc(param1:int) : Point
      {
         var _loc2_:Point = this.playField.getItemPosInStage(Categories.SPECIAL,param1);
         return _loc2_.add(new Point(int(Special.GATE_ICON_LOCATION_X * MainConfig.ZOOM_LEVELS[this.currentZoomLevel]),int(Special.GATE_ICON_LOCATION_Y * MainConfig.ZOOM_LEVELS[this.currentZoomLevel])));
      }
      
      private function handleItemDragStop(param1:ItemNotice) : void
      {
         var _loc4_:Building = null;
         var _loc5_:CageData = null;
         var _loc6_:DecorData = null;
         var _loc7_:Decor = null;
         var _loc8_:Boolean = false;
         var _loc9_:StoreData = null;
         var _loc10_:NurseryVO = null;
         var _loc11_:BreedingLabVO = null;
         var _loc12_:TrashBinData = null;
         this.playField.markItem(param1.categoryId,param1.uniqueId,ItemMarkType.DEFAULT);
         this.playField.stopDragAction(param1.categoryId,param1.uniqueId);
         var _loc2_:Point = this.dragItem.dragPoint;
         var _loc3_:Point = this.playField.getStageToFieldCords(_loc2_);
         _loc4_ = this.playField.getFieldItem(param1.categoryId,param1.uniqueId) as Building;
         if(_loc4_ != null && this.playField.checkAvailabilityWithGround(param1.groundRequired,_loc3_,param1.size,param1.categoryId,param1.uniqueId) && !this.playField.testBuildingOutOfFieldBonuds(_loc3_,param1.size))
         {
            switch(param1.categoryId)
            {
               case Categories.CAGE:
                  _loc5_ = new CageData();
                  _loc5_.uniqueId = param1.uniqueId;
                  _loc5_.posX = _loc3_.x;
                  _loc5_.posY = _loc3_.y;
                  _loc5_.rotatePos = param1.rotatePos;
                  this.playField.setFieldItems(Vector.<FieldItemData>([_loc5_]),PlayField.GUESS_COMMANDID);
                  sendNotification(NET.MOVE_CAGE,[param1.uniqueId,_loc3_.x,_loc3_.y,param1.rotatePos]);
                  _loc4_.buildingCommandIds.move = this.netProxy.currentRequestId;
                  break;
               case Categories.DECOR:
                  _loc6_ = new DecorData();
                  _loc6_.uniqueId = param1.uniqueId;
                  _loc6_.posX = _loc3_.x;
                  _loc6_.posY = _loc3_.y;
                  _loc6_.rotatePos = param1.rotatePos;
                  _loc7_ = _loc4_ as Decor;
                  _loc8_ = false;
                  if(_loc7_.itemId == Decor.SNOW_MAN_UID || _loc7_.itemId == Decor.HEARTS_GLOBE)
                  {
                     if(_loc7_.currentStateId == 1)
                     {
                        _loc8_ = true;
                     }
                  }
                  this.playField.setFieldItems(Vector.<FieldItemData>([_loc6_]),PlayField.GUESS_COMMANDID);
                  sendNotification(NET.MOVE_DECO,[param1.uniqueId,_loc3_.x,_loc3_.y,param1.rotatePos]);
                  _loc4_.buildingCommandIds.move = this.netProxy.currentRequestId;
                  if(_loc8_)
                  {
                     if(_loc7_.itemId == Decor.SNOW_MAN_UID)
                     {
                        this.notifier.dispatchNoticeToRoot(new FieldItemStateNotice(FieldItemStateNotice.CHANGE_ALL_ITEM_STATES,1,_loc7_.category,_loc7_.itemId));
                     }
                     if(_loc7_.itemId == Decor.HEARTS_GLOBE)
                     {
                        this.notifier.dispatchNoticeToRoot(new FieldItemStateNotice(FieldItemStateNotice.CHANGE_ALL_ITEM_STATES,1,_loc7_.category,_loc7_.itemId));
                     }
                     _loc8_ = false;
                  }
                  break;
               case Categories.STORE:
                  _loc9_ = new StoreData();
                  _loc9_.uniqueId = param1.uniqueId;
                  _loc9_.posX = _loc3_.x;
                  _loc9_.posY = _loc3_.y;
                  _loc9_.rotatePos = param1.rotatePos;
                  this.playField.setFieldItems(Vector.<FieldItemData>([_loc9_]),PlayField.GUESS_COMMANDID);
                  sendNotification(NET.MOVE_STORE,[param1.uniqueId,_loc3_.x,_loc3_.y,param1.rotatePos]);
                  _loc4_.buildingCommandIds.move = this.netProxy.currentRequestId;
                  break;
               case Categories.NURSERY:
                  _loc10_ = new NurseryVO();
                  _loc10_.uniqueId = param1.uniqueId;
                  _loc10_.posX = _loc3_.x;
                  _loc10_.posY = _loc3_.y;
                  _loc10_.rotatePos = param1.rotatePos;
                  this.playField.setFieldItems(Vector.<FieldItemData>([_loc10_]),PlayField.GUESS_COMMANDID);
                  sendNotification(NET.MOVE_NURSERY,[param1.uniqueId,_loc3_.x,_loc3_.y,param1.rotatePos]);
                  _loc4_.buildingCommandIds.move = this.netProxy.currentRequestId;
                  break;
               case Categories.BREEDING_LAB:
                  _loc11_ = new BreedingLabVO();
                  _loc11_.uniqueId = param1.uniqueId;
                  _loc11_.posX = _loc3_.x;
                  _loc11_.posY = _loc3_.y;
                  _loc11_.rotatePos = param1.rotatePos;
                  this.playField.setFieldItems(Vector.<FieldItemData>([_loc11_]),PlayField.GUESS_COMMANDID);
                  sendNotification(NET.MOVE_BREEDING_LAB,[param1.uniqueId,_loc3_.x,_loc3_.y,param1.rotatePos]);
                  _loc4_.buildingCommandIds.move = this.netProxy.currentRequestId;
                  break;
               case Categories.TRASHBIN:
                  _loc12_ = new TrashBinData();
                  _loc12_.uniqueId = param1.uniqueId;
                  _loc12_.posX = _loc3_.x;
                  _loc12_.posY = _loc3_.y;
                  _loc12_.rotatePos = param1.rotatePos;
                  this.playField.setFieldItems(Vector.<FieldItemData>([_loc12_]),PlayField.GUESS_COMMANDID);
                  sendNotification(NET.MOVE_TRASH_BIN,[param1.uniqueId,_loc3_.x,_loc3_.y,param1.rotatePos]);
                  _loc4_.buildingCommandIds.move = this.netProxy.currentRequestId;
            }
         }
         this.dragItem.stopDragItem();
      }
      
      private function handleItemDelete(param1:DeleteItemNotice) : void
      {
         if(this.dragItem.dragCategoryId == param1.category && this.dragItem.dragUniqueId == param1.uniqueId)
         {
            this.dragItem.stopDragItem();
         }
      }
      
      private function handleItemClick(param1:ItemNotice) : void
      {
         if(this.appProxy.currentAppMode == AppMode.VISIT_NEIGHBOUR)
         {
            this.handleItemClickTouringMode(param1);
         }
         else
         {
            this.handleItemClickNormalMode(param1);
         }
      }
      
      private function handleItemClickTouringMode(param1:ItemNotice) : void
      {
      }
      
      private function handleItemClickNormalMode(param1:ItemNotice) : void
      {
         var _loc3_:Building = null;
         var _loc4_:int = 0;
         var _loc5_:Cage = null;
         var _loc6_:Decor = null;
         var _loc7_:Store = null;
         var _loc8_:ItemAbstract = null;
         var _loc9_:ItemAbstract = null;
         var _loc10_:Special = null;
         var _loc11_:Point = null;
         var _loc12_:CircusProxy = null;
         var _loc13_:Point = null;
         var _loc14_:CageData = null;
         var _loc15_:StoreData = null;
         var _loc16_:NurseryVO = null;
         var _loc17_:BreedingLabVO = null;
         var _loc18_:DecorData = null;
         var _loc19_:Decor = null;
         var _loc20_:Boolean = false;
         var _loc21_:Cage = null;
         var _loc22_:Decor = null;
         var _loc23_:int = 0;
         var _loc24_:Decor = null;
         var _loc25_:int = 0;
         this.closeAllActionMenus();
         var _loc2_:ParticlesProxy = facade.retrieveProxy(ParticlesProxy.NAME) as ParticlesProxy;
         _loc3_ = this.playField.getFieldItem(param1.categoryId,param1.uniqueId) as Building;
         if(_loc3_)
         {
            switch(this.mouseModule.mouseType)
            {
               case MouseState.DEFAULT:
                  switch(_loc3_.category)
                  {
                     case Categories.CAGE:
                        _loc5_ = _loc3_ as Cage;
                        if(_loc5_.buildTimeStamp > TimeManager.currentTime)
                        {
                           this.notifier.dispatchNoticeToRoot(new ActionMenuNotice(ActionMenuNotice.OPEN_ACTION_MENU,ActionMenuTypes.MENU_TYPE_BUILD,_loc5_));
                           this.soundManager.playSoundEffect(SoundEffectNames.SND_BUILDINGS_CREATE_BUILDING);
                        }
                        else if(_loc5_.maleCount > 0 || _loc5_.femaleCount > 0 || _loc5_.childCount > 0)
                        {
                           if(Settings.TUTORIAL_ACTIVE)
                           {
                              if(!(_loc5_.itemId == 3 && TutorialInjectionManager.getInstance().currentStep == 9))
                              {
                                 this.notifier.dispatchNoticeToRoot(new ActionMenuNotice(ActionMenuNotice.OPEN_ACTION_MENU,ActionMenuTypes.MENU_TYPE_CAGE,_loc5_));
                              }
                           }
                           else
                           {
                              this.notifier.dispatchNoticeToRoot(new ActionMenuNotice(ActionMenuNotice.OPEN_ACTION_MENU,ActionMenuTypes.MENU_TYPE_CAGE,_loc5_));
                           }
                        }
                        else
                        {
                           sendNotification(SHOP.OPEN_SHOP_ON_TAB,ShopTabs.ANIMALS);
                        }
                        break;
                     case Categories.DECOR:
                        _loc6_ = _loc3_ as Decor;
                        if(_loc6_.itemId == Decor.SNOW_MAN_UID)
                        {
                           if(_loc6_.currentStateId == 0 && !_loc2_.isParticlesRunning)
                           {
                              this.notifier.dispatchNoticeToRoot(new FieldItemStateNotice(FieldItemStateNotice.CHANGE_ALL_ITEM_STATES,1,_loc6_.category,_loc6_.itemId));
                              this.activateSnowFall();
                           }
                           else
                           {
                              this.notifier.dispatchNoticeToRoot(new FieldItemStateNotice(FieldItemStateNotice.CHANGE_ALL_ITEM_STATES,0,_loc6_.category,_loc6_.itemId));
                              this.stopSnowFall();
                           }
                        }
                        if(_loc6_.itemId == Decor.HEARTS_GLOBE)
                        {
                           if(_loc6_.currentStateId == 0 && !_loc2_.isParticlesRunning)
                           {
                              this.notifier.dispatchNoticeToRoot(new FieldItemStateNotice(FieldItemStateNotice.CHANGE_ALL_ITEM_STATES,1,_loc6_.category,_loc6_.itemId));
                              this.activateHeartsFall();
                           }
                           else
                           {
                              this.notifier.dispatchNoticeToRoot(new FieldItemStateNotice(FieldItemStateNotice.CHANGE_ALL_ITEM_STATES,0,_loc6_.category,_loc6_.itemId));
                              this.stopHeartsFall();
                           }
                        }
                        if(_loc6_.itemId == Decor.FORTUNE_WHEEL_DEPRICATED)
                        {
                           if(this.userProxy.userLevel > 2)
                           {
                              facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.ZOO_WHEEL));
                           }
                           else
                           {
                              this.notifier.dispatchNotice(new ConfirmationWindowNotice(WindowNotice.OPEN_WINDOW,OldWindowTypes.MINI_MESSAGE,"","",null,null,null,"ERROR","ERROR : Fortune wheel can be used from level 3 only. Sorry."));
                           }
                        }
                        if(_loc6_.itemId == Decor.TENTH_MILLION_USER_UID || _loc6_.itemId == Decor.NUT_CRACKER || _loc6_.itemId == Decor.FAIRY_LIGHT_REINDEER || _loc6_.itemId == Decor.FLYING_CANLES_HALLOWEEN || _loc6_.itemId == Decor.PATRONUS || _loc6_.itemId == Decor.QUIDDICH)
                        {
                           this.notifier.dispatchNoticeToRoot(new FieldItemStateNotice(FieldItemStateNotice.CHANGE_ITEM_STATE,1,_loc6_.category,_loc6_.itemId,_loc6_.uniqueId));
                        }
                        if(_loc6_.itemId >= Decor.STORAGE_START_ID && _loc6_.itemId < Decor.STORAGE_END_ID && FeatureActiveReference.storage)
                        {
                           this.notifier.dispatchNotice(new WindowNotice(WindowNotice.OPEN_WINDOW,OldWindowTypes.STORAGE_CAPACITY));
                        }
                        if(_loc6_.buildTimeStamp > TimeManager.currentTime)
                        {
                           this.notifier.dispatchNoticeToRoot(new ActionMenuNotice(ActionMenuNotice.OPEN_ACTION_MENU,ActionMenuTypes.MENU_TYPE_BUILD,_loc6_));
                        }
                        break;
                     case Categories.SPECIAL:
                        if(_loc3_ is Special)
                        {
                           _loc10_ = _loc3_ as Special;
                           if(_loc10_.itemId == Special.GATE_UID_1 || _loc10_.itemId == Special.GATE_UID_2 || _loc10_.itemId == Special.GATE_UID_3 || _loc10_.itemId == Special.GATE_UID_4 || _loc10_.itemId == Special.GATE_UID_5 || _loc10_.itemId == Special.GATE_UID_7 || _loc10_.itemId == Special.GATE_UID_8 || _loc10_.itemId == Special.GATE_FENCE_UID_2 || _loc10_.itemId == Special.GATE_FENCE_UID_3 || _loc10_.itemId == Special.GATE_FENCE_UID_4 || _loc10_.itemId == Special.GATE_FENCE_UID_5 || _loc10_.itemId == Special.GATE_FENCE_UID_7 || _loc10_.itemId == Special.GATE_FORGOTTEN_UID || _loc10_.itemId == Special.GATE_FENCE_UID_8)
                           {
                              _loc10_.hideCollectAnimation();
                              _loc11_ = this.gateActionMenuPositionCalc(_loc10_.uniqueId);
                              if(this.playfieldSettingsProxy.activePlayfieldType == PlayFieldsTypes.FIELD_TYPE_FORGOTTEN_ZOO)
                              {
                                 this.notifier.dispatchNoticeToRoot(new ActionMenuNotice(ActionMenuNotice.OPEN_ACTION_MENU,ActionMenuTypes.MENU_TYPE_GATE_FORGOTTEN,_loc10_,_loc11_));
                              }
                              else
                              {
                                 this.notifier.dispatchNoticeToRoot(new ActionMenuNotice(ActionMenuNotice.OPEN_ACTION_MENU,ActionMenuTypes.MENU_TYPE_GATE,_loc10_,_loc11_));
                              }
                           }
                           if(_loc10_.itemId == Special.ESTER_EGG_ID)
                           {
                              this.notifier.dispatchNotice(new EsterEggNotice(EsterEggNotice.AUTO_COLLECT_ESTER_EGG,_loc10_));
                           }
                           if(_loc10_.itemId == Special.ANNIVERSARY_STAGE)
                           {
                           }
                           if(_loc10_.itemId == Special.SAFARI_MINI_GAME_JEEP_UID)
                           {
                              this.handleSafariGame();
                           }
                           if(_loc10_.itemId == Special.FORGOTTEN_ZOO_SIGN_UID)
                           {
                              this.handleForgottenZooClick();
                           }
                           if(_loc10_.itemId == Special.FORTUNE_WHEEL)
                           {
                              facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.ZOO_WHEEL));
                           }
                           if(_loc10_.itemId == Special.CIRCUS)
                           {
                              facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.CIRCUS_WINDOW));
                           }
                           if(_loc10_.itemId == Special.BABY_CARAVAN)
                           {
                              facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.BABY_CARAVAN_WINDOW));
                           }
                           if(_loc10_.itemId == Special.CINEMA)
                           {
                              facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.CINEMA_WINDOW));
                           }
                           if(_loc10_.itemId == Special.ADV_BREED_VAN)
                           {
                              facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.ADV_BREEDING_EVENT_WINDOW));
                           }
                           if(_loc10_.itemId == Special.OCEAN_WORLD_LIFE_GUARD)
                           {
                              facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.OCEAN_COMIC_WINDOW));
                           }
                        }
                        break;
                     case Categories.STORE:
                        _loc7_ = _loc3_ as Store;
                        if(_loc7_.itemId == 34)
                        {
                           if(_loc7_.canCollect)
                           {
                              _loc12_ = facade.retrieveProxy(CircusProxy.NAME) as CircusProxy;
                              _loc12_.freePosition(_loc7_.posX,_loc7_.posY);
                              facade.sendNotification(NET.CIRCUS_OPEN_BOX,[_loc7_.uniqueId]);
                              _loc7_.enabled = false;
                           }
                           return;
                        }
                        if(_loc7_.buildTimeStamp > TimeManager.currentTime)
                        {
                           this.notifier.dispatchNoticeToRoot(new ActionMenuNotice(ActionMenuNotice.OPEN_ACTION_MENU,ActionMenuTypes.MENU_TYPE_BUILD,_loc7_));
                        }
                        else
                        {
                           _loc7_.hideCollectAnimation();
                           _loc13_ = this.playField.getItemPosInStage(Categories.STORE,_loc7_.uniqueId);
                           _loc13_.y -= StoreActionMenu.STORE_MENU_ZOOM_Y_OFFSETS[this.currentZoomLevel];
                           this.notifier.dispatchNoticeToRoot(new ActionMenuNotice(ActionMenuNotice.OPEN_ACTION_MENU,ActionMenuTypes.MENU_TYPE_STORE,_loc7_,_loc13_));
                        }
                        break;
                     case Categories.TRASHBIN:
                        _loc8_ = this.playField.getFieldItem(param1.categoryId,param1.uniqueId);
                        if((_loc8_ as TrashBin).trashAmmount > 0)
                        {
                           this.notifier.dispatchNoticeToRoot(new ActionMenuNotice(ActionMenuNotice.OPEN_ACTION_MENU,ActionMenuTypes.MENU_TYPE_CLEAN,_loc8_));
                        }
                        break;
                     case Categories.TRASHROAD:
                        _loc9_ = this.playField.getFieldItem(param1.categoryId,param1.uniqueId);
                        if((_loc9_ as TrashRoad).trashAmmount > 0)
                        {
                           this.notifier.dispatchNoticeToRoot(new ActionMenuNotice(ActionMenuNotice.OPEN_ACTION_MENU,ActionMenuTypes.MENU_TYPE_CLEAN,_loc9_));
                        }
                  }
                  break;
               case MouseState.MOVE_ITEM:
                  if(_loc3_.itemId == 34 && _loc3_.category == Categories.STORE)
                  {
                     this.blocItemAction(_loc3_);
                  }
                  else
                  {
                     _loc3_.startDragAction();
                  }
                  break;
               case MouseState.FLIP_ITEM:
                  if(_loc3_.itemId == 34 && _loc3_.category == Categories.STORE)
                  {
                     this.blocItemAction(_loc3_);
                     break;
                  }
                  _loc4_ = _loc3_.rotatePos == ItemAbstract.ROTATION_0 ? ItemAbstract.ROTATION_270 : ItemAbstract.ROTATION_0;
                  if(!this.playField.testBuildingColision(new Point(_loc3_.posX,_loc3_.posY),new Point(param1.size.y,param1.size.x),_loc3_.category,_loc3_.uniqueId) && !this.playField.testBuildingOutOfFieldBonuds(new Point(_loc3_.posX,_loc3_.posY),new Point(param1.size.y,param1.size.x)))
                  {
                     if(!this.playField.testRoadColision(new Point(_loc3_.posX,_loc3_.posY),new Point(param1.size.y,param1.size.x)) || _loc3_.category == Categories.TRASHBIN || _loc3_.category == Categories.DECOR && (_loc3_.groundRequired == ItemAbstract.GROUND_ROAD || _loc3_.groundRequired == ItemAbstract.GROUND_ANY))
                     {
                        _loc3_.renewActiveZone();
                        switch(_loc3_.category)
                        {
                           case Categories.CAGE:
                              _loc14_ = new CageData();
                              _loc14_.itemId = _loc3_.itemId;
                              _loc14_.uniqueId = _loc3_.uniqueId;
                              _loc14_.rotatePos = _loc4_;
                              this.playField.setFieldItems(Vector.<FieldItemData>([_loc14_]),PlayField.GUESS_COMMANDID);
                              sendNotification(NET.MOVE_CAGE,[_loc3_.uniqueId,_loc3_.posX,_loc3_.posY,_loc4_]);
                              _loc3_.buildingCommandIds.move = this.netProxy.currentRequestId;
                              break;
                           case Categories.STORE:
                              _loc15_ = new StoreData();
                              _loc15_.itemId = _loc3_.itemId;
                              _loc15_.uniqueId = _loc3_.uniqueId;
                              _loc15_.rotatePos = _loc4_;
                              this.playField.setFieldItems(Vector.<FieldItemData>([_loc15_]),PlayField.GUESS_COMMANDID);
                              sendNotification(NET.MOVE_STORE,[_loc3_.uniqueId,_loc3_.posX,_loc3_.posY,_loc4_]);
                              _loc3_.buildingCommandIds.move = this.netProxy.currentRequestId;
                              break;
                           case Categories.NURSERY:
                              _loc16_ = new NurseryVO();
                              _loc16_.itemId = _loc3_.itemId;
                              _loc16_.uniqueId = _loc3_.uniqueId;
                              _loc16_.rotatePos = _loc4_;
                              this.playField.setFieldItems(Vector.<FieldItemData>([_loc16_]),PlayField.GUESS_COMMANDID);
                              sendNotification(NET.MOVE_NURSERY,[_loc3_.uniqueId,_loc3_.posX,_loc3_.posY,_loc4_]);
                              _loc3_.buildingCommandIds.move = this.netProxy.currentRequestId;
                              break;
                           case Categories.BREEDING_LAB:
                              _loc17_ = new BreedingLabVO();
                              _loc17_.itemId = _loc3_.itemId;
                              _loc17_.uniqueId = _loc3_.uniqueId;
                              _loc17_.rotatePos = _loc4_;
                              this.playField.setFieldItems(Vector.<FieldItemData>([_loc17_]),PlayField.GUESS_COMMANDID);
                              sendNotification(NET.MOVE_BREEDING_LAB,[_loc3_.uniqueId,_loc3_.posX,_loc3_.posY,_loc4_]);
                              _loc3_.buildingCommandIds.move = this.netProxy.currentRequestId;
                              break;
                           case Categories.DECOR:
                              _loc18_ = new DecorData();
                              _loc18_.itemId = _loc3_.itemId;
                              _loc18_.uniqueId = _loc3_.uniqueId;
                              _loc18_.rotatePos = _loc4_;
                              _loc19_ = _loc3_ as Decor;
                              _loc20_ = false;
                              if(_loc19_.itemId == Decor.SNOW_MAN_UID || _loc19_.itemId == Decor.HEARTS_GLOBE)
                              {
                                 if(_loc19_.currentStateId == 1)
                                 {
                                    _loc20_ = true;
                                 }
                              }
                              this.playField.setFieldItems(Vector.<FieldItemData>([_loc18_]),PlayField.GUESS_COMMANDID);
                              sendNotification(NET.MOVE_DECO,[_loc3_.uniqueId,_loc3_.posX,_loc3_.posY,_loc4_]);
                              _loc3_.buildingCommandIds.move = this.netProxy.currentRequestId;
                              if(_loc20_)
                              {
                                 if(_loc19_.itemId == Decor.SNOW_MAN_UID)
                                 {
                                    this.notifier.dispatchNoticeToRoot(new FieldItemStateNotice(FieldItemStateNotice.CHANGE_ALL_ITEM_STATES,1,_loc19_.category,_loc19_.itemId));
                                 }
                                 if(_loc19_.itemId == Decor.HEARTS_GLOBE)
                                 {
                                    this.notifier.dispatchNoticeToRoot(new FieldItemStateNotice(FieldItemStateNotice.CHANGE_ALL_ITEM_STATES,1,_loc19_.category,_loc19_.itemId));
                                 }
                                 _loc20_ = false;
                              }
                              break;
                           case Categories.TRASHBIN:
                              sendNotification(NET.MOVE_TRASH_BIN,[_loc3_.uniqueId,_loc3_.posX,_loc3_.posY,_loc4_]);
                              _loc3_.buildingCommandIds.move = this.netProxy.currentRequestId;
                        }
                     }
                     else
                     {
                        TweenLite.to(_loc3_,0.2,{"glowFilter":{
                           "color":16711680,
                           "blurX":10,
                           "blurY":10,
                           "strength":3,
                           "alpha":1,
                           "quality":1
                        }});
                     }
                  }
                  else
                  {
                     TweenLite.to(_loc3_,0.2,{"glowFilter":{
                        "color":16711680,
                        "blurX":10,
                        "blurY":10,
                        "strength":3,
                        "alpha":1,
                        "quality":1
                     }});
                  }
                  break;
               case MouseState.SELL_ITEM:
                  switch(_loc3_.category)
                  {
                     case Categories.CAGE:
                     case Categories.STORE:
                     case Categories.DECOR:
                     case Categories.TRASHBIN:
                        if(_loc3_.itemId == 34 && _loc3_.category == Categories.STORE)
                        {
                           this.blocItemAction(_loc3_);
                        }
                        else
                        {
                           this.sendSellItemNotification(_loc3_);
                        }
                  }
                  break;
               case MouseState.STORE_ITEM:
                  switch(_loc3_.category)
                  {
                     case Categories.CAGE:
                        if(_loc3_.buildTimeStamp < TimeManager.currentTime)
                        {
                           _loc21_ = _loc3_ as Cage;
                           if(_loc21_.eventTimeStamp < TimeManager.currentTime)
                           {
                              if(_loc21_.animalCount <= 0 || _loc21_.happiness >= MainConfig.CAGE_ANIMAL_HAPPYNESS_GOOD_FOR_STARADGE * 100)
                              {
                                 if(_loc21_.breedTimeStamp > TimeManager.currentTime)
                                 {
                                    facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.CONFIRMATION,"",new ConfirmationInitParams(TextResourceModule.getText("zoo.window.infoLayers.breedInInventory.title"),TextResourceModule.getText("zoo.window.infoLayers.breedInInventory.text")),new WindowParams("",null,"",null,Note.SEND_CAGE_TO_INVENTORY,_loc3_)));
                                    break;
                                 }
                                 this.sendCageToInventory(_loc3_);
                              }
                              else
                              {
                                 sendNotification(Note.HIDE_LOADER_LAYER);
                                 this.notifier.dispatchNotice(new ConfirmationWindowNotice(WindowNotice.OPEN_WINDOW,OldWindowTypes.MINI_MESSAGE,"zoo.inventory.store.error.title","zoo.inventory.store.error.info"));
                                 this.blocItemAction(_loc3_);
                              }
                           }
                           else
                           {
                              this.blocItemAction(_loc3_);
                           }
                        }
                        else
                        {
                           this.blocItemAction(_loc3_);
                        }
                        break;
                     case Categories.STORE:
                     case Categories.DECOR:
                        if(_loc3_.itemId == 34 && _loc3_.category == Categories.STORE)
                        {
                           this.blocItemAction(_loc3_);
                        }
                        else if(_loc3_.category == Categories.DECOR && _loc3_.itemId == Decor.FORTUNE_WHEEL_DEPRICATED)
                        {
                           this.blocItemAction(_loc3_);
                        }
                        else if(_loc3_.buildTimeStamp < TimeManager.currentTime)
                        {
                           TweenLite.delayedCall(1,this.changeToolBackTo,[this.mouseModule.mouseType]);
                           this.notifier.dispatchNoticeToRoot(new MouseToolNotice(MouseToolNotice.INIT_HALT_ACTIONS));
                           if(_loc3_.itemId == Decor.HEARTS_GLOBE && _loc3_.category == Categories.DECOR)
                           {
                              _loc22_ = _loc3_ as Decor;
                              _loc23_ = this.playFieldProxy.getItemCount(Categories.DECOR,-1,false,_loc22_.itemId);
                              if(_loc22_.currentStateId == 1 && _loc23_ == 1)
                              {
                                 this.stopHeartsFall();
                              }
                           }
                           if(_loc3_.itemId == Decor.SNOW_MAN_UID && _loc3_.category == Categories.DECOR)
                           {
                              _loc24_ = _loc3_ as Decor;
                              _loc25_ = this.playFieldProxy.getItemCount(Categories.DECOR,-1,false,_loc24_.itemId);
                              if(_loc24_.currentStateId == 1 && _loc25_ == 1)
                              {
                                 this.stopSnowFall();
                              }
                           }
                           this.sendStoreItemNotification(_loc3_);
                        }
                        else
                        {
                           this.blocItemAction(_loc3_);
                        }
                        break;
                     case Categories.TRASHBIN:
                        this.sendStoreItemNotification(_loc3_);
                  }
            }
         }
         if(param1.uniqueId == -3)
         {
            this.notifier.dispatchNotice(new WindowNotice(WindowNotice.OPEN_WINDOW,OldWindowTypes.OCEAN_WORLD_TEASER));
         }
         if(param1.uniqueId == -6 || param1.uniqueId == -7)
         {
            this.notifier.dispatchNotice(new PlayFieldNotice(PlayFieldNotice.ACTIVATE_EXPAND_BUY));
         }
      }
      
      private function handleForgottenZooClick() : void
      {
         sendNotification(Note.MAP_SHOW);
      }
      
      private function changeToolBackTo(param1:String) : void
      {
         if(this.mouseModule.mouseType == MouseState.HALT_ACTIONS)
         {
            this.notifier.dispatchNoticeToRoot(new MouseToolNotice(param1));
         }
         else if(this.mouseModule.mouseType == MouseState.MOVE_SCREEN)
         {
            this.playField.hackPreMoveMouseState(MouseState.HALT_ACTIONS);
         }
      }
      
      private function blocItemAction(param1:Building) : void
      {
         TweenLite.delayedCall(1,this.switchHighlightBack,[param1,param1.markType]);
         param1.markType = ItemMarkType.PLACEMENT_MISTAKE;
      }
      
      private function sendStoreItemNotification(param1:Building) : void
      {
         sendNotification(PLAYFIELD.PF_PLAYFIELD_TO_INVENTORY,param1);
      }
      
      public function sendSellItemNotification(param1:Building) : void
      {
         var _loc3_:WindowButtonParams = null;
         var _loc4_:ShopItemData = null;
         var _loc5_:int = 0;
         var _loc6_:ConfirmationWindowNotice = null;
         var _loc2_:BabyCaravanProxy = facade.retrieveProxy(BabyCaravanProxy.NAME) as BabyCaravanProxy;
         if(_loc2_.isEventActive && _loc2_.cageHasLoanedAnimals(param1.uniqueId))
         {
            TweenLite.delayedCall(1,this.switchHighlightBack,[param1,param1.markType]);
            param1.markType = ItemMarkType.PLACEMENT_MISTAKE;
            return;
         }
         if(param1.sellable)
         {
            _loc3_ = new WindowButtonParams(null,null,this.handleSellItemWindowConfirmed,[param1]);
            _loc4_ = this.itemConfigProxy.getItemById(param1.itemId,param1.category);
            _loc5_ = BuildingHelper.getSellPrice(param1,_loc4_);
            _loc6_ = new ConfirmationWindowNotice(WindowNotice.OPEN_WINDOW,OldWindowTypes.QUESTION,TextResourceModule.getText("zoo.window.confirmation.sellitemaction.title"),TextResourceModule.getText("zoo.window.confirmation.sellitemaction.info"),_loc3_,null,null,"","",_loc5_);
            this.notifier.dispatchNotice(_loc6_);
         }
         else
         {
            TweenLite.delayedCall(1,this.switchHighlightBack,[param1,param1.markType]);
            param1.markType = ItemMarkType.PLACEMENT_MISTAKE;
         }
      }
      
      private function switchHighlightBack(param1:Building, param2:int) : void
      {
         if(param1.markType == ItemMarkType.PLACEMENT_MISTAKE)
         {
            param1.markType = param2;
         }
      }
      
      private function handleSellItemWindowConfirmed(param1:Building) : void
      {
         if(!param1.markedForDelete)
         {
            param1.markedForDelete = true;
            switch(param1.category)
            {
               case Categories.CAGE:
                  this.sellCage(param1.uniqueId);
                  break;
               case Categories.STORE:
                  this.sellStore(param1.uniqueId);
                  break;
               case Categories.DECOR:
                  this.sellDecor(param1.uniqueId);
                  break;
               case Categories.TRASHBIN:
                  this.sellTrashBin(param1.uniqueId);
                  break;
               case Categories.BREEDING_LAB:
                  sendNotification(NET.SELL_SPECIAL_ITEM,[param1.uniqueId]);
                  break;
               case Categories.NURSERY:
                  sendNotification(NET.SELL_SPECIAL_ITEM,[param1.uniqueId]);
            }
         }
      }
      
      private function handleRoadItemClick(param1:RoadItemNotice) : void
      {
         var _loc2_:MouseModule = MouseModule.getInstance();
         switch(_loc2_.mouseType)
         {
            case MouseState.MOVE_ITEM:
               this.dragItem.startDragGeneralItem(param1.categoryId,param1.typeId,0,param1.uniqueId,true,true);
               break;
            case MouseState.SELL_ITEM:
               this.sellRoad(param1.uniqueId);
               this.playField.removeFieldRoad(param1.uniqueId);
               break;
            case MouseState.STORE_ITEM:
               this.storeRoad(param1.uniqueId);
               this.playField.removeFieldRoad(param1.uniqueId);
         }
      }
      
      private function storeRoad(param1:int) : void
      {
         sendNotification(Note.STORE_PLAYFIELD_ROAD,param1);
      }
      
      private function sendCageToInventory(param1:Building) : void
      {
         TweenLite.delayedCall(1,this.changeToolBackTo,[this.mouseModule.mouseType]);
         this.notifier.dispatchNoticeToRoot(new MouseToolNotice(MouseToolNotice.INIT_HALT_ACTIONS));
         this.sendStoreItemNotification(param1);
      }
      
      public function sellCage(param1:int) : void
      {
         var _loc2_:Building = this.playField.getFieldItem(Categories.CAGE,param1) as Building;
         var _loc3_:Point = this.playField.getItemPosInStage(Categories.CAGE,param1);
         var _loc4_:ShopItemData = this.itemConfigProxy.getItemById(_loc2_.itemId,_loc2_.category);
         var _loc5_:int = BuildingHelper.getSellPrice(_loc2_,_loc4_);
         this.currencyProxy.increaseCurrency(UserResources.VIRTUAL_MONEY,_loc5_);
         this.notifier.dispatchNotice(new QuickInfoNotice(QuickInfoNotice.INCREASE_CURRENCY,UserResources.VIRTUAL_MONEY,_loc5_,new Point(_loc3_.x,_loc3_.y)));
         sendNotification(NET.SELL_CAGE,[param1]);
      }
      
      public function sellStore(param1:int) : void
      {
         var _loc2_:Store = this.playField.getFieldItem(Categories.STORE,param1) as Store;
         var _loc3_:Point = this.playField.getItemPosInStage(Categories.STORE,param1);
         this.currencyProxy.increaseCurrency(UserResources.VIRTUAL_MONEY,_loc2_.sellVirtual);
         this.notifier.dispatchNotice(new QuickInfoNotice(QuickInfoNotice.INCREASE_CURRENCY,UserResources.VIRTUAL_MONEY,_loc2_.sellVirtual,new Point(_loc3_.x,_loc3_.y)));
         sendNotification(NET.SELL_STORE,[param1]);
      }
      
      public function sellDecor(param1:int) : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc2_:Decor = this.playField.getFieldItem(Categories.DECOR,param1) as Decor;
         var _loc3_:Point = this.playField.getItemPosInStage(Categories.DECOR,param1);
         var _loc4_:ShopItemData = this.itemConfigProxy.getItemById(_loc2_.itemId,_loc2_.category);
         var _loc5_:int = BuildingHelper.getSellPrice(_loc2_ as Building,_loc4_);
         this.currencyProxy.increaseCurrency(UserResources.VIRTUAL_MONEY,_loc5_);
         this.notifier.dispatchNotice(new QuickInfoNotice(QuickInfoNotice.INCREASE_CURRENCY,UserResources.VIRTUAL_MONEY,_loc5_,new Point(_loc3_.x,_loc3_.y)));
         sendNotification(NET.SELL_DECO,[param1]);
         if(_loc2_.itemId == Decor.SNOW_MAN_UID)
         {
            _loc6_ = this.playFieldProxy.getItemCount(Categories.DECOR,-1,false,_loc2_.itemId);
            if(_loc2_.currentStateId == 1 && _loc6_ == 1)
            {
               this.stopSnowFall();
            }
         }
         if(_loc2_.itemId == Decor.HEARTS_GLOBE)
         {
            _loc7_ = this.playFieldProxy.getItemCount(Categories.DECOR,-1,false,_loc2_.itemId);
            if(_loc2_.currentStateId == 1 && _loc7_ == 1)
            {
               this.stopHeartsFall();
            }
         }
      }
      
      public function sellRoad(param1:int) : void
      {
         var _loc2_:Point = this.playField.getRoadPosInStage(param1);
         var _loc3_:int = this.playField.getRoadTypeId(param1);
         var _loc4_:RoadShopData = ConfigurationModule.getInstance().getRoadData(_loc3_);
         this.currencyProxy.increaseCurrency(UserResources.VIRTUAL_MONEY,_loc4_.sellVirtual);
         this.notifier.dispatchNotice(new QuickInfoNotice(QuickInfoNotice.INCREASE_CURRENCY,UserResources.VIRTUAL_MONEY,_loc4_.sellVirtual,new Point(_loc2_.x,_loc2_.y)));
         sendNotification(NET.SELL_ROAD,[param1]);
         var _loc5_:int = this.netProxy.currentRequestId;
         this.playField.storeRoadCommandId(param1,_loc5_);
      }
      
      public function sellTrashBin(param1:int) : void
      {
         var _loc2_:TrashBin = this.playField.getFieldItem(Categories.TRASHBIN,param1) as TrashBin;
         sendNotification(NET.SELL_TRASH_BIN,[param1,_loc2_.trashAmmount]);
      }
      
      public function keyRotateItem() : void
      {
         if(this.dragItem.isDragging)
         {
            this.dragItem.rotate();
         }
      }
      
      private function handleScreenMove(param1:PlayFieldNotice) : void
      {
         this.closeAllActionMenus();
         sendNotification(GUINote.PLAY_FIELD_DRAG,param1);
         this.itemDropLayer.x = param1.playFieldX;
         this.itemDropLayer.y = param1.playFieldY;
      }
      
      private function handleActionButtonClick(param1:ActionNotice) : void
      {
         var _loc2_:Building = null;
         var _loc3_:BonusCodeNotice = null;
         var _loc4_:Cage = null;
         var _loc5_:Cage = null;
         switch(param1.menuType)
         {
            case ActionMenuTypes.MENU_TYPE_BUILD:
               _loc2_ = this.playField.getFieldItem(param1.itemCategory,param1.itemUniqueId) as Building;
               this.notifier.dispatchNotice(new ConstructionWindowNotice(WindowNotice.OPEN_WINDOW,OldWindowTypes.CONSTRUCTION,param1.itemCategory,param1.itemUniqueId,_loc2_.buildTimeStamp,_loc2_.buildTime,_loc2_.directBuildReal));
               break;
            case ActionMenuTypes.MENU_TYPE_CLEAN:
               if(Settings.TUTORIAL_ACTIVE)
               {
                  TutorialInjectionManager.getInstance().trashCleaned();
               }
               this.handleActionTrashbinCleanButtonClick(param1);
               break;
            case ActionMenuTypes.MENU_TYPE_ASSISTANCES:
               this.handleActionAssistanceButtonClick(param1);
               break;
            case ActionMenuTypes.MENU_TYPE_COMMUNITY:
               switch(param1.actionId)
               {
                  case ActionButton.MAIL_ACTION:
                     sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.MAIL_WINDOW));
                     this.notifier.dispatchNotice(new ActionMenuNotice(ActionMenuNotice.CLOSE_ACTION_MENU));
                     break;
                  case ActionButton.BONUS_CODE_ACTION:
                     _loc3_ = new BonusCodeNotice(WindowNotice.OPEN_WINDOW,OldWindowTypes.BONUS_CODE_WINDOW,"zoo.window.bonus.main.title","zoo.window.bonus.main.info");
                     this.notifier.dispatchNotice(_loc3_);
                     break;
                  case ActionButton.NEWS_ACTION:
                     sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.NEWS_WINDOW));
                     this.notifier.dispatchNotice(new ActionMenuNotice(ActionMenuNotice.CLOSE_ACTION_MENU));
                     break;
                  case ActionButton.INVITE_ACTION:
                     sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.FRIENDS_WINDOW));
                     break;
                  case ActionButton.PRIZE_ACTION:
               }
               break;
            case ActionMenuTypes.MENU_TYPE_CAGE:
               this.newCageData = new CageData();
               this.newCageData.uniqueId = param1.itemUniqueId;
               this.animalCage = this.playField.getFieldItem(Categories.CAGE,param1.itemUniqueId) as Cage;
               this.spiecieShopData = ConfigurationModule.getInstance().getSpecieData(this.animalCage.speciesId);
               this.cagePositionInStage = this.playField.getItemPosInStage(Categories.CAGE,param1.itemUniqueId);
               switch(param1.actionId)
               {
                  case ActionButton.WATER_ACTON:
                     sendNotification(Note.CAGE_WATER_ACTION,this.animalCage.uniqueId);
                     break;
                  case ActionButton.FEED_ACTON:
                     sendNotification(Note.CAGE_FEED_ACTION,this.animalCage.uniqueId);
                     break;
                  case ActionButton.SUPER_FEED_ACTON:
                     sendNotification(Note.CAGE_SUPER_FEED_ACTION,this.animalCage.uniqueId);
                     break;
                  case ActionButton.POWER_FEED_ACTON:
                     sendNotification(Note.CAGE_POWER_FEED_ACTION,this.animalCage.uniqueId);
                     break;
                  case ActionButton.CLEAN_ACTON:
                     sendNotification(Note.CAGE_CLEAN_ACTION,this.animalCage.uniqueId);
                     break;
                  case ActionButton.CUDDLE_ACTON:
                     sendNotification(Note.CAGE_CUDDLE_ACTION,this.animalCage.uniqueId);
                     break;
                  case ActionButton.MEDICINE_ACTON:
                     sendNotification(Note.CAGE_HEAL_ACTION,this.animalCage.uniqueId);
                     break;
                  case ActionButton.SUPER_MEDICINE_ACTON:
                     sendNotification(Note.CAGE_INSTANT_HEAL_ACTION,this.animalCage.uniqueId);
                     break;
                  case ActionButton.BREED_ACTON:
                     sendNotification(Note.CAGE_BREED_ACTION,this.animalCage.uniqueId);
                     break;
                  case ActionButton.UPGRADE_ACTON:
                     _loc4_ = this.playField.getFieldItem(Categories.CAGE,param1.itemUniqueId) as Cage;
                     sendNotification(Note.OPEN_CAGE_UPGRADE_WINDOW,[_loc4_,this.playfieldSettingsProxy.activePlayfieldType]);
                     break;
                  case ActionButton.BABY_TO_INV_ACTON:
                     sendNotification(Note.MOVE_ANIMAL_TO_INVENTORY,this.animalCage);
                     break;
                  case ActionButton.UPGRADE_EXTRA_ACTON:
                     _loc5_ = this.playField.getFieldItem(Categories.CAGE,param1.itemUniqueId) as Cage;
                     sendNotification(Note.OPEN_ANIVERSARY_CAGE_UPGRADE_WINDOW,_loc5_);
               }
               break;
            case ActionMenuTypes.MENU_TYPE_STORE:
               this.handleCollectPennyActionButtonClick(param1);
               break;
            case ActionMenuTypes.MENU_TYPE_GATE:
               switch(param1.actionId)
               {
                  case ActionButton.GATE_COLLECT_ACTION:
                     this.handleCollectGateMoney(param1);
                     this.playField.updateEntranceFee(0);
                     break;
                  case ActionButton.OCEAN_WORLD_ACTION:
                     if(!Settings.TUTORIAL_ACTIVE)
                     {
                        this.handleActionMenuOceanWorldClicked();
                     }
                     break;
                  case ActionButton.SAFARI_MINI_GAME_ACTION:
                     if(!Settings.TUTORIAL_ACTIVE)
                     {
                        this.handleSafariGame();
                     }
                     break;
                  case ActionButton.FORGOTTEN_ZOO_ACTION:
                     sendNotification(Note.MAP_SHOW);
                     break;
                  case ActionButton.ZOO_WHEEL_ACTION:
                     sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.ZOO_WHEEL));
                     break;
                  case ActionButton.MAIN_BUILDING_SELECTION_ACTION:
                     sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.MAIN_BUILDING_SELECTION));
                     break;
                  case ActionButton.AVATAR_CREATOR_ACTION:
                     sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.AVATAR_WINDOW));
               }
               this.notifier.dispatchNotice(new ActionMenuNotice(ActionMenuNotice.CLOSE_ACTION_MENU,param1.menuType));
               break;
            case ActionMenuTypes.MENU_TYPE_GATE_FORGOTTEN:
               switch(param1.actionId)
               {
                  case ActionButton.GATE_COLLECT_ACTION:
                     this.handleCollectGateMoney(param1);
                     break;
                  case ActionButton.BACK_TO_MAIN_ACTION:
                     sendNotification(Note.SWITCH_PLAYFIELD,PlayFieldsTypes.FIELD_TYPE_MAIN_ZOO);
                     break;
                  case ActionButton.SAFARI_MINI_GAME_ACTION:
                     if(!Settings.TUTORIAL_ACTIVE)
                     {
                        this.handleSafariGame();
                     }
                     break;
                  case ActionButton.ZOO_WHEEL_ACTION:
                     sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.ZOO_WHEEL));
                     break;
                  case ActionButton.AVATAR_CREATOR_ACTION:
                     sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.AVATAR_WINDOW));
               }
               this.notifier.dispatchNotice(new ActionMenuNotice(ActionMenuNotice.CLOSE_ACTION_MENU,param1.menuType));
               break;
            case ActionMenuTypes.MENU_TYPE_UNDEFINED:
         }
      }
      
      private function handleSafariGame() : void
      {
         sendNotification(Note.SAFARI_SHOW);
      }
      
      private function performCageUpgrade(param1:UpgradeWindowNotice) : void
      {
         if(param1.eventTrigged == EventTypes.ANNIVERSARY_WHOLE_EVENT)
         {
            sendNotification(NET.UPGRADE_EVENT_CAGE,[param1.uid,EventTypes.ANNIVERSARY_WHOLE_EVENT]);
         }
         else
         {
            sendNotification(NET.UPGRADE_CAGE,[param1.uid]);
         }
         if(param1.eventTrigged == EventTypes.BDAY2014_EVENT)
         {
            sendNotification(NET.UPGRADE_EVENT_CAGE,[param1.uid,EventTypes.BDAY2014_EVENT]);
         }
         else
         {
            sendNotification(NET.UPGRADE_CAGE,[param1.uid]);
         }
      }
      
      public function handleActionTrashbinCleanButtonClick(param1:ActionNotice) : void
      {
         var _loc2_:TrashBin = null;
         var _loc3_:int = 0;
         var _loc4_:Point = null;
         var _loc5_:int = 0;
         var _loc6_:TrashRoad = null;
         var _loc7_:int = 0;
         var _loc8_:TrashRoadData = null;
         if(Boolean(param1) && param1.itemCategory == Categories.TRASHBIN)
         {
            _loc2_ = this.playField.getFieldItem(param1.itemCategory,param1.itemUniqueId) as TrashBin;
            sendNotification(NET.CLEAR_TRASH_BIN,[param1.itemUniqueId,_loc2_.trashAmmount]);
            _loc3_ = this.netProxy.currentRequestId;
            this.playField.cleanTrashBinFrom(_loc2_.uniqueId,_loc2_.trashAmmount,_loc3_);
            _loc4_ = this.playField.getItemPosInStage(param1.itemCategory,param1.itemUniqueId);
            _loc5_ = this.userResourcesProxy.getItemCalculatedXP(_loc2_,ActionType.TRASH_CLEAN);
            this.playfieldSettingsProxy.getCurrentFieldSettings().trashbins = this.playfieldSettingsProxy.getCurrentFieldSettings().trashbins - _loc2_.trashAmmount;
            this.playfieldSettingsProxy.recalculatePlayfieldsInfo(true);
            if(!Settings.TUTORIAL_ACTIVE)
            {
               this.notifier.dispatchNotice(new QuickInfoNotice(QuickInfoNotice.INCREASE_CURRENCY,UserResources.EXPERIENCE,_loc5_,new Point(_loc4_.x,_loc4_.y)));
               this.currencyProxy.increaseCurrency(UserResources.EXPERIENCE,_loc5_);
            }
            this.userProxy.commandIds.experience = _loc3_;
            this.resourcesProxy.increaseResource(Resources.TRASH,_loc2_.trashAmmount);
            _loc2_.trashAmmount = 0;
            this.closeAllActionMenus();
            this.soundManager.playSoundEffect(SoundEffectNames.SND_ITEM_TRASHBIN);
         }
         else if(Boolean(param1) && param1.itemCategory == Categories.TRASHROAD)
         {
            _loc6_ = this.playField.getFieldItem(param1.itemCategory,param1.itemUniqueId) as TrashRoad;
            sendNotification(NET.CLEAR_TRASH_ROAD,[_loc6_.trashAmmount]);
            _loc7_ = this.netProxy.currentRequestId;
            this.playField.cleanTrashRoadFrom(_loc6_.uniqueId,_loc6_.trashAmmount,_loc7_);
            _loc4_ = this.playField.getItemPosInStage(param1.itemCategory,param1.itemUniqueId);
            _loc5_ = this.userResourcesProxy.getItemCalculatedXP(_loc6_,ActionType.TRASH_CLEAN);
            this.playfieldSettingsProxy.getCurrentFieldSettings().trashroads = this.playfieldSettingsProxy.getCurrentFieldSettings().trashroads - _loc6_.trashAmmount;
            this.resourcesProxy.increaseResource(Resources.TRASH,_loc6_.trashAmmount);
            this.playfieldSettingsProxy.recalculatePlayfieldsInfo(true);
            if(!Settings.TUTORIAL_ACTIVE)
            {
               this.notifier.dispatchNotice(new QuickInfoNotice(QuickInfoNotice.INCREASE_CURRENCY,UserResources.EXPERIENCE,_loc5_,new Point(_loc4_.x,_loc4_.y)));
               this.currencyProxy.increaseCurrency(UserResources.EXPERIENCE,_loc5_);
            }
            this.userProxy.commandIds.experience = _loc7_;
            _loc8_ = new TrashRoadData();
            _loc8_.uniqueId = param1.itemUniqueId;
            _loc8_.del = 1;
            this.playField.setFieldItems(Vector.<FieldItemData>([_loc8_]),PlayField.GUESS_COMMANDID);
            this.closeAllActionMenus();
            this.soundManager.playSoundEffect(SoundEffectNames.SND_ITEM_TRASH);
         }
      }
      
      private function handleCollectPennyActionButtonClick(param1:ActionNotice) : void
      {
         var _loc3_:Point = null;
         var _loc4_:int = 0;
         var _loc5_:PowerupProxy = null;
         var _loc6_:int = 0;
         SoundManager.getInstance().playSoundEffect(SoundEffectNames.SND_MONEY_EARN_2);
         var _loc2_:Store = this.playField.getFieldItem(param1.itemCategory,param1.itemUniqueId) as Store;
         if(_loc2_.buildTimeStamp > TimeManager.currentTime)
         {
            this.notifier.dispatchNoticeToRoot(new ActionMenuNotice(ActionMenuNotice.OPEN_ACTION_MENU,ActionMenuTypes.MENU_TYPE_BUILD,_loc2_));
         }
         else
         {
            _loc3_ = this.playField.getItemPosInStage(param1.itemCategory,param1.itemUniqueId);
            if(_loc2_.collectTimeStamp < TimeManager.currentTime)
            {
               sendNotification(NET.COLLECT_STORE_MONEY,[param1.itemUniqueId]);
               _loc4_ = this.netProxy.currentRequestId;
               if(_loc2_.collectReal > 0)
               {
                  this.currencyProxy.increaseCurrency(UserResources.REAL_MONEY,_loc2_.collectReal);
                  this.notifier.dispatchNotice(new QuickInfoNotice(QuickInfoNotice.INCREASE_CURRENCY,UserResources.REAL_MONEY,_loc2_.collectReal,new Point(_loc3_.x,_loc3_.y)));
                  this.userProxy.commandIds.realMoney = _loc4_;
               }
               else
               {
                  _loc5_ = facade.getProxy(PowerupProxy);
                  _loc6_ = _loc2_.collectVirtual;
                  if(_loc5_.isPowerupActive(PowerupItemType.PENNY_30_MORE))
                  {
                     _loc6_ += _loc2_.collectVirtual * 0.3;
                  }
                  if(_loc5_.isPowerupActive(PowerupItemType.PENNY_100_MORE))
                  {
                     _loc6_ += _loc2_.collectVirtual;
                  }
                  this.currencyProxy.increaseCurrency(UserResources.VIRTUAL_MONEY,_loc6_);
                  this.notifier.dispatchNotice(new QuickInfoNotice(QuickInfoNotice.INCREASE_CURRENCY,UserResources.VIRTUAL_MONEY,_loc6_,new Point(_loc3_.x,_loc3_.y)));
                  this.userProxy.commandIds.virtualMoney = _loc4_;
               }
               _loc2_.resetCollectTime();
               this.closeAllActionMenus();
            }
         }
      }
      
      private function handleCollectGateMoney(param1:ActionNotice) : void
      {
         SoundManager.getInstance().playSoundEffect(SoundEffectNames.SND_MONEY_EARN_2);
         if(Settings.TUTORIAL_ACTIVE)
         {
            TutorialInjectionManager.getInstance().collectGateMoney();
         }
         var _loc2_:Special = this.playField.getFieldItem(param1.itemCategory,param1.itemUniqueId) as Special;
         var _loc3_:Point = this.playField.getItemPosInStage(param1.itemCategory,param1.itemUniqueId);
         sendNotification(NET.COLLECT_ENTRANCE_FEE);
         var _loc4_:int = this.netProxy.currentRequestId;
         var _loc5_:int = _loc2_.entranceFee;
         this.currencyProxy.increaseCurrency(UserResources.VIRTUAL_MONEY,_loc5_);
         this.notifier.dispatchNotice(new QuickInfoNotice(QuickInfoNotice.INCREASE_CURRENCY,UserResources.VIRTUAL_MONEY,_loc5_,new Point(_loc3_.x,_loc3_.y)));
         this.userProxy.commandIds.realMoney = _loc4_;
         _loc2_.entranceFee = 0;
         this.closeAllActionMenus();
      }
      
      private function handleActionAssistanceButtonClick(param1:ActionNotice) : void
      {
         var _loc2_:int = 0;
         switch(param1.actionId)
         {
            case ActionButton.FEED_ASSIST_ACTON_DIACTIVE:
            case ActionButton.WATER_ASSIST_ACTON_DIACTIVE:
            case ActionButton.CLEAN_ASSIST_ACTON_DIACTIVE:
            case ActionButton.CUDDLE_ASSIST_ACTON_DIACTIVE:
            case ActionButton.TRASH_ASSIST_ACTON_DIACTIVE:
            case ActionButton.CASH_ASSIST_ACTON_DIACTIVE:
            case ActionButton.HEAL_ASSIST_ACTON_DIACTIVE:
            case ActionButton.FEED_OCEAN_ASSIST_ACTON_DEACTIVE:
            case ActionButton.WATER_OCEAN_ASSIST_ACTON_DEACTIVE:
            case ActionButton.CLEAN_OCEAN_ASSIST_ACTON_DEACTIVE:
            case ActionButton.CUDDLE_OCEAN_ASSIST_ACTON_DEACTIVE:
               this.closeAllActionMenus();
               sendNotification(SHOP.OPEN_SHOP_ON_TAB,ShopTabs.ASSISTANTS);
               break;
            case ActionButton.FEED_ASSIST_ACTON:
            case ActionButton.FEED_OCEAN_ASSIST_ACTON:
               if(this.assistantsProxy.waitForCommandId < 0)
               {
                  sendNotification(Note.LOCK_ASSISTANTS_USED);
                  if(this.playfieldSettingsProxy.activePlayfieldType == PlayFieldsTypes.FIELD_TYPE_OCEANWORLD_ZOO)
                  {
                     this.netProxy.callServer(NET.USE_ASSISTANT,[AssistantsVO.OCEAN_FEED_ASSIST]).addCallback(Note.UNLOCK_ASSISTANTS_USED).sendNow();
                  }
                  else
                  {
                     this.netProxy.callServer(NET.USE_ASSISTANT,[AssistantsVO.FEED_ASSIST]).addCallback(Note.UNLOCK_ASSISTANTS_USED).sendNow();
                  }
                  _loc2_ = this.netProxy.currentRequestId;
                  this.assistantsProxy.waitForCommandId = _loc2_;
                  this.assistantsProxy.setActiveAssistant(_loc2_,AssistantTypeVO.FEED_ASSISTANT);
                  sendNotification(Note.MAKE_USERDATA_SNAPSHOT,_loc2_);
               }
               break;
            case ActionButton.WATER_ASSIST_ACTON:
            case ActionButton.WATER_OCEAN_ASSIST_ACTON:
               if(this.assistantsProxy.waitForCommandId < 0)
               {
                  if(this.playfieldSettingsProxy.activePlayfieldType == PlayFieldsTypes.FIELD_TYPE_OCEANWORLD_ZOO)
                  {
                     this.netProxy.callServer(NET.USE_ASSISTANT,[AssistantsVO.OCEAN_WATER_ASSIST]).addCallback(Note.UNLOCK_ASSISTANTS_USED).sendNow();
                  }
                  else
                  {
                     this.netProxy.callServer(NET.USE_ASSISTANT,[AssistantsVO.WATER_ASSIST]).addCallback(Note.UNLOCK_ASSISTANTS_USED).sendNow();
                  }
                  _loc2_ = this.netProxy.currentRequestId;
                  this.assistantsProxy.waitForCommandId = _loc2_;
                  this.assistantsProxy.setActiveAssistant(_loc2_,AssistantTypeVO.WATER_ASSISTANT);
                  sendNotification(Note.MAKE_USERDATA_SNAPSHOT,_loc2_);
                  sendNotification(Note.LOCK_ASSISTANTS_USED);
               }
               break;
            case ActionButton.CLEAN_ASSIST_ACTON:
            case ActionButton.CLEAN_OCEAN_ASSIST_ACTON:
               if(this.assistantsProxy.waitForCommandId < 0)
               {
                  if(this.playfieldSettingsProxy.activePlayfieldType == PlayFieldsTypes.FIELD_TYPE_OCEANWORLD_ZOO)
                  {
                     this.netProxy.callServer(NET.USE_ASSISTANT,[AssistantsVO.OCEAN_CLEAN_ASSIST]).addCallback(Note.UNLOCK_ASSISTANTS_USED).sendNow();
                  }
                  else
                  {
                     this.netProxy.callServer(NET.USE_ASSISTANT,[AssistantsVO.CLEAN_ASSIST]).addCallback(Note.UNLOCK_ASSISTANTS_USED).sendNow();
                  }
                  _loc2_ = this.netProxy.currentRequestId;
                  this.assistantsProxy.waitForCommandId = _loc2_;
                  this.assistantsProxy.setActiveAssistant(_loc2_,AssistantTypeVO.CLEAN_ASSISTANT);
                  sendNotification(Note.MAKE_USERDATA_SNAPSHOT,_loc2_);
                  sendNotification(Note.LOCK_ASSISTANTS_USED);
               }
               break;
            case ActionButton.CUDDLE_ASSIST_ACTON:
            case ActionButton.CUDDLE_OCEAN_ASSIST_ACTON:
               if(this.assistantsProxy.waitForCommandId < 0)
               {
                  if(this.playfieldSettingsProxy.activePlayfieldType == PlayFieldsTypes.FIELD_TYPE_OCEANWORLD_ZOO)
                  {
                     this.netProxy.callServer(NET.USE_ASSISTANT,[AssistantsVO.OCEAN_CUDDLE_ASSIST]).addCallback(Note.UNLOCK_ASSISTANTS_USED).sendNow();
                  }
                  else
                  {
                     this.netProxy.callServer(NET.USE_ASSISTANT,[AssistantsVO.CUDDLE_ASSIST]).addCallback(Note.UNLOCK_ASSISTANTS_USED).sendNow();
                  }
                  _loc2_ = this.netProxy.currentRequestId;
                  this.assistantsProxy.waitForCommandId = _loc2_;
                  this.assistantsProxy.setActiveAssistant(_loc2_,AssistantTypeVO.CUDDLE_ASSISTANT);
                  sendNotification(Note.MAKE_USERDATA_SNAPSHOT,_loc2_);
                  sendNotification(Note.LOCK_ASSISTANTS_USED);
               }
               break;
            case ActionButton.TRASH_ASSIST_ACTON:
               if(this.assistantsProxy.waitForCommandId < 0)
               {
                  this.netProxy.callServer(NET.USE_ASSISTANT,[AssistantsVO.TRASH_ASSIST]).addCallback(Note.UNLOCK_ASSISTANTS_USED).sendNow();
                  _loc2_ = this.netProxy.currentRequestId;
                  this.assistantsProxy.waitForCommandId = _loc2_;
                  this.assistantsProxy.setActiveAssistant(_loc2_,AssistantTypeVO.TRASH_ASSISTANT);
                  sendNotification(Note.MAKE_USERDATA_SNAPSHOT,_loc2_);
                  sendNotification(Note.LOCK_ASSISTANTS_USED);
               }
               break;
            case ActionButton.CASH_ASSIST_ACTON:
               if(this.assistantsProxy.waitForCommandId < 0)
               {
                  this.netProxy.callServer(NET.USE_ASSISTANT,[AssistantsVO.CASH_ASSIST]).addCallback(Note.UNLOCK_ASSISTANTS_USED).sendNow();
                  _loc2_ = this.netProxy.currentRequestId;
                  this.assistantsProxy.waitForCommandId = _loc2_;
                  sendNotification(Note.MAKE_USERDATA_SNAPSHOT,_loc2_);
                  sendNotification(Note.LOCK_ASSISTANTS_USED);
               }
               break;
            case ActionButton.SUPER_FEED_ASSIST_ACTON:
            case ActionButton.SUPER_FEED_OCEAN_ASSIST_ACTON:
               if(this.assistantsProxy.waitForCommandId < 0)
               {
                  if(this.playfieldSettingsProxy.activePlayfieldType == PlayFieldsTypes.FIELD_TYPE_OCEANWORLD_ZOO)
                  {
                     this.netProxy.callServer(NET.SUPER_FEED_ASSISTANT,[AssistantsVO.OCEAN_FEED_ASSIST]).addCallback(Note.UNLOCK_ASSISTANTS_USED).sendNow();
                  }
                  else
                  {
                     this.netProxy.callServer(NET.SUPER_FEED_ASSISTANT,[AssistantsVO.FEED_ASSIST]).addCallback(Note.UNLOCK_ASSISTANTS_USED).sendNow();
                  }
                  _loc2_ = this.netProxy.currentRequestId;
                  this.assistantsProxy.waitForCommandId = _loc2_;
                  this.assistantsProxy.setActiveAssistant(_loc2_,AssistantTypeVO.SUPER_FEED_ASSISTANT);
                  sendNotification(Note.MAKE_USERDATA_SNAPSHOT,_loc2_);
                  sendNotification(Note.LOCK_ASSISTANTS_USED);
               }
               break;
            case ActionButton.POWER_FEED_ASSIST_ACTON:
            case ActionButton.POWER_FEED_OCEAN_ASSIST_ACTON:
               if(this.assistantsProxy.waitForCommandId < 0)
               {
                  if(this.playfieldSettingsProxy.activePlayfieldType == PlayFieldsTypes.FIELD_TYPE_OCEANWORLD_ZOO)
                  {
                     this.netProxy.callServer(NET.POWER_FEED_ASSISTANT,[AssistantsVO.OCEAN_FEED_ASSIST]).addCallback(Note.UNLOCK_ASSISTANTS_USED).sendNow();
                  }
                  else
                  {
                     this.netProxy.callServer(NET.POWER_FEED_ASSISTANT,[AssistantsVO.FEED_ASSIST]).addCallback(Note.UNLOCK_ASSISTANTS_USED).sendNow();
                  }
                  _loc2_ = this.netProxy.currentRequestId;
                  this.assistantsProxy.waitForCommandId = _loc2_;
                  this.assistantsProxy.setActiveAssistant(_loc2_,AssistantTypeVO.POWER_FEED_ASSISTANT);
                  sendNotification(Note.MAKE_USERDATA_SNAPSHOT,_loc2_);
                  sendNotification(Note.LOCK_ASSISTANTS_USED);
               }
               break;
            case ActionButton.HEAL_ASSIST_ACTON:
               if(this.assistantsProxy.waitForCommandId < 0)
               {
                  this.netProxy.callServer(NET.USE_ASSISTANT,[AssistantsVO.HEAL_ASSIST]).addCallback(Note.UNLOCK_ASSISTANTS_USED).sendNow();
                  _loc2_ = this.netProxy.currentRequestId;
                  this.assistantsProxy.waitForCommandId = _loc2_;
                  this.assistantsProxy.setActiveAssistant(_loc2_,AssistantTypeVO.HEAL_ASSISTANT);
                  sendNotification(Note.MAKE_USERDATA_SNAPSHOT,_loc2_);
                  sendNotification(Note.LOCK_ASSISTANTS_USED);
               }
               break;
            case ActionButton.SUPER_HEAL_ASSIST_ACTON:
               if(this.assistantsProxy.waitForCommandId < 0)
               {
                  this.netProxy.callServer(NET.SUPER_HEAL_ASSISTANT,[AssistantsVO.HEAL_ASSIST]).addCallback(Note.UNLOCK_ASSISTANTS_USED).sendNow();
                  _loc2_ = this.netProxy.currentRequestId;
                  this.assistantsProxy.waitForCommandId = _loc2_;
                  this.assistantsProxy.setActiveAssistant(_loc2_,AssistantTypeVO.SUPER_HEAL_ASSISTANT);
                  sendNotification(Note.MAKE_USERDATA_SNAPSHOT,_loc2_);
                  sendNotification(Note.LOCK_ASSISTANTS_USED);
               }
         }
         this.notifier.dispatchNotice(new ActionMenuNotice(ActionMenuNotice.CLOSE_ACTION_MENU));
      }
      
      private function handleCenterActionMenuPicClick(param1:ActionMenuNotice) : void
      {
         var _loc2_:int = 0;
         switch(param1.actionMenuId)
         {
            case 1:
               if(this.assistantsProxy.waitForCommandId < 0)
               {
                  if(this.assistantsProxy.haveAllAssistantsActive)
                  {
                     this.netProxy.callServer(NET.USE_ASSISTANT,[AssistantsVO.ZOO_DIRECTOR_ASSIST]).addCallback(Note.UNLOCK_ASSISTANTS_USED).sendNow();
                     _loc2_ = this.netProxy.currentRequestId;
                     this.assistantsProxy.waitForCommandId = _loc2_;
                     this.assistantsProxy.setActiveAssistant(_loc2_,AssistantTypeVO.ZOO_DIRECTOR_ASSISTANT);
                     sendNotification(Note.MAKE_USERDATA_SNAPSHOT,_loc2_);
                     sendNotification(Note.LOCK_ASSISTANTS_USED);
                  }
                  else
                  {
                     this.notifier.dispatchNotice(new ActionMenuNotice(ActionMenuNotice.CLOSE_ACTION_MENU));
                  }
               }
         }
         this.notifier.dispatchNotice(new ActionMenuNotice(ActionMenuNotice.CLOSE_ACTION_MENU));
      }
      
      public function movePlayField(param1:Point) : void
      {
         this.playField.movePlayField(param1);
      }
      
      public function initTool(param1:String) : void
      {
         var _loc2_:MouseModule = MouseModule.getInstance();
         this.playField.dragPlayFieldItems = true;
         switch(param1)
         {
            case MouseToolNotice.INIT_MOVE_TOOL:
               _loc2_.show(MouseState.MOVE_ITEM);
               this.playField.initRoadGlowMode();
               break;
            case MouseToolNotice.INIT_FLIP_TOOL:
               _loc2_.show(MouseState.FLIP_ITEM);
               this.playField.exitRoadGlowMode();
               break;
            case MouseToolNotice.INIT_SELL_TOOL:
               _loc2_.show(MouseState.SELL_ITEM);
               this.playField.initRoadGlowMode();
               this.playField.dragPlayFieldItems = false;
               break;
            case MouseToolNotice.INIT_STORE_TOOL:
               _loc2_.show(MouseState.STORE_ITEM);
               this.playField.initRoadGlowMode();
               this.playField.dragPlayFieldItems = false;
               break;
            case MouseToolNotice.INIT_HALT_ACTIONS:
               _loc2_.show(MouseState.HALT_ACTIONS);
               this.playField.exitRoadGlowMode();
               this.playField.dragPlayFieldItems = false;
               break;
            case MouseToolNotice.DEFAULT:
            default:
               _loc2_.show(MouseState.DEFAULT);
               this.playField.exitRoadGlowMode();
               this.playField.dragPlayFieldItems = false;
         }
      }
      
      public function debugPlayField() : void
      {
         this.playField.debugField();
      }
      
      public function stopDragShopItem() : void
      {
         if(this.dragItem.shopItemDraged)
         {
            this.dragItem.stopDragItem();
         }
      }
      
      public function handleItemWindowAction(param1:ItemWindowActionNotice) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Building = null;
         var _loc5_:Cage = null;
         var _loc2_:Point = this.playField.getItemPosInStage(param1.itemCategory,param1.itemUniqueId);
         switch(param1.type)
         {
            case ItemWindowActionNotice.BUY_INSTANT_BUILD:
               _loc4_ = this.playField.getFieldItem(param1.itemCategory,param1.itemUniqueId) as Building;
               if(this.userProxy.realAmount >= _loc4_.directBuildReal)
               {
                  switch(param1.itemCategory)
                  {
                     case Categories.CAGE:
                        sendNotification(NET.BUILD_CAGE_BUY,[_loc4_.uniqueId]);
                        break;
                     case Categories.DECOR:
                        sendNotification(NET.BUILD_DECO_BUY,[_loc4_.uniqueId]);
                        break;
                     case Categories.STORE:
                        sendNotification(NET.BUILD_STORE_BUY,[_loc4_.uniqueId]);
                  }
                  _loc3_ = this.netProxy.currentRequestId;
                  this.currencyProxy.reduceCurrency(UserResources.REAL_MONEY,_loc4_.directBuildReal);
                  this.notifier.dispatchNotice(new QuickInfoNotice(QuickInfoNotice.REDUCE_CURRENCY,UserResources.REAL_MONEY,_loc4_.directBuildReal,new Point(_loc2_.x,_loc2_.y)));
                  this.userProxy.commandIds.realMoney = _loc3_;
                  _loc4_.buildTimeStamp = 0;
                  this.closeAllActionMenus();
                  SoundManager.getInstance().playSoundEffect(SoundEffectNames.SND_BUILDINGS_INSTANT_BUILD);
               }
               break;
            case ItemWindowActionNotice.BUY_INSTANT_BREED:
               _loc5_ = this.playField.getFieldItem(param1.itemCategory,param1.itemUniqueId) as Cage;
               if(_loc5_.canBreed)
               {
                  if(this.userProxy.realAmount >= _loc5_.directBreedReal)
                  {
                     sendNotification(NET.DIRECT_BREED,[_loc5_.uniqueId]);
                     _loc3_ = this.netProxy.currentRequestId;
                     this.currencyProxy.reduceCurrency(UserResources.REAL_MONEY,_loc5_.directBreedReal);
                     this.notifier.dispatchNotice(new QuickInfoNotice(QuickInfoNotice.REDUCE_CURRENCY,UserResources.REAL_MONEY,_loc5_.directBreedReal,new Point(_loc2_.x,_loc2_.y)));
                     this.userProxy.commandIds.realMoney = _loc3_;
                     this.closeAllActionMenus();
                     _loc5_.breedTimeStamp = 0;
                     ++_loc5_.childCount;
                     sendNotification(Note.CAGE_INSTANT_BREED_ACTION,_loc5_.uniqueId);
                  }
                  else
                  {
                     this.notifier.dispatchNotice(new WindowNotice(WindowNotice.OPEN_WINDOW,OldWindowTypes.BANK));
                  }
               }
               break;
            case ItemWindowActionNotice.START_BREED:
               _loc5_ = this.playField.getFieldItem(param1.itemCategory,param1.itemUniqueId) as Cage;
               _loc5_.breedTimeStamp = TimeManager.currentTime + _loc5_.breadTime;
               sendNotification(NET.BREED_START,[param1.itemUniqueId]);
         }
      }
      
      public function activateScreenDrag() : void
      {
         if(!Settings.TUTORIAL_ACTIVE)
         {
            this.playField.startDragField();
         }
      }
      
      public function diactivateScreenDrag() : void
      {
         this.playField.stopDragField();
      }
      
      public function enableVisitors(param1:Boolean) : void
      {
         this.playField.enableVisitors(param1);
      }
      
      private function handleOpenCageBreedWindow(param1:CageNotice) : void
      {
         this.notifier.dispatchNotice(new AnimalBreedWindowNotice(WindowNotice.OPEN_WINDOW,param1.cage.category,param1.cage.uniqueId,param1.cage.breedTimeStamp,param1.cage.breadTime,param1.cage.directBreedReal,this.userProxy.realAmount >= param1.cage.directBreedReal,param1.cage.breadCostReal,Math.floor(param1.cage.breadCostVirtual * this.premiumProxy.animalBreadingCostMultiplyer),param1.cage.breadExperience,param1.cage));
      }
      
      public function handleActionMenuNotice(param1:ActionMenuNotice) : void
      {
         var _loc2_:CageSlotMenuNotice = null;
         var _loc3_:int = 0;
         var _loc4_:* = false;
         if(param1.actionMenuId == ActionMenuTypes.MENU_TYPE_CAGESLOTS)
         {
            _loc2_ = param1 as CageSlotMenuNotice;
            if(_loc2_ != null && _loc2_.targetItem != null && _loc2_.dragItem != null)
            {
               _loc3_ = ConfigurationModule.getInstance().getAnimalData(_loc2_.dragItem.dragitemId).speciesId;
               _loc4_ = !this.playField.checkAvailabilityWithCage(_loc2_.targetItem.itemId,_loc3_);
               if(_loc4_)
               {
                  return;
               }
            }
         }
         this.actionMenuManager.handleNotice(param1);
      }
      
      public function handleActionMenuOceanWorldClicked() : void
      {
         this.notifier.dispatchNotice(new WindowNotice(WindowNotice.OPEN_WINDOW,OldWindowTypes.OCEAN_WORLD_TEASER));
      }
      
      public function handleUserLevelChange() : void
      {
         this.playField.handleUserLevelChange();
      }
      
      public function handleFieldItemStateChange(param1:FieldItemStateNotice) : void
      {
         this.playField.handleFieldItemStateChange(param1);
      }
      
      public function stageToFieldCords(param1:Point) : Point
      {
         return this.playField.getStageToFieldCords(param1);
      }
      
      private function changeAppMode() : void
      {
         var _loc1_:ParticlesProxy = null;
         switch(this.appProxy.currentAppMode)
         {
            case AppMode.SAFARI:
               this.closeAllActionMenus();
               this.playField.hideField();
               break;
            case AppMode.MANAGMENT_CENTER:
               this.playfieldSettingsProxy.setPlayfieldTypeById(PlayFieldsTypes.FIELD_TYPE_MANAGMENT_CENTER);
               sendNotification(Note.MOVE_TO_MANAGMENT_CENTER);
            case AppMode.MAP_OVERVIEW:
               this.closeAllActionMenus();
               this.playField.hideField();
               break;
            case AppMode.VISIT_NEIGHBOUR:
               this.closeAllActionMenus();
               break;
            case AppMode.NORMAL:
            default:
               this.playField.showField();
               _loc1_ = facade.retrieveProxy(ParticlesProxy.NAME) as ParticlesProxy;
               if(_loc1_.whichParticlesRunning == "SnowFlakeParticleSprite")
               {
                  _loc1_.setParticlesRunning();
                  this.activateSnowFall();
               }
               if(_loc1_.whichParticlesRunning == "HeartParticleSprite")
               {
                  _loc1_.setParticlesRunning();
                  this.activateHeartsFall();
               }
         }
      }
      
      public function removeAllItems(param1:String) : void
      {
         this.playField.removeAllItemsHACKED(param1);
      }
      
      public function setFieldItems(param1:Vector.<FieldItemData>) : void
      {
         this.playField.setFieldItems(param1,PlayField.GUESS_COMMANDID);
      }
   }
}

