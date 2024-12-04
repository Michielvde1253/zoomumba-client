package com.bigpoint.zoomumba.model.events.babyEvent
{
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.events.babyEvent.vo.BabyEventConfigVO;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class BabyEventProxy extends Proxy
   {
      public static const NAME:String = "BabyEventProxy";
      
      private var _config:BabyEventConfigVO = new BabyEventConfigVO();
      
      private var _sliderValue:int = 0;
      
      public function BabyEventProxy()
      {
         super(NAME,null);
      }
      
      public function updateSliderValue(param1:int) : void
      {
         this._sliderValue = param1;
         sendNotification(Note.BABY_EVENT_SLIDER_VALUE_UPDATE,this._sliderValue);
      }
      
      public function get sliderValue() : int
      {
         return this._sliderValue;
      }
      
      public function get config() : BabyEventConfigVO
      {
         return this._config;
      }
   }
}

