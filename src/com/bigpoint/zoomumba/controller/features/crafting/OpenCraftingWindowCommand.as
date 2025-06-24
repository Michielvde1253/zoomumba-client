package com.bigpoint.zoomumba.controller.features.crafting
{
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.zoomumba.constants.MANAGMENTCENTER;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.features.crafting.CraftingProxy;
   import com.bigpoint.zoomumba.model.managmentCenter.ManagmentCenterProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class OpenCraftingWindowCommand extends SimpleCommand
   {
      public function OpenCraftingWindowCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:CraftingProxy = facade.getProxy(CraftingProxy) as CraftingProxy;
         if(_loc2_.isActive == true)
         {
            if(_loc2_.craftingData.endTime - TimeManager.currentTime <= 0)
            {
               sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.CRAFTING_SUCCESS_WINDOW));
            }
            else
            {
               sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.CRAFTING_PROGRESS_WINDOW));
            }
         }
         else
         {
            sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.CRAFTING_INTRO_WINDOW));
            if(_loc2_.firstWindowStartup == false)
            {
               if((facade.getProxy(ManagmentCenterProxy) as ManagmentCenterProxy).getBuildingViewVoByBuildingId(MANAGMENTCENTER.MC_BUILDING_CRAFTING).newbie == 1)
               {
                  sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.CRAFTING_COMIC_WINDOW));
               }
            }
            _loc2_.firstWindowStartup = true;
         }
      }
   }
}

