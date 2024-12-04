package com.bigpoint.zoorama.notices.gui.window
{
   import com.bigpoint.utils.notificator.Notice;
   import com.bigpoint.zoorama.view.gui.win.generals.WindowButtonParams;
   
   public class WindowNotice extends Notice
   {
      public static const OPEN_WINDOW:String = "openGeneralWindow";
      
      public static const CLOSE_WINDOW:String = "closeGeneralWindow";
      
      public var windowTypeId:int;
      
      public var windowButtonParams:WindowButtonParams;
      
      public var windowTab:int;
      
      public function WindowNotice(param1:String, param2:int, param3:WindowButtonParams = null, param4:int = -1)
      {
         this.windowTypeId = param2;
         this.windowButtonParams = param3;
         this.windowTab = param4;
         super(param1);
      }
      
      public function toString() : String
      {
         return "WindowNotice{" + "type:" + type + ", windowTypeId:" + this.windowTypeId + ", windowButtonParams:" + this.windowButtonParams + "}";
      }
   }
}

