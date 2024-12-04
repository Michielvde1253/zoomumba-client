package com.bigpoint.zoomumba.model.gameConfig
{
   import com.bigpoint.zoomumba.model.gameConfig.vo.PromoPackVO;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class PromoPackProxy extends Proxy
   {
      public static const NAME:String = "PromoPackProxy";
      
      private var promoPacks:Vector.<PromoPackVO> = new Vector.<PromoPackVO>();
      
      public function PromoPackProxy()
      {
         super(NAME);
      }
      
      public function addPack(param1:PromoPackVO) : void
      {
         this.promoPacks.push(param1);
      }
      
      public function getPackById(param1:int) : PromoPackVO
      {
         var _loc2_:PromoPackVO = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.promoPacks.length)
         {
            if(this.promoPacks[_loc3_].packId == param1)
            {
               _loc2_ = this.promoPacks[_loc3_] as PromoPackVO;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function get packCount() : int
      {
         return this.promoPacks.length;
      }
   }
}

