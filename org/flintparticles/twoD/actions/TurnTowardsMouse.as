package org.flintparticles.twoD.actions
{
   import flash.display.DisplayObject;
   import org.flintparticles.common.actions.ActionBase;
   import org.flintparticles.common.emitters.Emitter;
   import org.flintparticles.common.particles.Particle;
   import org.flintparticles.twoD.particles.Particle2D;
   
   public class TurnTowardsMouse extends ActionBase
   {
      private var _power:Number;
      
      private var _renderer:DisplayObject;
      
      public function TurnTowardsMouse(param1:Number = 0, param2:DisplayObject = null)
      {
         super();
         this.power = param1;
         this.renderer = param2;
      }
      
      public function get power() : Number
      {
         return this._power;
      }
      
      public function set power(param1:Number) : void
      {
         this._power = param1;
      }
      
      public function get renderer() : DisplayObject
      {
         return this._renderer;
      }
      
      public function set renderer(param1:DisplayObject) : void
      {
         this._renderer = param1;
      }
      
      override public function update(param1:Emitter, param2:Particle, param3:Number) : void
      {
         var _loc4_:Particle2D = null;
         var _loc5_:* = false;
         var _loc6_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         _loc4_ = Particle2D(param2);
         _loc5_ = (_loc4_.y - this._renderer.mouseY) * _loc4_.velX + (this._renderer.mouseX - _loc4_.x) * _loc4_.velY > 0;
         if(_loc5_)
         {
            _loc6_ = Math.atan2(_loc4_.velY,_loc4_.velX) - this._power * param3;
         }
         else
         {
            _loc6_ = Math.atan2(_loc4_.velY,_loc4_.velX) + this._power * param3;
         }
         var _loc7_:Number = Math.sqrt(_loc4_.velX * _loc4_.velX + _loc4_.velY * _loc4_.velY);
         _loc4_.velX = _loc7_ * Math.cos(_loc6_);
         _loc4_.velY = _loc7_ * Math.sin(_loc6_);
         var _loc8_:* = (_loc4_.y - this._renderer.mouseY) * _loc4_.velX + (this._renderer.mouseX - _loc4_.x) * _loc4_.velY > 0 != _loc5_;
         if(_loc8_)
         {
            _loc9_ = this._renderer.mouseX - _loc4_.x;
            _loc10_ = this._renderer.mouseY - _loc4_.y;
            _loc11_ = _loc7_ / Math.sqrt(_loc9_ * _loc9_ + _loc10_ * _loc10_);
            _loc4_.velX = _loc9_ * _loc11_;
            _loc4_.velY = _loc10_ * _loc11_;
         }
      }
   }
}

