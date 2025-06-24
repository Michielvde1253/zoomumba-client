package com.bigpoint.zoorama.notices.view.quickInfo
{
   import com.bigpoint.utils.notificator.Notice;
   import flash.geom.Point;
   
   public class QuickInfoNotice extends Notice
   {
      public static const INCREASE_RESOURCE:String = "increaseResourceQuickInfo";
      
      public static const REDUCE_RESOURCE:String = "reduceResourceQuickInfo";
      
      public static const INCREASE_CURRENCY:String = "increaseCurrencyQuickInfo";
      
      public static const REDUCE_CURRENCY:String = "reduceCurrencyQuickInfo";
      
      public var position:Point = new Point(-1000,0);
      
      public var resourceId:int = -1;
      
      public var amount:Number = 0;
      
      public function QuickInfoNotice(param1:String, param2:int, param3:Number, param4:Point)
      {
         super(param1);
         this.position = param4;
         this.resourceId = param2;
         this.amount = param3;
      }
   }
}

