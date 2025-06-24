package org.flintparticles.common.actions
{
   import flash.display.Stage;
   import flash.events.KeyboardEvent;
   import org.flintparticles.common.emitters.Emitter;
   import org.flintparticles.common.particles.Particle;
   
   public class KeyDownAction extends ActionBase
   {
      private var _action:Action;
      
      private var _keyCode:uint;
      
      private var _isDown:Boolean;
      
      private var _stage:Stage;
      
      public function KeyDownAction(param1:Action = null, param2:uint = 0, param3:Stage = null)
      {
         super();
         this._action = param1;
         this._keyCode = param2;
         this._isDown = false;
         this._stage = param3;
         this.createListeners();
      }
      
      private function createListeners() : void
      {
         if(this._stage)
         {
            this._stage.addEventListener(KeyboardEvent.KEY_DOWN,this.keyDownListener,false,0,true);
            this._stage.addEventListener(KeyboardEvent.KEY_UP,this.keyUpListener,false,0,true);
         }
      }
      
      private function keyDownListener(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == this._keyCode)
         {
            this._isDown = true;
         }
      }
      
      private function keyUpListener(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == this._keyCode)
         {
            this._isDown = false;
         }
      }
      
      public function get stage() : Stage
      {
         return this._stage;
      }
      
      public function set stage(param1:Stage) : void
      {
         this._stage = param1;
         this.createListeners();
      }
      
      public function get action() : Action
      {
         return this._action;
      }
      
      public function set action(param1:Action) : void
      {
         this._action = param1;
      }
      
      public function get keyCode() : uint
      {
         return this._keyCode;
      }
      
      public function set keyCode(param1:uint) : void
      {
         this._keyCode = param1;
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
         if(this._isDown)
         {
            this._action.update(param1,param2,param3);
         }
      }
   }
}

