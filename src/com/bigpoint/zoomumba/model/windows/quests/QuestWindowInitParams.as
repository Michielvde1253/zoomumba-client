package com.bigpoint.zoomumba.model.windows.quests
{
   public class QuestWindowInitParams
   {
      public var defultTabNr:int;
      
      public var subPageId:int;
      
      public function QuestWindowInitParams(param1:int, param2:int = -1)
      {
         super();
         this.defultTabNr = param1;
         this.subPageId = param2;
      }
   }
}

