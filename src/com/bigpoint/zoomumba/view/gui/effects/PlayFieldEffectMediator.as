package com.bigpoint.zoomumba.view.gui.effects
{
   import com.bigpoint.zoomumba.constants.EFFECTCONST;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.view.gui.effects.effectItem.PlayFieldEffectItem;
   import com.bigpoint.zoomumba.view.gui.effects.effectScreen.EffectScreen;
   import com.bigpoint.zoomumba.view.gui.effects.misc.PlayFieldEffectConfig;
   import com.bigpoint.zoomumba.view.gui.effects.vo.PlayFieldEffectViewVo;
   import com.bigpoint.zoomumba.view.gui.effects.vo.PlayFieldEffectVo;
   import com.bigpoint.zoomumba.view.gui.effects.vo.StartEffectVo;
   import com.bigpoint.zoorama.MainConfig;
   import com.bigpoint.zoorama.view.field.PlayField;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.geom.Point;
   import org.puremvc.as3.interfaces.IMediator;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.mediator.Mediator;
   
   public class PlayFieldEffectMediator extends Mediator implements IMediator
   {
      public static const NAME:String = "PlayFieldEffectMediator";
      
      private var _currentEffectQuery:Vector.<StartEffectVo>;
      
      private var _swfAsset:SWFAsset;
      
      private var _effectItems:Vector.<PlayFieldEffectItem>;
      
      private var _effectScreen:EffectScreen;
      
      private var _config:PlayFieldEffectConfig;
      
      public function PlayFieldEffectMediator(param1:PlayFieldEffectViewVo)
      {
         super(NAME,param1);
      }
      
      override public function onRegister() : void
      {
         this._config = new PlayFieldEffectConfig();
         this._effectItems = new Vector.<PlayFieldEffectItem>();
         this._currentEffectQuery = new Vector.<StartEffectVo>();
         sendNotification(Note.START_BOARDGAME_WEATHER);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Note.TOGGLE_FULLSCREEN_MODE,Note.EXIT_FULLSCREEN_MODE,Note.APP_RESIZED,Note.START_PLAYFIELD_EFFECT,Note.GAME_CHANGE_PLAYFIELD,Note.GAME_RENDER_PLAYFIELD];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:StartEffectVo = null;
         switch(param1.getName())
         {
            case Note.EXIT_FULLSCREEN_MODE:
            case Note.TOGGLE_FULLSCREEN_MODE:
            case Note.APP_RESIZED:
            case Note.GAME_CHANGE_PLAYFIELD:
            case Note.GAME_RENDER_PLAYFIELD:
               this.updateEffectPositions();
               break;
            case Note.START_PLAYFIELD_EFFECT:
               _loc2_ = param1.getBody() as StartEffectVo;
               this.startEffect(_loc2_);
         }
      }
      
      public function startEffect(param1:StartEffectVo) : void
      {
         this._currentEffectQuery.push(param1);
         if(this._swfAsset == null)
         {
            AssetLibrary.sendAssetToFunction(EFFECTCONST.ASSET_NAME,this.handleAssetsLoaded);
         }
         else
         {
            this.initNextEffect();
         }
      }
      
      private function handleAssetsLoaded(param1:SWFAsset) : void
      {
         var _loc2_:int = 0;
         if(param1.id.search(EFFECTCONST.ASSET_NAME) != -1)
         {
            this._swfAsset = param1;
            this.initNextEffect();
         }
      }
      
      private function initNextEffect() : void
      {
         var _loc1_:PlayFieldEffectVo = null;
         var _loc2_:MovieClip = null;
         var _loc3_:PlayFieldEffectItem = null;
         var _loc4_:StartEffectVo = null;
         var _loc5_:PlayFieldEffectItem = null;
         var _loc6_:int = 0;
         if(this._currentEffectQuery.length > 0)
         {
            _loc4_ = this._currentEffectQuery.shift();
         }
         if(_loc4_)
         {
            _loc1_ = this._config.getEffectByName(_loc4_.effectName);
            if(_loc1_ == null)
            {
               return;
            }
            if(_loc1_.effectAction == EFFECTCONST.EFFECT_ACTION_DISPLAYDECO)
            {
               if(this._effectScreen != null)
               {
                  this.getViewByState(_loc1_.screenType).removeChild(this._effectScreen);
                  this._effectScreen = null;
               }
               this._effectScreen = new EffectScreen(_loc1_.name,this.getAssetRow(_loc1_.name),_loc1_);
               if(this._effectScreen == null)
               {
                  return;
               }
               this.getViewByState(_loc1_.screenType).addChild(this._effectScreen);
            }
            else
            {
               for each(_loc5_ in this._effectItems)
               {
                  _loc5_.updateState(EFFECTCONST.STATE_KILL);
               }
               _loc6_ = 0;
               while(_loc6_ < _loc1_.itemCount)
               {
                  _loc2_ = this.getRandomMcItem(_loc1_.name);
                  _loc3_ = new PlayFieldEffectItem(String(_loc6_.toString() + _loc1_.name),_loc2_,_loc1_,this.getMaxAreaByScreen(_loc1_.screenType));
                  _loc3_.addEventListener(PlayFieldEffectItem.EFFECT_ITEM_REMOVE,this.onItemUnload,false,0,true);
                  this.getViewByState(_loc1_.screenType).addChild(_loc3_);
                  this._effectItems.push(_loc3_);
                  _loc6_++;
               }
            }
            this.updateEffectPositions();
            this.initNextEffect();
         }
      }
      
      private function onItemUnload(param1:Event) : void
      {
         var _loc2_:PlayFieldEffectItem = param1.target as PlayFieldEffectItem;
         if(this.getViewByState(_loc2_.playFieldEffectVo.screenType).contains(_loc2_) <= 0)
         {
            this.getViewByState(_loc2_.playFieldEffectVo.screenType).removeChild(_loc2_);
         }
         _loc2_.destroy();
      }
      
      private function getMaxAreaByScreen(param1:String) : Point
      {
         var _loc2_:Point = new Point();
         if(param1 == EFFECTCONST.SCREEN_FIELD)
         {
            _loc2_.x = this.getFieldWidth();
            _loc2_.y = this.getFieldHeight();
         }
         else
         {
            _loc2_.x = this.getMaxWindowWidth();
            _loc2_.y = this.getMaxWindowHeight();
         }
         return _loc2_;
      }
      
      private function getRandomMcItem(param1:String) : MovieClip
      {
         var _loc2_:MovieClip = null;
         var _loc3_:MovieClip = null;
         var _loc4_:int = 0;
         _loc2_ = this.getAssetRow(param1);
         if(_loc2_)
         {
            _loc4_ = _loc2_.totalFrames;
            _loc2_.gotoAndStop(this.randomNr(1,_loc4_));
            _loc3_ = _loc2_["item_mc"];
            _loc3_.cacheAsBitmap = true;
         }
         return _loc3_;
      }
      
      private function getAssetRow(param1:String) : MovieClip
      {
         if(this._swfAsset != null)
         {
            return this._swfAsset.getEmbededMovieClip(param1);
         }
         return null;
      }
      
      private function updateEffectPositions() : void
      {
         var _loc1_:PlayFieldEffectItem = null;
         if(this._effectScreen != null)
         {
            this._effectScreen.update(this.getMaxAreaByScreen(this._effectScreen.playFieldEffectVo.screenType));
         }
         for each(_loc1_ in this._effectItems)
         {
            _loc1_.maxPos.x = this.getMaxAreaByScreen(_loc1_.playFieldEffectVo.screenType).x;
            _loc1_.maxPos.y = this.getMaxAreaByScreen(_loc1_.playFieldEffectVo.screenType).y;
         }
      }
      
      private function getViewByState(param1:String) : Sprite
      {
         switch(param1)
         {
            case EFFECTCONST.SCREEN_FIELD:
               return (viewComponent as PlayFieldEffectViewVo).fieldEffectDisplay;
            case EFFECTCONST.SCREEN_FRONT:
               return (viewComponent as PlayFieldEffectViewVo).frontEffectDisplay;
            default:
               return null;
         }
      }
      
      private function randomNr(param1:int, param2:int) : int
      {
         return Math.floor(Math.random() * (1 + param2 - param1)) + param1;
      }
      
      private function getFieldWidth() : int
      {
         return (facade.getMediator(PlayField) as PlayField).fieldWidth;
      }
      
      private function getFieldHeight() : int
      {
         return (facade.getMediator(PlayField) as PlayField).fieldHeight;
      }
      
      private function getMaxWindowWidth() : int
      {
         if((viewComponent as PlayFieldEffectViewVo).fieldEffectDisplay.stage)
         {
            return (viewComponent as PlayFieldEffectViewVo).fieldEffectDisplay.stage.stageWidth;
         }
         return MainConfig.STAGE_DEFALT_WIDTH;
      }
      
      private function getMaxWindowHeight() : int
      {
         if((viewComponent as PlayFieldEffectViewVo).fieldEffectDisplay.stage)
         {
            return (viewComponent as PlayFieldEffectViewVo).fieldEffectDisplay.stage.stageHeight;
         }
         return MainConfig.STAGE_DEFALT_HEIGHT;
      }
      
      public function get playfield() : PlayField
      {
         return facade.getMediator(PlayField) as PlayField;
      }
   }
}

