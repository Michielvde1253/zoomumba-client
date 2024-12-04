package org.flintparticles.common.activities
{
   import org.flintparticles.common.emitters.Emitter;
   
   public class UpdateOnFrame extends ActivityBase
   {
      private var action:FrameUpdatable;
      
      public function UpdateOnFrame(param1:FrameUpdatable)
      {
         super();
         this.action = param1;
      }
      
      override public function update(param1:Emitter, param2:Number) : void
      {
         this.action.frameUpdate(param1,param2);
      }
   }
}

