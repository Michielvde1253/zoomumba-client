package com.bigpoint.zoomumba.controller.features.nursery
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.playfield.advBreed.NurseryProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.NurseryWindowInitParams;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class OpenNurseryViewCommand extends SimpleCommand
   {
      public function OpenNurseryViewCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:int = parseInt(String(param1.getBody().uId));
         var _loc3_:NurseryProxy = facade.retrieveProxy(NurseryProxy.NAME) as NurseryProxy;
         switch(_loc3_.currentState)
         {
            case NurseryProxy.STATE_READY:
               sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.NURSERY_WINDOW,"",new NurseryWindowInitParams(Categories.NURSERY,_loc2_)));
               break;
            case NurseryProxy.STATE_RUNNING:
               sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.NURSERY_RAISING_PROGRESS_WINDOW,"",new NurseryWindowInitParams(Categories.NURSERY,_loc2_)));
               break;
            case NurseryProxy.STATE_FINISHED:
               sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.NURSERY_RAISING_ENDED_WINDOW,"",new NurseryWindowInitParams(Categories.NURSERY,_loc2_)));
         }
      }
   }
}

