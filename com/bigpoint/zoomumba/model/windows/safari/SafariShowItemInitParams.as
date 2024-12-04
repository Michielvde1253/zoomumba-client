package com.bigpoint.zoomumba.model.windows.safari
{
   import com.bigpoint.zoorama.core.feature.safari.windows.components.SafariPriceItem;
   
   public class SafariShowItemInitParams
   {
      public var infoText:String = "";
      
      public var categoryId:int = 1;
      
      public var itemId:int = 1;
      
      public var safariPrize:SafariPriceItem;
      
      public var trap:Boolean;
      
      public function SafariShowItemInitParams(param1:String, param2:int, param3:int, param4:SafariPriceItem, param5:Boolean = false)
      {
         super();
         this.infoText = param1;
         this.categoryId = param2;
         this.itemId = param3;
         this.safariPrize = param4;
         this.trap = param5;
      }
   }
}

