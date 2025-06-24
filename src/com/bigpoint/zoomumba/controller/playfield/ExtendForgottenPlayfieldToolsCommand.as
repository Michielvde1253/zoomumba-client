package com.bigpoint.zoomumba.controller.playfield
{
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.model.net.responceDataVo.ExpansionBuyInfoVo;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class ExtendForgottenPlayfieldToolsCommand extends SimpleCommand
   {
      public function ExtendForgottenPlayfieldToolsCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:ExpansionBuyInfoVo = param1.getBody() as ExpansionBuyInfoVo;
         var _loc3_:NetProxy = facade.retrieveProxy(NetProxy.NAME) as NetProxy;
         _loc3_.callServer(NET.EXTEND_FORGOTTEN_ZOO_TOOLS_BUY,[_loc2_.tools,_loc2_.zoodollar]).sendNow();
      }
   }
}

