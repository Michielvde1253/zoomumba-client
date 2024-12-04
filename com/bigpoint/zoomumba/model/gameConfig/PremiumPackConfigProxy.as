package com.bigpoint.zoomumba.model.gameConfig
{
   import com.bigpoint.zoomumba.model.gameConfig.vo.PremiumPackConfigVO;
   import org.puremvc.as3.interfaces.IProxy;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class PremiumPackConfigProxy extends Proxy implements IProxy
   {
      public static const NAME:String = "PremiumPackConfigProxy";
      
      private var _normalUser:PremiumPackConfigVO = new PremiumPackConfigVO();
      
      private var _premiumPackOne:PremiumPackConfigVO;
      
      private var _premiumPackTwo:PremiumPackConfigVO;
      
      private var _premiumPackFull:PremiumPackConfigVO;
      
      public function PremiumPackConfigProxy()
      {
         super(NAME,this._normalUser);
      }
      
      public function enablePremiumOne() : void
      {
         data = this._premiumPackOne;
      }
      
      public function enablePremiumTwo() : void
      {
         data = this._premiumPackTwo;
      }
      
      public function enablePremiumFull() : void
      {
         data = this._premiumPackFull;
      }
      
      public function disablePremiumPacks() : void
      {
         data = this._normalUser;
      }
      
      public function get isPremiumUser() : Boolean
      {
         if(data != this._normalUser)
         {
            return true;
         }
         return false;
      }
      
      public function set premiumPackOne(param1:PremiumPackConfigVO) : void
      {
         this._premiumPackOne = param1;
      }
      
      public function set premiumPackTwo(param1:PremiumPackConfigVO) : void
      {
         this._premiumPackTwo = param1;
      }
      
      public function set premiumPackFull(param1:PremiumPackConfigVO) : void
      {
         this._premiumPackFull = param1;
      }
      
      private function get premiumPackVO() : PremiumPackConfigVO
      {
         return data as PremiumPackConfigVO;
      }
      
      public function get entranceFeeMaxAmmountMultiplyer() : Number
      {
         return this.premiumPackVO.entranceFeeMaxAmmountMultiplyer;
      }
      
      public function get animalHealtTimeMultiplyer() : Number
      {
         return this.premiumPackVO.animalHealtTimeMultiplyer;
      }
      
      public function get allNormalBuildingsCostMultiplyer() : Number
      {
         return this.premiumPackVO.allNormalBuildingsCostMultiplyer;
      }
      
      public function get animalBreadingCostMultiplyer() : Number
      {
         return this.premiumPackVO.animalBreadingCostMultiplyer;
      }
      
      public function get fieldActionPetPawsMultiplyer() : Number
      {
         return this.premiumPackVO.fieldActionPetPawsMultiplyer;
      }
      
      public function get fieldActionPearlsMultiplyer() : Number
      {
         return this.premiumPackVO.fieldActionPearlsMultiplyer;
      }
      
      public function get fieldActionExpMultiplyer() : Number
      {
         return this.premiumPackVO.fieldActionExpMultiplyer;
      }
   }
}

