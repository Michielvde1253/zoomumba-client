package com.bigpoint.zoomumba.model.features.ranknig
{
   import com.bigpoint.zoomumba.model.features.ranknig.vo.RankingListVO;
   import org.puremvc.as3.interfaces.IProxy;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class RanknigProxy extends Proxy implements IProxy
   {
      public static const NAME:String = "RanknigProxy";
      
      private var ranknigData:Vector.<RankingListVO>;
      
      public function RanknigProxy()
      {
         super(NAME,new Vector.<RankingListVO>());
         this.ranknigData = data as Vector.<RankingListVO>;
      }
      
      public function setRanknigData(param1:int, param2:RankingListVO) : void
      {
         while(this.ranknigData.length <= param1)
         {
            this.ranknigData.push(new RankingListVO());
         }
         this.ranknigData[param1] = param2;
      }
      
      public function getRanknigData(param1:int) : RankingListVO
      {
         while(this.ranknigData.length <= param1)
         {
            this.ranknigData.push(new RankingListVO());
         }
         return this.ranknigData[param1];
      }
   }
}

