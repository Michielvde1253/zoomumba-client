package com.bigpoint.zoomumba.controller.playfield
{
   import com.bigpoint.zoomumba.model.playfield.PlayFieldAnimationProxy;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class EnablePlayfieldAnimationCommand extends SimpleCommand
   {
      public function EnablePlayfieldAnimationCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:Boolean = Boolean(param1.getBody());
         var _loc3_:PlayFieldAnimationProxy = facade.retrieveProxy(PlayFieldAnimationProxy.NAME) as PlayFieldAnimationProxy;
         _loc3_.isPaused = !_loc2_;
      }
   }
}

