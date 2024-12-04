package com.bigpoint.zoomumba.model.windows.adam
{
   import com.bigpoint.zoomumba.model.features.adamPenguin.vo.AdamViewVO;
   
   public class AdamWindowInitParams
   {
      public var adamParams:AdamViewVO;
      
      public function AdamWindowInitParams(param1:AdamViewVO)
      {
         super();
         this.adamParams = param1;
      }
   }
}

