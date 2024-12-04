package com.bigpoint.zoorama.view.gui.utils
{
   import flash.display.Sprite;
   
   public class Scale9Helper
   {
      public function Scale9Helper()
      {
         super();
      }
      
      public static function setWidth(param1:Sprite, param2:Number) : void
      {
         var _loc3_:Number = NaN;
         if(Boolean(param1["l"]) && Boolean(param1["r"]))
         {
            _loc3_ = param1["l"].width + param1["r"].width;
         }
         if(Boolean(param1["l"]) && param2 >= _loc3_)
         {
            param1.scaleX = 1;
            param1["c"].width = param2 - param1["l"].width - param1["r"].width;
            param1["r"].x = param2 - param1["r"].width;
            if(param1["tl"])
            {
               param1["t"].width = param2 - param1["tl"].width - param1["tr"].width;
               param1["tr"].x = param2 - param1["tr"].width;
               param1["b"].width = param2 - param1["bl"].width - param1["br"].width;
               param1["br"].x = param2 - param1["br"].width;
            }
         }
         else if(param1["t"])
         {
            param1.scaleX = 1;
            param1["t"].width = param1["c"].width = param1["b"].width = param2;
         }
         else
         {
            param1.width = param2;
         }
      }
      
      public static function setHeight(param1:Sprite, param2:Number) : void
      {
         var _loc3_:Number = NaN;
         if(Boolean(param1["t"]) && Boolean(param1["b"]))
         {
            _loc3_ = param1["t"].height + param1["b"].height;
         }
         if(Boolean(param1["t"]) && param2 >= _loc3_)
         {
            param1["c"].height = param2 - param1["t"].height - param1["b"].height;
            param1["b"].y = param2 - param1["b"].height;
            if(param1["tl"])
            {
               param1["l"].height = param2 - param1["tl"].height - param1["bl"].height;
               param1["bl"].y = param2 - param1["bl"].height;
               param1["r"].height = param2 - param1["tr"].height - param1["br"].height;
               param1["br"].y = param2 - param1["br"].height;
            }
         }
         else if(param1["l"])
         {
            param1["l"].height = param1["c"].height = param1["r"].height = param2;
         }
         else
         {
            param1.height = param2;
         }
      }
   }
}

