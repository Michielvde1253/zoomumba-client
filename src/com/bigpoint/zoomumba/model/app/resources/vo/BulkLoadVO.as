package com.bigpoint.zoomumba.model.app.resources.vo
{
   import com.greensock.loading.LoaderMax;
   import flash.utils.Dictionary;
   
   public class BulkLoadVO
   {
      public var id:String;
      
      public var queue:LoaderMax;
      
      public var resources:Dictionary;
      
      public var idsList:Vector.<String>;
      
      public var callbackComplete:Function;
      
      public var callbackItem:Function;
      
      public function BulkLoadVO(param1:String, param2:LoaderMax, param3:Vector.<String>, param4:Dictionary, param5:Function = null, param6:Function = null)
      {
         super();
         this.id = param1;
         this.queue = param2;
         this.idsList = param3;
         this.resources = param4;
         this.callbackComplete = param5;
         this.callbackItem = param6;
      }
      
      public function get numResources() : uint
      {
         return this.idsList.length;
      }
      
      public function get numResourcesDecoded() : uint
      {
         var _loc2_:* = undefined;
         var _loc1_:uint = 0;
         for(_loc2_ in this.resources)
         {
            _loc1_++;
         }
         return _loc1_;
      }
   }
}

