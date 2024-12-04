package com.bigpoint.zoomumba.model.app.items
{
   public class BlueprintInfoVO extends ItemVO
   {
      public var neededMaterials:Vector.<ItemStackVO> = new Vector.<ItemStackVO>();
      
      public var blueprintId:int;
      
      public var duration:int;
      
      public var petpaws:int;
      
      public var craftInstantReal:int;
      
      public function BlueprintInfoVO()
      {
         super();
      }
   }
}

