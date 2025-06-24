package com.bigpoint.zoorama.notices.gui.window
{
   import com.bigpoint.zoorama.data.settings.WelcomeBackItem;
   import com.bigpoint.zoorama.view.gui.win.generals.WindowButtonParams;
   
   public class WelcomeBackWindowNotice extends WindowNotice
   {
      public var prices:Vector.<WelcomeBackItem>;
      
      public var closeFunction:Function = null;
      
      public var closeFunctionParams:Array = null;
      
      public function WelcomeBackWindowNotice(param1:String, param2:int, param3:WindowButtonParams = null, param4:int = -1)
      {
         super(param1,param2,param3,param4);
      }
   }
}

