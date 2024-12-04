package com.flexspy.imp.metadata
{
   public class StyleMetadata
   {
      public var arrayType:String;
      
      public var format:String;
      
      public var type:String;
      
      public var name:String;
      
      public var enumeration:String;
      
      public function StyleMetadata(param1:XML)
      {
         super();
         name = param1.@name;
         type = param1.@type;
         arrayType = param1.@arrayType;
         format = param1.@format;
         enumeration = param1.@enumeration;
      }
   }
}

