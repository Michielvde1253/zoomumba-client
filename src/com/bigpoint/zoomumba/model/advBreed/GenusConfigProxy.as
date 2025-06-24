package com.bigpoint.zoomumba.model.advBreed
{
   import com.bigpoint.utils.ObjectHelper;
   import com.bigpoint.zoomumba.model.advBreed.vo.GenusConfigVO;
   import flash.utils.Dictionary;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class GenusConfigProxy extends Proxy
   {
      public static const NAME:String = "GenusConfigProxy";
      
      private var _genusConfig:Dictionary = new Dictionary(true);
      
      private var _genusAdvBreeding:Vector.<int> = new Vector.<int>();
      
      public function GenusConfigProxy(param1:Object = null)
      {
         super(NAME);
      }
      
      override public function setData(param1:Object) : void
      {
         var _loc2_:GenusConfigVO = null;
         var _loc3_:Object = null;
         for each(_loc3_ in param1)
         {
            _loc2_ = new GenusConfigVO();
            ObjectHelper.copyData(_loc2_,_loc3_);
            this._genusConfig[_loc2_.genusId] = _loc2_;
            if(_loc2_.breedableAdvance)
            {
               this._genusAdvBreeding.push(_loc2_.genusId);
            }
         }
      }
      
      public function getGenusAdvBreedingids() : Vector.<int>
      {
         return this._genusAdvBreeding;
      }
      
      public function getSpecieByTier(param1:int, param2:int = 1) : int
      {
         var _loc3_:int = -1;
         var _loc4_:GenusConfigVO = this.getConfigById(param1);
         if(_loc4_)
         {
            _loc3_ = _loc4_.speciesId[param2] as int;
         }
         return _loc3_;
      }
      
      public function getConfigById(param1:int) : GenusConfigVO
      {
         var _loc2_:GenusConfigVO = null;
         if(param1 in this._genusConfig)
         {
            _loc2_ = this._genusConfig[param1];
         }
         return _loc2_;
      }
   }
}

