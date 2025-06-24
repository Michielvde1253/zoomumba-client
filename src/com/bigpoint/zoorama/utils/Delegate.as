package com.bigpoint.zoorama.utils
{
   public class Delegate
   {
      public function Delegate()
      {
         super();
      }
      
      public static function create(param1:Function, ... rest) : Function
      {
         var target:Function = param1;
         var params:Array = rest;
         var f:Function = function(... rest):void
         {
            target.apply(null,rest.concat(params));
         };
         return f;
      }
   }
}

