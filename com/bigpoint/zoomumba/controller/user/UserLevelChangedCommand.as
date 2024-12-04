package com.bigpoint.zoomumba.controller.user
{
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.user.quests.QuestsProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class UserLevelChangedCommand extends SimpleCommand
   {
      public function UserLevelChangedCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(WindowTypes.QUESTS));
         var _loc2_:QuestsProxy = facade.retrieveProxy(QuestsProxy.NAME) as QuestsProxy;
         _loc2_.removeOldData();
      }
   }
}

