package com.bigpoint.zoomumba.model.features.powerup
{
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.features.powerup.vo.PowerupItemConfigVO;
   import com.bigpoint.zoomumba.model.features.powerup.vo.PowerupItemType;
   import com.bigpoint.zoomumba.model.features.powerup.vo.PowerupItemVO;
   import flash.utils.describeType;
   import org.puremvc.as3.interfaces.IProxy;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class PowerupProxy extends Proxy implements IProxy
   {
      public static const NAME:String = "PowerupProxy";
      
      private var powerupConfig:Vector.<PowerupItemConfigVO>;
      
      private var powerupItems:Vector.<PowerupItemVO>;
      
      public function PowerupProxy()
      {
         super(NAME);
         this.powerupConfig = new Vector.<PowerupItemConfigVO>();
         this.powerupItems = new Vector.<PowerupItemVO>();
      }
      
      public function addPowerupConfig(param1:PowerupItemConfigVO) : void
      {
         this.powerupConfig.push(param1);
      }
      
      public function addPowerupItem(param1:PowerupItemVO) : void
      {
         if(!this.exists(param1))
         {
            this.powerupItems.push(param1);
            if(this.powerUpIsHandled(param1.pid))
            {
               sendNotification(Note.POWERUP_ITEM_ADDED,param1.pid);
            }
         }
         else
         {
            this.updateItem(param1);
         }
         sendNotification(Note.POWERUP_ITEM_MODIFIED,param1.pid);
      }
      
      private function updateItem(param1:PowerupItemVO) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.powerupItems.length)
         {
            if(this.powerupItems[_loc2_].pid == param1.pid)
            {
               this.powerupItems[_loc2_].endTime = param1.endTime;
               this.powerupItems[_loc2_].lastActivated = param1.lastActivated;
               this.powerupItems[_loc2_].inUse = param1.inUse;
            }
            _loc2_++;
         }
      }
      
      public function removeItem(param1:int) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.powerupItems.length)
         {
            if(this.powerupItems[_loc2_].pid == param1)
            {
               this.powerupItems.splice(_loc2_,1);
            }
            _loc2_++;
         }
      }
      
      private function exists(param1:PowerupItemVO) : Boolean
      {
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         while(_loc3_ < this.powerupItems.length)
         {
            if(this.powerupItems[_loc3_].id == param1.id)
            {
               _loc2_ = true;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      private function powerUpIsHandled(param1:int) : Boolean
      {
         var _loc4_:* = undefined;
         var _loc2_:Boolean = false;
         var _loc3_:XML = describeType(PowerupItemType);
         for each(_loc4_ in _loc3_.constant)
         {
            if(int(PowerupItemType[_loc4_.@name]) == param1)
            {
               _loc2_ = true;
               break;
            }
         }
         return _loc2_;
      }
      
      public function getMultiplierByAffectedProperty(param1:int, param2:int) : Number
      {
         var _loc3_:Number = 0;
         var _loc4_:PowerupItemConfigVO = null;
         var _loc5_:int = 0;
         while(_loc5_ < this.powerupItems.length)
         {
            if(TimeManager.currentTime < this.powerupItems[_loc5_].endTime)
            {
               _loc4_ = this.getPowerupConfigVOById(this.powerupItems[_loc5_].pid);
               if((Boolean(_loc4_)) && _loc4_.affectedProp.mod > 0)
               {
                  if(_loc4_.affectedProp.category == param1 && _loc4_.affectedProp.affectedIds.indexOf(param2) > -1)
                  {
                     _loc3_ += _loc4_.affectedProp.mod;
                  }
               }
            }
            _loc5_++;
         }
         return _loc3_;
      }
      
      private function getPowerupConfigVOById(param1:int) : PowerupItemConfigVO
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(this.powerupConfig.length);
         while(_loc2_ < _loc3_)
         {
            if(this.powerupConfig[_loc2_].pID == param1)
            {
               return this.powerupConfig[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function getPowerupById(param1:int) : PowerupItemVO
      {
         var _loc2_:PowerupItemVO = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.powerupItems.length)
         {
            if(this.powerupItems[_loc3_].pid == param1)
            {
               _loc2_ = this.powerupItems[_loc3_];
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function isPowerupActive(param1:int) : Boolean
      {
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         while(_loc3_ < this.powerupItems.length)
         {
            if(this.powerupItems[_loc3_].pid == param1)
            {
               if(this.powerupItems[_loc3_].endTime > TimeManager.currentTime && Boolean(this.powerupItems[_loc3_].inUse))
               {
                  _loc2_ = true;
               }
            }
            _loc3_++;
         }
         return _loc2_;
      }
   }
}

