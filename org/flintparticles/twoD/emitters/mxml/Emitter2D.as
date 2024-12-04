package org.flintparticles.twoD.emitters.mxml
{
   import mx.core.IMXMLObject;
   import org.flintparticles.twoD.emitters.Emitter2D;
   
   public class Emitter2D extends org.flintparticles.twoD.emitters.Emitter2D implements IMXMLObject
   {
      public var runAheadTime:Number = 0;
      
      public var runAheadFrameRate:Number = 10;
      
      public var autoStart:Boolean = true;
      
      public function Emitter2D()
      {
         super();
      }
      
      public function initialized(param1:Object, param2:String) : void
      {
         if(this.autoStart)
         {
            start();
         }
         if(this.runAheadTime)
         {
            runAhead(this.runAheadTime,this.runAheadFrameRate);
         }
      }
   }
}

