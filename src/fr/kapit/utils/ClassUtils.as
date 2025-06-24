package fr.kapit.utils
{
   import flash.net.getClassByAlias;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   import mx.collections.ArrayCollection;
   import mx.collections.ICollectionView;
   import mx.controls.List;
   
   public class ClassUtils
   {
      public function ClassUtils()
      {
         super();
      }
      
      public static function getClassByName(param1:String) : Class
      {
         var classz:Class = null;
         var name:String = param1;
         try
         {
            classz = getClassByAlias(name);
         }
         catch(e:Error)
         {
            try
            {
               classz = getDefinitionByName(name) as Class;
            }
            catch(e2:Error)
            {
            }
         }
         return classz;
      }
      
      public static function getInstanceLabel(param1:Object) : String
      {
         var label:String = null;
         var idx:int = 0;
         var obj:Object = param1;
         if(!obj)
         {
            return null;
         }
         try
         {
            label = obj.label;
         }
         catch(e:Error)
         {
         }
         if(!label)
         {
            if(obj is Array || obj is ICollectionView || obj is ArrayCollection || obj is List)
            {
               label = ClassUtils.getShortClassName(obj);
            }
            else
            {
               label = obj.toString();
               idx = int(label.lastIndexOf("."));
               if(idx > 0)
               {
                  label = label.substring(idx + 1);
               }
            }
         }
         return label;
      }
      
      public static function getLabelForDisplayNode(param1:Object) : String
      {
         if(!param1)
         {
            return "";
         }
         var _loc2_:String = param1.toString();
         if(!_loc2_)
         {
            return "";
         }
         var _loc3_:int = int(_loc2_.lastIndexOf("."));
         return _loc3_ < 0 ? _loc2_ : _loc2_.substr(_loc3_ + 1);
      }
      
      public static function getMatchingClass(param1:*) : Class
      {
         var _loc2_:Class = null;
         if(param1 is String)
         {
            _loc2_ = getClassByAlias(param1);
         }
         else if(param1 is Class)
         {
            _loc2_ = param1 as Class;
         }
         else
         {
            _loc2_ = getObjectClass(param1);
         }
         return _loc2_;
      }
      
      public static function getObjectClass(param1:*) : Class
      {
         var classz:Class = null;
         var qualified:String = null;
         var target:* = param1;
         if(target is int)
         {
            classz = int;
         }
         else if(target is Number)
         {
            classz = Number;
         }
         else if(target == null)
         {
            classz = null;
         }
         else if(target is Class)
         {
            classz = target as Class;
         }
         else if(target is Function)
         {
            classz = Function;
         }
         else
         {
            qualified = getQualifiedClassName(target);
            try
            {
               classz = getDefinitionByName(qualified) as Class;
            }
            catch(e:Error)
            {
               classz = null;
            }
         }
         return classz;
      }
      
      public static function getShortClassName(param1:*) : String
      {
         var _loc2_:String = getQualifiedClassName(param1);
         var _loc3_:int = int(_loc2_.indexOf("::"));
         if(_loc3_ >= 0)
         {
            _loc2_ = _loc2_.substr(_loc3_ + 2);
         }
         return _loc2_;
      }
   }
}

