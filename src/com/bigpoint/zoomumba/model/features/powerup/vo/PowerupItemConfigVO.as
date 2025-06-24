package com.bigpoint.zoomumba.model.features.powerup.vo
{
   public class PowerupItemConfigVO
   {
      private var _pID:int;
      
      private var _alias:String;
      
      public var affectedProp:AffectedPropertyVO = new AffectedPropertyVO();
      
      public function PowerupItemConfigVO()
      {
         super();
      }
      
      public function get pID() : int
      {
         return this._pID;
      }
      
      public function set pId(param1:int) : void
      {
         this._pID = param1;
      }
      
      public function get alias() : String
      {
         return this._alias;
      }
      
      public function set alias(param1:String) : void
      {
         this._alias = param1;
      }
   }
}

