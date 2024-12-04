package com.bigpoint.zoorama.notices.playfield
{
   import com.bigpoint.utils.notificator.Notice;
   import com.bigpoint.zoorama.view.field.items.Special;
   
   public class EsterEggNotice extends Notice
   {
      public static const AUTO_COLLECT_ESTER_EGG:String = "autoCollectEsterEgg";
      
      public var esterEgg:Special;
      
      public function EsterEggNotice(param1:String, param2:Special)
      {
         super(param1);
         this.esterEgg = param2;
      }
   }
}

