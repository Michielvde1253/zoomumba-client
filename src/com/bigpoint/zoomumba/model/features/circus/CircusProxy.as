package com.bigpoint.zoomumba.model.features.circus
{
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.features.circus.vo.CircusVO;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class CircusProxy extends Proxy
   {
      public static const NAME:String = "CircusProxy";
      
      public var canBuy:Boolean = true;
      
      public function CircusProxy(param1:*)
      {
         super(NAME,new CircusVO(param1));
      }
      
      private function get vo() : CircusVO
      {
         return this.data as CircusVO;
      }
      
      private function set vo(param1:CircusVO) : void
      {
         this.data = param1;
      }
      
      public function get crateAmount() : int
      {
         return this.vo.crateAmount;
      }
      
      public function get rewardId() : int
      {
         return this.vo.rewardId;
      }
      
      public function get rewardType() : String
      {
         return this.vo.rewardType;
      }
      
      public function get speciesId() : Vector.<int>
      {
         return this.vo.speciesId;
      }
      
      public function resetCrateAmount() : void
      {
         this.vo.crateAmount = 0;
         this.vo.currentPositionOfCrates = [];
      }
      
      public function setReward(param1:int, param2:String) : void
      {
         this.vo.rewardId = param1;
         this.vo.rewardType = param2;
         facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.CIRCUS_REWARD_WINDOW));
      }
      
      public function registerCrate(param1:int, param2:int) : void
      {
         ++this.vo.crateAmount;
         this.vo.currentPositionOfCrates.push([param1,param2]);
         this.vo.currentIndexOfCrates.push(this.giveMeIndex(param1,param2));
      }
      
      private function giveMeIndex(param1:int, param2:int) : int
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         while(_loc4_ < this.vo.positionsOfCrates.length)
         {
            if(this.vo.positionsOfCrates[_loc4_][0] == param1 && this.vo.positionsOfCrates[_loc4_][1] == param2)
            {
               _loc3_ = _loc4_;
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function getNextFreePosition() : Array
      {
         var _loc1_:Array = this.vo.positionsOfCrates[0];
         var _loc2_:int = 0;
         while(_loc2_ < this.vo.positionsOfCrates.length)
         {
            if(this.vo.currentIndexOfCrates.indexOf(_loc2_) == -1)
            {
               return this.vo.positionsOfCrates[_loc2_];
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function freePosition(param1:int, param2:int) : void
      {
         var _loc3_:int = this.giveMeIndex(param1,param2);
         --this.vo.crateAmount;
         var _loc4_:int = 0;
         while(_loc4_ < this.vo.currentIndexOfCrates.length)
         {
            if(this.vo.currentIndexOfCrates[_loc4_] == _loc3_)
            {
               this.vo.currentIndexOfCrates.splice(_loc4_,1);
            }
            _loc4_++;
         }
      }
      
      private function filterFreePosition(param1:Array, param2:int, param3:Array) : Boolean
      {
         return this.vo.currentPositionOfCrates.indexOf(param1) == -1;
      }
   }
}

