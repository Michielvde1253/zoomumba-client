package com.bigpoint.zoomumba.model.gameConfig
{
   import com.bigpoint.zoomumba.model.gameConfig.vo.FeatureConfigVO;
   import org.puremvc.as3.interfaces.IProxy;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class FeatureConfigProxy extends Proxy implements IProxy
   {
      public static const NAME:String = "FeatureConfigProxy";
      
      public function FeatureConfigProxy(param1:FeatureConfigVO)
      {
         super(NAME,param1);
      }
      
      public function get questLogging() : Boolean
      {
         return this.featureConfig.questLogging;
      }
      
      public function get tombolaLogging() : Boolean
      {
         return this.featureConfig.tombolaLogging;
      }
      
      public function get serverSideStacking() : Boolean
      {
         return this.featureConfig.serverSideStacking;
      }
      
      public function get storage() : Boolean
      {
         return this.featureConfig.storage;
      }
      
      public function get flexGUI() : Boolean
      {
         return this.featureConfig.flexGUI;
      }
      
      public function get cashFieldItemsAsBitmap() : Boolean
      {
         return this.featureConfig.cashFieldItemsAsBitmap;
      }
      
      public function get visitorWishes() : Boolean
      {
         return true;
      }
      
      public function get directRaise() : Boolean
      {
         return this.featureConfig.directRaise;
      }
      
      public function get cinema() : Boolean
      {
         return this.featureConfig.cinema;
      }
      
      private function get featureConfig() : FeatureConfigVO
      {
         return data as FeatureConfigVO;
      }
   }
}

