package com.bigpoint.zoomumba.model.features.counter
{
   import com.bigpoint.utils.ObjectHelper;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.features.counter.vo.CounterValueVO;
   import flash.utils.Dictionary;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class CounterValuesProxy extends Proxy
   {
      public static const NAME:String = "CounterValuesProxy";
      
      private var _counters:Dictionary = new Dictionary();
      
      public function CounterValuesProxy()
      {
         super(NAME,null);
      }
      
      public function getCounterById(param1:int) : CounterValueVO
      {
         if(!this._counters[param1])
         {
            return new CounterValueVO(param1,0);
         }
         return this._counters[param1] as CounterValueVO;
      }
      
      public function parseCounters(param1:Object, param2:Boolean = false) : void
      {
         var _loc3_:String = null;
         var _loc4_:CounterValueVO = null;
         for(_loc3_ in param1)
         {
            _loc4_ = new CounterValueVO();
            ObjectHelper.copyData(_loc4_,param1[_loc3_]);
            if(this._counters[_loc4_.id])
            {
               CounterValueVO(this._counters[_loc4_.id]).count = _loc4_.count;
            }
            else
            {
               this._counters[_loc4_.id] = _loc4_;
            }
         }
         if(param2)
         {
            sendNotification(Note.GAME_COUNTER_UPDATED);
         }
      }
   }
}

