package org.flintparticles.twoD.actions
{
   import flash.display.DisplayObject;
   import org.flintparticles.common.actions.ActionBase;
   import org.flintparticles.common.emitters.Emitter;
   import org.flintparticles.common.particles.Particle;
   import org.flintparticles.twoD.particles.Particle2D;
   
   public class MouseGravity extends ActionBase
   {
      private var _power:Number;
      
      private var _epsilonSq:Number;
      
      private var _gravityConst:Number = 10000;
      
      private var _renderer:DisplayObject;
      
      public function MouseGravity(param1:Number = 0, param2:DisplayObject = null, param3:Number = 100)
      {
         super();
         this.power = param1;
         this.epsilon = param3;
         this.renderer = param2;
      }
      
      public function get power() : Number
      {
         return this._power / this._gravityConst;
      }
      
      public function set power(param1:Number) : void
      {
         this._power = param1 * this._gravityConst;
      }
      
      public function get renderer() : DisplayObject
      {
         return this._renderer;
      }
      
      public function set renderer(param1:DisplayObject) : void
      {
         this._renderer = param1;
      }
      
      public function get epsilon() : Number
      {
         return Math.sqrt(this._epsilonSq);
      }
      
      public function set epsilon(param1:Number) : void
      {
         this._epsilonSq = param1 * param1;
      }
      
      override public function update(param1:Emitter, param2:Particle, param3:Number) : void
      {
         var _loc4_:Particle2D = Particle2D(param2);
         var _loc5_:Number = this._renderer.mouseX - _loc4_.x;
         var _loc6_:Number = this._renderer.mouseY - _loc4_.y;
         var _loc7_:Number = _loc5_ * _loc5_ + _loc6_ * _loc6_;
         if(_loc7_ == 0)
         {
            return;
         }
         var _loc8_:Number = Math.sqrt(_loc7_);
         if(_loc7_ < this._epsilonSq)
         {
            _loc7_ = this._epsilonSq;
         }
         var _loc9_:Number = this._power * param3 / (_loc7_ * _loc8_);
         _loc4_.velX += _loc5_ * _loc9_;
         _loc4_.velY += _loc6_ * _loc9_;
      }
   }
}

