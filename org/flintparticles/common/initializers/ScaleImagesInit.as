package org.flintparticles.common.initializers
{
   import org.flintparticles.common.emitters.Emitter;
   import org.flintparticles.common.particles.Particle;
   import org.flintparticles.common.utils.WeightedArray;
   
   public class ScaleImagesInit extends InitializerBase
   {
      private var _scales:WeightedArray;
      
      private var _mxmlScales:Array;
      
      private var _mxmlWeights:Array;
      
      public function ScaleImagesInit(param1:Array = null, param2:Array = null)
      {
         super();
         this._scales = new WeightedArray();
         if(param1 == null)
         {
            return;
         }
         this.init(param1,param2);
      }
      
      override public function addedToEmitter(param1:Emitter) : void
      {
         if(this._mxmlScales)
         {
            this.init(this._mxmlScales,this._mxmlWeights);
            this._mxmlScales = null;
            this._mxmlWeights = null;
         }
      }
      
      private function init(param1:Array = null, param2:Array = null) : void
      {
         var _loc4_:int = 0;
         this._scales.clear();
         var _loc3_:int = int(param1.length);
         if(param2 != null && param2.length == _loc3_)
         {
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               this._scales.add(param1[_loc4_],param2[_loc4_]);
               _loc4_++;
            }
         }
         else
         {
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               this._scales.add(param1[_loc4_],1);
               _loc4_++;
            }
         }
      }
      
      public function addScale(param1:Number, param2:Number = 1) : void
      {
         this._scales.add(param1,param2);
      }
      
      public function removeScale(param1:Number) : void
      {
         this._scales.remove(param1);
      }
      
      public function set scales(param1:Array) : void
      {
         if(param1.length == 1 && param1[0] is String)
         {
            this._mxmlScales = String(param1[0]).split(",");
         }
         else
         {
            this._mxmlScales = param1;
         }
         this.checkStartValues();
      }
      
      public function set weights(param1:Array) : void
      {
         if(param1.length == 1 && param1[0] is String)
         {
            this._mxmlWeights = String(param1[0]).split(",");
         }
         else
         {
            this._mxmlWeights = param1;
         }
         this.checkStartValues();
      }
      
      private function checkStartValues() : void
      {
         if(Boolean(this._mxmlScales) && Boolean(this._mxmlWeights))
         {
            this.init(this._mxmlScales,this._mxmlWeights);
            this._mxmlScales = null;
            this._mxmlWeights = null;
         }
      }
      
      override public function initialize(param1:Emitter, param2:Particle) : void
      {
         param2.scale = this._scales.getRandomValue();
      }
   }
}

