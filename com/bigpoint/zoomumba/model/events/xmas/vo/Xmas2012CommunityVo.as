package com.bigpoint.zoomumba.model.events.xmas.vo
{
   import flash.utils.Dictionary;
   
   public class Xmas2012CommunityVo
   {
      public var steps:Vector.<XMas2012StepVo>;
      
      public var round:uint;
      
      public var progress:uint;
      
      public var neededAmount:int;
      
      public var currentStep:uint;
      
      public var uid:uint;
      
      public var displayIds:Array;
      
      public var displayIdWeight:Dictionary = new Dictionary();
      
      public function Xmas2012CommunityVo()
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
   }
}

