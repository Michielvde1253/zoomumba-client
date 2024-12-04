package com.bigpoint.zoomumba.controller.user.assistants
{
   import com.bigpoint.zoomumba.model.net.responceDataVo.general.AssistanceData;
   import com.bigpoint.zoomumba.model.user.assistances.AssistancesProxy;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class HandleAssistantDataCommand extends SimpleCommand
   {
      public function HandleAssistantDataCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:AssistancesProxy = facade.retrieveProxy(AssistancesProxy.NAME) as AssistancesProxy;
         var _loc3_:Vector.<AssistanceData> = param1.getBody() as Vector.<AssistanceData>;
         _loc2_.storeData(_loc3_);
      }
   }
}

