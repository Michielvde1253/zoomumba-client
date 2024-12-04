package com.flexspy.imp
{
   import flash.display.DisplayObject;
   import flash.utils.getQualifiedClassName;
   import mx.core.UIComponent;
   import mx.utils.StringUtil;
   
   public class Utils
   {
      public function Utils()
      {
         super();
      }
      
      public static function isSafeType(param1:String) : Boolean
      {
         if(param1 == "Number" || param1 == "String" || param1 == "Boolean" || param1 == "int" || param1 == "uint" || param1 == "Date")
         {
            return true;
         }
         if(param1 == "flash.geom::Rectangle" || param1 == "mx.core::EdgeMetrics")
         {
            return true;
         }
         return false;
      }
      
      public static function fromHexColor(param1:String) : Number
      {
         if(param1 == null || param1 == "")
         {
            return 0;
         }
         if(param1.charAt(0) == "#")
         {
            return Number("0x" + param1.slice(1));
         }
         return Number(param1);
      }
      
      public static function toHexColor(param1:Number) : String
      {
         var _loc2_:String = param1.toString(16);
         while(_loc2_.length < 6)
         {
            _loc2_ = "0" + _loc2_;
         }
         return "#" + _loc2_;
      }
      
      public static function formatClass(param1:Object) : String
      {
         var _loc4_:int = 0;
         var _loc5_:String = null;
         var _loc6_:* = null;
         var _loc7_:String = null;
         var _loc2_:String = getQualifiedClassName(param1);
         if(_loc2_ != null)
         {
            _loc4_ = int(_loc2_.indexOf("::"));
            if(_loc4_ > 0)
            {
               return "ClassReference(\"" + _loc2_ + "\")";
            }
         }
         else
         {
            _loc2_ = String(param1);
         }
         var _loc3_:String = "__embed_css_";
         _loc4_ = int(_loc2_.indexOf(_loc3_));
         if(_loc4_ > 0)
         {
            _loc5_ = _loc2_.substr(_loc4_ + _loc3_.length);
            _loc6_ = _loc5_ = _loc5_.substr(0,_loc5_.lastIndexOf("_"));
            _loc7_ = "";
            _loc4_ = int(_loc5_.indexOf("_swf_"));
            if(_loc4_ > 0)
            {
               _loc6_ = _loc5_.substr(0,_loc4_) + ".swf";
               _loc7_ = _loc5_.substr(_loc4_ + 4);
               if(_loc7_.length > 0)
               {
                  _loc7_ = _loc7_.substr(1);
                  while(_loc7_.indexOf("_") > 0)
                  {
                     _loc7_ = _loc7_.replace("_",".");
                  }
               }
            }
            else
            {
               _loc4_ = int(_loc5_.lastIndexOf("_"));
               if(_loc4_ > 0)
               {
                  _loc6_ = _loc5_.substr(0,_loc4_) + "." + _loc5_.substr(_loc4_ + 1);
               }
            }
            if(_loc7_.length > 0)
            {
               return "Embed(source=\"" + _loc6_ + "\", symbol=\"" + _loc7_ + "\")";
            }
            return "Embed(\"" + _loc6_ + "\")";
         }
         return _loc2_;
      }
      
      public static function formatDisplayObject(param1:DisplayObject, param2:String) : String
      {
         if(param1 == null)
         {
            return "";
         }
         var _loc3_:String = param2;
         if(_loc3_.indexOf("::") >= 0)
         {
            _loc3_ = _loc3_.substr(2 + _loc3_.indexOf("::"));
         }
         if(param1 is UIComponent && UIComponent(param1).id != null && UIComponent(param1).id != "")
         {
            _loc3_ += " id=\"" + UIComponent(param1).id + "\"";
         }
         else if(param1.name != null && param1.name != "")
         {
            _loc3_ += " name=\"" + param1.name + "\"";
         }
         return StringUtil.substitute("<{0}>",_loc3_);
      }
      
      public static function endsWith(param1:String, param2:String, param3:Boolean = true) : Boolean
      {
         if(param2 == null)
         {
            return true;
         }
         if(param1 == null)
         {
            return false;
         }
         var _loc4_:int = param1.length - param2.length;
         if(_loc4_ < 0)
         {
            return false;
         }
         if(param3)
         {
            return param1.substr(_loc4_) == param2;
         }
         return param1.substr(_loc4_).toLowerCase() == param2.toLowerCase();
      }
   }
}

