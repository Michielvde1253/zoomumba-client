package com.bigpoint.zoomumba.view.gui.event.ballons
{
   import com.bigpoint.zoomumba.view.gui.event.vo.BallonTypeVo;
   
   public class BallonItemType2 extends BallonItemType1
   {
      public function BallonItemType2(param1:BallonTypeVo)
      {
         super(param1);
         flightTimeMax = 12;
         flightTimeMin = 10;
      }
   }
}

