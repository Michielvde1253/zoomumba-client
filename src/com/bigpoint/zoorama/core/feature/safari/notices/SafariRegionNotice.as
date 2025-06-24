package com.bigpoint.zoorama.core.feature.safari.notices
{
   import com.bigpoint.utils.notificator.Notice;
   
   public class SafariRegionNotice extends Notice
   {
      public static const ACTIVETE_REGION:String = "safariActivateRegion";
      
      public static const MOUSE_DOWN_REGION:String = "safariMouseDownRegion";
      
      public var regionId:int;
      
      public function SafariRegionNotice(param1:String, param2:int = -1)
      {
         super(param1);
         this.regionId = param2;
      }
   }
}

