package com.bigpoint.zoomumba.model.windowSystem.vo
{
   public class WindowTypeDefitinion
   {
      private static var windowDifinitonCount:int = 0;
      
      private var _windowDefinitionId:int = 0;
      
      private var isStacked:Boolean;
      
      public var windowTypeClass:Class;
      
      public var flexClass:Class;
      
      public var isModal:Boolean;
      
      public var isStacking:Boolean;
      
      public var openStrategy:int;
      
      public function WindowTypeDefitinion(param1:Class, param2:Class, param3:int = 0, param4:Boolean = true, param5:Boolean = true)
      {
         super();
         this.windowTypeClass = param1;
         this.flexClass = param2;
         this.openStrategy = param3;
         this.isModal = param4;
         this.isStacked = param5;
         ++WindowTypeDefitinion.windowDifinitonCount;
         this._windowDefinitionId = WindowTypeDefitinion.windowDifinitonCount;
      }
      
      public function get windowDefinitionId() : int
      {
         return this._windowDefinitionId;
      }
   }
}

