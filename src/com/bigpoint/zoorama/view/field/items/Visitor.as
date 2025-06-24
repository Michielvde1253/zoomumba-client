package com.bigpoint.zoorama.view.field.items
{
   import com.bigpoint.utils.DisplayObjectHelper;
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.WishesConstants;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.FieldItemData;
   import com.bigpoint.zoomumba.model.visitorWishes.vo.VisitorWishesBubbleVO;
   import com.bigpoint.zoorama.MainConfig;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.core.VisitorManager;
   import com.bigpoint.zoorama.core.feature.FeatureActiveReference;
   import com.bigpoint.zoorama.data.OldWindowTypes;
   import com.bigpoint.zoorama.data.fieldItems.FieldVisitorData;
   import com.bigpoint.zoorama.notices.gui.window.WindowNotice;
   import com.bigpoint.zoorama.notices.view.field.VisitorNotice;
   import com.greensock.TweenLite;
   import com.greensock.easing.Linear;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class Visitor extends ItemAbstract
   {
      public static const EASTER_VISITOR_ID:int = 30;
      
      public static const ANIM_STAND:String = "stand";
      
      public static const ANIM_WALK:String = "walk";
      
      private static var ANIMATION_PHASE_NONE:int = -1;
      
      private static var ANIMATION_PHASE_START:int = 0;
      
      private static var ANIMATION_PHASE_END:int = 1;
      
      public static const ROTATION_DOWN:int = ItemAbstract.ROTATION_0;
      
      public static const ROTATION_LEFT:int = ItemAbstract.ROTATION_90;
      
      public static const ROTATION_UP:int = ItemAbstract.ROTATION_180;
      
      public static const ROTATION_RIGHT:int = ItemAbstract.ROTATION_270;
      
      private static const POSITION_BACK:String = "back";
      
      private static const POSITION_FRONT:String = "front";
      
      public static var checkMeId:int = 0;
      
      private var tileWidthQuarter:int = int(MainConfig.TILE_WIDTH / 4);
      
      private var tileHeightQuarter:int = int(MainConfig.TILE_WIDTH / 4);
      
      private var _lifeTimeStamp:int = 2147483647;
      
      private var _anim:String = "stand";
      
      private var position:Point = new Point();
      
      private var targetPosition:Point = new Point();
      
      private var fromPosition:Point = new Point();
      
      private var animationPhase:int = ANIMATION_PHASE_NONE;
      
      private var animationLeft:Number = -1;
      
      private var itemHolder:Sprite;
      
      private var bubble:VisitorWishesBubbleVO;
      
      private var bubbleContainer:Sprite;
      
      private var bubbleAnim:MovieClip;
      
      private var bubbleContent:Sprite;
      
      private var bubbleContentQuestion:Sprite;
      
      private var bubbleAnimationTime:Number = 0.5;
      
      public function Visitor(param1:Notifier, param2:Sprite, param3:int)
      {
         super(param1,param3);
         this.itemHolder = param2;
         this._category = Categories.VISITOR;
         this._groundRequired = ItemAbstract.GROUND_ROAD;
         this._itemFamily = ItemAbstract.ITEM_FAMILY_VEHICLE;
         this._rotatePos = ROTATION_UP;
         if(!canConstruct)
         {
            throw Error("This class can be created only with ItemFactory.as");
         }
         this.itemHeight = 1;
         this.itemWidth = 1;
         this._dragable = false;
         skin = new MovieClip();
         param2.addChild(this);
         this.addChild(this.skin);
         AssetLibrary.sendAssetToFunction(AssetIds.getFieldAssetId(this._category,this._itemId),this.hadleVisitorAsset);
      }
      
      internal static function getItemInstance(param1:Notifier, param2:Sprite, param3:int) : Visitor
      {
         canConstruct = true;
         var _loc4_:Visitor = new Visitor(param1,param2,param3);
         canConstruct = false;
         return _loc4_;
      }
      
      public function hideWishBubble(param1:VisitorWishesBubbleVO) : void
      {
         var _loc2_:String = null;
         this.bubble = param1;
         TweenLite.killTweensOf(this.bubbleContentQuestion);
         TweenLite.killTweensOf(this.bubbleAnim);
         TweenLite.killTweensOf(this.bubbleContent);
         DisplayObjectHelper.removeChild(this.bubbleContainer,this.bubbleContent);
         DisplayObjectHelper.removeChild(this.bubbleContainer,this.bubbleAnim);
         DisplayObjectHelper.removeChild(this.bubbleContainer,this.bubbleContentQuestion);
         this.bubbleContentQuestion = null;
         this.bubbleAnim = null;
         this.bubbleContent = null;
         if(param1 != null && param1.item != null)
         {
            switch(param1.state)
            {
               case WishesConstants.STATE_WISHING:
               case WishesConstants.STATE_WISHING_AGAIN:
                  _loc2_ = AssetConfig.COMMONS_WISH_BUBBLE_MC_DISAPPEARING;
                  break;
               case WishesConstants.STATE_LOVE:
                  _loc2_ = AssetConfig.COMMONS_WISH_BUBBLE_MC_LOVING_DISAPPEARING;
            }
            if(_loc2_)
            {
               this.bubbleAnim = AssetLibrary.getMovieClip(AssetConfig.ASSET_COMMONS_SYMBOLS,_loc2_);
               this.bubbleContainer.addChild(this.bubbleAnim);
               TweenLite.to(this.bubbleAnim,this.bubbleAnim.totalFrames / 12,{
                  "frame":this.bubbleAnim.totalFrames,
                  "onComplete":DisplayObjectHelper.removeChild,
                  "onCompleteParams":[this.bubbleContainer,this.bubbleAnim]
               });
            }
         }
      }
      
      public function showWishBubble(param1:VisitorWishesBubbleVO) : void
      {
         this.bubble = param1;
         if(this.bubbleContent != null)
         {
            this.hideWishBubble(param1);
         }
         var _loc2_:String = null;
         if(param1.item != null)
         {
            _loc2_ = AssetIds.getPreviewAssetId(param1.item.categoryId,param1.item.itemId,param1.item.baseLevel);
            if(param1.item.categoryId == Categories.DECOR)
            {
               _loc2_ = "decor_preview_all";
            }
         }
         else if(param1.type == WishesConstants.TYPE_ASK_CLEAN_ZOO)
         {
            _loc2_ = "trashOnRoad_preview_clean";
         }
         if(_loc2_)
         {
            AssetLibrary.sendAssetToFunction(_loc2_,this.loadedWish);
         }
      }
      
      private function loadedWish(param1:SWFAsset) : void
      {
         var _loc2_:String = null;
         if(this.bubble)
         {
            switch(this.bubble.state)
            {
               case WishesConstants.STATE_WISHING:
                  _loc2_ = AssetConfig.COMMONS_WISH_BUBBLE_MC_APPEARING;
                  break;
               case WishesConstants.STATE_WISHING_AGAIN:
                  _loc2_ = AssetConfig.COMMONS_WISH_BUBBLE_MC_APPEARING;
                  DisplayObjectHelper.removeChild(this.bubbleContainer,this.bubbleContentQuestion);
                  this.bubbleContentQuestion = AssetLibrary.getSprite(AssetConfig.ASSET_COMMONS_SYMBOLS,AssetConfig.COMMONS_WISH_BUBBLE_SPR_QUESTIONMARK);
                  break;
               case WishesConstants.STATE_LOVE:
                  _loc2_ = AssetConfig.COMMONS_WISH_BUBBLE_MC_LOVING;
            }
         }
         if(this.bubble != null && _loc2_ != null && this.bubbleContainer != null)
         {
            DisplayObjectHelper.removeChild(this.bubbleContainer,this.bubbleAnim);
            this.bubbleAnim = AssetLibrary.getMovieClip(AssetConfig.ASSET_COMMONS_SYMBOLS,_loc2_);
            this.bubbleContainer.addChild(this.bubbleAnim);
            this.bubbleContent = param1.getEmbededSprite("WishSPR");
            if(this.bubbleContentQuestion != null)
            {
               this.bubbleContainer.addChild(this.bubbleContentQuestion);
               this.bubbleContentQuestion.alpha = 0;
               this.bubbleContentQuestion.x = 3;
               this.bubbleContentQuestion.y = -46;
            }
            TweenLite.to(this.bubbleAnim,this.bubbleAnim.totalFrames / 12,{
               "frame":this.bubbleAnim.totalFrames,
               "onComplete":this.showWishIcon
            });
         }
      }
      
      private function showWishIcon() : void
      {
         if(this.bubble.state == WishesConstants.STATE_LOVE)
         {
            DisplayObjectHelper.removeChild(this.bubbleContainer,this.bubbleAnim);
            this.bubbleAnim = AssetLibrary.getMovieClip(AssetConfig.ASSET_COMMONS_SYMBOLS,AssetConfig.COMMONS_WISH_BUBBLE_MC_LOVING_SHINNING);
            this.bubbleContainer.addChild(this.bubbleAnim);
         }
         DisplayObjectHelper.removeChild(this.bubbleContainer,this.bubbleContent);
         if(this.bubbleContent)
         {
            this.bubbleContent.x = 2;
            this.bubbleContent.y = -48;
            this.bubbleContainer.addChild(this.bubbleContent);
         }
         if(this.bubbleContentQuestion)
         {
            this.oscilateQuestionMark();
         }
      }
      
      private function oscilateQuestionMark() : void
      {
         var targets:Array = null;
         if(this.bubbleContentQuestion != null && this.bubbleContent != null)
         {
            targets = [this.bubbleContentQuestion,this.bubbleContent];
            targets.sort(function(param1:DisplayObject, param2:DisplayObject):Number
            {
               if(param1.alpha > param2.alpha)
               {
                  return -1;
               }
               if(param1.alpha < param2.alpha)
               {
                  return 1;
               }
               return 0;
            });
            TweenLite.to(targets[0],this.bubbleAnimationTime,{
               "delay":1,
               "alpha":0
            });
            TweenLite.to(targets[1],this.bubbleAnimationTime,{
               "delay":1,
               "alpha":1,
               "onComplete":this.oscilateQuestionMark
            });
         }
      }
      
      private function hadleVisitorAsset(param1:SWFAsset) : void
      {
         var bounds:Rectangle = null;
         var visitorAsset:SWFAsset = param1;
         if(!_isDisposed)
         {
            skin = visitorAsset.getEmbededMovieClip("ObjectMC");
            skin.mouseEnabled = false;
            skin.mouseChildren = false;
            if(FeatureActiveReference.cashFieldItemsAsBitmap)
            {
               skin.cacheAsBitmap = true;
            }
            this.updateView();
            this.mouseEnabled = true;
            this.mouseChildren = true;
            this.bubbleContainer = new Sprite();
            bounds = skin.getBounds(this);
            this.bubbleContainer.x = bounds.x + bounds.width / 2;
            this.bubbleContainer.y = bounds.y - 5;
            this.bubbleContainer.scaleX = this.bubbleContainer.scaleY = 0.5;
            this.bubbleContainer.mouseEnabled = true;
            this.bubbleContainer.mouseChildren = false;
            this.bubbleContainer.buttonMode = true;
            this.bubbleContainer.addEventListener(MouseEvent.CLICK,function():void
            {
               notifier.dispatchNotice(new WindowNotice(WindowNotice.OPEN_WINDOW,OldWindowTypes.VISITOR_WISHES));
            });
            this.addChild(this.bubbleContainer);
         }
      }
      
      override public function updateState(param1:FieldItemData, param2:int) : void
      {
         var _loc3_:FieldVisitorData = FieldVisitorData(param1);
         if(_loc3_.uniqueId != -1)
         {
            this.uniqueId = _loc3_.uniqueId;
         }
         if(_loc3_.lifeTimeStamp != -1)
         {
            this._lifeTimeStamp = _loc3_.lifeTimeStamp;
         }
         if(_loc3_.posX != int.MIN_VALUE && _loc3_.posY != int.MIN_VALUE)
         {
            this.updateCords(new Point(_loc3_.posX,_loc3_.posY));
         }
         if(_loc3_.rotatePos != -1)
         {
            this._rotatePos = _loc3_.rotatePos;
         }
         super.updateState(_loc3_,param2);
         this.updateView();
      }
      
      private function updateView() : void
      {
         if(this.skin)
         {
            if(!this.contains(skin))
            {
               this.addChild(skin);
            }
            this.skin.gotoAndStop(this._anim);
            if(this.skin.action_mc)
            {
               switch(this._rotatePos)
               {
                  case ItemAbstract.ROTATION_0:
                     this.skin.action_mc.gotoAndStop(POSITION_FRONT);
                     this.skin.action_mc.scaleX = -1;
                     break;
                  case ItemAbstract.ROTATION_90:
                     this.skin.action_mc.gotoAndStop(POSITION_BACK);
                     this.skin.action_mc.scaleX = -1;
                     break;
                  case ItemAbstract.ROTATION_180:
                     this.skin.action_mc.gotoAndStop(POSITION_BACK);
                     this.skin.action_mc.scaleX = 1;
                     break;
                  case ItemAbstract.ROTATION_270:
                     this.skin.action_mc.gotoAndStop(POSITION_FRONT);
                     this.skin.action_mc.scaleX = 1;
               }
               this.scaleX = _zoomlevel;
               this.scaleY = _zoomlevel;
               if(this.skin.action_mc.direction_mc)
               {
                  this.skin.action_mc.direction_mc.gotoAndStop("zoom_" + _zoomlevel);
               }
            }
         }
      }
      
      private function repositionInCell() : void
      {
         notifier.dispatchNotice(new ItemNotice(ItemNotice.SEND_POSITION_IN_CELL,this._category,this._itemId,this._level,this.uniqueId,this._groundRequired,this._rotatePos,new Point(1,1)));
      }
      
      override public function set markType(param1:int) : void
      {
      }
      
      override public function set rotatePos(param1:int) : void
      {
         _rotatePos = param1;
         this.updateView();
      }
      
      override public function set zoomlevel(param1:Number) : void
      {
         switch(this.animationPhase)
         {
            case ANIMATION_PHASE_START:
               this.animationLeft = (this.targetPosition.x - this.x) / (this.targetPosition.x - this.position.x);
               break;
            case ANIMATION_PHASE_END:
               this.animationLeft = (this.position.x - this.x) / (this.position.x - this.fromPosition.x);
               break;
            case ANIMATION_PHASE_NONE:
         }
         TweenLite.killTweensOf(this);
         super.zoomlevel = param1;
         this.tileWidthQuarter = MainConfig.TILE_WIDTH * _zoomlevel / 4;
         this.tileHeightQuarter = MainConfig.TILE_HEIGHT * _zoomlevel / 4;
         this.updateView();
      }
      
      override public function updatePosition(param1:Point) : void
      {
         this.position = param1;
         super.updatePosition(param1);
         zDepth -= 3;
         if(this.animationLeft != -1)
         {
            switch(this.animationPhase)
            {
               case ANIMATION_PHASE_START:
                  this.moveVisitorStart(this.rotatePos);
                  break;
               case ANIMATION_PHASE_END:
                  this.moveVisitorEnd();
                  break;
               case ANIMATION_PHASE_NONE:
            }
         }
      }
      
      override public function updateCords(param1:Point) : void
      {
         _posX = param1.x;
         _posY = param1.y;
         recalculateZSortShift();
         if(_rotatePos == ItemAbstract.ROTATION_270 || _rotatePos == ItemAbstract.ROTATION_0)
         {
            zSortShift += MainConfig.TILE_HEIGHT;
            zDepth = this.y + zSortShift;
         }
         dispatchPositionUpdateNotification();
      }
      
      public function sendPositionInCell(param1:Point) : void
      {
         this.position = param1;
      }
      
      public function get anim() : String
      {
         return this._anim;
      }
      
      public function set anim(param1:String) : void
      {
         this._anim = param1;
         this.updateView();
      }
      
      public function get lifeTimeStamp() : int
      {
         return this._lifeTimeStamp;
      }
      
      public function moveVisitorStart(param1:int) : void
      {
         this.animationPhase = ANIMATION_PHASE_START;
         this.repositionInCell();
         this.anim = Visitor.ANIM_WALK;
         this.rotatePos = param1;
         switch(param1)
         {
            case Visitor.ROTATION_DOWN:
               this.targetPosition.x = this.x - this.tileWidthQuarter;
               this.targetPosition.y = this.y + this.tileHeightQuarter;
               break;
            case Visitor.ROTATION_LEFT:
               this.targetPosition.x = this.x - this.tileWidthQuarter;
               this.targetPosition.y = this.y - this.tileHeightQuarter;
               break;
            case Visitor.ROTATION_UP:
               this.targetPosition.x = this.x + this.tileWidthQuarter;
               this.targetPosition.y = this.y - this.tileHeightQuarter;
               break;
            case Visitor.ROTATION_RIGHT:
               this.targetPosition.x = this.x + this.tileWidthQuarter;
               this.targetPosition.y = this.y + this.tileHeightQuarter;
         }
         var _loc2_:Number = VisitorManager.HALF_TRAVEL_TIME;
         if(this.animationLeft != -1)
         {
            this.x = this.targetPosition.x - (this.targetPosition.x - this.position.x) * this.animationLeft;
            this.y = this.targetPosition.y - (this.targetPosition.y - this.position.y) * this.animationLeft;
            _loc2_ *= this.animationLeft;
            this.animationLeft = -1;
         }
         if(this.alpha < 1)
         {
            this.alpha = 1;
         }
         TweenLite.to(this,_loc2_,{
            "x":this.targetPosition.x,
            "y":this.targetPosition.y,
            "ease":Linear.easeNone,
            "onComplete":this.endMoveVisitorStart
         });
      }
      
      private function endMoveVisitorStart() : void
      {
         switch(this.rotatePos)
         {
            case Visitor.ROTATION_DOWN:
               this.updateCords(new Point(this._posX,this._posY + 1));
               break;
            case Visitor.ROTATION_LEFT:
               this.updateCords(new Point(this._posX - 1,this._posY));
               break;
            case Visitor.ROTATION_UP:
               this.updateCords(new Point(this._posX,this._posY - 1));
               break;
            case Visitor.ROTATION_RIGHT:
               this.updateCords(new Point(this._posX + 1,this._posY));
         }
         this.moveVisitorEnd();
      }
      
      private function moveVisitorEnd() : void
      {
         this.animationPhase = ANIMATION_PHASE_END;
         this.repositionInCell();
         switch(this.rotatePos)
         {
            case Visitor.ROTATION_DOWN:
               this.fromPosition.x = this.position.x + this.tileWidthQuarter;
               this.fromPosition.y = this.position.y - this.tileHeightQuarter;
               break;
            case Visitor.ROTATION_LEFT:
               this.fromPosition.x = this.position.x + this.tileWidthQuarter;
               this.fromPosition.y = this.position.y + this.tileHeightQuarter;
               break;
            case Visitor.ROTATION_UP:
               this.fromPosition.x = this.position.x - this.tileWidthQuarter;
               this.fromPosition.y = this.position.y + this.tileHeightQuarter;
               break;
            case Visitor.ROTATION_RIGHT:
               this.fromPosition.x = this.position.x - this.tileWidthQuarter;
               this.fromPosition.y = this.position.y - this.tileHeightQuarter;
         }
         this.x = this.fromPosition.x;
         this.y = this.fromPosition.y;
         var _loc1_:Number = VisitorManager.HALF_TRAVEL_TIME;
         if(this.animationLeft != -1)
         {
            this.x = this.position.x - (this.position.x - this.fromPosition.x) * this.animationLeft;
            this.y = this.position.y - (this.position.y - this.fromPosition.y) * this.animationLeft;
            _loc1_ *= this.animationLeft;
            this.animationLeft = -1;
         }
         TweenLite.to(this,_loc1_,{
            "x":this.position.x,
            "y":this.position.y,
            "ease":Linear.easeNone,
            "onComplete":this.handleAnimationEnd
         });
      }
      
      public function standStill() : void
      {
         this.anim = Visitor.ANIM_STAND;
      }
      
      private function handleAnimationEnd() : void
      {
         this.animationPhase = ANIMATION_PHASE_NONE;
         this.notifier.dispatchNotice(new VisitorNotice(VisitorNotice.WALK_ONE_CELL_END,this.uniqueId));
      }
      
      override public function dispose() : void
      {
         this.position = null;
         this.targetPosition = null;
         this.fromPosition = null;
         TweenLite.killTweensOf(this);
         if(skin)
         {
            this.itemHolder.removeChild(this);
            this.itemHolder = null;
            this.removeChild(skin);
            skin = null;
         }
         super.dispose();
      }
   }
}

