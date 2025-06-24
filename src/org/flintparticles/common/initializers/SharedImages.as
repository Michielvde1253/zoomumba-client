package org.flintparticles.common.initializers
{
   import org.flintparticles.common.emitters.Emitter;
   import org.flintparticles.common.particles.Particle;
   import org.flintparticles.common.utils.WeightedArray;
   
   public class SharedImages extends InitializerBase
   {
      private var _images:WeightedArray;
      
      private var _mxmlImages:Array;
      
      private var _mxmlWeights:Array;
      
      public function SharedImages(param1:Array = null, param2:Array = null)
      {
         super();
         this._images = new WeightedArray();
         if(param1 == null)
         {
            return;
         }
         this.init(param1,param2);
      }
      
      override public function addedToEmitter(param1:Emitter) : void
      {
         if(this._mxmlImages)
         {
            this.init(this._mxmlImages,this._mxmlWeights);
            this._mxmlImages = null;
            this._mxmlWeights = null;
         }
      }
      
      private function init(param1:Array = null, param2:Array = null) : void
      {
         var _loc4_:int = 0;
         this._images.clear();
         var _loc3_:int = int(param1.length);
         if(param2 != null && param2.length == _loc3_)
         {
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               this._images.add(param1[_loc4_],param2[_loc4_]);
               _loc4_++;
            }
         }
         else
         {
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               this._images.add(param1[_loc4_],1);
               _loc4_++;
            }
         }
      }
      
      public function addImage(param1:*, param2:Number = 1) : void
      {
         this._images.add(param1,param2);
      }
      
      public function removeImage(param1:*) : void
      {
         this._images.remove(param1);
      }
      
      public function set images(param1:Array) : void
      {
         this._mxmlImages = param1;
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
         if(Boolean(this._mxmlImages) && Boolean(this._mxmlWeights))
         {
            this.init(this._mxmlImages,this._mxmlWeights);
            this._mxmlImages = null;
            this._mxmlWeights = null;
         }
      }
      
      override public function initialize(param1:Emitter, param2:Particle) : void
      {
         param2.image = this._images.getRandomValue();
      }
   }
}

