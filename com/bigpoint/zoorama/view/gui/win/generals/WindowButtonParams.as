package com.bigpoint.zoorama.view.gui.win.generals
{
   public class WindowButtonParams
   {
      public var closeFunction:Function;
      
      public var closeParams:Array;
      
      public var confirmationFunction:Function;
      
      public var confirmationParams:Array;
      
      public var cancelFunction:Function;
      
      public var cancelParams:Array;
      
      public function WindowButtonParams(param1:Function = null, param2:Array = null, param3:Function = null, param4:Array = null, param5:Function = null, param6:Array = null)
      {
         super();
         this.closeFunction = param1;
         this.closeParams = param2;
         this.confirmationFunction = param3;
         this.confirmationParams = param4;
         this.cancelFunction = param5;
         this.cancelParams = param6;
      }
      
      public function toStirng() : String
      {
         return "WindowButtonParams{" + "closeFunction" + this.closeFunction + ", closeParams" + this.closeParams + ", confirmationFunction" + this.confirmationFunction + ", confirmationParams" + this.confirmationParams + ", cancelFunction" + this.cancelFunction + ", cancelParams" + this.cancelParams + "}";
      }
   }
}

