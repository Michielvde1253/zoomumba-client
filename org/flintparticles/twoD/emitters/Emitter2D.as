package org.flintparticles.twoD.emitters
{
   import org.flintparticles.common.emitters.Emitter;
   import org.flintparticles.common.particles.Particle;
   import org.flintparticles.common.particles.ParticleFactory;
   import org.flintparticles.common.utils.Maths;
   import org.flintparticles.twoD.particles.Particle2D;
   import org.flintparticles.twoD.particles.ParticleCreator2D;
   
   public class Emitter2D extends Emitter
   {
      protected static var _creator:ParticleCreator2D = new ParticleCreator2D();
      
      protected var _x:Number = 0;
      
      protected var _y:Number = 0;
      
      protected var _rotation:Number = 0;
      
      public var spaceSort:Boolean = false;
      
      public function Emitter2D()
      {
         super();
         _particleFactory = _creator;
      }
      
      public static function get defaultParticleFactory() : ParticleFactory
      {
         return _creator;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function set x(param1:Number) : void
      {
         this._x = param1;
      }
      
      public function get y() : Number
      {
         return this._y;
      }
      
      public function set y(param1:Number) : void
      {
         this._y = param1;
      }
      
      public function get rotation() : Number
      {
         return Maths.asDegrees(this._rotation);
      }
      
      public function set rotation(param1:Number) : void
      {
         this._rotation = Maths.asRadians(param1);
      }
      
      public function get rotRadians() : Number
      {
         return this._rotation;
      }
      
      public function set rotRadians(param1:Number) : void
      {
         this._rotation = param1;
      }
      
      override protected function initParticle(param1:Particle) : void
      {
         var _loc2_:Particle2D = Particle2D(param1);
         _loc2_.x = this._x;
         _loc2_.y = this._y;
         _loc2_.previousX = this._x;
         _loc2_.previousY = this._y;
         _loc2_.rotation = this._rotation;
      }
      
      override protected function sortParticles() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this.spaceSort)
         {
            _particles.sortOn("x",Array.NUMERIC);
            _loc1_ = int(_particles.length);
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               Particle2D(_particles[_loc2_]).sortID = _loc2_;
               _loc2_++;
            }
         }
      }
   }
}

