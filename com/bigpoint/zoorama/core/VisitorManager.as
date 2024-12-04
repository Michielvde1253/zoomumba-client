package com.bigpoint.zoorama.core
{
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.zoomumba.constants.AppMode;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.DataNote;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.app.core.AppProxy;
   import com.bigpoint.zoomumba.model.app.gameEvents.GlobalEventProxy;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.EventTypes;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.FieldItemData;
   import com.bigpoint.zoomumba.model.playfield.PlayfieldSettingsProxy;
   import com.bigpoint.zoomumba.model.user.events.UserEventProxy;
   import com.bigpoint.zoomumba.model.visitorWishes.vo.VisitorWishesBubbleVO;
   import com.bigpoint.zoorama.data.SoundEffectNames;
   import com.bigpoint.zoorama.data.fieldItems.FieldVisitorData;
   import com.bigpoint.zoorama.sound.SoundManager;
   import com.bigpoint.zoorama.view.field.PlayField;
   import com.bigpoint.zoorama.view.field.RoadItemTable;
   import com.bigpoint.zoorama.view.field.items.Visitor;
   import com.greensock.TweenLite;
   import flash.utils.Dictionary;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.mediator.Mediator;
   
   public class VisitorManager extends Mediator
   {
      public static const NAME:String = "VisitorManager";
      
      public static const VISITOR_ASSET_COUNT:int = 9;
      
      public static const HALF_TRAVEL_TIME:Number = 1;
      
      private const BIG_CHANCE:int = 95;
      
      private const SMALL_CHANCE:int = 5;
      
      private const VISITOR_POSIBLE:int = 10;
      
      private const VISITOR_BUFFER:int = 20;
      
      private const VISITOR_MAX:int = 30;
      
      private const VISITOR_LIFE_TIME:int = 200;
      
      private var appProxy:AppProxy;
      
      private var eventProxy:GlobalEventProxy;
      
      private var userEventProxy:UserEventProxy;
      
      private var playfieldSettingsProxy:PlayfieldSettingsProxy;
      
      private var notifier:Notifier;
      
      private var playField:PlayField;
      
      private var roadTable:RoadItemTable;
      
      private var allVisitors:Vector.<Visitor> = new Vector.<Visitor>(this.VISITOR_MAX);
      
      private var curentVisitorId:int = 0;
      
      private var oldiestVisitorId:int = 0;
      
      private var totalEventVisitors:int = 0;
      
      private var totalVisitors:int = 0;
      
      private var lastVisitorId:int = 0;
      
      private var neededVisitors:int = 0;
      
      private var neededEventVisitors:int = 0;
      
      private var spownPosX:int;
      
      private var spownPosY:int;
      
      private var shownIntervals:int;
      
      private var _enabled:Boolean = true;
      
      private var isEventLoopRunning:Boolean = false;
      
      private var esterCheckIntervals:int = 8;
      
      private var visitorIdForBunnyId:Dictionary = new Dictionary();
      
      public function VisitorManager(param1:Notifier, param2:PlayField, param3:RoadItemTable)
      {
         super(NAME);
         this.notifier = new Notifier(param1);
         this.playField = param2;
         this.roadTable = param3;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [DataNote.APP_MODE_CHANGED,Note.VISITOR_SHOW_BUBBLE,Note.VISITOR_HIDE_BUBBLE,Note.GAME_CHANGE_PLAYFIELD,Note.REMOVE_ALL_PLAYFIELD_ITEMS,Note.GLOBAL_EVENT_ESTER_END];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:VisitorWishesBubbleVO = null;
         var _loc3_:Visitor = null;
         switch(param1.getName())
         {
            case Note.REMOVE_ALL_PLAYFIELD_ITEMS:
               this.removeAllVisitors();
               this.removeEsterVisitors();
               break;
            case Note.GLOBAL_EVENT_ESTER_END:
               this.removeEsterVisitors();
               break;
            case DataNote.APP_MODE_CHANGED:
               this.handleAppModeChange();
               break;
            case Note.VISITOR_SHOW_BUBBLE:
               _loc2_ = param1.getBody() as VisitorWishesBubbleVO;
               _loc3_ = this.allVisitors[_loc2_.visitorId];
               if(_loc3_)
               {
                  _loc3_.showWishBubble(_loc2_);
               }
               break;
            case Note.VISITOR_HIDE_BUBBLE:
               _loc2_ = param1.getBody() as VisitorWishesBubbleVO;
               _loc3_ = this.allVisitors[_loc2_.visitorId];
               if(_loc3_)
               {
                  _loc3_.hideWishBubble(_loc2_);
               }
               break;
            case Note.GAME_CHANGE_PLAYFIELD:
               this.setVisitorPercentage(this.playfieldSettingsProxy.getAttractionPercent(this.playfieldSettingsProxy.getCurrentPlayFieldId()));
         }
      }
      
      override public function onRegister() : void
      {
         this.appProxy = facade.retrieveProxy(AppProxy.NAME) as AppProxy;
         this.eventProxy = facade.retrieveProxy(GlobalEventProxy.NAME) as GlobalEventProxy;
         this.userEventProxy = facade.retrieveProxy(UserEventProxy.NAME) as UserEventProxy;
         this.playfieldSettingsProxy = facade.getProxy(PlayfieldSettingsProxy);
         this.repeateCheckForVisitorSpowning();
      }
      
      private function handleAppModeChange() : void
      {
         switch(this.appProxy.currentAppMode)
         {
            case AppMode.VISIT_NEIGHBOUR:
               this.removeAllVisitors();
               this.removeEsterVisitors();
               break;
            case AppMode.NORMAL:
         }
      }
      
      public function setVisitorPercentage(param1:Number) : void
      {
         this.neededVisitors = Math.floor(this.VISITOR_POSIBLE * param1);
      }
      
      public function startSpowningVisitorsAt(param1:int, param2:int, param3:int) : void
      {
         this.spownPosX = param1;
         this.spownPosY = param2;
         this.shownIntervals = param3;
      }
      
      private function repeateCheckForVisitorSpowning() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(this.appProxy.currentAppMode != AppMode.VISIT_NEIGHBOUR)
         {
            this.neededEventVisitors = this.userEventProxy.getEsterBunnyCount();
            if(this.eventProxy.isEventActive(EventTypes.EASTER_EVENT) && this.totalEventVisitors < this.neededEventVisitors)
            {
               ++this.totalEventVisitors;
               _loc1_ = this.userEventProxy.getEsterNextBunnyId();
               _loc2_ = this.spownVisitorAt(this.spownPosX,this.spownPosY,Visitor.EASTER_VISITOR_ID);
               this.visitorIdForBunnyId[_loc2_] = _loc1_;
               if(!this.isEventLoopRunning)
               {
                  this.isEventLoopRunning = true;
                  TweenLite.delayedCall(this.esterCheckIntervals,this.repeateCheckForBunniesSpowningEggs);
               }
            }
            else if(this._enabled)
            {
               if(this.totalVisitors < this.neededVisitors)
               {
                  while(true)
                  {
                     _loc4_ = Math.floor(Math.random() * VISITOR_ASSET_COUNT) + 1;
                     if(_loc4_ != this.lastVisitorId)
                     {
                        break;
                     }
                  }
                  this.lastVisitorId = _loc4_;
                  this.spownVisitorAt(this.spownPosX,this.spownPosY,_loc4_);
               }
               _loc3_ = 0;
               while(_loc3_ < this.allVisitors.length)
               {
                  if(this.allVisitors[_loc3_])
                  {
                     if(this.allVisitors[_loc3_].lifeTimeStamp < TimeManager.currentTime)
                     {
                        this.removeVisitor(_loc3_);
                     }
                  }
                  _loc3_++;
               }
            }
         }
         TweenLite.delayedCall(this.shownIntervals,this.repeateCheckForVisitorSpowning);
      }
      
      private function repeateCheckForBunniesSpowningEggs() : void
      {
         var _loc1_:String = null;
         var _loc2_:int = 0;
         if(this.eventProxy.isEventActive(EventTypes.EASTER_EVENT))
         {
            for(_loc1_ in this.visitorIdForBunnyId)
            {
               _loc2_ = this.userEventProxy.getEsterNextEggIdForBunny(this.visitorIdForBunnyId[_loc1_],TimeManager.currentTime);
               if(_loc2_ >= 0)
               {
                  this.playField.spownEasternEggAtBunny(_loc2_,int(_loc1_),this.visitorIdForBunnyId[_loc1_]);
               }
            }
            TweenLite.delayedCall(this.esterCheckIntervals,this.repeateCheckForBunniesSpowningEggs);
         }
      }
      
      private function spownVisitorAt(param1:int, param2:int, param3:int) : int
      {
         ++this.totalVisitors;
         var _loc4_:FieldVisitorData = new FieldVisitorData();
         _loc4_.posX = param1;
         _loc4_.posY = param2;
         if(param3 == Visitor.EASTER_VISITOR_ID)
         {
            _loc4_.lifeTimeStamp = int.MAX_VALUE;
         }
         else
         {
            _loc4_.lifeTimeStamp = TimeManager.currentTime + this.VISITOR_LIFE_TIME;
         }
         SoundManager.getInstance().playSoundEffect(SoundEffectNames.SND_MONEY_EARN_3);
         _loc4_.itemId = param3;
         _loc4_.rotatePos = Visitor.ROTATION_UP;
         _loc4_.uniqueId = this.curentVisitorId;
         this.playField.setFieldItems(Vector.<FieldItemData>([_loc4_]),PlayField.GUESS_COMMANDID);
         this.allVisitors[this.curentVisitorId] = this.playField.getFieldItem(Categories.VISITOR,this.curentVisitorId) as Visitor;
         TweenLite.from(this.allVisitors[this.curentVisitorId],2,{"alpha":0});
         TweenLite.delayedCall(5,this.decideOnNextAction,[this.curentVisitorId]);
         ++this.curentVisitorId;
         if(this.curentVisitorId >= this.VISITOR_MAX - 1)
         {
            this.curentVisitorId = 0;
         }
         if(this.totalVisitors > this.VISITOR_POSIBLE)
         {
            if(this.allVisitors[this.oldiestVisitorId])
            {
               if(this.allVisitors[this.oldiestVisitorId].itemId != Visitor.EASTER_VISITOR_ID)
               {
                  this.removeVisitor(this.oldiestVisitorId);
               }
            }
            ++this.oldiestVisitorId;
            if(this.oldiestVisitorId >= this.VISITOR_MAX - 1)
            {
               this.oldiestVisitorId = 0;
            }
         }
         sendNotification(Note.VISITOR_ENTER_ZOO,_loc4_);
         return _loc4_.uniqueId;
      }
      
      public function decideOnNextAction(param1:int) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Vector.<int> = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:Number = NaN;
         var _loc11_:int = 0;
         var _loc2_:Visitor = this.allVisitors[param1];
         if(_loc2_)
         {
            if(_loc2_.isDisposed)
            {
               this.removeVisitor(param1);
            }
            else
            {
               _loc3_ = _loc2_.rotatePos;
               _loc4_ = -1;
               _loc5_ = Vector.<int>([0,0,0,0]);
               _loc6_ = 0;
               _loc7_ = 0;
               while(_loc7_ < _loc5_.length)
               {
                  switch(_loc7_)
                  {
                     case Visitor.ROTATION_DOWN:
                        if(this.roadTable.getCellRoadType(_loc2_.posX,_loc2_.posY + 1) > 0)
                        {
                           _loc5_[_loc7_] = this.BIG_CHANCE;
                        }
                        break;
                     case Visitor.ROTATION_LEFT:
                        if(this.roadTable.getCellRoadType(_loc2_.posX - 1,_loc2_.posY) > 0)
                        {
                           _loc5_[_loc7_] = this.BIG_CHANCE;
                        }
                        break;
                     case Visitor.ROTATION_UP:
                        if(this.roadTable.getCellRoadType(_loc2_.posX,_loc2_.posY - 1) > 0)
                        {
                           _loc5_[_loc7_] = this.BIG_CHANCE;
                        }
                        break;
                     case Visitor.ROTATION_RIGHT:
                        if(this.roadTable.getCellRoadType(_loc2_.posX + 1,_loc2_.posY) > 0)
                        {
                           _loc5_[_loc7_] = this.BIG_CHANCE;
                        }
                        break;
                  }
                  _loc6_ += _loc5_[_loc7_];
                  _loc7_++;
               }
               _loc8_ = (_loc3_ + 2) % 4;
               if(_loc5_[_loc8_])
               {
                  _loc5_[_loc8_] = this.SMALL_CHANCE;
                  _loc6_ -= this.BIG_CHANCE - this.SMALL_CHANCE;
               }
               if(_loc6_ > 0)
               {
                  _loc9_ = 0;
                  _loc10_ = _loc6_ * Math.random();
                  _loc11_ = 0;
                  while(_loc11_ < _loc5_.length - 1)
                  {
                     _loc9_ += _loc5_[_loc11_];
                     if(_loc10_ < _loc9_)
                     {
                        _loc4_ = _loc11_;
                        break;
                     }
                     _loc11_++;
                  }
                  if(_loc4_ == -1)
                  {
                     _loc4_ = int(_loc5_.length - 1);
                  }
                  _loc2_.moveVisitorStart(_loc4_);
               }
               else
               {
                  _loc2_.standStill();
               }
            }
         }
         else
         {
            sendNotification(Note.WARNING_REPORT,":::: ERROR :::: The visitor is NULL see VisitorManager.as line 208");
         }
      }
      
      private function removeVisitor(param1:int) : void
      {
         if(this.allVisitors[param1])
         {
            sendNotification(Note.VISITOR_LEAVE_ZOO,param1);
            TweenLite.to(this.allVisitors[param1],2,{
               "alpha":0,
               "onComplete":this.removeVisitorFromPlayfield,
               "onCompleteParams":[param1]
            });
            if(this.allVisitors[param1].anim)
            {
               this.allVisitors[param1].anim = Visitor.ANIM_STAND;
            }
            --this.totalVisitors;
         }
      }
      
      private function removeVisitorFromPlayfield(param1:int) : void
      {
         var _loc3_:FieldVisitorData = null;
         var _loc2_:Visitor = this.allVisitors[param1];
         if(Boolean(_loc2_) && !_loc2_.isDisposed)
         {
            _loc3_ = new FieldVisitorData();
            _loc3_.uniqueId = param1;
            _loc3_.del = 1;
            this.playField.setFieldItems(Vector.<FieldItemData>([_loc3_]),PlayField.GUESS_COMMANDID);
         }
         this.allVisitors[param1] = null;
      }
      
      public function get enabled() : Boolean
      {
         return this._enabled;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         if(this._enabled != param1)
         {
            this._enabled = param1;
            if(!this._enabled)
            {
               this.removeAllVisitors();
               this.removeEsterVisitors();
            }
         }
      }
      
      private function removeAllVisitors() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.allVisitors.length)
         {
            if(this.allVisitors[_loc1_])
            {
               if(this.allVisitors[_loc1_].itemId != Visitor.EASTER_VISITOR_ID)
               {
                  this.removeVisitor(_loc1_);
                  this.removeVisitorFromPlayfield(_loc1_);
                  TweenLite.killTweensOf(this.allVisitors[_loc1_]);
                  this.allVisitors[_loc1_] = null;
               }
            }
            _loc1_++;
         }
         this.totalVisitors = 0;
         this.lastVisitorId = 0;
         this.curentVisitorId = 0;
         this.oldiestVisitorId = 0;
      }
      
      private function removeEsterVisitors() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.allVisitors.length)
         {
            if(this.allVisitors[_loc1_])
            {
               if(this.allVisitors[_loc1_].itemId == Visitor.EASTER_VISITOR_ID)
               {
                  this.removeVisitor(_loc1_);
                  this.removeVisitorFromPlayfield(_loc1_);
                  TweenLite.killTweensOf(this.allVisitors[_loc1_]);
                  this.allVisitors[_loc1_] = null;
               }
            }
            _loc1_++;
         }
         this.totalEventVisitors = 0;
         this.isEventLoopRunning = false;
         TweenLite.killDelayedCallsTo(this.repeateCheckForBunniesSpowningEggs);
      }
   }
}

