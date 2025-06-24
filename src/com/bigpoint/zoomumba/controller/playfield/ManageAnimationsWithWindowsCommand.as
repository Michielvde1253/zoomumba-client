package com.bigpoint.zoomumba.controller.playfield
{
   import com.bigpoint.zoomumba.model.playfield.PlayFieldAnimationProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowSystemProxy;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class ManageAnimationsWithWindowsCommand extends SimpleCommand
   {
      public function ManageAnimationsWithWindowsCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:WindowSystemProxy = facade.retrieveProxy(WindowSystemProxy.NAME) as WindowSystemProxy;
         var _loc3_:PlayFieldAnimationProxy = facade.retrieveProxy(PlayFieldAnimationProxy.NAME) as PlayFieldAnimationProxy;
         if(_loc3_)
         {
            if(_loc2_.stackedWindowCount > 0)
            {
               _loc3_.isPaused = true;
            }
            else
            {
               _loc3_.isPaused = false;
            }
         }
      }
   }
}

