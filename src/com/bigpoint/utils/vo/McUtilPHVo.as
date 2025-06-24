package com.bigpoint.utils.vo
{
   import flash.display.MovieClip;
   
   public class McUtilPHVo
   {
      public var callback:Function;
      
      public var pars:Object;
      
      public var mc:MovieClip;
      
      public var cnt:uint = 0;
      
      public function McUtilPHVo(param1:Function = null, param2:Object = null, param3:MovieClip = null)
      {
         super();
         this.callback = param1;
         this.pars = param2;
         this.mc = param3;
      }
   }
}

