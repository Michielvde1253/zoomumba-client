package com.bigpoint.zoorama.notices.gui.window
{
   public class ConstructionWindowNotice extends WindowNotice
   {
      public var titleId:String = this.titleId;
      
      public var textId:String = this.textId;
      
      public var replaceIds:Object = this.replaceIds;
      
      public var replaceVars:Object = this.replaceVars;
      
      public var objectId:String;
      
      public var itemCategory:int;
      
      public var itemUniqueId:int;
      
      public var buildTimeStamp:int;
      
      public var buildTime:int;
      
      public var directBuildReal:int;
      
      public function ConstructionWindowNotice(param1:String, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int)
      {
         this.itemCategory = param3;
         this.itemUniqueId = param4;
         this.buildTimeStamp = param5;
         this.buildTime = param6;
         this.directBuildReal = param7;
         super(param1,param2,null);
      }
   }
}

