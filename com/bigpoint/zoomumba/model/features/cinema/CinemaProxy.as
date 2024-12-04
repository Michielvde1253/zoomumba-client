package com.bigpoint.zoomumba.model.features.cinema
{
   import com.bigpoint.utils.ObjectHelper;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.app.core.vo.CurrencyVO;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class CinemaProxy extends Proxy
   {
      public static const NAME:String = "CinemaProxy";
      
      public var time:int;
      
      private var _tickets:int = 0;
      
      public function CinemaProxy(param1:Vector.<Object>)
      {
         var _loc2_:int = int(param1.length);
         var _loc3_:Vector.<CurrencyVO> = new Vector.<CurrencyVO>(_loc2_,true);
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            _loc3_[_loc4_] = ObjectHelper.copyData(new CurrencyVO(),param1[_loc4_]);
            _loc4_++;
         }
         super(NAME,_loc3_);
      }
      
      public function get rewards() : Vector.<CurrencyVO>
      {
         return data as Vector.<CurrencyVO>;
      }
      
      public function get tickets() : int
      {
         return this._tickets;
      }
      
      public function set tickets(param1:int) : void
      {
         this._tickets = Math.max(param1,0);
         sendNotification(Note.CINEMA_TICKET_CHANGED,{"tickets":this._tickets});
      }
   }
}

