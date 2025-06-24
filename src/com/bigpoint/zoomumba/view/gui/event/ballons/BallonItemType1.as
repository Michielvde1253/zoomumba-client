package com.bigpoint.zoomumba.view.gui.event.ballons
{
   import com.bigpoint.utils.McUtil;
   import com.bigpoint.zoomumba.constants.BALLONEVENT;
   import com.bigpoint.zoomumba.view.gui.event.vo.BallonTypeVo;
   import com.greensock.TweenLite;
   import com.greensock.easing.Linear;
   import flash.display.MovieClip;
   
   public class BallonItemType1 extends BallonItem
   {
      private var _flightTimeMin:Number = 14;
      
      private var _flightTimeMax:Number = 16;
      
      public function BallonItemType1(param1:BallonTypeVo)
      {
         super(param1);
      }
      
      override protected function startFlight() : void
      {
         var _loc1_:TweenLite = null;
         super.startFlight();
         displayBallon.visible = false;
         McUtil.gotoAndWait(this.getRandomTween,displayBallon,"animation");
         flightTweens.push(_loc1_);
      }
      
      private function getRandomTween() : void
      {
         var _loc1_:int = randomNr(1,displayBallon.animation_mc.totalFrames);
         McUtil.gotoAndWait(this.startTween,displayBallon.animation_mc,_loc1_);
      }
      
      private function startTween() : void
      {
         var _loc1_:TweenLite = null;
         var _loc2_:Number = NaN;
         var _loc3_:MovieClip = null;
         var _loc4_:MovieClip = null;
         var _loc5_:Number = NaN;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(displayBallon.animation_mc)
         {
            _loc2_ = 0.5;
            _loc3_ = displayBallon.animation_mc.ghostAni_mc;
            _loc4_ = _loc3_.ghostBody_mc;
            _loc5_ = randomNr(this._flightTimeMin,this._flightTimeMax);
            _loc4_.gotoAndStop(1);
            if(ballonTypeVo.maxCoord)
            {
               _loc6_ = ballonTypeVo.maxCoord.x - displayBallon.animation_mc.width * 1.2;
               _loc7_ = ballonTypeVo.maxCoord.y - displayBallon.animation_mc.height * 1.2;
               displayBallon.x = randomNr(displayBallon.animation_mc.width / 8,_loc6_);
               displayBallon.y = randomNr(displayBallon.animation_mc.height / 8,_loc7_);
            }
            _loc3_.activeBorder_mc.visible = false;
            _loc3_.gotoAndStop(1);
            _loc3_.alpha = 0;
            displayBallon.visible = true;
            _loc4_.width *= -1;
            _loc4_.height *= -1;
            _loc1_ = TweenLite.to(_loc3_,_loc2_,{
               "ease":Linear.easeNone,
               "alpha":0.75
            });
            flightTweens.push(_loc1_);
            _loc1_ = TweenLite.to(_loc3_,_loc5_,{
               "ease":Linear.easeNone,
               "frame":_loc3_.totalFrames,
               "onComplete":updateState,
               "onCompleteParams":[BALLONEVENT.BALLON_STATE_FLIGHT_END]
            });
            flightTweens.push(_loc1_);
            _loc1_ = TweenLite.to(_loc3_,_loc2_,{
               "delay":_loc5_ - _loc2_,
               "ease":Linear.easeNone,
               "alpha":0
            });
            flightTweens.push(_loc1_);
         }
      }
      
      override protected function delayExplode(param1:String) : void
      {
         var _loc2_:MovieClip = displayBallon.animation_mc.ghostAni_mc;
         var _loc3_:MovieClip = _loc2_.ghostBody_mc;
         killFlightTweens();
         _loc3_.gotoAndPlay(param1);
         _loc3_.visible = true;
      }
      
      public function get flightTimeMin() : Number
      {
         return this._flightTimeMin;
      }
      
      public function set flightTimeMin(param1:Number) : void
      {
         this._flightTimeMin = param1;
      }
      
      public function get flightTimeMax() : Number
      {
         return this._flightTimeMax;
      }
      
      public function set flightTimeMax(param1:Number) : void
      {
         this._flightTimeMax = param1;
      }
   }
}

