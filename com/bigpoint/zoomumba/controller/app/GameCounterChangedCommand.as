package com.bigpoint.zoomumba.controller.app
{
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.events.xmas.XmasProxy;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class GameCounterChangedCommand extends SimpleCommand
   {
      public function GameCounterChangedCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc3_:NetProxy = null;
         var _loc2_:XmasProxy = facade.retrieveProxy(XmasProxy.NAME) as XmasProxy;
         if(_loc2_.canRedeemTree)
         {
            _loc3_ = facade.retrieveProxy(NetProxy.NAME) as NetProxy;
            if(_loc2_.tier3Counter.count == 0)
            {
               _loc3_.callServer(NET.XMAS_REDEEM_TREE,[]).addCallbackIfTrue(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.CHRISTMAS_REWARD_WINDOW,"",555)).addCallbackIfTrue(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.CHRISTMAS_ENDED_WINDOW,"",false)).sendNow();
            }
            else
            {
               _loc3_.callServer(NET.XMAS_REDEEM_TREE,[]).addCallbackIfTrue(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.CHRISTMAS_REWARD_WINDOW,"",555)).sendNow();
            }
         }
      }
   }
}

