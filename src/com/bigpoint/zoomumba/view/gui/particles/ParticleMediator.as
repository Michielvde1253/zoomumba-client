package com.bigpoint.zoomumba.view.gui.particles
{
   import com.bigpoint.zoomumba.Zoomumba;
   import com.bigpoint.zoomumba.constants.AppMode;
   import com.bigpoint.zoomumba.constants.DataNote;
   import com.bigpoint.zoomumba.constants.GUINote;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.app.core.AppProxy;
   import com.bigpoint.zoomumba.model.gui.particles.ParticlesProxy;
   import com.bigpoint.zoomumba.view.app.ApplicationMediator;
   import com.bigpoint.zoomumba.view.gui.particles.components.ZoomumbaParticle;
   import flash.geom.Point;
   import org.flintparticles.common.counters.Steady;
   import org.flintparticles.common.initializers.AlphaInit;
   import org.flintparticles.common.initializers.ImageClass;
   import org.flintparticles.common.initializers.ScaleImageInit;
   import org.flintparticles.twoD.actions.DeathZone;
   import org.flintparticles.twoD.actions.Move;
   import org.flintparticles.twoD.actions.RandomDrift;
   import org.flintparticles.twoD.emitters.Emitter2D;
   import org.flintparticles.twoD.initializers.Position;
   import org.flintparticles.twoD.initializers.Velocity;
   import org.flintparticles.twoD.renderers.DisplayObjectRenderer;
   import org.flintparticles.twoD.zones.LineZone;
   import org.flintparticles.twoD.zones.PointZone;
   import org.flintparticles.twoD.zones.RectangleZone;
   import org.puremvc.as3.interfaces.IMediator;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.mediator.Mediator;
   
   public class ParticleMediator extends Mediator implements IMediator
   {
      public static const NAME:String = "ParticleMediator";
      
      private var lineZone:LineZone;
      
      private var particleProxy:ParticlesProxy;
      
      public function ParticleMediator(param1:DisplayObjectRenderer)
      {
         super(NAME,param1);
      }
      
      override public function onRegister() : void
      {
         this.particleProxy = facade.retrieveProxy(ParticlesProxy.NAME) as ParticlesProxy;
      }
      
      private function enableParticles(param1:String) : void
      {
         if(!this.particleProxy.isParticlesRunning)
         {
            if(!this.particleProxy.enabled(param1))
            {
               this.particleProxy.enable(param1,this.createParticleSet(param1));
               this.checkSize();
            }
         }
      }
      
      private function disableParticles(param1:String) : void
      {
         if(this.particleProxy.enabled(param1))
         {
            this.removeEmitter(this.particleProxy.getEmitterByType(param1));
            this.particleProxy.removeEmitter(param1);
         }
      }
      
      private function disableAllParticles() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.particleProxy.emitterCount)
         {
            this.removeEmitter(this.particleProxy.getEmitterByPosition(_loc1_));
            _loc1_++;
         }
         this.particleProxy.removeAllEmitters();
      }
      
      private function removeEmitter(param1:Emitter2D) : void
      {
         param1.stop();
      }
      
      private function createParticleSet(param1:String) : Emitter2D
      {
         this.lineZone = new LineZone(new Point(-5,-5),new Point(1000,-5));
         var _loc2_:DeathZone = new DeathZone(new RectangleZone(-10,-10,3000,3000),true);
         var _loc3_:Emitter2D = new Emitter2D();
         _loc3_.counter = new Steady(20);
         _loc3_.addInitializer(new ImageClass(ZoomumbaParticle,param1));
         _loc3_.addInitializer(new AlphaInit(0.8,1));
         _loc3_.addInitializer(new Position(this.lineZone));
         _loc3_.addInitializer(new Velocity(new PointZone(new Point(0,65))));
         _loc3_.addInitializer(new ScaleImageInit(0.75,2));
         _loc3_.addAction(new Move());
         _loc3_.addAction(_loc2_);
         _loc3_.addAction(new RandomDrift(15,15));
         viewComponent.addEmitter(_loc3_);
         _loc3_.start();
         _loc3_.runAhead(10);
         return _loc3_;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Note.APP_RESIZED,GUINote.ENABLE_PARTICLES,GUINote.DISABLE_PARTICLES,GUINote.DISABLE_ALL_PARTICLES,DataNote.APP_MODE_CHANGED];
      }
      
      private function checkSize() : void
      {
         var _loc1_:ApplicationMediator = facade.retrieveMediator(ApplicationMediator.NAME) as ApplicationMediator;
         this.lineZone.endX = _loc1_.application.width;
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Zoomumba = null;
         switch(param1.getName())
         {
            case Note.APP_RESIZED:
               _loc2_ = param1.getBody() as Zoomumba;
               if(this.lineZone)
               {
                  this.lineZone.endX = _loc2_.width;
               }
               break;
            case GUINote.ENABLE_PARTICLES:
               this.enableParticles(param1.getBody() as String);
               break;
            case GUINote.DISABLE_PARTICLES:
               this.disableParticles(param1.getBody() as String);
               break;
            case GUINote.DISABLE_ALL_PARTICLES:
               this.disableAllParticles();
               break;
            case DataNote.APP_MODE_CHANGED:
               this.checkForAppMode();
         }
      }
      
      private function checkForAppMode() : void
      {
         var _loc1_:AppProxy = facade.retrieveProxy(AppProxy.NAME) as AppProxy;
         if(_loc1_.currentAppMode == AppMode.SAFARI || _loc1_.currentAppMode == AppMode.VISIT_NEIGHBOUR || _loc1_.currentAppMode == AppMode.MANAGMENT_CENTER || _loc1_.currentAppMode == AppMode.MAP_OVERVIEW)
         {
            this.disableAllParticles();
         }
      }
   }
}

