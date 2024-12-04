package org.flintparticles.twoD.actions
{
   import org.flintparticles.common.actions.ActionBase;
   import org.flintparticles.common.activities.FrameUpdatable;
   import org.flintparticles.common.activities.UpdateOnFrame;
   import org.flintparticles.common.emitters.Emitter;
   import org.flintparticles.common.events.ParticleEvent;
   import org.flintparticles.common.particles.Particle;
   import org.flintparticles.twoD.emitters.Emitter2D;
   import org.flintparticles.twoD.particles.Particle2D;
   
   public class Collide extends ActionBase implements FrameUpdatable
   {
      private var _bounce:Number;
      
      private var _maxDistance:Number;
      
      private var _updateActivity:UpdateOnFrame;
      
      public function Collide(param1:Number = 1)
      {
         super();
         priority = -20;
         this.bounce = param1;
         this._maxDistance = 0;
      }
      
      public function get bounce() : Number
      {
         return this._bounce;
      }
      
      public function set bounce(param1:Number) : void
      {
         this._bounce = param1;
      }
      
      override public function addedToEmitter(param1:Emitter) : void
      {
         Emitter2D(param1).spaceSort = true;
         this._updateActivity = new UpdateOnFrame(this);
         param1.addActivity(this._updateActivity);
      }
      
      override public function removedFromEmitter(param1:Emitter) : void
      {
         if(this._updateActivity)
         {
            param1.removeActivity(this._updateActivity);
         }
      }
      
      public function frameUpdate(param1:Emitter, param2:Number) : void
      {
         var _loc6_:Particle = null;
         var _loc3_:Array = param1.particlesArray;
         var _loc4_:Number = 0;
         var _loc5_:Number = 0;
         for each(_loc6_ in _loc3_)
         {
            if(_loc6_.collisionRadius > _loc4_)
            {
               _loc5_ = _loc4_;
               _loc4_ = _loc6_.collisionRadius;
            }
            else if(_loc6_.collisionRadius > _loc5_)
            {
               _loc5_ = _loc6_.collisionRadius;
            }
         }
         this._maxDistance = _loc4_ + _loc5_;
      }
      
      override public function update(param1:Emitter, param2:Particle, param3:Number) : void
      {
         var _loc7_:Particle2D = null;
         var _loc8_:int = 0;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc22_:ParticleEvent = null;
         var _loc4_:Particle2D = Particle2D(param2);
         var _loc5_:Emitter2D = Emitter2D(param1);
         var _loc6_:Array = _loc5_.particlesArray;
         var _loc9_:int = int(_loc6_.length);
         _loc8_ = _loc4_.sortID + 1;
         while(_loc8_ < _loc9_)
         {
            _loc7_ = _loc6_[_loc8_];
            _loc13_ = _loc7_.x - _loc4_.x;
            if(_loc13_ > this._maxDistance)
            {
               break;
            }
            _loc12_ = _loc7_.collisionRadius + _loc4_.collisionRadius;
            if(_loc13_ <= _loc12_)
            {
               _loc14_ = _loc7_.y - _loc4_.y;
               if(!(_loc14_ > _loc12_ || _loc14_ < -_loc12_))
               {
                  _loc11_ = _loc14_ * _loc14_ + _loc13_ * _loc13_;
                  if(_loc11_ <= _loc12_ * _loc12_ && _loc11_ > 0)
                  {
                     _loc10_ = 1 / Math.sqrt(_loc11_);
                     _loc13_ *= _loc10_;
                     _loc14_ *= _loc10_;
                     _loc15_ = _loc13_ * _loc4_.velX + _loc14_ * _loc4_.velY;
                     _loc16_ = _loc13_ * _loc7_.velX + _loc14_ * _loc7_.velY;
                     _loc17_ = _loc15_ - _loc16_;
                     if(_loc17_ > 0)
                     {
                        _loc18_ = _loc4_.mass;
                        _loc19_ = _loc7_.mass;
                        _loc10_ = (1 + this._bounce) * _loc17_ / (_loc18_ + _loc19_);
                        _loc20_ = _loc10_ * _loc19_;
                        _loc21_ = -_loc10_ * _loc18_;
                        _loc4_.velX -= _loc20_ * _loc13_;
                        _loc4_.velY -= _loc20_ * _loc14_;
                        _loc7_.velX -= _loc21_ * _loc13_;
                        _loc7_.velY -= _loc21_ * _loc14_;
                        if(param1.hasEventListener(ParticleEvent.PARTICLES_COLLISION))
                        {
                           _loc22_ = new ParticleEvent(ParticleEvent.PARTICLES_COLLISION,_loc4_);
                           _loc22_.otherObject = _loc7_;
                           param1.dispatchEvent(_loc22_);
                        }
                     }
                  }
               }
            }
            _loc8_++;
         }
      }
   }
}

