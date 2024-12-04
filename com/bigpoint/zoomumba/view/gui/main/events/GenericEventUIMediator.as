package com.bigpoint.zoomumba.view.gui.main.events
{
   import com.bigpoint.utils.AngleUtils;
   import com.bigpoint.zoomumba.constants.AppMode;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.DataNote;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.app.core.AppProxy;
   import com.bigpoint.zoomumba.model.app.gameEvents.GlobalEventProxy;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.events.boardgame.BoardgameProxy;
   import com.bigpoint.zoomumba.model.events.boardgame.vo.BoardgameCollVo;
   import com.bigpoint.zoomumba.model.events.boardgame.vo.BoardgameVo;
   import com.bigpoint.zoomumba.model.events.gui.GenericGUIConfigHandler;
   import com.bigpoint.zoomumba.model.events.gui.vo.CentralIconVo;
   import com.bigpoint.zoomumba.model.events.gui.vo.DisplayIconVo;
   import com.bigpoint.zoomumba.model.features.collectables.CollectablesProxy;
   import com.bigpoint.zoomumba.model.inventory.InventoryProxy;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.core.PlayFieldManager;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import components.counter.CounterRectSmallSkin;
   import custom.generic.GenericCircularCounter;
   import custom.mainInterface.genericUI.GenericEventUI;
   import custom.mainInterface.genericUI.events.GenericGUIEvent;
   import flash.display.Sprite;
   import flash.geom.Point;
   import org.puremvc.as3.interfaces.IMediator;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.facade.Facade;
   import org.puremvc.as3.patterns.mediator.Mediator;
   
   public class GenericEventUIMediator extends Mediator implements IMediator
   {
      public static const NAME:String = "GenericEventUIMediator";
      
      private var appProxy:AppProxy;
      
      private var collectableProxy:CollectablesProxy;
      
      private var eventProxy:GlobalEventProxy;
      
      private var inventoryProxy:InventoryProxy;
      
      private var swfAsset:SWFAsset;
      
      public function GenericEventUIMediator(param1:GenericEventUI)
      {
         super(NAME,param1);
      }
      
      override public function listNotificationInterests() : Array
      {
         var _loc3_:DisplayIconVo = null;
         var _loc4_:Array = null;
         this.eventProxy = Facade.getInstance().retrieveProxy(GlobalEventProxy.NAME) as GlobalEventProxy;
         var _loc1_:Array = [];
         var _loc2_:Vector.<DisplayIconVo> = this.eventProxy.genericGUIConfigHandler.displayIcons();
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_.actionNoteName)
            {
               _loc1_.push(_loc3_.actionNoteName);
            }
         }
         return [Note.SHOW_NEYBOUR_ACTION_MENU,Note.ON_UPDATE_BALLON_DARTS,Note.ON_REGISTER_COMMUNITY_PAYIN_EVENT,DataNote.APP_MODE_CHANGED,Note.ON_REGISTER_BOARDGAME,Note.EVENT_UI_MINIMIZE,Note.HIDE_EVENT_UI,DataNote.COLLECTABLE_UPDATED].concat(_loc1_);
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:DisplayIconVo = null;
         if(this.genericEventUI)
         {
            for each(_loc2_ in this.eventProxy.genericGUIConfigHandler.displayIcons)
            {
               if(param1.getName() == _loc2_.actionNoteName)
               {
                  this.genericEventUI.getButton(_loc2_.nr).counter.value = _loc2_.callback(facade,param1.getBody(),_loc2_.itemId);
                  this.genericEventUI.getButton(_loc2_.nr).button.enabled = true;
               }
            }
            switch(param1.getName())
            {
               case Note.SHOW_NEYBOUR_ACTION_MENU:
                  this.genericEventUI.minimize();
                  break;
               case Note.EVENT_UI_MINIMIZE:
                  this.genericEventUI.minimize();
                  break;
               case DataNote.APP_MODE_CHANGED:
                  this.genericEventUI.visible = this.appProxy.currentAppMode == AppMode.NORMAL;
                  break;
               case Note.HIDE_EVENT_UI:
                  this.genericEventUI.visible = false;
                  break;
               case Note.ON_UPDATE_BALLON_DARTS:
               case DataNote.COLLECTABLE_UPDATED:
                  this.updateCollectables();
                  break;
               case Note.ON_REGISTER_BOARDGAME:
               case Note.ON_REGISTER_COMMUNITY_PAYIN_EVENT:
                  this.refreshItem();
            }
         }
      }
      
      private function refreshItem() : void
      {
         var _loc1_:CentralIconVo = this.eventProxy.genericGUIConfigHandler.centralIcon();
         this.genericEventUI.displayImg.spriteClassDisplay = new WrapedSprite(_loc1_.eventName,_loc1_.iconType,0,65,65);
         if(Boolean(_loc1_.infoMediator) && (this.eventProxy.isEventActive(this.eventProxy.genericGUIConfigHandler.runningBoardGameEvent) || this.eventProxy.isEventActive(this.eventProxy.genericGUIConfigHandler.runningCommunityEvent)))
         {
            new _loc1_.infoMediator(this.genericEventUI.extraButtonsGroup,_loc1_.eventId);
         }
      }
      
      override public function onRegister() : void
      {
         this.collectableProxy = facade.retrieveProxy(CollectablesProxy.NAME) as CollectablesProxy;
         this.appProxy = facade.retrieveProxy(AppProxy.NAME) as AppProxy;
         this.eventProxy = facade.retrieveProxy(GlobalEventProxy.NAME) as GlobalEventProxy;
         this.inventoryProxy = facade.retrieveProxy(InventoryProxy.NAME) as InventoryProxy;
         this.setup();
      }
      
      private function updateCollectables() : void
      {
         var _loc2_:BoardgameVo = null;
         var _loc3_:BoardgameCollVo = null;
         var _loc1_:int = 0;
         if(this.boardgameProxy)
         {
            _loc2_ = this.boardgameProxy.proxyDataById(this.eventProxy.genericGUIConfigHandler.runningBoardGameEvent);
         }
         if(_loc2_ != null)
         {
            for each(_loc3_ in _loc2_.collect)
            {
               _loc1_++;
               if(this.genericEventUI.getButton(String("id" + _loc1_)))
               {
                  (this.genericEventUI.getButton(String("id" + _loc1_)) as GenericCircularCounter).counter.value = this.collectableProxy.getCollectableAmmount(_loc3_.itemId);
               }
            }
            if(this.genericEventUI.getButton(String("counter")))
            {
               (this.genericEventUI.getButton(String("counter")) as GenericCircularCounter).counter.value = this.eventProxy.ballonProxy.getCounter();
            }
         }
      }
      
      private function get boardgameProxy() : BoardgameProxy
      {
         return facade.retrieveProxy(BoardgameProxy.NAME) as BoardgameProxy;
      }
      
      private function setup() : void
      {
         var _loc2_:GenericCircularCounter = null;
         var _loc3_:int = 0;
         var _loc4_:DisplayIconVo = null;
         var _loc1_:CentralIconVo = this.eventProxy.genericGUIConfigHandler.centralIcon();
         if(_loc1_)
         {
            this.genericEventUI.mainButtonEnabled = true;
            this.genericEventUI.addEventListener(GenericGUIEvent.BUTTON_CLICKED,this.subButtonClicked);
            this.genericEventUI.addEventListener(GenericGUIEvent.MAIN_CLICKED,this.mainButtonClicked);
            this.genericEventUI.top = this.eventProxy.genericGUIConfigHandler.top;
            this.genericEventUI.right = this.eventProxy.genericGUIConfigHandler.right;
            this.genericEventUI.displayImg.automaticCentralize = false;
            this.genericEventUI.displayImg.spriteClassDisplay = new WrapedSprite(_loc1_.eventName + "Icon",_loc1_.iconType,0);
            _loc3_ = 0;
            this.genericEventUI.visible = this.appProxy.currentAppMode == AppMode.NORMAL;
            for each(_loc4_ in this.eventProxy.genericGUIConfigHandler.displayIcons())
            {
               if(_loc4_)
               {
                  switch(_loc4_.nr)
                  {
                     case GenericGUIConfigHandler.TYPE_COUNTER:
                        _loc2_ = this.createCounterButton(_loc4_);
                        _loc2_.x = 40;
                        _loc2_.y = 100;
                        break;
                     default:
                        _loc2_ = this.createSubButton(_loc4_,_loc3_);
                        _loc2_.x = AngleUtils.getCirclePosition(1,Math.PI,80,Math.PI / 3).x;
                        _loc2_.y = AngleUtils.getCirclePosition(1,Math.PI,80,Math.PI / 3).y;
                  }
                  _loc3_++;
               }
               else
               {
                  _loc2_.counter.visible = false;
               }
            }
            if(Boolean(_loc1_.infoMediator) && this.eventProxy.isEventActive(this.eventProxy.genericGUIConfigHandler.runningBoardGameEvent))
            {
               new _loc1_.infoMediator(this.genericEventUI.extraButtonsGroup,_loc1_.eventId);
            }
            this.updateCollectables();
         }
         else
         {
            this.genericEventUI.visible = false;
         }
      }
      
      private function createCounterButton(param1:DisplayIconVo) : GenericCircularCounter
      {
         var _loc2_:GenericCircularCounter = null;
         _loc2_ = this.genericEventUI.addButton(param1.nr);
         _loc2_.valueId = String(param1.itemId);
         _loc2_.button.displayImg.automaticCentralize = false;
         _loc2_.button.imgBackground.verticalCenter = 0;
         _loc2_.button.imgBackground.horizontalCenter = 0;
         _loc2_.counter.right = -25;
         _loc2_.counter.bottom = -25;
         _loc2_.button.enabled = true;
         _loc2_.button.displayImg.currentState = "normal";
         _loc2_.button.displayImg.automaticCentralize = false;
         _loc2_.button.displayImg.spriteClassDisplay = new WrapedSprite(AssetIds.getPreviewAssetId(Categories.COLLECTIBLE,parseInt(_loc2_.valueId)),AssetConfig.DEFAULT_OBJECT_SPR,1,45,-1);
         _loc2_.button.bitmapDisplayPosX = _loc2_.button.displayImg.spriteClassDisplay.width - 4;
         _loc2_.button.bitmapDisplayPosY = _loc2_.button.displayImg.spriteClassDisplay.height - 2;
         _loc2_.button.displayImg.maskRectBottom = 45;
         return _loc2_;
      }
      
      private function createSubButton(param1:DisplayIconVo, param2:int) : GenericCircularCounter
      {
         var _loc3_:GenericCircularCounter = null;
         var _loc4_:Sprite = null;
         var _loc5_:CentralIconVo = null;
         _loc3_ = this.genericEventUI.addButton(param1.nr);
         _loc3_.index = param2;
         _loc3_.button.enabled = true;
         if(param1.callback != null)
         {
            _loc3_.counter.visible = true;
            _loc3_.counter.value = param1.callback(facade,null,param1.itemId);
            _loc3_.counter.setStyle("skinClass",CounterRectSmallSkin);
         }
         _loc3_.counter.visible = false;
         _loc3_.button.displayImg.currentState = "normal";
         _loc3_.button.displayImg.automaticCentralize = false;
         if(param1.asset)
         {
            _loc4_ = new WrapedSprite(param1.asset,param1.assetConfig,0,65,65);
            _loc4_.cacheAsBitmap = true;
            _loc3_.button.displayImg.spriteClassDisplay = _loc4_;
         }
         else
         {
            _loc4_ = new WrapedSprite(param1.asset,_loc5_.iconType,0,65,65);
            _loc4_.cacheAsBitmap = true;
            _loc5_ = this.eventProxy.genericGUIConfigHandler.centralIcon();
            this.genericEventUI.displayImg.spriteClassDisplay = _loc4_;
         }
         return _loc3_;
      }
      
      private function subButtonClicked(param1:GenericGUIEvent) : void
      {
         var _loc2_:DisplayIconVo = null;
         for each(_loc2_ in this.eventProxy.genericGUIConfigHandler.displayIcons())
         {
            if(_loc2_.nr == param1.id && Boolean(_loc2_.action))
            {
               super.facade.sendNotification(_loc2_.action,_loc2_.actionParams);
            }
         }
      }
      
      private function mainButtonClicked(param1:GenericGUIEvent = null) : void
      {
         var _loc2_:CentralIconVo = null;
         if(this.eventProxy.isEventActive(this.eventProxy.genericGUIConfigHandler.runningBoardGameEvent) || this.eventProxy.genericGUIConfigHandler.shouldDisplayIcon())
         {
            _loc2_ = this.eventProxy.genericGUIConfigHandler.centralIcon();
            facade.sendNotification(_loc2_.action,_loc2_.actionVars);
         }
         else
         {
            this.genericEventUI.visible = false;
         }
      }
      
      public function getPosition() : Point
      {
         var _loc1_:Point = new Point(this.genericEventUI.x,this.genericEventUI.y);
         var _loc2_:PlayFieldManager = facade.retrieveMediator(PlayFieldManager.NAME) as PlayFieldManager;
         return _loc2_.playField.stageToField(_loc1_);
      }
      
      public function get genericEventUI() : GenericEventUI
      {
         return this.getViewComponent() as GenericEventUI;
      }
   }
}

