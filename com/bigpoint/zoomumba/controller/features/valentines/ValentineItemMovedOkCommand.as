package com.bigpoint.zoomumba.controller.features.valentines
{
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.features.valenties.ValentinesProxy;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class ValentineItemMovedOkCommand extends SimpleCommand
   {
      public function ValentineItemMovedOkCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:ValentinesProxy = facade.retrieveProxy(ValentinesProxy.NAME) as ValentinesProxy;
         _loc2_.currentPosition = param1.getBody() as int;
         _loc2_.oldPosition = param1.getBody() as int;
         sendNotification(Note.VALENTINE_REFRESH_BOARD);
      }
   }
}

