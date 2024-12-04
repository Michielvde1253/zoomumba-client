package com.bigpoint.zoorama.notices.gui.window
{
   import com.bigpoint.zoorama.view.gui.win.generals.WindowButtonParams;
   import flash.display.BitmapData;
   
   public class SaveScreenshotNotice extends WindowNotice
   {
      public var image:BitmapData;
      
      public function SaveScreenshotNotice(param1:String, param2:int, param3:BitmapData, param4:WindowButtonParams = null)
      {
         this.image = param3;
         super(param1,param2,param4);
      }
   }
}

