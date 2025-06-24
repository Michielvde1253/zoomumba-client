package fr.kapit.utils
{
   import mx.collections.ArrayCollection;
   import mx.utils.ArrayUtil;
   
   public final class ArrayUtils
   {
      public function ArrayUtils()
      {
         super();
      }
      
      public static function getArrayAsLookupObject(param1:Array, param2:String) : Object
      {
         var _loc4_:int = 0;
         var _loc5_:Object = null;
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc3_:Object = new Object();
         if(param1 != null)
         {
            _loc4_ = 0;
            while(_loc4_ < param1.length)
            {
               _loc5_ = param1[_loc4_];
               if(_loc5_.hasOwnProperty(param2))
               {
                  _loc6_ = _loc5_[param2];
                  if(!StringUtils.isEmpty(_loc6_))
                  {
                     _loc3_[_loc6_] = new Object();
                     for(_loc7_ in _loc5_)
                     {
                        _loc3_[_loc6_][_loc7_] = _loc5_[_loc7_];
                     }
                  }
               }
               _loc4_++;
            }
         }
         return _loc3_;
      }
      
      public static function getObjectByProperty(param1:Array, param2:String, param3:*) : Object
      {
         var _loc4_:Object = null;
         for each(_loc4_ in param1)
         {
            if(_loc4_.hasOwnProperty(param2))
            {
               if(_loc4_[param2] == param3)
               {
                  return _loc4_;
               }
            }
         }
         return null;
      }
      
      public static function getSafeArray(param1:Object) : ArrayCollection
      {
         var _loc2_:Array = null;
         if(!(param1 is ArrayCollection))
         {
            _loc2_ = ArrayUtil.toArray(param1);
            param1 = new ArrayCollection(_loc2_);
         }
         return param1 as ArrayCollection;
      }
   }
}

