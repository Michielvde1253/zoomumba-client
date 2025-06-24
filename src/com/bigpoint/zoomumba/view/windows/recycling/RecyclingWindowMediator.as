package com.bigpoint.zoomumba.view.windows.recycling
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.DataNote;
   import com.bigpoint.zoomumba.constants.GUINote;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.PreloaderTypes;
   import com.bigpoint.zoomumba.constants.RecyclingConst;
   import com.bigpoint.zoomumba.constants.Resources;
   import com.bigpoint.zoomumba.constants.SHOP;
   import com.bigpoint.zoomumba.constants.WATERSTOREHOUSE;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.cards.vo.CardHolderModes;
   import com.bigpoint.zoomumba.model.features.recycling.RecyclingProxy;
   import com.bigpoint.zoomumba.model.features.recycling.vo.RecyclingCardInfoVo;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.view.cards.group.CardGroupHolderMediator;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import com.bigpoint.zoorama.view.gui.tooltip.TooltipNewManager;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.recycling.RecyclingContent;
   import windows.custom.recycling.RecyclingWindow;
   
   public class RecyclingWindowMediator extends WindowMediator
   {
      public static const NAME:String = "RecyclingWindowMediator";
      
      private var window:RecyclingWindow;
      
      private var _recyclingProxy:RecyclingProxy;
      
      private var _cardGroupHolderMediator:CardGroupHolderMediator;
      
      private var _barOMeter:MovieClip;
      
      private var _infoButton:MovieClip;
      
      public function RecyclingWindowMediator(param1:RecyclingWindow)
      {
         super(NAME,param1);
         this.window = param1;
      }
      
      override public function onRegister() : void
      {
         this._recyclingProxy = facade.getProxy(RecyclingProxy) as RecyclingProxy;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Note.RECYCLING_SLOTS_REFRESHED,SHOP.REFRESH_RESOURCES,DataNote.COLLECTABLE_UPDATED,GUINote.RECYCLING_SLOT_TIMER_ENDED,Note.RESOURCES_UPDATED,Note.USER_DATA_UPDATED,Note.MANAGMENTCENTER_UPDATE,GUINote.RECYCLING_SLOT_ITEM_INSTANT_BUY,GUINote.RECYCLING_SLOT_ITEM_CHOOSE,Note.MANAGMENTCENTER_UPDATE,GUINote.RECYCLING_SLOT_TIMER_COMPLETE];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case Note.RECYCLING_SLOTS_REFRESHED:
               this.createRecyclingCards();
               this.updateTrashOMeter();
               this.window.preloaderVisibility = false;
               break;
            case GUINote.RECYCLING_SLOT_ITEM_CHOOSE:
               this.onClickCardItem(param1.getBody() as RecyclingCardInfoVo);
               break;
            case GUINote.RECYCLING_SLOT_ITEM_INSTANT_BUY:
               this._recyclingProxy.instantCollectReycleSlot((param1.getBody() as RecyclingCardInfoVo).slotDataVo.slotId);
               break;
            case GUINote.RECYCLING_SLOT_TIMER_COMPLETE:
            case GUINote.RECYCLING_SLOT_TIMER_ENDED:
               this._recyclingProxy.getRecylceSlots();
               break;
            case DataNote.COLLECTABLE_UPDATED:
            case SHOP.REFRESH_RESOURCES:
            case Note.RESOURCES_UPDATED:
            case Note.USER_DATA_UPDATED:
            case Note.MANAGMENTCENTER_UPDATE:
               this.updateTrashOMeter();
         }
      }
      
      private function onClickCardItem(param1:RecyclingCardInfoVo) : void
      {
         switch(param1.state)
         {
            case RecyclingConst.SLOT_TYPE_BUY:
               this._recyclingProxy.bookNewReycleSlot(param1.slotDataVo.slotId,param1.slotDataVo.amount);
               break;
            case RecyclingConst.SLOT_TYPE_FREE:
               sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.RECYCLING_CHOOSE_WINDOW,"",param1,null));
               break;
            case RecyclingConst.SLOT_TYPE_READY_FOR_COLLECT:
               this._recyclingProxy.collectReycleSlot(param1.slotDataVo.slotId);
         }
      }
      
      override public function init(param1:Object) : void
      {
         this.window.preloaderVisibility = true;
         AssetLibrary.sendAssetToFunction("RecyclingWindow",this.handleAssetLoad);
      }
      
      private function handleAssetLoad(param1:SWFAsset) : void
      {
         this.content.header_bg.source = param1.getEmbededBitmapData("Background");
         this._infoButton = param1.getEmbededMovieClip("infoButton");
         this._infoButton.mouseChildren = true;
         this._infoButton.mouseEnabled = true;
         this._infoButton.useHandCursor = true;
         this._infoButton.buttonMode = true;
         this._infoButton.addEventListener(MouseEvent.CLICK,this.openHelpComic);
         this.content.infoButton.useHandCursor = true;
         this.content.infoButton.addChild(this._infoButton);
         this._infoButton.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver,false,0,true);
         this._infoButton.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut,false,0,true);
         this._infoButton.gotoAndStop("out");
         this._barOMeter = param1.getEmbededMovieClip("baroMeter");
         this._barOMeter.stop();
         (this._barOMeter.getChildByName("icon_mc") as Sprite).addChild(new WrapedSprite(AssetIds.getPreviewAssetId(Categories.RESOURCES,Resources.TRASH),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI,-1,-1,1));
         this._barOMeter.addEventListener(MouseEvent.MOUSE_OVER,this.handleBarOMeterMouseOver);
         this._barOMeter.addEventListener(MouseEvent.MOUSE_OUT,this.handleBarOMeterMouseOut);
         this.content.buttonUpdateTrash.label = TextResourceModule.getText("zoo.window.upgrade.button");
         this.content.buttonUpdateTrash.addEventListener(MouseEvent.CLICK,this.handleUpgradeButtonClick);
         this.content.superFilterRarSymbol.addChild(this._barOMeter);
         this._recyclingProxy.getRecylceSlots();
         var _loc2_:Sprite = param1.getEmbededSprite("header_icon");
         initDynamicTitle(TextResourceModule.getText("zoo.window.recycling.title"),_loc2_);
         this.updateTrashOMeter();
      }
      
      private function onMouseOver(param1:MouseEvent) : void
      {
         this._infoButton.gotoAndStop("over");
      }
      
      private function onMouseOut(param1:MouseEvent) : void
      {
         this._infoButton.gotoAndStop("out");
      }
      
      private function openHelpComic(param1:MouseEvent) : void
      {
         sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.RECYCLING_COMIC_WINDOW,""));
      }
      
      private function handleUpgradeButtonClick(param1:MouseEvent) : void
      {
         var _loc2_:Object = new Object();
         _loc2_.id = WATERSTOREHOUSE.TRASH;
         _loc2_.level = this._recyclingProxy.recyclingNextLevelConfigVo;
         sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.WATERSTOREHOUSEUPDATE_WINDOW,"",_loc2_));
      }
      
      private function handleBarOMeterMouseOut(param1:MouseEvent) : void
      {
         TooltipNewManager.removeToolTip();
      }
      
      private function handleBarOMeterMouseOver(param1:MouseEvent) : void
      {
         var _loc2_:int = this._recyclingProxy.trashAmount;
         var _loc3_:int = this._recyclingProxy.trashMaxAmount;
         var _loc4_:String = TextResourceModule.getText("zoo.window.recycling.storage.info");
         _loc4_ = _loc4_.replace("%count%",_loc2_);
         _loc4_ = _loc4_.replace("%maxcount%",_loc3_);
         TooltipNewManager.setToolTip(this._barOMeter.getChildByName("icon_mc") as Sprite,_loc4_,false);
      }
      
      private function updateTrashOMeter() : void
      {
         var _loc1_:int = this._recyclingProxy.trashAmount;
         var _loc2_:int = this._recyclingProxy.trashMaxAmount;
         var _loc3_:int = Math.round(100 / _loc2_ * _loc1_);
         if(_loc3_ == 0)
         {
            _loc3_ = 1;
         }
         this.content.counter.value = _loc1_;
         this._barOMeter.gotoAndStop(_loc3_ * 10);
         if(this._recyclingProxy.recyclingNextLevelConfigVo)
         {
            this.content.buttonUpdateTrash.enabled = true;
         }
         else
         {
            this.content.buttonUpdateTrash.enabled = false;
         }
      }
      
      private function createRecyclingCards() : void
      {
         if(this._cardGroupHolderMediator == null)
         {
            this._cardGroupHolderMediator = new CardGroupHolderMediator(this.content.cardGroupHolder,CardHolderModes.RECYCLING_MODE);
            facade.registerMediator(this._cardGroupHolderMediator);
            this.content.cardGroupHolder.paginator.entriesPerPage = 3;
         }
         this._cardGroupHolderMediator.forceRemoveItems();
         this._cardGroupHolderMediator.onRemove();
         this._cardGroupHolderMediator.mode = CardHolderModes.RECYCLING_MODE;
         this._cardGroupHolderMediator.dataProvider = this._recyclingProxy.cardProductionHolderData;
      }
      
      override public function onRemove() : void
      {
         if(this._infoButton)
         {
            this._barOMeter.removeEventListener(MouseEvent.MOUSE_OVER,this.handleBarOMeterMouseOver);
            this._barOMeter.removeEventListener(MouseEvent.MOUSE_OUT,this.handleBarOMeterMouseOut);
         }
         if(this._infoButton)
         {
            this._infoButton.removeEventListener(MouseEvent.CLICK,this.openHelpComic);
            this._infoButton.removeEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
            this._infoButton.removeEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         }
         if(this._cardGroupHolderMediator)
         {
            this._cardGroupHolderMediator.forceRemoveItems();
            this._cardGroupHolderMediator.onRemove();
            facade.removeMediator(this._cardGroupHolderMediator.getMediatorName());
         }
         super.onRemove();
      }
      
      public function get content() : RecyclingContent
      {
         return this.window.getContent(0) as RecyclingContent;
      }
   }
}

