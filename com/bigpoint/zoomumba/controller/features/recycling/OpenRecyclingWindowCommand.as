package com.bigpoint.zoomumba.controller.features.recycling
{
   import com.bigpoint.zoomumba.constants.MANAGMENTCENTER;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.features.recycling.RecyclingProxy;
   import com.bigpoint.zoomumba.model.managmentCenter.ManagmentCenterProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class OpenRecyclingWindowCommand extends SimpleCommand
   {
      public function OpenRecyclingWindowCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:RecyclingProxy = facade.getProxy(RecyclingProxy) as RecyclingProxy;
         sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.RECYCLING_WINDOW));
         if(_loc2_.firstWindowStartup == false)
         {
            if((facade.getProxy(ManagmentCenterProxy) as ManagmentCenterProxy).getBuildingViewVoByBuildingId(MANAGMENTCENTER.MC_BUILDING_RECYCLING).newbie == 1)
            {
               sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.RECYCLING_COMIC_WINDOW));
            }
         }
         _loc2_.firstWindowStartup = true;
      }
   }
}

