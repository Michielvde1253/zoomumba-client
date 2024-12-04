package com.bigpoint.zoorama.utils.configModules
{
   public class TextReplace
   {
      public var searchText:String;
      
      public var replaceText:String;
      
      public function TextReplace(param1:String, param2:String)
      {
         super();
         this.replaceText = param2;
         this.searchText = param1;
      }
      
      public function toString() : String
      {
         return "[TextReplace searchText=" + this.searchText + " replaceText=" + this.replaceText + "]";
      }
   }
}

