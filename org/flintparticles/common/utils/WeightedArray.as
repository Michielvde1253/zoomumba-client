package org.flintparticles.common.utils
{
   import flash.utils.Proxy;
   import flash.utils.flash_proxy;
   
   use namespace flash_proxy;
   
   public class WeightedArray extends Proxy
   {
      private var _values:Vector.<Pair>;
      
      private var _totalWeights:Number;
      
      public function WeightedArray()
      {
         super();
         this._values = new Vector.<Pair>();
         this._totalWeights = 0;
      }
      
      override flash_proxy function getProperty(param1:*) : *
      {
         var _loc2_:int = int(param1);
         if(_loc2_ == param1 && _loc2_ < this._values.length && Boolean(this._values[_loc2_]))
         {
            return this._values[_loc2_].value;
         }
         return undefined;
      }
      
      override flash_proxy function setProperty(param1:*, param2:*) : void
      {
         var _loc3_:uint = uint(param1);
         if(_loc3_ == param1 && _loc3_ < this._values.length)
         {
            this._values[_loc3_].value = param2;
         }
      }
      
      override flash_proxy function nextNameIndex(param1:int) : int
      {
         if(param1 < this._values.length)
         {
            return param1 + 1;
         }
         return 0;
      }
      
      override flash_proxy function nextName(param1:int) : String
      {
         return (param1 - 1).toString();
      }
      
      override flash_proxy function nextValue(param1:int) : *
      {
         return this._values[param1 - 1].value;
      }
      
      public function add(param1:*, param2:Number) : uint
      {
         this._totalWeights += param2;
         this._values.push(new Pair(param2,param1));
         return this._values.length;
      }
      
      public function remove(param1:*) : Boolean
      {
         var _loc2_:uint = this._values.length;
         while(_loc2_--)
         {
            if(this._values[_loc2_].value == param1)
            {
               this._totalWeights -= Pair(this._values[_loc2_]).weight;
               this._values.splice(_loc2_,1);
               return true;
            }
         }
         return false;
      }
      
      public function contains(param1:*) : Boolean
      {
         var _loc2_:uint = this._values.length;
         while(_loc2_--)
         {
            if(this._values[_loc2_].value == param1)
            {
               return true;
            }
         }
         return false;
      }
      
      public function removeAt(param1:uint) : *
      {
         var _loc2_:* = this._values[param1].value;
         this._totalWeights -= this._values[param1].weight;
         this._values.splice(param1,1);
         return _loc2_;
      }
      
      public function clear() : void
      {
         this._values.length = 0;
         this._totalWeights = 0;
      }
      
      public function get length() : uint
      {
         return this._values.length;
      }
      
      public function get totalWeights() : Number
      {
         return this._totalWeights;
      }
      
      public function getRandomValue() : *
      {
         var _loc1_:Number = Math.random() * this._totalWeights;
         var _loc2_:Number = 0;
         var _loc3_:int = int(this._values.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ += this._values[_loc4_].weight;
            if(_loc2_ >= _loc1_)
            {
               return this._values[_loc4_].value;
            }
            _loc4_++;
         }
         return this._values[_loc3_ - 1].value;
      }
   }
}

class Pair
{
   internal var weight:Number;
   
   internal var value:*;
   
   public function Pair(param1:Number, param2:*)
   {
      super();
      this.weight = param1;
      this.value = param2;
   }
}
