package com.bigpoint.zoorama.notices.fortuneWheel
{
   import com.bigpoint.zoomumba.model.net.responceDataVo.fortuneWheel.RewardData;
   import com.bigpoint.zoorama.notices.gui.window.WindowNotice;
   import com.bigpoint.zoorama.view.gui.win.generals.WindowButtonParams;
   
   public class FortuneWheelRewardWindowNotice extends WindowNotice
   {
      public var rewardData:RewardData;
      
      public function FortuneWheelRewardWindowNotice(param1:String, param2:int, param3:WindowButtonParams = null)
      {
         super(param1,param2,param3);
      }
   }
}

