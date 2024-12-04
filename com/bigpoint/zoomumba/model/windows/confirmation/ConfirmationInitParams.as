package com.bigpoint.zoomumba.model.windows.confirmation
{
   public class ConfirmationInitParams
   {
      public var title:String;
      
      public var message:String;
      
      public function ConfirmationInitParams(param1:String, param2:String)
      {
         super();
         this.title = param1;
         this.message = param2;
      }
   }
}

