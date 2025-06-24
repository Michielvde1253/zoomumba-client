package com.bigpoint.zoomumba.controller.playfield
{
   import com.bigpoint.zoomumba.model.playfield.PlayFieldAnimationProxy;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class PlayFieldAnimationEndedCommand extends SimpleCommand
   {
      public function PlayFieldAnimationEndedCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:PlayFieldAnimationProxy = facade.retrieveProxy(PlayFieldAnimationProxy.NAME) as PlayFieldAnimationProxy;
         if(_loc2_)
         {
            _loc2_.forceAnimationRecheck();
         }
      }
   }
}

