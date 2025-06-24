package com.bigpoint.zoomumba.model.playfield.components.animals
{
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.tempModel.TempGetterProxy;
   import com.bigpoint.zoorama.MainConfig;
   import com.greensock.TweenLite;
   import com.greensock.easing.Bounce;
   import com.greensock.easing.Linear;
   import flash.display.MovieClip;
   import flash.events.Event;
   
   public class AnimData
   {
      private static const TIME_FOR_INIT_ANIM:int = 3;
      
      private static const TIME_FOR_PAUSE_ANIM:int = 5;
      
      private static const TIME_FOR_RANDOM_ANIM:int = 15;
      
      private static const FIRST_APRIL:Boolean = false;
      
      private var still:MovieClip;
      
      private var loop:MovieClip;
      
      private var randomClips:Vector.<MovieClip> = new Vector.<MovieClip>();
      
      private var randomeRate:Vector.<int> = new Vector.<int>();
      
      private var totalRate:int = 0;
      
      private var curentTestAnim:int = -1;
      
      private var curentAprilAnim:int = -1;
      
      private var curentAprilAnimClip:MovieClip = null;
      
      private var curentAprilAnimTween:TweenLite;
      
      private var isStill:Boolean = false;
      
      private var animName:String;
      
      private var assetId:String;
      
      private var isTesting:Boolean = false;
      
      private var zoomLevel:Number = MainConfig.ZOOM_LEVELS[MainConfig.ZOOM_DEFAULT_ID];
      
      private var playingClip:MovieClip;
      
      private var playingClipTween:TweenLite;
      
      private var isAnimating:Boolean = false;
      
      public function AnimData(param1:String, param2:String)
      {
         super();
         this.animName = param1;
         this.assetId = param2;
      }
      
      public function get isPlayingAnimation() : Boolean
      {
         return !this.isStill;
      }
      
      public function addStill(param1:MovieClip) : void
      {
         if(!this.still)
         {
            this.still = param1;
         }
      }
      
      public function addLoop(param1:MovieClip) : void
      {
         if(!this.loop)
         {
            this.loop = param1;
         }
      }
      
      public function addRandome(param1:MovieClip, param2:int) : void
      {
         this.randomClips.push(param1);
         this.randomeRate.push(param2);
         this.totalRate += param2;
      }
      
      public function showStill() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.randomClips.length)
         {
            this.randomClips[_loc1_].gotoAndStop(1);
            this.randomClips[_loc1_].visible = false;
            _loc1_++;
         }
         if(this.still)
         {
            this.still.visible = true;
            this.still.gotoAndStop("zoom_" + this.zoomLevel);
         }
         this.isStill = true;
         this.isAnimating = false;
      }
      
      public function scaleAnim(param1:Number) : void
      {
         this.zoomLevel = param1;
         if(this.isStill)
         {
            this.still.gotoAndStop("zoom_" + this.zoomLevel);
         }
      }
      
      public function showRandom(param1:int) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.randomClips.length)
         {
            if(_loc2_ == param1)
            {
               this.randomClips[_loc2_].gotoAndStop(2);
               this.playingClip = this.randomClips[_loc2_];
               if(this.playingClipTween)
               {
                  this.playingClipTween.kill();
                  this.playingClipTween = null;
               }
               this.playingClipTween = TweenLite.to(this.playingClip,this.randomClips[_loc2_].totalFrames / 12,{
                  "delay":Math.random() * 2,
                  "frame":this.randomClips[_loc2_].totalFrames,
                  "onComplete":this.handleAnimComplete,
                  "ease":Linear.easeNone
               });
               this.playingClip.visible = true;
            }
            else
            {
               this.randomClips[_loc2_].gotoAndStop(1);
               this.randomClips[_loc2_].visible = false;
            }
            _loc2_++;
         }
         if(this.still)
         {
            this.still.visible = false;
         }
         this.isStill = false;
         this.isAnimating = true;
      }
      
      private function handleAnimComplete(param1:Event = null) : void
      {
         this.showStill();
         TempGetterProxy.sendNotification(Note.PLAY_FIELD_ANIMATION_ENDED);
      }
      
      public function playRandamAnim() : void
      {
         if(FIRST_APRIL)
         {
            if(this.curentAprilAnim == -1 && this.curentAprilAnimClip == null)
            {
               if(this.randomClips.length > 0)
               {
                  this.curentTestAnim = Math.floor(Math.random() * this.randomClips.length);
                  this.showRandom(this.curentTestAnim);
                  if(Math.floor(Math.random() * 6) == 3)
                  {
                     this.killAprilTween();
                     this.curentAprilAnim = this.curentTestAnim;
                     this.curentAprilAnimClip = this.randomClips[this.curentAprilAnim];
                     this.curentAprilAnimTween = TweenLite.to(this.curentAprilAnimClip,1,{
                        "alpha":0,
                        "delay":0.4,
                        "onComplete":this.completeArilAniSmall
                     });
                  }
               }
            }
         }
         else if(this.randomClips.length > 0)
         {
            this.curentTestAnim = Math.floor(Math.random() * this.randomClips.length);
            this.showRandom(this.curentTestAnim);
         }
      }
      
      private function completeArilAniSmall() : void
      {
         if(this.curentAprilAnimClip)
         {
            this.killAprilTween();
            this.curentAprilAnimTween = TweenLite.to(this.curentAprilAnimClip,2,{
               "delay":2,
               "alpha":1,
               "ease":Bounce.easeOut,
               "onComplete":this.completeArilAniFinished
            });
         }
         else
         {
            this.completeArilAniFinished();
         }
      }
      
      private function completeArilAniFinished() : void
      {
         this.killAprilTween();
         if(this.curentAprilAnimClip)
         {
            this.curentAprilAnimClip.alpha = 1;
         }
         this.curentAprilAnim = -1;
         this.curentAprilAnimClip = null;
      }
      
      private function killAprilTween() : void
      {
         if(this.curentAprilAnimTween)
         {
            this.curentAprilAnimTween.kill();
            this.curentAprilAnimTween = null;
         }
      }
      
      public function dispose() : void
      {
         TweenLite.killDelayedCallsTo(this.playRandamAnim);
         if(this.playingClip)
         {
            if(this.playingClipTween)
            {
               this.playingClipTween.kill();
               this.playingClipTween = null;
            }
            this.playingClip = null;
         }
         this.completeArilAniFinished();
         this.still = null;
         this.loop = null;
         this.randomClips = null;
         this.randomeRate = null;
         this.isAnimating = false;
      }
   }
}

