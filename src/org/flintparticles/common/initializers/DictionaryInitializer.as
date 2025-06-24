package org.flintparticles.common.initializers
{
   import org.flintparticles.common.emitters.Emitter;
   import org.flintparticles.common.particles.Particle;
   
   public class DictionaryInitializer extends InitializerBase
   {
      private var _initValues:*;
      
      public function DictionaryInitializer(param1:*)
      {
         super();
         this._initValues = param1;
      }
      
      public function get initValues() : *
      {
         return this._initValues;
      }
      
      public function set initValues(param1:*) : void
      {
         this._initValues = param1;
      }
      
      override public function initialize(param1:Emitter, param2:Particle) : void
      {
         var _loc3_:* = undefined;
         if(!this._initValues)
         {
            return;
         }
         for(_loc3_ in this._initValues)
         {
            param2.dictionary[_loc3_] = this._initValues[_loc3_];
         }
      }
   }
}

