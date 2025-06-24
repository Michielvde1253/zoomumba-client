package com.bigpoint.zoomumba.view.gui.event.ballons
{
   import com.bigpoint.zoomumba.constants.BALLONEVENT;
   import com.bigpoint.zoomumba.view.gui.event.vo.BallonTypeVo;
   import com.greensock.TweenLite;
   import com.greensock.easing.Linear;
   
   public class BallonItemType3 extends BallonItem
   {
      public function BallonItemType3(param1:BallonTypeVo)
      {
         super(param1);
      }
      
      override protected function startFlight() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:TweenLite = null;
         super.startFlight();
         var _loc3_:int = randomNr(13,18);
         if(randomNr(1,2) == 1)
         {
            _loc2_ = randomNr(0,ballonTypeVo.maxCoord.y);
            _loc1_ = ballonTypeVo.maxCoord.x + displayBallon.width;
            _loc5_ = randomNr(0,ballonTypeVo.maxCoord.y);
            _loc4_ = 0 - displayBallon.width;
            _loc3_ = _loc3_ * ballonTypeVo.maxCoord.x / 1000;
         }
         else
         {
            _loc2_ = ballonTypeVo.maxCoord.y + displayBallon.height;
            _loc1_ = randomNr(0,ballonTypeVo.maxCoord.x);
            _loc5_ = 0 - displayBallon.height;
            _loc4_ = randomNr(0,ballonTypeVo.maxCoord.x);
            _loc3_ = _loc3_ * ballonTypeVo.maxCoord.y / 1000;
         }
         displayBallon.alpha = 0.75;
         if(randomNr(1,2) == 1)
         {
            if(_loc1_ > _loc4_)
            {
               displayBallon.scaleX = -1;
            }
            displayBallon.x = _loc1_;
            displayBallon.y = _loc2_;
            _loc6_ = TweenLite.to(displayBallon,_loc3_,{
               "ease":Linear.easeNone,
               "y":_loc5_,
               "x":_loc4_,
               "onComplete":updateState,
               "onCompleteParams":[BALLONEVENT.BALLON_STATE_FLIGHT_END]
            });
         }
         else
         {
            if(_loc1_ < _loc4_)
            {
               displayBallon.scaleX = -1;
            }
            displayBallon.x = _loc4_;
            displayBallon.y = _loc5_;
            _loc6_ = TweenLite.to(displayBallon,_loc3_,{
               "ease":Linear.easeNone,
               "y":_loc2_,
               "x":_loc1_,
               "onComplete":updateState,
               "onCompleteParams":[BALLONEVENT.BALLON_STATE_FLIGHT_END]
            });
         }
         flightTweens.push(_loc6_);
      }
   }
}

