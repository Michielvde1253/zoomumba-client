package com.bigpoint.zoomumba.model.features.circus.vo
{
   public class CircusVO
   {
      public var currentPositionOfCrates:Array = [];
      
      public var currentIndexOfCrates:Array = [];
      
      public var positionsOfCrates:Array = [[40,92],[41,92],[38,91],[39,91],[40,91],[38,90],[39,90],[40,90],[37,92],[37,91],[38,92],[39,92],[39,93],[40,93],[41,93],[42,92],[41,91],[41,90],[40,89],[40,88]];
      
      public var crateAmount:int = 0;
      
      public var speciesId:Vector.<int>;
      
      public var rewardType:String = null;
      
      public var rewardId:int = 0;
      
      public function CircusVO(param1:Vector.<int>)
      {
         super();
         this.speciesId = param1;
      }
   }
}

