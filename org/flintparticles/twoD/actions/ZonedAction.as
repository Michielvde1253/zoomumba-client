package org.flintparticles.twoD.actions
{
   import org.flintparticles.common.actions.Action;
   import org.flintparticles.common.actions.ActionBase;
   import org.flintparticles.common.emitters.Emitter;
   import org.flintparticles.common.particles.Particle;
   import org.flintparticles.twoD.particles.Particle2D;
   import org.flintparticles.twoD.zones.Zone2D;
   
   public class ZonedAction extends ActionBase
   {
      private var _action:Action;
      
      private var _zone:Zone2D;
      
      private var _invert:Boolean;
      
      public function ZonedAction(param1:Action = null, param2:Zone2D = null, param3:Boolean = false)
      {
         super();
         this.action = param1;
         this.zone = param2;
         this.invertZone = param3;
      }
      
      public function get action() : Action
      {
         return this._action;
      }
      
      public function set action(param1:Action) : void
      {
         this._action = param1;
      }
      
      public function get zone() : Zone2D
      {
         return this._zone;
      }
      
      public function set zone(param1:Zone2D) : void
      {
         this._zone = param1;
      }
      
      public function get invertZone() : Boolean
      {
         return this._invert;
      }
      
      public function set invertZone(param1:Boolean) : void
      {
         this._invert = param1;
      }
      
      override public function get priority() : int
      {
         return this._action.priority;
      }
      
      override public function set priority(param1:int) : void
      {
         this._action.priority = param1;
      }
      
      override public function addedToEmitter(param1:Emitter) : void
      {
         this._action.addedToEmitter(param1);
      }
      
      override public function removedFromEmitter(param1:Emitter) : void
      {
         this._action.removedFromEmitter(param1);
      }
      
      override public function update(param1:Emitter, param2:Particle, param3:Number) : void
      {
         var _loc4_:Particle2D = Particle2D(param2);
         if(this._zone.contains(_loc4_.x,_loc4_.y))
         {
            if(!this._invert)
            {
               this._action.update(param1,param2,param3);
            }
         }
         else if(this._invert)
         {
            this._action.update(param1,param2,param3);
         }
      }
   }
}

