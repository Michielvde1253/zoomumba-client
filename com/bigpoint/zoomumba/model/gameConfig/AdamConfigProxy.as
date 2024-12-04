package com.bigpoint.zoomumba.model.gameConfig
{
   import com.bigpoint.zoomumba.model.gameConfig.vo.AdamConfigVO;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class AdamConfigProxy extends Proxy
   {
      public static const NAME:String = "AdamConfigProxy";
      
      private var adamConfig:Vector.<AdamConfigVO> = new Vector.<AdamConfigVO>();
      
      public function AdamConfigProxy()
      {
         super(NAME);
      }
      
      public function addConfigItem(param1:AdamConfigVO) : void
      {
         this.adamConfig.push(param1);
      }
      
      public function getConfigItem(param1:int) : AdamConfigVO
      {
         var _loc2_:AdamConfigVO = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.adamConfig.length)
         {
            if(this.adamConfig[_loc3_].packId == param1)
            {
               _loc2_ = this.adamConfig[_loc3_];
            }
            _loc3_++;
         }
         return _loc2_;
      }
   }
}

