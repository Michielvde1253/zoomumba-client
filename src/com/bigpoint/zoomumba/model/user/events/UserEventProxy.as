package com.bigpoint.zoomumba.model.user.events
{
   import com.bigpoint.zoomumba.constants.DataNote;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.EventTypes;
   import com.bigpoint.zoomumba.model.user.events.vo.UserEventVO;
   import flash.utils.Dictionary;
   import org.puremvc.as3.interfaces.IProxy;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class UserEventProxy extends Proxy implements IProxy
   {
      public static const NAME:String = "UserEventProxy";
      
      private var allUsedBunnies:Dictionary = new Dictionary();
      
      private var allUsedBunnyEggs:Dictionary = new Dictionary();
      
      public function UserEventProxy()
      {
         super(NAME,new Dictionary());
      }
      
      public function storeUserEventData(param1:UserEventVO) : void
      {
         this.userEventList[param1.id] = param1;
         sendNotification(DataNote.USER_EVENT_DATA_STORED,param1.id);
      }
      
      public function getUserEvent(param1:int) : UserEventVO
      {
         if(this.userEventList[param1])
         {
            return this.userEventList[param1];
         }
         sendNotification(Note.WARNING_REPORT,"USER EVENT WITH ID " + param1 + " IS NOT REGISTERED");
         return null;
      }
      
      private function get userEventList() : Dictionary
      {
         return data as Dictionary;
      }
      
      public function getEsterBunnyCount() : int
      {
         var _loc2_:Object = null;
         var _loc3_:String = null;
         var _loc1_:int = 0;
         if(this.userEventList[EventTypes.EASTER_EVENT])
         {
            _loc2_ = (this.userEventList[EventTypes.EASTER_EVENT] as UserEventVO).params["bunnies"];
            for(_loc3_ in _loc2_)
            {
               _loc1_++;
            }
         }
         return _loc1_;
      }
      
      public function getEsterNextBunnyId() : int
      {
         var _loc2_:Object = null;
         var _loc3_:String = null;
         var _loc1_:int = -1;
         if(this.userEventList[EventTypes.EASTER_EVENT])
         {
            _loc2_ = (this.userEventList[EventTypes.EASTER_EVENT] as UserEventVO).params["bunnies"];
            for(_loc3_ in _loc2_)
            {
               if(this.allUsedBunnies[_loc3_] != true)
               {
                  this.allUsedBunnies[_loc3_] = true;
                  _loc1_ = int(_loc3_);
                  break;
               }
            }
         }
         return _loc1_;
      }
      
      public function getEsterNextEggIdForBunny(param1:int, param2:int) : int
      {
         var _loc4_:Object = null;
         var _loc5_:Object = null;
         var _loc6_:String = null;
         var _loc3_:int = -1;
         if(this.userEventList[EventTypes.EASTER_EVENT])
         {
            _loc4_ = (this.userEventList[EventTypes.EASTER_EVENT] as UserEventVO).params["bunnies"];
            if(_loc4_)
            {
               _loc5_ = _loc4_[param1];
               for(_loc6_ in _loc5_)
               {
                  if(_loc6_ != "time")
                  {
                     if(this.allUsedBunnyEggs[param1 + "-" + _loc6_ + "-" + String(_loc4_[param1])] != true)
                     {
                        if(int(_loc5_[_loc6_]) < param2)
                        {
                           this.allUsedBunnyEggs[param1 + "-" + _loc6_ + "-" + String(_loc4_[param1])] = true;
                           if(_loc3_ < 0 || _loc5_[_loc6_] < _loc5_[_loc3_])
                           {
                              _loc3_ = int(_loc6_);
                              break;
                           }
                        }
                     }
                  }
               }
            }
         }
         return _loc3_;
      }
      
      public function clearEsterDataUsage() : void
      {
         this.allUsedBunnies = new Dictionary();
         this.allUsedBunnyEggs = new Dictionary();
      }
   }
}

