package com.bigpoint.zoomumba.controller.features.fortuneWheel
{
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.features.fortuneWheel.FortuneWheelProxy;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class StartSpinCommand extends SimpleCommand
   {
      public function StartSpinCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:FortuneWheelProxy = facade.retrieveProxy(FortuneWheelProxy.NAME) as FortuneWheelProxy;
         _loc2_.request_log_data.push(TimeManager.currentTime);
         sendNotification(Note.REQUEST_REWARD);
      }
   }
}

