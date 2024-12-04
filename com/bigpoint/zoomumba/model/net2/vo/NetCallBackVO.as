package com.bigpoint.zoomumba.model.net2.vo
{
   public class NetCallBackVO
   {
      public var noteName:String;
      
      public var noteBody:Object;
      
      public var valid:int;
      
      public function NetCallBackVO(param1:String, param2:Object, param3:int)
      {
         super();
         this.noteName = param1;
         this.noteBody = param2;
         this.valid = param3;
      }
   }
}

