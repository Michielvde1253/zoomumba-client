package org.flintparticles.common.initializers
{
   import org.flintparticles.common.emitters.Emitter;
   import org.flintparticles.common.particles.Particle;
   import org.flintparticles.common.utils.WeightedArray;
   
   public class ColorsInit extends InitializerBase
   {
      private var _colors:WeightedArray;
      
      private var _mxmlColors:Array;
      
      private var _mxmlWeights:Array;
      
      public function ColorsInit(param1:Array = null, param2:Array = null)
      {
         super();
         this._colors = new WeightedArray();
         if(param1 == null)
         {
            return;
         }
         this.init(param1,param2);
      }
      
      override public function addedToEmitter(param1:Emitter) : void
      {
         if(this._mxmlColors)
         {
            this.init(this._mxmlColors,this._mxmlWeights);
            this._mxmlColors = null;
            this._mxmlWeights = null;
         }
      }
      
      private function init(param1:Array = null, param2:Array = null) : void
      {
         var _loc4_:int = 0;
         this._colors.clear();
         var _loc3_:int = int(param1.length);
         if(param2 != null && param2.length == _loc3_)
         {
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               this._colors.add(param1[_loc4_],param2[_loc4_]);
               _loc4_++;
            }
         }
         else
         {
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               this._colors.add(param1[_loc4_],1);
               _loc4_++;
            }
         }
      }
      
      public function addColor(param1:uint, param2:Number = 1) : void
      {
         this._colors.add(param1,param2);
      }
      
      public function removeColor(param1:uint) : void
      {
         this._colors.remove(param1);
      }
      
      public function set colors(param1:Array) : void
      {
         if(param1.length == 1 && param1[0] is String)
         {
            this._mxmlColors = String(param1[0]).split(",");
         }
         else
         {
            this._mxmlColors = param1;
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
         if(Boolean(this._mxmlColors) && Boolean(this._mxmlWeights))
         {
            this.init(this._mxmlColors,this._mxmlWeights);
            this._mxmlColors = null;
            this._mxmlWeights = null;
         }
      }
      
      override public function initialize(param1:Emitter, param2:Particle) : void
      {
         param2.color = this._colors.getRandomValue();
      }
   }
}

