package com.bigpoint.zoomumba.model.gameConfig.vo
{
   public class ItemAssetVO
   {
      public var category:int;
      
      public var itemId:int;
      
      public var linkage:String;
      
      public var preloaderType:int;
      
      public var fixedWidth:int;
      
      public var fixedHeight:int;
      
      public var scale:Number;
      
      public var callBack:Function = null;
      
      public var callBackParams:Array = [];
      
      public function ItemAssetVO(param1:int = -1, param2:int = -1, param3:String = "ObjectSPR", param4:int = 0, param5:int = -1, param6:int = -1, param7:Number = 1, param8:Function = null, param9:Array = null)
      {
         super();
         this.category = param1;
         this.itemId = param2;
         this.linkage = param3;
         this.preloaderType = param4;
         this.fixedWidth = param5;
         this.fixedHeight = param6;
         this.scale = param7;
         this.callBack = this.callBack;
         this.callBackParams = param9;
      }
   }
}

