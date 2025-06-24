package com.bigpoint.zoorama.view.field
{
   import com.bigpoint.utils.notificator.Notice;
   
   public class PlayFieldNotice extends Notice
   {
      public static const SCREEN_MOVE:String = "playFieldScreenMove";
      
      public static const ACTIVATE_EXPAND_BUY:String = "playFieldActivateExpandBuy";
      
      public static const REMOVE_ALL_ITEMS:String = "playFieldRemoveAllItems";
      
      public static const ALL_ITEMS_REMOVED:String = "playFieldHaveBeenRemoved";
      
      public var playFieldX:int = -1;
      
      public var playFieldY:int = -1;
      
      public var clearFor:String;
      
      public function PlayFieldNotice(param1:String, param2:int = -1, param3:int = -1, param4:String = null)
      {
         super(param1);
         this.playFieldX = param2;
         this.playFieldY = param3;
         this.clearFor = param4;
      }
   }
}

