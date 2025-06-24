package com.bigpoint.zoomumba.model.app.resources.vo
{
   import flash.display.DisplayObjectContainer;
   
   public class SendResourceToFunctionVO
   {
      public var id:String;
      
      public var callbacks:Vector.<Function> = new Vector.<Function>();
      
      public var targets:Vector.<DisplayObjectContainer> = new Vector.<DisplayObjectContainer>();
      
      public function SendResourceToFunctionVO(param1:String, param2:Function, param3:DisplayObjectContainer = null)
      {
         super();
         this.id = param1;
         this.addCallback(param2,param3);
      }
      
      public function addCallback(param1:Function, param2:DisplayObjectContainer) : void
      {
         this.callbacks.push(param1);
         this.targets.push(param2);
      }
      
      public function dispose() : void
      {
         this.id = null;
         this.callbacks = null;
         this.targets = null;
      }
   }
}

