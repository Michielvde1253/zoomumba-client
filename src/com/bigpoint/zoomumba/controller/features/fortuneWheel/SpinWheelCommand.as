package com.bigpoint.zoomumba.controller.features.fortuneWheel
{
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.features.fortuneWheel.FortuneWheelProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowParams;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class SpinWheelCommand extends SimpleCommand
   {
      private static const TICKET_PRICE:int = 2;
      
      public function SpinWheelCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:FortuneWheelProxy = facade.retrieveProxy(FortuneWheelProxy.NAME) as FortuneWheelProxy;
         if(_loc2_.numberOfTries > 0)
         {
            sendNotification(Note.START_SPIN);
         }
         else
         {
            facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.ZOO_WHEEL_BUY_SPIN,"",null,new WindowParams("",null,"",null,Note.BUY_SPIN,true)));
         }
      }
   }
}

