package com.greensock
{
   import com.greensock.core.*;
   import com.greensock.events.TweenEvent;
   import com.greensock.plugins.*;
   import flash.display.*;
   import flash.events.*;
   import flash.utils.*;
   
   public class TweenMax extends TweenLite implements IEventDispatcher
   {
      public static const version:Number = 11.698;
      
      private static var _overwriteMode:int = OverwriteManager.enabled ? OverwriteManager.mode : OverwriteManager.init(2);
      
      public static var killTweensOf:Function = TweenLite.killTweensOf;
      
      public static var killDelayedCallsTo:Function = TweenLite.killTweensOf;
      
      TweenPlugin.activate([AutoAlphaPlugin,EndArrayPlugin,FramePlugin,RemoveTintPlugin,TintPlugin,VisiblePlugin,VolumePlugin,BevelFilterPlugin,BezierPlugin,BezierThroughPlugin,BlurFilterPlugin,ColorMatrixFilterPlugin,ColorTransformPlugin,DropShadowFilterPlugin,FrameLabelPlugin,GlowFilterPlugin,HexColorsPlugin,RoundPropsPlugin,ShortRotationPlugin,{}]);
      
      protected var _dispatcher:EventDispatcher;
      
      protected var _hasUpdateListener:Boolean;
      
      protected var _repeat:int = 0;
      
      protected var _repeatDelay:Number = 0;
      
      protected var _cyclesComplete:int = 0;
      
      protected var _easePower:int;
      
      protected var _easeType:int;
      
      public var yoyo:Boolean;
      
      public function TweenMax(param1:Object, param2:Number, param3:Object)
      {
         super(param1,param2,param3);
         if(TweenLite.version < 11.2)
         {
            throw new Error("TweenMax error! Please update your TweenLite class or try deleting your ASO files. TweenMax requires a more recent version. Download updates at http://www.TweenMax.com.");
         }
         this.yoyo = Boolean(this.vars.yoyo);
         this._repeat = uint(this.vars.repeat);
         this._repeatDelay = !!this.vars.repeatDelay ? Number(this.vars.repeatDelay) : 0;
         this.cacheIsDirty = true;
         if(Boolean(this.vars.onCompleteListener) || Boolean(this.vars.onInitListener) || Boolean(this.vars.onUpdateListener) || Boolean(this.vars.onStartListener) || Boolean(this.vars.onRepeatListener) || Boolean(this.vars.onReverseCompleteListener))
         {
            this.initDispatcher();
            if(param2 == 0 && _delay == 0)
            {
               this._dispatcher.dispatchEvent(new TweenEvent(TweenEvent.UPDATE));
               this._dispatcher.dispatchEvent(new TweenEvent(TweenEvent.COMPLETE));
            }
         }
         if(Boolean(this.vars.timeScale) && !(this.target is TweenCore))
         {
            this.cachedTimeScale = this.vars.timeScale;
         }
      }
      
      public static function to(param1:Object, param2:Number, param3:Object) : TweenMax
      {
         return new TweenMax(param1,param2,param3);
      }
      
      public static function from(param1:Object, param2:Number, param3:Object) : TweenMax
      {
         if(param3.isGSVars)
         {
            param3 = param3.vars;
         }
         param3.runBackwards = true;
         if(!("immediateRender" in param3))
         {
            param3.immediateRender = true;
         }
         return new TweenMax(param1,param2,param3);
      }
      
      public static function fromTo(param1:Object, param2:Number, param3:Object, param4:Object) : TweenMax
      {
         if(param4.isGSVars)
         {
            param4 = param4.vars;
         }
         if(param3.isGSVars)
         {
            param3 = param3.vars;
         }
         param4.startAt = param3;
         if(param3.immediateRender)
         {
            param4.immediateRender = true;
         }
         return new TweenMax(param1,param2,param4);
      }
      
      public static function allTo(param1:Array, param2:Number, param3:Object, param4:Number = 0, param5:Function = null, param6:Array = null) : Array
      {
         var curDelay:Number;
         var lastIndex:int;
         var i:int = 0;
         var varsDup:Object = null;
         var p:String = null;
         var onCompleteProxy:Function = null;
         var onCompleteParamsProxy:Array = null;
         var targets:Array = param1;
         var duration:Number = param2;
         var vars:Object = param3;
         var stagger:Number = param4;
         var onCompleteAll:Function = param5;
         var onCompleteAllParams:Array = param6;
         var l:int = int(targets.length);
         var a:Array = [];
         if(vars.isGSVars)
         {
            vars = vars.vars;
         }
         curDelay = "delay" in vars ? Number(vars.delay) : 0;
         onCompleteProxy = vars.onComplete;
         onCompleteParamsProxy = vars.onCompleteParams;
         lastIndex = l - 1;
         i = 0;
         while(i < l)
         {
            varsDup = {};
            for(p in vars)
            {
               varsDup[p] = vars[p];
            }
            varsDup.delay = curDelay;
            if(i == lastIndex && onCompleteAll != null)
            {
               varsDup.onComplete = function():void
               {
                  if(onCompleteProxy != null)
                  {
                     onCompleteProxy.apply(null,onCompleteParamsProxy);
                  }
                  onCompleteAll.apply(null,onCompleteAllParams);
               };
            }
            a[i] = new TweenMax(targets[i],duration,varsDup);
            curDelay += stagger;
            i += 1;
         }
         return a;
      }
      
      public static function allFrom(param1:Array, param2:Number, param3:Object, param4:Number = 0, param5:Function = null, param6:Array = null) : Array
      {
         if(param3.isGSVars)
         {
            param3 = param3.vars;
         }
         param3.runBackwards = true;
         if(!("immediateRender" in param3))
         {
            param3.immediateRender = true;
         }
         return allTo(param1,param2,param3,param4,param5,param6);
      }
      
      public static function allFromTo(param1:Array, param2:Number, param3:Object, param4:Object, param5:Number = 0, param6:Function = null, param7:Array = null) : Array
      {
         if(param4.isGSVars)
         {
            param4 = param4.vars;
         }
         if(param3.isGSVars)
         {
            param3 = param3.vars;
         }
         param4.startAt = param3;
         if(param3.immediateRender)
         {
            param4.immediateRender = true;
         }
         return allTo(param1,param2,param4,param5,param6,param7);
      }
      
      public static function delayedCall(param1:Number, param2:Function, param3:Array = null, param4:Boolean = false) : TweenMax
      {
         return new TweenMax(param2,0,{
            "delay":param1,
            "onComplete":param2,
            "onCompleteParams":param3,
            "immediateRender":false,
            "useFrames":param4,
            "overwrite":0
         });
      }
      
      public static function getTweensOf(param1:Object) : Array
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc2_:Array = masterList[param1];
         var _loc3_:Array = [];
         if(_loc2_)
         {
            _loc4_ = int(_loc2_.length);
            _loc5_ = 0;
            while(--_loc4_ > -1)
            {
               if(!TweenLite(_loc2_[_loc4_]).gc)
               {
                  var _loc6_:*;
                  _loc3_[_loc6_ = _loc5_++] = _loc2_[_loc4_];
               }
            }
         }
         return _loc3_;
      }
      
      public static function isTweening(param1:Object) : Boolean
      {
         var _loc4_:TweenLite = null;
         var _loc2_:Array = getTweensOf(param1);
         var _loc3_:int = int(_loc2_.length);
         while(--_loc3_ > -1)
         {
            _loc4_ = _loc2_[_loc3_];
            if(_loc4_.active || _loc4_.cachedStartTime == _loc4_.timeline.cachedTime && _loc4_.timeline.active)
            {
               return true;
            }
         }
         return false;
      }
      
      public static function getAllTweens() : Array
      {
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc1_:Dictionary = masterList;
         var _loc2_:int = 0;
         var _loc3_:Array = [];
         for each(_loc4_ in _loc1_)
         {
            _loc5_ = int(_loc4_.length);
            while(--_loc5_ > -1)
            {
               if(!TweenLite(_loc4_[_loc5_]).gc)
               {
                  var _loc8_:*;
                  _loc3_[_loc8_ = _loc2_++] = _loc4_[_loc5_];
               }
            }
         }
         return _loc3_;
      }
      
      public static function killAll(param1:Boolean = false, param2:Boolean = true, param3:Boolean = true) : void
      {
         var _loc5_:* = false;
         var _loc4_:Array = getAllTweens();
         var _loc6_:int = int(_loc4_.length);
         while(--_loc6_ > -1)
         {
            _loc5_ = _loc4_[_loc6_].target == _loc4_[_loc6_].vars.onComplete;
            if(_loc5_ == param3 || _loc5_ != param2)
            {
               if(param1)
               {
                  _loc4_[_loc6_].complete(false);
               }
               else
               {
                  _loc4_[_loc6_].setEnabled(false,false);
               }
            }
         }
      }
      
      public static function killChildTweensOf(param1:DisplayObjectContainer, param2:Boolean = false) : void
      {
         var _loc4_:Object = null;
         var _loc5_:DisplayObjectContainer = null;
         var _loc3_:Array = getAllTweens();
         var _loc6_:int = int(_loc3_.length);
         while(--_loc6_ > -1)
         {
            _loc4_ = _loc3_[_loc6_].target;
            if(_loc4_ is DisplayObject)
            {
               _loc5_ = _loc4_.parent;
               while(_loc5_)
               {
                  if(_loc5_ == param1)
                  {
                     if(param2)
                     {
                        _loc3_[_loc6_].complete(false);
                     }
                     else
                     {
                        _loc3_[_loc6_].setEnabled(false,false);
                     }
                  }
                  _loc5_ = _loc5_.parent;
               }
            }
         }
      }
      
      public static function pauseAll(param1:Boolean = true, param2:Boolean = true) : void
      {
         changePause(true,param1,param2);
      }
      
      public static function resumeAll(param1:Boolean = true, param2:Boolean = true) : void
      {
         changePause(false,param1,param2);
      }
      
      private static function changePause(param1:Boolean, param2:Boolean = true, param3:Boolean = false) : void
      {
         var _loc5_:* = false;
         var _loc4_:Array = getAllTweens();
         var _loc6_:int = int(_loc4_.length);
         while(--_loc6_ > -1)
         {
            _loc5_ = TweenLite(_loc4_[_loc6_]).target == TweenLite(_loc4_[_loc6_]).vars.onComplete;
            if(_loc5_ == param3 || _loc5_ != param2)
            {
               TweenCore(_loc4_[_loc6_]).paused = param1;
            }
         }
      }
      
      public static function get globalTimeScale() : Number
      {
         return TweenLite.rootTimeline == null ? 1 : TweenLite.rootTimeline.cachedTimeScale;
      }
      
      public static function set globalTimeScale(param1:Number) : void
      {
         if(param1 == 0)
         {
            param1 = 0.0001;
         }
         if(TweenLite.rootTimeline == null)
         {
            TweenLite.to({},0,{});
         }
         var _loc2_:SimpleTimeline = TweenLite.rootTimeline;
         var _loc3_:Number = getTimer() * 0.001;
         _loc2_.cachedStartTime = _loc3_ - (_loc3_ - _loc2_.cachedStartTime) * _loc2_.cachedTimeScale / param1;
         _loc2_ = TweenLite.rootFramesTimeline;
         _loc3_ = TweenLite.rootFrame;
         _loc2_.cachedStartTime = _loc3_ - (_loc3_ - _loc2_.cachedStartTime) * _loc2_.cachedTimeScale / param1;
         TweenLite.rootFramesTimeline.cachedTimeScale = TweenLite.rootTimeline.cachedTimeScale = param1;
      }
      
      override protected function init() : void
      {
         var _loc1_:TweenMax = null;
         if(this.vars.startAt)
         {
            this.vars.startAt.overwrite = 0;
            this.vars.startAt.immediateRender = true;
            _loc1_ = new TweenMax(this.target,0,this.vars.startAt);
         }
         if(this._dispatcher)
         {
            this._dispatcher.dispatchEvent(new TweenEvent(TweenEvent.INIT));
         }
         super.init();
         if(_ease in fastEaseLookup)
         {
            this._easeType = fastEaseLookup[_ease][0];
            this._easePower = fastEaseLookup[_ease][1];
         }
      }
      
      override public function invalidate() : void
      {
         this.yoyo = Boolean(this.vars.yoyo == true);
         this._repeat = !!this.vars.repeat ? int(Number(this.vars.repeat)) : 0;
         this._repeatDelay = !!this.vars.repeatDelay ? Number(this.vars.repeatDelay) : 0;
         this._hasUpdateListener = false;
         if(this.vars.onCompleteListener != null || this.vars.onUpdateListener != null || this.vars.onStartListener != null)
         {
            this.initDispatcher();
         }
         setDirtyCache(true);
         super.invalidate();
      }
      
      public function updateTo(param1:Object, param2:Boolean = false) : void
      {
         var _loc4_:String = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:PropTween = null;
         var _loc8_:Number = NaN;
         var _loc3_:Number = this.ratio;
         if(param2 && this.timeline != null && this.cachedStartTime < this.timeline.cachedTime)
         {
            this.cachedStartTime = this.timeline.cachedTime;
            this.setDirtyCache(false);
            if(this.gc)
            {
               this.setEnabled(true,false);
            }
            else
            {
               this.timeline.insert(this,this.cachedStartTime - _delay);
            }
         }
         for(_loc4_ in param1)
         {
            this.vars[_loc4_] = param1[_loc4_];
         }
         if(this.initted)
         {
            if(param2)
            {
               this.initted = false;
            }
            else
            {
               if(_notifyPluginsOfEnabled && Boolean(this.cachedPT1))
               {
                  onPluginEvent("onDisable",this);
               }
               if(this.cachedTime / this.cachedDuration > 0.998)
               {
                  _loc5_ = this.cachedTime;
                  this.renderTime(0,true,false);
                  this.initted = false;
                  this.renderTime(_loc5_,true,false);
               }
               else if(this.cachedTime > 0)
               {
                  this.initted = false;
                  this.init();
                  _loc6_ = 1 / (1 - _loc3_);
                  _loc7_ = this.cachedPT1;
                  while(_loc7_)
                  {
                     _loc8_ = _loc7_.start + _loc7_.change;
                     _loc7_.change *= _loc6_;
                     _loc7_.start = _loc8_ - _loc7_.change;
                     _loc7_ = _loc7_.nextNode;
                  }
               }
            }
         }
      }
      
      public function setDestination(param1:String, param2:*, param3:Boolean = true) : void
      {
         var _loc4_:Object = {};
         _loc4_[param1] = param2;
         this.updateTo(_loc4_,!param3);
      }
      
      public function killProperties(param1:Array) : void
      {
         var _loc2_:Object = {};
         var _loc3_:int = int(param1.length);
         while(--_loc3_ > -1)
         {
            _loc2_[param1[_loc3_]] = true;
         }
         killVars(_loc2_);
      }
      
      override public function renderTime(param1:Number, param2:Boolean = false, param3:Boolean = false) : void
      {
         var _loc7_:* = false;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc11_:Number = NaN;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:Number = NaN;
         var _loc4_:Number = this.cacheIsDirty ? this.totalDuration : this.cachedTotalDuration;
         var _loc5_:Number = this.cachedTime;
         var _loc6_:Number = this.cachedTotalTime;
         if(param1 >= _loc4_)
         {
            this.cachedTotalTime = _loc4_;
            this.cachedTime = this.cachedDuration;
            this.ratio = 1;
            _loc7_ = !this.cachedReversed;
            if(this.cachedDuration == 0)
            {
               if((param1 == 0 || _rawPrevTime < 0) && _rawPrevTime != param1)
               {
                  param3 = true;
               }
               _rawPrevTime = param1;
            }
         }
         else if(param1 <= 0)
         {
            if(param1 < 0)
            {
               this.active = false;
               if(this.cachedDuration == 0)
               {
                  if(_rawPrevTime >= 0)
                  {
                     param3 = true;
                     _loc7_ = _rawPrevTime > 0;
                  }
                  _rawPrevTime = param1;
               }
            }
            else if(param1 == 0 && !this.initted)
            {
               param3 = true;
            }
            this.cachedTotalTime = this.cachedTime = this.ratio = 0;
            if(this.cachedReversed && _loc6_ != 0)
            {
               _loc7_ = true;
            }
         }
         else
         {
            this.cachedTotalTime = this.cachedTime = param1;
            _loc9_ = true;
         }
         if(this._repeat != 0)
         {
            _loc11_ = this.cachedDuration + this._repeatDelay;
            _loc12_ = this._cyclesComplete;
            if((this._cyclesComplete = this.cachedTotalTime / _loc11_ >> 0) == this.cachedTotalTime / _loc11_ && this._cyclesComplete != 0)
            {
               --this._cyclesComplete;
            }
            _loc8_ = Boolean(_loc12_ != this._cyclesComplete);
            if(_loc7_)
            {
               if(this.yoyo && Boolean(this._repeat % 2))
               {
                  this.cachedTime = this.ratio = 0;
               }
            }
            else if(param1 > 0)
            {
               this.cachedTime = this.cachedTotalTime - this._cyclesComplete * _loc11_;
               if(this.yoyo && Boolean(this._cyclesComplete % 2))
               {
                  this.cachedTime = this.cachedDuration - this.cachedTime;
               }
               else if(this.cachedTime >= this.cachedDuration)
               {
                  this.cachedTime = this.cachedDuration;
                  this.ratio = 1;
                  _loc9_ = false;
               }
               if(this.cachedTime <= 0)
               {
                  this.cachedTime = this.ratio = 0;
                  _loc9_ = false;
               }
            }
            else
            {
               this._cyclesComplete = 0;
            }
         }
         if(_loc5_ == this.cachedTime && !param3)
         {
            return;
         }
         if(!this.initted)
         {
            this.init();
         }
         if(!this.active && !this.cachedPaused)
         {
            this.active = true;
         }
         if(_loc9_)
         {
            if(this._easeType)
            {
               _loc13_ = this._easePower;
               _loc14_ = this.cachedTime / this.cachedDuration;
               if(this._easeType == 2)
               {
                  this.ratio = _loc14_ = 1 - _loc14_;
                  while(--_loc13_ > -1)
                  {
                     this.ratio = _loc14_ * this.ratio;
                  }
                  this.ratio = 1 - this.ratio;
               }
               else if(this._easeType == 1)
               {
                  this.ratio = _loc14_;
                  while(--_loc13_ > -1)
                  {
                     this.ratio = _loc14_ * this.ratio;
                  }
               }
               else if(_loc14_ < 0.5)
               {
                  this.ratio = _loc14_ = _loc14_ * 2;
                  while(--_loc13_ > -1)
                  {
                     this.ratio = _loc14_ * this.ratio;
                  }
                  this.ratio *= 0.5;
               }
               else
               {
                  this.ratio = _loc14_ = (1 - _loc14_) * 2;
                  while(--_loc13_ > -1)
                  {
                     this.ratio = _loc14_ * this.ratio;
                  }
                  this.ratio = 1 - 0.5 * this.ratio;
               }
            }
            else
            {
               this.ratio = _ease(this.cachedTime,0,1,this.cachedDuration);
            }
         }
         if(_loc6_ == 0 && (this.cachedTotalTime != 0 || this.cachedDuration == 0) && !param2)
         {
            if(this.vars.onStart)
            {
               this.vars.onStart.apply(null,this.vars.onStartParams);
            }
            if(this._dispatcher)
            {
               this._dispatcher.dispatchEvent(new TweenEvent(TweenEvent.START));
            }
         }
         var _loc10_:PropTween = this.cachedPT1;
         while(_loc10_)
         {
            _loc10_.target[_loc10_.property] = _loc10_.start + this.ratio * _loc10_.change;
            _loc10_ = _loc10_.nextNode;
         }
         if(_hasUpdate && !param2)
         {
            this.vars.onUpdate.apply(null,this.vars.onUpdateParams);
         }
         if(this._hasUpdateListener && !param2)
         {
            this._dispatcher.dispatchEvent(new TweenEvent(TweenEvent.UPDATE));
         }
         if(_loc8_ && !param2 && !this.gc)
         {
            if(this.vars.onRepeat)
            {
               this.vars.onRepeat.apply(null,this.vars.onRepeatParams);
            }
            if(this._dispatcher)
            {
               this._dispatcher.dispatchEvent(new TweenEvent(TweenEvent.REPEAT));
            }
         }
         if(_loc7_ && !this.gc)
         {
            if(_hasPlugins && Boolean(this.cachedPT1))
            {
               onPluginEvent("onComplete",this);
            }
            this.complete(true,param2);
         }
      }
      
      override public function complete(param1:Boolean = false, param2:Boolean = false) : void
      {
         super.complete(param1,param2);
         if(!param2 && Boolean(this._dispatcher))
         {
            if(this.cachedTotalTime == this.cachedTotalDuration && !this.cachedReversed)
            {
               this._dispatcher.dispatchEvent(new TweenEvent(TweenEvent.COMPLETE));
            }
            else if(this.cachedReversed && this.cachedTotalTime == 0)
            {
               this._dispatcher.dispatchEvent(new TweenEvent(TweenEvent.REVERSE_COMPLETE));
            }
         }
      }
      
      protected function initDispatcher() : void
      {
         if(this._dispatcher == null)
         {
            this._dispatcher = new EventDispatcher(this);
         }
         if(this.vars.onInitListener is Function)
         {
            this._dispatcher.addEventListener(TweenEvent.INIT,this.vars.onInitListener,false,0,true);
         }
         if(this.vars.onStartListener is Function)
         {
            this._dispatcher.addEventListener(TweenEvent.START,this.vars.onStartListener,false,0,true);
         }
         if(this.vars.onUpdateListener is Function)
         {
            this._dispatcher.addEventListener(TweenEvent.UPDATE,this.vars.onUpdateListener,false,0,true);
            this._hasUpdateListener = true;
         }
         if(this.vars.onCompleteListener is Function)
         {
            this._dispatcher.addEventListener(TweenEvent.COMPLETE,this.vars.onCompleteListener,false,0,true);
         }
         if(this.vars.onRepeatListener is Function)
         {
            this._dispatcher.addEventListener(TweenEvent.REPEAT,this.vars.onRepeatListener,false,0,true);
         }
         if(this.vars.onReverseCompleteListener is Function)
         {
            this._dispatcher.addEventListener(TweenEvent.REVERSE_COMPLETE,this.vars.onReverseCompleteListener,false,0,true);
         }
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         if(this._dispatcher == null)
         {
            this.initDispatcher();
         }
         if(param1 == TweenEvent.UPDATE)
         {
            this._hasUpdateListener = true;
         }
         this._dispatcher.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         if(this._dispatcher)
         {
            this._dispatcher.removeEventListener(param1,param2,param3);
         }
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return this._dispatcher == null ? false : this._dispatcher.hasEventListener(param1);
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return this._dispatcher == null ? false : this._dispatcher.willTrigger(param1);
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return this._dispatcher == null ? false : this._dispatcher.dispatchEvent(param1);
      }
      
      public function get currentProgress() : Number
      {
         return this.cachedTime / this.duration;
      }
      
      public function set currentProgress(param1:Number) : void
      {
         if(this._cyclesComplete == 0)
         {
            setTotalTime(this.duration * param1,false);
         }
         else
         {
            setTotalTime(this.duration * param1 + this._cyclesComplete * this.cachedDuration,false);
         }
      }
      
      public function get totalProgress() : Number
      {
         return this.cachedTotalTime / this.totalDuration;
      }
      
      public function set totalProgress(param1:Number) : void
      {
         setTotalTime(this.totalDuration * param1,false);
      }
      
      override public function set currentTime(param1:Number) : void
      {
         if(this._cyclesComplete != 0)
         {
            if(this.yoyo && this._cyclesComplete % 2 == 1)
            {
               param1 = this.duration - param1 + this._cyclesComplete * (this.cachedDuration + this._repeatDelay);
            }
            else
            {
               param1 += this._cyclesComplete * (this.duration + this._repeatDelay);
            }
         }
         setTotalTime(param1,false);
      }
      
      override public function get totalDuration() : Number
      {
         if(this.cacheIsDirty)
         {
            this.cachedTotalDuration = this._repeat == -1 ? 999999999999 : this.cachedDuration * (this._repeat + 1) + this._repeatDelay * this._repeat;
            this.cacheIsDirty = false;
         }
         return this.cachedTotalDuration;
      }
      
      override public function set totalDuration(param1:Number) : void
      {
         if(this._repeat == -1)
         {
            return;
         }
         this.duration = (param1 - this._repeat * this._repeatDelay) / (this._repeat + 1);
      }
      
      public function get timeScale() : Number
      {
         return this.cachedTimeScale;
      }
      
      public function set timeScale(param1:Number) : void
      {
         if(param1 == 0)
         {
            param1 = 0.0001;
         }
         var _loc2_:Number = Boolean(this.cachedPauseTime) || this.cachedPauseTime == 0 ? this.cachedPauseTime : this.timeline.cachedTotalTime;
         this.cachedStartTime = _loc2_ - (_loc2_ - this.cachedStartTime) * this.cachedTimeScale / param1;
         this.cachedTimeScale = param1;
         setDirtyCache(false);
      }
      
      public function get repeat() : int
      {
         return this._repeat;
      }
      
      public function set repeat(param1:int) : void
      {
         this._repeat = param1;
         setDirtyCache(true);
      }
      
      public function get repeatDelay() : Number
      {
         return this._repeatDelay;
      }
      
      public function set repeatDelay(param1:Number) : void
      {
         this._repeatDelay = param1;
         setDirtyCache(true);
      }
   }
}

