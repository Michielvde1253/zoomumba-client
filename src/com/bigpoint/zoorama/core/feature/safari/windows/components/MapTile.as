package com.bigpoint.zoorama.core.feature.safari.windows.components
{
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.net.responceDataVo.safari.SafariTileData;
   import com.bigpoint.zoorama.core.feature.safari.notices.SafariTileNotice;
   import com.greensock.TweenMax;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class MapTile extends Sprite
   {
      private var notifier:Notifier;
      
      private var rowPos:int;
      
      private var columnPos:int;
      
      private var moveActionEnabled:Boolean = false;
      
      private var useJokerActionEnabled:Boolean = false;
      
      private var terainType:int = -1;
      
      private var isOpened:Boolean = false;
      
      private var contentType:int = -1;
      
      private var isMapped:Boolean = false;
      
      private var terainIcon:Sprite;
      
      private var contentPic:Sprite;
      
      private var jokerIdInUse:int = -1;
      
      private var tileShape:Sprite;
      
      private var fader:Shape;
      
      public function MapTile(param1:Notifier, param2:int, param3:int)
      {
         super();
         this.notifier = new Notifier(param1);
         this.columnPos = param3;
         this.rowPos = param2;
         this.tileShape = new Sprite();
         TweenMax.to(this.tileShape,0.001,{"glowFilter":{
            "color":16238370,
            "blurX":0,
            "blurY":0,
            "strength":0,
            "quality":1,
            "alpha":1,
            "knockout":true
         }});
         var _loc4_:Shape = new Shape();
         _loc4_.graphics.beginFill(0);
         _loc4_.graphics.drawRect(0,0,60,60);
         _loc4_.graphics.endFill();
         this.tileShape.addChild(_loc4_);
         this.addChild(this.tileShape);
         var _loc5_:Shape = new Shape();
         _loc5_.graphics.lineStyle(1,6433024);
         _loc5_.graphics.drawRect(0,0,60,60);
         this.addChild(_loc5_);
         this.fader = new Shape();
         this.fader.graphics.beginFill(0,0.4);
         this.fader.graphics.drawRect(0,0,60,60);
         this.fader.graphics.endFill();
         this.addChild(this.fader);
      }
      
      public function updateState(param1:SafariTileData) : void
      {
         if(this.terainType != param1.terainType || this.isOpened != param1.isOpened)
         {
            this.terainType = param1.terainType;
            this.isOpened = param1.isOpened;
            if(this.terainIcon)
            {
               this.removeChild(this.terainIcon);
               this.terainIcon = null;
            }
            this.fader.visible = !this.isOpened;
            if(!this.isOpened)
            {
               switch(this.terainType)
               {
                  case SafariTileData.TERAIN_TYPE_HARD:
                     this.terainIcon = AssetLibrary.getSprite("safari_gui","HardTerainIconSPR");
                     break;
                  case SafariTileData.TERAIN_TYPE_IMPASSABLE:
                     this.terainIcon = AssetLibrary.getSprite("safari_gui","InpassableTerainIconSPR");
                     break;
                  case SafariTileData.TERAIN_TYPE_EASY:
               }
            }
            if(this.terainIcon)
            {
               this.addChild(this.terainIcon);
               this.terainIcon.mouseEnabled = false;
               this.terainIcon.mouseChildren = false;
            }
         }
         if(this.contentType != param1.contentType || this.isMapped != param1.isMapped)
         {
            this.contentType = param1.contentType;
            this.isMapped = param1.isMapped;
            if(this.contentPic)
            {
               this.removeChild(this.contentPic);
            }
            if(this.isOpened)
            {
               switch(this.contentType)
               {
                  case SafariTileData.CONTENT_TYPE_ANIMAL:
                     this.contentPic = AssetLibrary.getSprite("safari_gui","ContentAnimalSPR");
                     break;
                  case SafariTileData.CONTENT_TYPE_TRAP:
                     this.contentPic = AssetLibrary.getSprite("safari_gui","ContentTrapSPR");
                     break;
                  case SafariTileData.CONTENT_TYPE_TREASURE:
                     this.contentPic = AssetLibrary.getSprite("safari_gui","ContentTreasureSPR");
                     break;
                  case SafariTileData.CONTENT_TYPE_TRAIL_UP:
                     this.contentPic = AssetLibrary.getSprite("safari_gui","ContentTracksSPR");
                     break;
                  case SafariTileData.CONTENT_TYPE_TRAIL_RIGHT:
                     this.contentPic = AssetLibrary.getSprite("safari_gui","ContentTracksSPR");
                     this.contentPic.rotation = 90;
                     this.contentPic.x = 60;
                     break;
                  case SafariTileData.CONTENT_TYPE_TRAIL_DOWN:
                     this.contentPic = AssetLibrary.getSprite("safari_gui","ContentTracksSPR");
                     this.contentPic.rotation = 180;
                     this.contentPic.x = 60;
                     this.contentPic.y = 60;
                     break;
                  case SafariTileData.CONTENT_TYPE_TRAIL_LEFT:
                     this.contentPic = AssetLibrary.getSprite("safari_gui","ContentTracksSPR");
                     this.contentPic.rotation = -90;
                     this.contentPic.y = 60;
                     break;
                  case SafariTileData.CONTENT_TYPE_EMPTY:
                  default:
                     this.contentPic = new Sprite();
               }
            }
            else if(this.isMapped)
            {
               this.contentPic = AssetLibrary.getSprite("safari_gui","ContentMappedSPR");
            }
            this.contentPic.mouseEnabled = false;
            this.contentPic.mouseChildren = false;
            this.addChild(this.contentPic);
         }
         if(this.moveActionEnabled)
         {
            this.enableMoveAction();
         }
      }
      
      public function dispose() : void
      {
         this.disableMoveAction();
         this.terainIcon = null;
         this.contentPic = null;
         this.tileShape = null;
      }
      
      public function enableMoveAction() : void
      {
         this.moveActionEnabled = true;
         if(this.tileShape)
         {
            TweenMax.to(this.tileShape,0.5,{"glowFilter":{
               "color":16238370,
               "blurX":15,
               "blurY":15,
               "strength":5,
               "quality":2,
               "alpha":1,
               "knockout":true
            }});
            this.tileShape.addEventListener(MouseEvent.CLICK,this.handleMoveAction);
            this.tileShape.useHandCursor = true;
            this.tileShape.buttonMode = true;
            this.tileShape.mouseChildren = false;
         }
      }
      
      public function disableMoveAction() : void
      {
         this.moveActionEnabled = false;
         if(this.tileShape)
         {
            TweenMax.to(this.tileShape,0.001,{"glowFilter":{
               "color":16238370,
               "blurX":0,
               "blurY":0,
               "strength":0,
               "quality":1,
               "alpha":1,
               "knockout":true
            }});
            this.tileShape.removeEventListener(MouseEvent.CLICK,this.handleMoveAction);
            this.tileShape.useHandCursor = false;
            this.tileShape.buttonMode = false;
         }
      }
      
      public function enableJokerSelectAction(param1:int) : void
      {
         this.jokerIdInUse = param1;
         this.useJokerActionEnabled = true;
         if(this.tileShape)
         {
            TweenMax.to(this.tileShape,0.5,{"glowFilter":{
               "color":8238848,
               "blurX":15,
               "blurY":15,
               "strength":4,
               "quality":2,
               "alpha":1,
               "knockout":true
            }});
            this.tileShape.addEventListener(MouseEvent.CLICK,this.handleJokerSelectAction);
            this.tileShape.useHandCursor = true;
            this.tileShape.buttonMode = true;
            this.tileShape.mouseChildren = false;
         }
      }
      
      public function disableJokerSelectAction() : void
      {
         this.jokerIdInUse = -1;
         this.useJokerActionEnabled = false;
         if(this.tileShape)
         {
            TweenMax.to(this.tileShape,0.001,{"glowFilter":{
               "color":16238370,
               "blurX":0,
               "blurY":0,
               "strength":0,
               "quality":1,
               "alpha":1,
               "knockout":true
            }});
            this.tileShape.removeEventListener(MouseEvent.CLICK,this.handleJokerSelectAction);
            this.tileShape.useHandCursor = false;
            this.tileShape.buttonMode = false;
         }
      }
      
      private function handleJokerSelectAction(param1:MouseEvent) : void
      {
         this.notifier.dispatchNotice(new SafariTileNotice(SafariTileNotice.USE_JOKER_ONTILE,this.columnPos,this.rowPos,this.jokerIdInUse));
         this.jokerIdInUse = -1;
      }
      
      private function handleMoveAction(param1:MouseEvent) : void
      {
         this.notifier.dispatchNotice(new SafariTileNotice(SafariTileNotice.EXPLORE_TILE,this.columnPos,this.rowPos));
      }
   }
}

