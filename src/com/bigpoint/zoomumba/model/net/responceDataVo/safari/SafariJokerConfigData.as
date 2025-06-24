package com.bigpoint.zoomumba.model.net.responceDataVo.safari
{
   public class SafariJokerConfigData
   {
      public static const JOKER_GROUP_GUIDE:int = 1;
      
      public static const JOKER_GROUP_MAP:int = 2;
      
      public var id:int = -1;
      
      public var groupId:int = -1;
      
      public var virtualPrice:int = 0;
      
      public var realPrice:int = 0;
      
      public function SafariJokerConfigData()
      {
         super();
      }
      
      public function set buyReal(param1:int) : void
      {
         this.realPrice = param1;
      }
      
      public function set buyVirtual(param1:int) : void
      {
         this.virtualPrice = param1;
      }
      
      public function toString() : String
      {
         return "[SafariJokerConfigData id=" + this.id + " groupId=" + this.groupId + " virtualPrice=" + this.virtualPrice + " realPrice=" + this.realPrice + "]";
      }
   }
}

