package com.bigpoint.zoomumba.model.events.ballonEvent
{
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.events.ballonEvent.vo.BallonEventVo;
   import com.bigpoint.zoomumba.model.events.ballonEvent.vo.BoardgameDropPackVo;
   import com.bigpoint.zoomumba.model.features.collectables.CollectablesProxy;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class BallonEventProxy extends Proxy
   {
      public static const NAME:String = "BallonEventProxy";
      
      public function BallonEventProxy(param1:Object = null)
      {
         var _loc2_:Object = null;
         var _loc3_:String = null;
         var _loc4_:Object = null;
         var _loc5_:String = null;
         var _loc7_:BoardgameDropPackVo = null;
         var _loc6_:BallonEventVo = new BallonEventVo();
         for(_loc3_ in param1)
         {
            _loc2_ = param1[_loc3_];
            if(_loc2_.bpm)
            {
               _loc6_.ballonsPerMinute = parseInt(String(_loc2_.bpm));
               _loc6_.eventId = parseInt(String(_loc3_));
            }
            if(_loc2_.ballonId)
            {
               _loc6_.ballonId = parseInt(String(_loc2_.ballonId));
            }
            if(_loc2_.dartId)
            {
               _loc6_.dartId = parseInt(String(_loc2_.dartId));
            }
            if(_loc2_.dropPacks)
            {
               _loc6_.dropPack = new Vector.<BoardgameDropPackVo>();
               for(_loc5_ in _loc2_.dropPacks)
               {
                  _loc7_ = new BoardgameDropPackVo();
                  _loc4_ = _loc2_.dropPacks[_loc5_];
                  if(_loc4_.amount)
                  {
                     _loc7_.amount = _loc4_.amount;
                  }
                  if(_loc4_.currencyReal)
                  {
                     _loc7_.currencyReal = _loc4_.currencyReal;
                  }
                  if(_loc4_.packId)
                  {
                     _loc7_.packId = _loc4_.packId;
                  }
                  if(_loc4_.itemId)
                  {
                     _loc7_.itemId = _loc4_.itemId;
                  }
                  if(_loc4_.type)
                  {
                     _loc7_.type = _loc4_.type;
                  }
                  if(_loc6_.eventId)
                  {
                     _loc7_.eventId = _loc6_.eventId;
                  }
                  _loc6_.dropPack.push(_loc7_);
               }
            }
         }
         super(BallonEventProxy.NAME,_loc6_);
         this.updateDartCount();
      }
      
      public function refreshVo(param1:BallonEventVo) : void
      {
         super.data = param1;
         this.updateDartCount();
      }
      
      override public function onRegister() : void
      {
         super.onRegister();
         if(this.proxyData.ballonsPerMinute > 0)
         {
            sendNotification(Note.ON_REGISTER_BALLONS);
            this.updateDartCount();
         }
      }
      
      public function updateDartCount() : void
      {
         this.proxyData.dartCount = this.collectableProxy.getCollectableAmmount(this.proxyData.dartId);
         data = this.proxyData;
         sendNotification(Note.ON_UPDATE_BALLON_DARTS);
      }
      
      public function shootBallon(param1:String, param2:int = -1) : void
      {
         if(this.getCounter() > 0)
         {
            --this.proxyData.dartCount;
            data = this.proxyData;
            sendNotification(Note.ON_UPDATE_BALLON_DARTS);
            if(param2 == -1)
            {
               this.netProxy.callServer(NET.EXPLODE_BALLONS,[this.proxyData.eventId]).sendNow();
            }
            else
            {
               this.netProxy.callServer(NET.EXPLODE_BALLONS_TYPE,[this.proxyData.eventId,param2]).sendNow();
            }
            sendNotification(Note.ON_EXPLODE_BALLON,param1);
         }
      }
      
      public function getCounter() : int
      {
         return this.proxyData.dartCount;
      }
      
      public function get netProxy() : NetProxy
      {
         return facade.retrieveProxy(NetProxy.NAME) as NetProxy;
      }
      
      public function get collectableProxy() : CollectablesProxy
      {
         return facade.retrieveProxy(CollectablesProxy.NAME) as CollectablesProxy;
      }
      
      public function get proxyData() : BallonEventVo
      {
         if(super.data == null)
         {
            super.data = new BallonEventVo();
         }
         return super.data as BallonEventVo;
      }
   }
}

