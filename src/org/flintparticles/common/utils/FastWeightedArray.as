package org.flintparticles.common.utils
{
   public class FastWeightedArray
   {
      private var _values:Vector.<Pair>;
      
      private var _totalRatios:Number;
      
      public function FastWeightedArray()
      {
         super();
         this._values = new Vector.<Pair>();
         this._totalRatios = 0;
      }
      
      public function add(param1:*, param2:Number) : uint
      {
         this._totalRatios += param2;
         this._values.push(new Pair(this._totalRatios,param1));
         return this._values.length;
      }
      
      public function clear() : void
      {
         this._values.length = 0;
         this._totalRatios = 0;
      }
      
      public function get length() : uint
      {
         return this._values.length;
      }
      
      public function get totalRatios() : Number
      {
         return this._totalRatios;
      }
      
      public function getRandomValue() : *
      {
         var _loc3_:uint = 0;
         var _loc1_:Number = Math.random() * this._totalRatios;
         var _loc2_:uint = 0;
         var _loc4_:uint = this._values.length;
         while(_loc2_ < _loc4_)
         {
            _loc3_ = Math.floor((_loc2_ + _loc4_) * 0.5);
            if(this._values[_loc3_].topWeight < _loc1_)
            {
               _loc2_ = uint(_loc3_ + 1);
            }
            else
            {
               _loc4_ = _loc3_;
            }
         }
         return this._values[_loc2_].value;
      }
   }
}

class Pair
{
   internal var topWeight:Number;
   
   internal var value:*;
   
   public function Pair(param1:Number, param2:*)
   {
      super();
      this.topWeight = param1;
      this.value = param2;
   }
}
