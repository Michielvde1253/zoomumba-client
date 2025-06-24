package com.bigpoint.zoomumba.view.windows.events.boardgameEvent.effect
{
   import com.bigpoint.zoomumba.model.gameConfig.CollectionPoolSetProxy;
   import com.bigpoint.zoomumba.view.windows.events.boardgameEvent.asCompontents.BoardgameCollectItemComponent;
   import com.bigpoint.zoomumba.view.windows.events.boardgameEvent.asCompontents.BoardgameRewardItemComponent;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.geom.Point;
   import mx.core.UIComponent;
   
   public class IconTweenEvent extends EventDispatcher
   {
      public static const ICON_TWEEN_FINISHED:String = "iconTweenFinished";
      
      private var _asset:Sprite;
      
      private var _collectionPool:CollectionPoolSetProxy;
      
      private var _tweenIcons:Vector.<TweenIcon>;
      
      private var _boardReward:BoardgameRewardItemComponent;
      
      public function IconTweenEvent(param1:Sprite, param2:CollectionPoolSetProxy)
      {
         super();
         this._asset = param1;
         this._collectionPool = param2;
         this._tweenIcons = new Vector.<TweenIcon>();
      }
      
      public function get boardReward() : BoardgameRewardItemComponent
      {
         return this._boardReward;
      }
      
      public function set boardReward(param1:BoardgameRewardItemComponent) : void
      {
         this._boardReward = param1;
      }
      
      public function tweenItems(param1:BoardgameCollectItemComponent, param2:BoardgameRewardItemComponent, param3:int = 0, param4:UIComponent = null) : void
      {
         var _loc5_:int = 0;
         var _loc6_:Point = null;
         var _loc7_:Point = null;
         var _loc8_:Sprite = null;
         var _loc9_:TweenIcon = null;
         if(Boolean(param1) && Boolean(param2))
         {
            if(param3 > 10)
            {
               param3 = 10;
            }
            this.boardReward = param2;
            _loc5_ = 0;
            while(_loc5_ < param3)
            {
               _loc6_ = new Point(param1.asset.x,param1.asset.y);
               _loc7_ = new Point(param2.asset.x,param2.asset.y);
               _loc8_ = this._collectionPool.getCopiedCollectionsItemById(param1.collVo.itemId);
               _loc8_.alpha = 0.8;
               _loc9_ = new TweenIcon(_loc8_,_loc6_,_loc7_,0.3,_loc5_ * 0.15);
               _loc9_.addEventListener(Event.COMPLETE,this.onComplete,false,0,true);
               this._asset.addChild(_loc9_);
               if(param4 != null)
               {
                  param4.addChild(_loc9_);
               }
               else
               {
                  this._asset.addChild(_loc9_);
               }
               this._tweenIcons.push(_loc9_);
               _loc5_++;
            }
         }
      }
      
      private function onComplete(param1:Event) : void
      {
         var _loc2_:TweenIcon = param1.target as TweenIcon;
         _loc2_.removeEventListener(Event.COMPLETE,this.onComplete);
         if(this._asset.contains(_loc2_))
         {
            this._asset.removeChild(_loc2_);
         }
         var _loc3_:int = 0;
         while(_loc3_ < this._tweenIcons.length)
         {
            _loc2_.destroy();
            if(this._tweenIcons[_loc3_] == _loc2_)
            {
               this._tweenIcons.splice(_loc3_,1);
            }
            if(this._tweenIcons.length == 0)
            {
               dispatchEvent(new Event(ICON_TWEEN_FINISHED));
            }
            _loc3_++;
         }
         _loc2_ = null;
      }
      
      public function destory() : void
      {
         var _loc1_:TweenIcon = null;
         var _loc2_:int = 0;
         while(_loc2_ < this._tweenIcons.length)
         {
            _loc1_ = this._tweenIcons[_loc2_];
            if(this._asset.contains(_loc1_))
            {
               this._asset.removeChild(_loc1_);
            }
            _loc1_.removeEventListener(Event.COMPLETE,this.onComplete);
            _loc1_.destroy();
            _loc2_++;
         }
         this._tweenIcons = null;
      }
   }
}

