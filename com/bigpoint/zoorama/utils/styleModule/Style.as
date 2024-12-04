package com.bigpoint.zoorama.utils.styleModule
{
   public class Style
   {
      internal var size:int = 12;
      
      internal var fontName:String = "Tahoma";
      
      internal var bold:Boolean = false;
      
      internal var italic:Boolean = false;
      
      internal var align:String = "left";
      
      public function Style(param1:int, param2:String, param3:Boolean = false, param4:Boolean = false, param5:String = "left")
      {
         super();
         this.size = param1;
         this.fontName = param2;
         this.bold = param3;
         this.italic = param4;
         this.align = param5;
      }
   }
}

