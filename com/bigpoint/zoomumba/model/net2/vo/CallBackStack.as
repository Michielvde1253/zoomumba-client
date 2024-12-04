package com.bigpoint.zoomumba.model.net2.vo
{
   public class CallBackStack
   {
      public var netName:String;
      
      public var netBody:Array;
      
      public var rqId:int = -1;
      
      public var checkForValid:Boolean = false;
      
      public var stack:Vector.<NetCallBackVO> = new Vector.<NetCallBackVO>();
      
      public function CallBackStack()
      {
         super();
      }
   }
}

