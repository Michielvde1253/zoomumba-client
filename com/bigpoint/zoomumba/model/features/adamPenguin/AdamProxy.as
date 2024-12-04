package com.bigpoint.zoomumba.model.features.adamPenguin
{
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.features.adamPenguin.vo.AdamViewVO;
   import com.bigpoint.zoomumba.model.gameConfig.AdamConfigProxy;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class AdamProxy extends Proxy
   {
      public static const NAME:String = "AdamProxy";
      
      public function AdamProxy()
      {
         super(NAME,new AdamViewVO());
      }
      
      public function pushAdam(param1:AdamViewVO) : void
      {
         var _loc2_:AdamConfigProxy = facade.retrieveProxy(AdamConfigProxy.NAME) as AdamConfigProxy;
         param1.configData = _loc2_.getConfigItem(param1.itemId);
         this.setAdamData(param1);
         sendNotification(Note.SHOW_ADAM);
      }
      
      public function get adamData() : AdamViewVO
      {
         return this.data as AdamViewVO;
      }
      
      private function setAdamData(param1:AdamViewVO) : void
      {
         this.data = param1;
      }
   }
}

