package com.bigpoint.zoorama.notices.gui.window
{
   import com.bigpoint.zoorama.view.gui.win.generals.WindowButtonParams;
   
   public class UpgradeWindowNotice extends WindowNotice
   {
      public var uid:int;
      
      public var itemId:int;
      
      public var level:int;
      
      public var category:int;
      
      public var cageEventId:int;
      
      public var eventTrigged:int;
      
      public var collectableAmmount:int;
      
      public var upgradeFunction:Function;
      
      public function UpgradeWindowNotice(param1:String, param2:int, param3:WindowButtonParams = null, param4:int = -1)
      {
         super(param1,param2,param3,param4);
      }
   }
}

