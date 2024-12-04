package com.bigpoint.utils
{
   import flash.net.registerClassAlias;
   import flash.utils.ByteArray;
   import flash.utils.describeType;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   
   public class ObjectHelper
   {
      private static var typePropertiesCache:Object = {};
      
      public function ObjectHelper()
      {
         super();
      }
      
      public static function toArray(param1:Object) : Array
      {
         var _loc2_:int = int(param1.length);
         var _loc3_:Array = new Array(_loc2_);
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_[_loc4_] = param1[_loc4_];
            _loc4_++;
         }
         return _loc3_;
      }
      
      public static function clone(param1:Object) : Object
      {
         registerClassAlias(getQualifiedClassName(param1).replace("::","."),Object(param1).constructor);
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeObject(param1);
         _loc2_.position = 0;
         return _loc2_.readObject();
      }
      
      public static function copyData(param1:*, param2:*) : *
      {
         var _loc5_:String = null;
         var _loc6_:Class = null;
         var _loc3_:Vector.<String> = getPropertyNames(param2);
         var _loc4_:* = null;
         for each(_loc5_ in _loc3_)
         {
            _loc4_ = param2[_loc5_];
            if(_loc4_ == null || _loc4_ == undefined)
            {
               continue;
            }
            _loc6_ = getDefinitionByName(getQualifiedClassName(_loc4_)) as Class;
            switch(_loc6_)
            {
               case Object:
               case String:
               case XML:
               case Number:
               case int:
               case uint:
               case Array:
               case Boolean:
                  fillData(param1,param2,_loc5_);
                  break;
               default:
                  _loc6_ = getDefinitionByName(getQualifiedClassName(param1[_loc5_])) as Class;
                  param1[_loc5_] = new _loc6_();
                  copyData(param1[_loc5_],_loc4_);
                  break;
            }
         }
         return param1;
      }
      
      private static function fillData(param1:*, param2:*, param3:String) : void
      {
         var c:Class;
         var name:String = null;
         var p_target:* = param1;
         var p_source:* = param2;
         var p_prop:String = param3;
         if(!(p_target as Object).hasOwnProperty(p_prop) || !(p_source as Object).hasOwnProperty(p_prop))
         {
            return;
         }
         c = null;
         try
         {
            name = getQualifiedClassName(p_target[p_prop]);
            c = getDefinitionByName(name) as Class;
         }
         catch(e:Error)
         {
         }
         finally
         {
            switch(c)
            {
               case XML:
                  if(p_source[p_prop] is XML)
                  {
                     p_target[p_prop] = p_source[p_prop];
                  }
                  else
                  {
                     p_target[p_prop] = new XML(p_source[p_prop]);
                  }
                  break;
               case Number:
                  p_target[p_prop] = Number(p_source[p_prop]);
                  break;
               case int:
                  p_target[p_prop] = int(p_source[p_prop]);
                  break;
               case uint:
                  p_target[p_prop] = uint(p_source[p_prop]);
                  break;
               case Boolean:
                  p_target[p_prop] = Boolean(p_source[p_prop]);
                  break;
               default:
                  p_target[p_prop] = p_source[p_prop];
            }
         }
      }
      
      public static function objToArray(param1:Object) : Array
      {
         var _loc3_:String = null;
         var _loc2_:Array = new Array();
         for(_loc3_ in param1)
         {
            _loc2_.push(param1[_loc3_]);
         }
         return _loc2_;
      }
      
      public static function lengthOf(param1:Object) : int
      {
         var _loc3_:String = null;
         var _loc2_:int = 0;
         for(_loc3_ in param1)
         {
            _loc2_++;
         }
         return _loc2_;
      }
      
      public static function getPropertyNames(param1:Object) : Vector.<String>
      {
         var _loc4_:String = null;
         var _loc5_:XML = null;
         var _loc6_:XML = null;
         var _loc2_:String = getQualifiedClassName(param1);
         var _loc3_:Vector.<String> = new Vector.<String>();
         for(_loc4_ in param1)
         {
            _loc3_.push(_loc4_);
         }
         if(_loc3_.length == 0)
         {
            if(typePropertiesCache[_loc2_])
            {
               return typePropertiesCache[_loc2_];
            }
            _loc5_ = describeType(param1);
            for each(_loc6_ in _loc5_.variable)
            {
               _loc3_.push(_loc6_.@name);
            }
         }
         return typePropertiesCache[_loc2_] = _loc3_;
      }
   }
}

