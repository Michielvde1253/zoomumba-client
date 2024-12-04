package com.bigpoint.zoorama.notices.gui.window
{
   import com.bigpoint.zoorama.view.gui.win.generals.WindowButtonParams;
   
   public class ConfirmationWindowNotice extends WindowNotice
   {
      public var titleText:String;
      
      public var messageText:String;
      
      public var titleId:String;
      
      public var textId:String;
      
      public var replaceIds:Object;
      
      public var replaceVars:Object;
      
      public var sellPrice:int = 0;
      
      public function ConfirmationWindowNotice(param1:String, param2:int, param3:String, param4:String, param5:WindowButtonParams = null, param6:Object = null, param7:Object = null, param8:String = "", param9:String = "", param10:int = 0)
      {
         this.messageText = param9;
         this.titleText = param8;
         this.titleId = param3;
         this.textId = param4;
         this.replaceIds = param6;
         this.replaceVars = param7;
         this.sellPrice = param10;
         super(param1,param2,param5);
      }
   }
}

