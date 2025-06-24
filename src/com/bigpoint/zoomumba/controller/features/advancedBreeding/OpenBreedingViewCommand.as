package com.bigpoint.zoomumba.controller.features.advancedBreeding
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.playfield.advBreed.BreedingLabProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.advancedBreeding.AdvancedBreedingWindowInitParams;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class OpenBreedingViewCommand extends SimpleCommand
   {
      public function OpenBreedingViewCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:int = parseInt(String(param1.getBody().uId));
         var _loc3_:BreedingLabProxy = facade.retrieveProxy(BreedingLabProxy.getFullName(Categories.BREEDING_LAB,_loc2_)) as BreedingLabProxy;
         switch(_loc3_.currentState)
         {
            case BreedingLabProxy.STATE_READY:
               sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.ADVANCED_BREEDING_WINDOW,"",new AdvancedBreedingWindowInitParams(Categories.BREEDING_LAB,_loc2_)));
               break;
            case BreedingLabProxy.STATE_RUNNING:
               sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.ADVANCED_BREEDING_PROGRESS_WINDOW,"",_loc2_));
               break;
            case BreedingLabProxy.STATE_FINISHED:
               sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.ADVANCED_BREEDING_ENDED_WINDOW,"",_loc2_));
         }
      }
   }
}

