package com.flexspy.imp
{
   public class StyleEditorItem extends PropertyEditorItem
   {
      private static var COLOR:String = "color";
      
      private static var COLORS:String = "colors";
      
      public function StyleEditorItem(param1:String)
      {
         super(param1);
      }
      
      override protected function getItemDisplayValue(param1:*) : String
      {
         if(param1 == null)
         {
            return "";
         }
         if(format == "Color")
         {
            return Utils.toHexColor(Number(param1));
         }
         if(format == "File")
         {
            if(type == "String")
            {
               return String(param1);
            }
            return Utils.formatClass(param1);
         }
         if(type == "Class")
         {
            return Utils.formatClass(param1);
         }
         return param1 == null ? "" : param1.toString();
      }
      
      override protected function detectFormat(param1:String, param2:String) : String
      {
         if(Utils.endsWith(param1,"color",false) && (param2 == "Number" || param2 == "uint" || param2 == "int"))
         {
            return "Color";
         }
         if(Utils.endsWith(param1,"colors",false) && param2 == "Array")
         {
            return "Color";
         }
         return super.detectFormat(param1,param2);
      }
   }
}

