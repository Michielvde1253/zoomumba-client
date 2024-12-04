package com.bigpoint.zoomumba.view.features.collectables
{
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.utils.timeManager.TimeTrack;
   import com.bigpoint.zoomumba.constants.DataNote;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.items.ItemVO;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.features.collectables.CollectablesProxy;
   import com.bigpoint.zoomumba.model.gameConfig.CollectionSetsConfigProxy;
   import com.bigpoint.zoomumba.model.gameConfig.vo.CollectionSetConfigVO;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.quests.QuestWindowInitParams;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.core.PlayFieldManager;
   import com.greensock.TweenLite;
   import com.greensock.easing.Strong;
   import custom.mainInterface.collectables.CollectablesPanel;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import org.puremvc.as3.interfaces.IMediator;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.mediator.Mediator;
   
   public class CollectablesPanelMediator extends Mediator implements IMediator
   {
      public static const NAME:String = "CollectablesPanelMediator";
      
      private var collSetConfigProxy:CollectionSetsConfigProxy;
      
      private var collectableProxy:CollectablesProxy;
      
      private var collectionId:int = -1;
      
      private var autoCloseTimeTrack:TimeTrack;
      
      private const CLOSE_DELAY:int = 4;
      
      private var openPosition:Point = new Point(0,0);
      
      public function CollectablesPanelMediator(param1:CollectablesPanel)
      {
         this.autoCloseTimeTrack = TimeManager.creatEmptyTrack(this.handleAutoClose);
         super(NAME,param1);
         this.collectablePanel.visible = false;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Note.SHOW_COLLECTABLES_PANEL,Note.HIDE_COLLECTABLES_PANEL,Note.APP_RESIZED,DataNote.COLLECTABLE_UPDATED];
      }
      
      override public function onRegister() : void
      {
         this.collSetConfigProxy = facade.retrieveProxy(CollectionSetsConfigProxy.NAME) as CollectionSetsConfigProxy;
         this.collectableProxy = facade.retrieveProxy(CollectablesProxy.NAME) as CollectablesProxy;
         this.collectablePanel.bookButton.addEventListener(MouseEvent.CLICK,this.handlePanelClick);
         this.openPosition.x = 0;
         this.collectablePanel.right = -80;
      }
      
      private function handlePanelClick(param1:MouseEvent) : void
      {
         sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.QUESTS,"",new QuestWindowInitParams(2,this.collectionId)));
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:int = 0;
         switch(param1.getName())
         {
            case Note.SHOW_COLLECTABLES_PANEL:
               sendNotification(Note.EVENT_UI_MINIMIZE);
               this.timedClose();
               this.showSet(param1.getBody() as int);
               _loc2_ = param1.getBody() as int;
               this.collectablePanel.visible = true;
               TweenLite.to(this.collectablePanel,0.3,{
                  "right":80,
                  "ease":Strong.easeOut,
                  "visible":true
               });
               if(this.openPosition.x == 0)
               {
                  this.openPosition.x = this.collectablePanel.x - this.collectablePanel.width - 80;
               }
               break;
            case Note.HIDE_COLLECTABLES_PANEL:
               TweenLite.to(this.collectablePanel,0.5,{
                  "right":-80,
                  "ease":Strong.easeIn,
                  "visible":false,
                  "onComplete":this.resetPosX
               });
               break;
            case DataNote.COLLECTABLE_UPDATED:
               this.updateCollectables(param1.getBody() as int);
               break;
            case Note.APP_RESIZED:
               this.resetPosX();
         }
      }
      
      private function resetPosX() : void
      {
         this.openPosition.x = 0;
      }
      
      private function timedClose() : void
      {
         var _loc1_:int = TimeManager.currentTime + this.CLOSE_DELAY;
         TimeManager.updateTrackTime(this.autoCloseTimeTrack,_loc1_);
      }
      
      private function handleAutoClose() : void
      {
         TimeManager.removeTrack(this.autoCloseTimeTrack);
         sendNotification(Note.HIDE_COLLECTABLES_PANEL);
      }
      
      private function updateCollectables(param1:int) : void
      {
         var _loc2_:CollectionSetConfigVO = null;
         var _loc3_:int = 0;
         var _loc4_:ItemVO = null;
         if(this.collectionId != -1)
         {
            _loc2_ = this.collSetConfigProxy.getSetConfigByCollectionId(this.collectionId);
            _loc3_ = 0;
            while(_loc3_ < _loc2_.collectables.length)
            {
               _loc4_ = _loc2_.collectables[_loc3_];
               if(_loc4_.itemId == param1)
               {
                  this.updageItemCount(_loc3_,this.collectableProxy.getCollectableAmmount(param1),this.collectableProxy.isCollectableCollected(param1));
               }
               _loc3_++;
            }
         }
      }
      
      private function showSet(param1:int) : void
      {
         var _loc4_:ItemVO = null;
         var _loc5_:DisplayObjectContainer = null;
         var _loc6_:int = 0;
         this.collectionId = param1;
         var _loc2_:CollectionSetConfigVO = this.collSetConfigProxy.getSetConfigByCollectionId(param1);
         while(this.collectablePanel.setItemHolder.numChildren > 0)
         {
            this.collectablePanel.setItemHolder.removeChild(this.collectablePanel.setItemHolder.getChildAt(0));
         }
         AssetLibrary.sendAssetToFunction(AssetIds.getPreviewAssetForItemVO(_loc2_.setCategory,_loc2_.setItemId),this.handleCollectionSetIcon);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.collectables.length)
         {
            _loc4_ = _loc2_.collectables[_loc3_];
            _loc5_ = this.collectablePanel["itemHolder" + (_loc3_ + 1)];
            while(_loc5_.numChildren > 0)
            {
               _loc5_.removeChild(_loc5_.getChildAt(0));
            }
            _loc6_ = this.collectableProxy.getCollectableAmmount(_loc4_.itemId);
            AssetLibrary.sendAssetToFunction(AssetIds.getPreviewAssetId(_loc4_.category,_loc4_.itemId),this.handleCollectable,_loc5_);
            this.updageItemCount(_loc3_,_loc6_,this.collectableProxy.isCollectableCollected(_loc4_.itemId));
            _loc3_++;
         }
      }
      
      private function updageItemCount(param1:int, param2:int, param3:Boolean) : void
      {
         this.collectablePanel["itemCounter" + (param1 + 1)].value = param2;
         var _loc4_:DisplayObjectContainer = this.collectablePanel["itemHolder" + (param1 + 1)];
         if(param3)
         {
            if(param1 == 4)
            {
               this.collectablePanel.unknownIcon.visible = false;
               _loc4_.visible = true;
            }
            if(param2 == 0)
            {
               TweenLite.to(_loc4_,0.01,{"colorMatrixFilter":{
                  "saturation":0,
                  "alpha":1
               }});
            }
            else
            {
               TweenLite.to(_loc4_,0.01,{"colorMatrixFilter":{
                  "saturation":1,
                  "alpha":1
               }});
            }
         }
         else if(param1 == 4)
         {
            this.collectablePanel.unknownIcon.visible = true;
            _loc4_.visible = false;
            TweenLite.to(_loc4_,0.01,{"colorMatrixFilter":{
               "saturation":1,
               "alpha":1
            }});
         }
         else
         {
            TweenLite.to(_loc4_,0.01,{"colorMatrixFilter":{
               "saturation":0,
               "alpha":0.5
            }});
         }
      }
      
      private function handleCollectionSetIcon(param1:SWFAsset) : void
      {
         var _loc2_:Sprite = param1.getEmbededSprite(AssetConfig.DEFAULT_OBJECT_SPR);
         _loc2_.scaleX = _loc2_.scaleY = 0.5;
         this.collectablePanel.setItemHolder.addChild(_loc2_);
      }
      
      private function handleCollectable(param1:SWFAsset, param2:DisplayObjectContainer) : void
      {
         var _loc3_:Sprite = param1.getEmbededSprite(AssetConfig.DEFAULT_OBJECT_SPR);
         _loc3_.scaleX = _loc3_.scaleY = 0.5;
         param2.addChild(_loc3_);
      }
      
      private function get collectablePanel() : CollectablesPanel
      {
         return this.viewComponent as CollectablesPanel;
      }
      
      public function getItemPosition(param1:int) : Point
      {
         var _loc2_:Point = new Point(this.openPosition.x,this.collectablePanel.y);
         if(param1 >= 1 && param1 < 6)
         {
            _loc2_.x += this.collectablePanel["itemHolder" + param1].x;
            _loc2_.y += this.collectablePanel["itemHolder" + param1].y;
         }
         var _loc3_:PlayFieldManager = facade.retrieveMediator(PlayFieldManager.NAME) as PlayFieldManager;
         return _loc3_.playField.stageToField(_loc2_);
      }
   }
}

