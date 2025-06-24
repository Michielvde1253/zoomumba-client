package com.bigpoint.zoomumba.controller.windowSystem
{
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.windowSystem.WindowSystemProxy;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.namespaces.windowSystem;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoomumba.view.windowSystem.WindowSystemMediator;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   import windows.core.AbstractWindow;
   
   use namespace windowSystem;
   
   public class CloseWindowCommand extends SimpleCommand
   {
      public function CloseWindowCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc5_:AbstractWindow = null;
         var _loc6_:WindowMediator = null;
         var _loc2_:WindowVars = param1.getBody() as WindowVars;
         var _loc3_:WindowSystemMediator = facade.retrieveMediator(WindowSystemMediator.NAME) as WindowSystemMediator;
         var _loc4_:WindowSystemProxy = facade.retrieveProxy(WindowSystemProxy.NAME) as WindowSystemProxy;
         if(_loc4_.isWindowCreated(_loc2_.windowType.windowDefinitionId,_loc2_.uniqueId))
         {
            _loc5_ = _loc4_.getWindowViewComponont(_loc2_.windowType.windowDefinitionId,_loc2_.uniqueId);
            _loc6_ = _loc4_.getWindowMediator(_loc2_.windowType.windowDefinitionId,_loc2_.uniqueId);
            _loc3_.hideWindow(_loc5_);
            facade.removeMediator(_loc6_.getMediatorName());
            _loc4_.deleteWindowData(_loc2_.windowType.windowDefinitionId,_loc2_.uniqueId);
            _loc6_.dispose();
            _loc6_.windowSystem::handleWindowClose();
            _loc6_.windowSystem::disposeWindowMediator();
            if(_loc4_.stackedWindowCount == 0 && _loc4_.queuedWindowCount > 0)
            {
               sendNotification(WinNote.OPEN_WINDOW,_loc4_.getNextQueuedWindowVars());
            }
         }
         else
         {
            sendNotification(Note.WARNING_REPORT,"Window is not opened. Nothing to close.");
         }
      }
   }
}

