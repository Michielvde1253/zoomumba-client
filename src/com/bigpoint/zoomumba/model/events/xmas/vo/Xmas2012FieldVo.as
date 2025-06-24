package com.bigpoint.zoomumba.model.events.xmas.vo
{
   import flash.utils.Dictionary;
   
   public class Xmas2012FieldVo
   {
      public var rewards:Vector.<Xmas2012RewardVo>;
      
      public var round:uint;
      
      public var progress:uint;
      
      public var neededAmount:int;
      
      public var currentStep:uint;
      
      public var uid:uint;
      
      public var type:String;
      
      public var displayIds:Array;
      
      public var displayIdWeight:Dictionary;
      
      public function Xmas2012FieldVo()
      {
         super();
      }
      
      public function getDisplayWeight(param1:int) : int
      {
         if(this.displayIdWeight[param1] != null)
         {
            return this.displayIdWeight[param1];
         }
         return 1;
      }
      
      public function getFirstDisplayId() : int
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:* = this.displayIds;
         for each(_loc1_ in _loc3_)
         {
            return _loc1_;
         }
         return -1;
      }
   }
}

