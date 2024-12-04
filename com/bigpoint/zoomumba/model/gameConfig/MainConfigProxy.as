package com.bigpoint.zoomumba.model.gameConfig
{
   import com.bigpoint.zoomumba.model.gameConfig.vo.MainConfigVO;
   import com.bigpoint.zoorama.data.settings.WelcomeBackItem;
   import org.puremvc.as3.interfaces.IProxy;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class MainConfigProxy extends Proxy implements IProxy
   {
      public static const NAME:String = "GameConfigProxy";
      
      public function MainConfigProxy(param1:MainConfigVO)
      {
         super(NAME,param1);
      }
      
      private function get mainConfigVO() : MainConfigVO
      {
         return data as MainConfigVO;
      }
      
      public function get maxXPLevel() : int
      {
         return this.mainConfigVO.userExperienceLevels.length - 1;
      }
      
      public function getNextHighestXPLevel(param1:int) : int
      {
         var _loc2_:int = -1;
         var _loc3_:int = this.maxXPLevel;
         var _loc4_:int = 0;
         while(_loc4_ <= _loc3_)
         {
            if(param1 >= this.mainConfigVO.userExperienceLevels[_loc4_] && _loc4_ >= this.maxXPLevel)
            {
               _loc2_ = this.mainConfigVO.userExperienceLevels[this.maxXPLevel];
               break;
            }
            if(param1 >= this.mainConfigVO.userExperienceLevels[_loc4_] && param1 < this.mainConfigVO.userExperienceLevels[_loc4_ + 1])
            {
               _loc2_ = this.mainConfigVO.userExperienceLevels[_loc4_ + 1];
               break;
            }
            _loc4_++;
         }
         return _loc2_;
      }
      
      public function checkLevelUpPerXP(param1:int, param2:int) : Boolean
      {
         var _loc3_:Boolean = false;
         var _loc4_:int = int(this.mainConfigVO.userExperienceLevels.length - 1);
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         while(_loc7_ < _loc4_)
         {
            _loc5_ = this.mainConfigVO.userExperienceLevels[_loc7_];
            _loc6_ = this.mainConfigVO.userExperienceLevels[_loc7_ + 1];
            if(param1 >= _loc5_ && param1 < _loc6_)
            {
               if(param2 >= _loc6_)
               {
                  return true;
               }
            }
            _loc7_++;
         }
         return _loc3_;
      }
      
      public function getPercentForXP(param1:Number) : Number
      {
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc2_:Number = this.mainConfigVO.userExperienceLevels.length - 1;
         var _loc3_:Number = 0;
         var _loc4_:Number = 0;
         var _loc5_:int = 0;
         while(_loc5_ < _loc2_)
         {
            _loc3_ = this.mainConfigVO.userExperienceLevels[_loc5_];
            _loc4_ = this.mainConfigVO.userExperienceLevels[_loc5_ + 1];
            if(param1 > _loc3_ && param1 < _loc4_)
            {
               _loc6_ = _loc4_ - _loc3_;
               _loc7_ = param1 - _loc3_;
               return Math.round(_loc7_ * 100 / _loc6_);
            }
            _loc5_++;
         }
         if(param1 > _loc4_)
         {
            return 100;
         }
         return 0;
      }
      
      public function getExperience(param1:int) : Number
      {
         var _loc2_:int = param1;
         if(param1 >= this.maxXPLevel)
         {
            _loc2_ = this.maxXPLevel;
         }
         if(_loc2_ < 0)
         {
            _loc2_ = 0;
         }
         return this.mainConfigVO.userExperienceLevels[_loc2_];
      }
      
      public function getLevel(param1:Number) : Number
      {
         var _loc2_:Number = 0;
         var _loc3_:Number = 0;
         while(_loc3_ < this.mainConfigVO.userExperienceLevels.length)
         {
            _loc2_ = _loc3_;
            if(param1 < this.mainConfigVO.userExperienceLevels[_loc3_])
            {
               break;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function get resourcesCap() : int
      {
         return this.mainConfigVO.resourcesCap;
      }
      
      public function get trashFactorForAttraction() : Number
      {
         return this.mainConfigVO.trashFactorForAttraction;
      }
      
      public function getWelcomeBackItems(param1:int) : Vector.<WelcomeBackItem>
      {
         return this.mainConfigVO.welcomeBackItems[param1];
      }
   }
}

