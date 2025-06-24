package com.bigpoint.zoomumba.model.features.adamPenguin.vo
{
   import com.bigpoint.zoomumba.model.gameConfig.vo.AdamConfigVO;
   
   public class AdamViewVO
   {
      public var type:String = "";
      
      public var itemId:int = -1;
      
      public var url:String = "";
      
      public var ajax:String = "";
      
      public var configData:AdamConfigVO = new AdamConfigVO();
      
      public function AdamViewVO()
      {
         super();
      }
   }
}

